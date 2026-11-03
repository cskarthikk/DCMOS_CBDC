// Diagnostic runtime timing controller. Values latched at request acceptance.
`timescale 1ns / 1ps
`default_nettype none

//==============================================================================
// Module: cbdc_puf_ctrl
// Description:
//   Conventional synchronous control FSM that sequences a single CBDC-PUF run
//   following Section 3.1; cycle counts and readout are engineering choices:
//     1. Assert clr=1 with excite=0, latch=0
//     2. Release clr=0 and allow initialization state to settle (excite=0, latch=0)
//     3. Assert excite=1 (with latch=0) and wait EXCITE_CYCLES
//     4. Assert latch=1 (with excite=1) and wait LATCH_CYCLES for Qb falling edge
//     5. Sample puf_q_i through a 2-flop synchronizer while excite=1
//     6. Drop latch=0 first (retaining Q in FDCE_1)
//     7. Drop excite=0 and assert resp_valid_o
//==============================================================================
module cbdc_puf_ctrl_timing #(
    parameter integer N_STAGES          = 16,
    parameter [3:0] GATE_INIT           = 4'h8,
    parameter integer AUTO_PARITY       = 1,
    parameter integer CLR_CYCLES        = 4,
    parameter integer INIT_SETTLE_CYCLES= 4,
    parameter integer EXCITE_CYCLES     = 8,
    parameter integer LATCH_CYCLES      = 8,
    parameter integer HOLD_CYCLES       = 4
) (
    input wire [7:0] wait_cycles_i, capture_cycles_i,
    input  wire                clk,          // System control clock (e.g., 100 MHz on Basys 3)
    input  wire                rst_n,        // Active-low synchronous reset
    input  wire                start_i,      // Pulse high for 1 cycle to start a PUF query
    input  wire [N_STAGES-1:0] challenge_i,  // Desired 16-bit challenge
    output reg                 busy_o,       // High while sequence is running
    output reg                 resp_valid_o, // Pulses high for 1 cycle when resp_bit_o is ready
    output reg                 request_error_o, // One-cycle pulse: unsupported challenge
    output reg                 resp_bit_o,   // Synchronized PUF response bit

    // To/From cbdc_puf_core
    output reg  [N_STAGES-1:0] puf_c_o,      // Challenge bus held static during run
    output reg                 puf_excite_o, // Drives core.excite
    output reg                 puf_latch_o,  // Drives core.latch
    output reg                 puf_clr_o,    // Drives core.clr
    input  wire                puf_q_i       // Driven by core.q
);

    // Inputs are synchronous to clk; start_i is accepted only while idle.
    // This rejects quiescent configurations without changing the paper's race.
    // resp_valid_o means sequence completion, not a physical liveness measurement.
    wire challenge_supported_w = (AUTO_PARITY != 0) ? 1'b1 : ((^challenge_i) ^ (GATE_INIT == 4'h7));
    // synthesis translate_off
    initial begin
        if (N_STAGES < 1 || (GATE_INIT != 4'h8 && GATE_INIT != 4'h7))
            $fatal(1, "Invalid controller chain parameters");
        if (CLR_CYCLES < 1 || CLR_CYCLES > 65536 ||
            INIT_SETTLE_CYCLES < 1 || INIT_SETTLE_CYCLES > 65536 ||
            EXCITE_CYCLES < 1 || EXCITE_CYCLES > 65536 ||
            LATCH_CYCLES < 1 || LATCH_CYCLES > 65536 ||
            HOLD_CYCLES < 3 || HOLD_CYCLES > 65536)
            $fatal(1, "Cycle counts must fit timer; HOLD_CYCLES must be >= 3");
    end
    // synthesis translate_on

    // FSM states
    localparam [2:0]
        ST_IDLE           = 3'd0,
        ST_INIT_CLR       = 3'd1,
        ST_INIT_SETTLE    = 3'd2,
        ST_EXCITE         = 3'd3,
        ST_LATCH          = 3'd4,
        ST_DROP_LATCH     = 3'd5,
        ST_DROP_EXCITE    = 3'd6,
        ST_DONE           = 3'd7;

    reg [7:0] wait_r, capture_r;
    reg [2:0]  state_r;
    reg [15:0] timer_r;

    // 2-flop synchronizer for reading the asynchronous FDCE_1 output (puf_q_i)
    (* ASYNC_REG = "TRUE", SHREG_EXTRACT = "NO" *) reg q_sync1_r, q_sync2_r;
    always @(posedge clk) begin
        if (!rst_n) begin
            q_sync1_r <= 1'b0;
            q_sync2_r <= 1'b0;
        end else begin
            q_sync1_r <= puf_q_i;
            q_sync2_r <= q_sync1_r;
        end
    end

    always @(posedge clk) begin
        if (!rst_n) begin
            wait_r <= 8; capture_r <= 8;
            state_r      <= ST_IDLE;
            timer_r      <= 16'd0;
            busy_o       <= 1'b0;
            resp_valid_o <= 1'b0;
            request_error_o <= 1'b0;
            resp_bit_o   <= 1'b0;
            puf_c_o      <= {N_STAGES{1'b0}};
            puf_excite_o <= 1'b0;
            puf_latch_o  <= 1'b0;
            puf_clr_o    <= 1'b0;
        end else begin
            resp_valid_o <= 1'b0;
            request_error_o <= 1'b0;

            case (state_r)
                ST_IDLE: begin
                    puf_excite_o <= 1'b0;
                    puf_latch_o  <= 1'b0;
                    puf_clr_o    <= 1'b0;
                    if (start_i) begin
                        if (challenge_supported_w && wait_cycles_i != 0 && capture_cycles_i != 0) begin
                            wait_r <= wait_cycles_i; capture_r <= capture_cycles_i;
                            puf_c_o      <= challenge_i; // Lock challenge before init
                            puf_clr_o    <= 1'b1;        // Clear before excitation
                            busy_o       <= 1'b1;
                            timer_r      <= 16'd0;
                            state_r      <= ST_INIT_CLR;
                        end else begin
                            busy_o <= 1'b0;
                            request_error_o <= 1'b1;
                        end
                    end else begin
                        busy_o       <= 1'b0;
                    end
                end

                ST_INIT_CLR: begin
                    puf_excite_o <= 1'b0;
                    puf_latch_o  <= 1'b0;
                    puf_clr_o    <= 1'b1;
                    if (timer_r >= CLR_CYCLES - 1) begin
                        puf_clr_o <= 1'b0; // Step 2: release clr while excite=0, latch=0
                        timer_r   <= 16'd0;
                        state_r   <= ST_INIT_SETTLE;
                    end else begin
                        timer_r   <= timer_r + 16'd1;
                    end
                end

                ST_INIT_SETTLE: begin
                    puf_excite_o <= 1'b0;
                    puf_latch_o  <= 1'b0;
                    puf_clr_o    <= 1'b0;
                    if (timer_r >= INIT_SETTLE_CYCLES - 1) begin
                        puf_excite_o <= 1'b1; // Step 3: assert excite=1, keep latch=0
                        timer_r      <= 16'd0;
                        state_r      <= ST_EXCITE;
                    end else begin
                        timer_r      <= timer_r + 16'd1;
                    end
                end

                ST_EXCITE: begin
                    puf_excite_o <= 1'b1;
                    puf_latch_o  <= 1'b0;
                    puf_clr_o    <= 1'b0;
                    if (timer_r >= wait_r - 1) begin
                        puf_latch_o <= 1'b1; // Step 4: assert latch=1 while excite=1
                        timer_r     <= 16'd0;
                        state_r     <= ST_LATCH;
                    end else begin
                        timer_r     <= timer_r + 16'd1;
                    end
                end

                ST_LATCH: begin
                    puf_excite_o <= 1'b1;
                    puf_latch_o  <= 1'b1;
                    puf_clr_o    <= 1'b0;
                    if (timer_r >= capture_r - 1) begin
                        puf_latch_o <= 1'b0; // Step 6: drop latch first to freeze FDCE_1
                        timer_r     <= 16'd0;
                        state_r     <= ST_DROP_LATCH;
                    end else begin
                        timer_r     <= timer_r + 16'd1;
                    end
                end

                ST_DROP_LATCH: begin
                    // Keep excite=1 for HOLD_CYCLES while 2-FF synchronizer flushes
                    // the captured response bit, then drop excite=0
                    puf_excite_o <= 1'b1;
                    puf_latch_o  <= 1'b0;
                    puf_clr_o    <= 1'b0;
                    if (timer_r >= HOLD_CYCLES - 1) begin
                        resp_bit_o   <= q_sync2_r; // Sample synchronized Q before dropping excite
                        puf_excite_o <= 1'b0;      // Step 7: drop excite=0
                        timer_r      <= 16'd0;
                        state_r      <= ST_DROP_EXCITE;
                    end else begin
                        timer_r      <= timer_r + 16'd1;
                    end
                end

                ST_DROP_EXCITE: begin
                    puf_excite_o <= 1'b0;
                    puf_latch_o  <= 1'b0;
                    puf_clr_o    <= 1'b0;
                    state_r      <= ST_DONE;
                end

                ST_DONE: begin
                    busy_o       <= 1'b0;
                    resp_valid_o <= 1'b1;
                    wait_r <= 8; capture_r <= 8;
            state_r      <= ST_IDLE;
                end

                default: begin
                    state_r <= ST_IDLE;
                    busy_o <= 1'b0;
                    puf_latch_o <= 1'b0;
                    puf_excite_o <= 1'b0;
                    puf_clr_o <= 1'b1;
                    request_error_o <= 1'b1;
                end
            endcase
        end
    end

endmodule

`default_nettype wire
