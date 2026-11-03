`timescale 1ns / 1ps
`default_nettype none

//==============================================================================
// Module: cbdc_puf_array_serial
// Description:
//   Hardware UART communication interface for the 128-core CBDC-PUF array on
//   Digilent Basys 3 (XC7A35TCPG236-1).
//
// Protocol Specification:
//   1. Legacy Single-Core Query (Command 0xA5):
//      Request:  [0xA5] [c_low] [c_high] [chk] (4 bytes)
//      Reply:    [0x5A] [c_low] [c_high] [flags] [resp_bit] [chk] (6 bytes)
//
//   2. 128-Core Array Query (Command 0x5C):
//      Request:  [0x5C] [c_low] [c_high] [mode] [chk] (5 bytes)
//                mode: 0 = Primary (QA), 1 = Complementary (QB), 2 = Differential (Qdiff)
//      Reply:    [0xCA] [c_low] [c_high] [mode] [flags] [16 bytes of data] [chk] (22 bytes)
//                16 bytes * 8 bits = 128 bits of PUF response.
//==============================================================================
module cbdc_puf_array_serial #(
    parameter integer UART_CLKS    = 868,   // 100 MHz / 115200 baud = 868.05
    parameter integer N_CORES      = 128,   // 128 PUF macro cores
    parameter integer N_STAGES     = 16,
    parameter [3:0]   GATE_INIT    = 4'h8,
    parameter integer AUTO_PARITY  = 1,
    parameter integer SINGLE_SHOT  = 1,
    parameter integer DUAL_ARBITER = 1
) (
    input  wire        clk,      // 100 MHz oscillator (Basys 3 pin W5)
    input  wire        btnU,     // Basys 3 center/up reset button
    input  wire        uart_rx,  // Basys 3 USB-UART RX (pin B18)
    output wire        uart_tx,  // Basys 3 USB-UART TX (pin A18)
    output wire [15:0] led       // Basys 3 onboard LEDs
);

    // Power-on reset generator (16 cycles)
    reg [4:0] por_r = 5'd0;
    wire pr_w = ~por_r[4];
    always @(posedge clk) begin
        if (pr_w)
            por_r <= por_r + 5'd1;
    end

    // Debounced reset button
    wire button_w;
    cbdc_button u_reset_btn (
        .clk    (clk),
        .reset  (pr_w),
        .raw_i  (btnU),
        .level_o(button_w)
    );
    wire reset_w = pr_w | button_w;

    // UART Transceiver
    wire [7:0] rx_data_w;
    wire       rx_received_w;
    wire       rx_framing_err_w;
    wire       tx_busy_w;
    reg        tx_send_r = 1'b0;
    reg  [7:0] tx_data_r = 8'd0;

    cbdc_uart #(
        .CLKS(UART_CLKS)
    ) u_uart (
        .clk          (clk),
        .reset        (reset_w),
        .rx           (uart_rx),
        .send         (tx_send_r),
        .tx_data      (tx_data_r),
        .tx           (uart_tx),
        .busy         (tx_busy_w),
        .rx_data      (rx_data_w),
        .received     (rx_received_w),
        .framing_error(rx_framing_err_w)
    );

    // PUF Response Assembly Instance
    reg         puf_start_r     = 1'b0;
    reg  [15:0] puf_challenge_r = 16'd0;
    wire        puf_busy_w;
    wire        puf_valid_w;
    wire        puf_error_w;
    wire [N_CORES-1:0] puf_resp_w;
    wire [N_CORES-1:0] puf_comp_w;
    wire [N_CORES-1:0] puf_diff_w;

    response_assembly #(
        .N_CORES      (N_CORES),
        .N_STAGES     (N_STAGES),
        .GATE_INIT    (GATE_INIT),
        .AUTO_PARITY  (AUTO_PARITY),
        .SINGLE_SHOT  (SINGLE_SHOT),
        .DUAL_ARBITER (DUAL_ARBITER)
    ) u_puf_array (
        .clk            (clk),
        .rst_n          (~reset_w),
        .start_i        (puf_start_r),
        .challenge_i    (puf_challenge_r),
        .config_mode_i  (1'b0),              // Broadcast mode
        .core_config_i  ({(N_CORES*16){1'b0}}),
        .busy_o         (puf_busy_w),
        .resp_valid_o   (puf_valid_w),
        .request_error_o(puf_error_w),
        .resp_data_o    (puf_resp_w),
        .comp_data_o    (puf_comp_w),
        .diff_data_o    (puf_diff_w)
    );

    // Command FSM States
    localparam [2:0]
        S_IDLE        = 3'd0,
        S_WAIT_PUF    = 3'd1,
        S_TX_LEGACY   = 3'd2,
        S_TX_ARRAY    = 3'd3;

    reg [2:0]  fsm_state_r        = S_IDLE;
    reg [2:0]  parser_state_r     = 3'd0;
    reg [7:0]  cmd_r              = 8'd0;
    reg [7:0]  mode_r             = 8'd0;
    reg [31:0] partial_timeout_r  = 32'd0;
    reg [31:0] puf_timeout_r      = 32'd0;
    reg [5:0]  tx_index_r         = 6'd0;

    reg [7:0]  flags_r            = 8'd0;
    reg [127:0] tx_resp_buf_r     = 128'd0;
    reg [7:0]  tx_chksum_r        = 8'd0;
    reg        done_r             = 1'b0;

    // LED assignments: status and lower 12 bits of last response
    assign led = {1'b1, puf_busy_w, puf_error_w, done_r, tx_resp_buf_r[11:0]};

    // Main FSM
    always @(posedge clk) begin
        if (reset_w) begin
            fsm_state_r       <= S_IDLE;
            parser_state_r    <= 3'd0;
            cmd_r             <= 8'd0;
            mode_r            <= 8'd0;
            puf_challenge_r   <= 16'd0;
            partial_timeout_r <= 32'd0;
            puf_timeout_r     <= 32'd0;
            puf_start_r       <= 1'b0;
            tx_send_r         <= 1'b0;
            tx_data_r         <= 8'd0;
            tx_index_r        <= 6'd0;
            flags_r           <= 8'd0;
            tx_resp_buf_r     <= 128'd0;
            tx_chksum_r       <= 8'd0;
            done_r            <= 1'b0;
        end else begin
            puf_start_r <= 1'b0;
            tx_send_r   <= 1'b0;

            case (fsm_state_r)
                S_IDLE: begin
                    // Timeout inter-byte parser if stalled
                    if (parser_state_r != 3'd0) begin
                        if (partial_timeout_r == (UART_CLKS * 40)) begin
                            parser_state_r    <= 3'd0;
                            partial_timeout_r <= 32'd0;
                        end else begin
                            partial_timeout_r <= partial_timeout_r + 32'd1;
                        end
                    end

                    if (rx_framing_err_w) begin
                        parser_state_r <= 3'd0;
                    end else if (rx_received_w) begin
                        partial_timeout_r <= 32'd0;
                        case (parser_state_r)
                            3'd0: begin
                                if (rx_data_w == 8'hA5 || rx_data_w == 8'h5C) begin
                                    cmd_r          <= rx_data_w;
                                    parser_state_r <= 3'd1;
                                end
                            end

                            3'd1: begin
                                puf_challenge_r[7:0] <= rx_data_w;
                                parser_state_r       <= 3'd2;
                            end

                            3'd2: begin
                                puf_challenge_r[15:8] <= rx_data_w;
                                if (cmd_r == 8'hA5)
                                    parser_state_r <= 3'd4; // Jump to checksum for legacy 4-byte command
                                else
                                    parser_state_r <= 3'd3; // Read mode for 5C command
                            end

                            3'd3: begin
                                mode_r         <= rx_data_w;
                                parser_state_r <= 3'd4;
                            end

                            3'd4: begin
                                parser_state_r <= 3'd0;
                                // Verify checksum
                                if (cmd_r == 8'hA5) begin
                                    if (rx_data_w == (8'hA5 ^ puf_challenge_r[7:0] ^ puf_challenge_r[15:8])) begin
                                        mode_r        <= 8'd0;
                                        puf_start_r   <= 1'b1;
                                        fsm_state_r   <= S_WAIT_PUF;
                                        puf_timeout_r <= 32'd0;
                                        done_r        <= 1'b0;
                                    end
                                end else begin // cmd_r == 8'h5C
                                    if (rx_data_w == (8'h5C ^ puf_challenge_r[7:0] ^ puf_challenge_r[15:8] ^ mode_r)) begin
                                        puf_start_r   <= 1'b1;
                                        fsm_state_r   <= S_WAIT_PUF;
                                        puf_timeout_r <= 32'd0;
                                        done_r        <= 1'b0;
                                    end
                                end
                            end

                            default: parser_state_r <= 3'd0;
                        endcase
                    end
                end

                S_WAIT_PUF: begin
                    puf_timeout_r <= puf_timeout_r + 32'd1;
                    if (puf_valid_w || puf_error_w || puf_timeout_r == 32'd20000) begin
                        flags_r <= puf_valid_w ? 8'h01 : (puf_error_w ? 8'h10 : 8'h80);

                        // Select response data mode
                        case (mode_r)
                            8'd1:    tx_resp_buf_r <= puf_comp_w[127:0];
                            8'd2:    tx_resp_buf_r <= puf_diff_w[127:0];
                            default: tx_resp_buf_r <= puf_resp_w[127:0];
                        endcase

                        tx_index_r  <= 6'd0;
                        done_r      <= 1'b1;

                        if (cmd_r == 8'hA5)
                            fsm_state_r <= S_TX_LEGACY;
                        else
                            fsm_state_r <= S_TX_ARRAY;
                    end
                end

                S_TX_LEGACY: begin
                    if (!tx_busy_w && !tx_send_r) begin
                        if (tx_index_r == 6'd6) begin
                            fsm_state_r <= S_IDLE;
                            tx_index_r  <= 6'd0;
                        end else begin
                            case (tx_index_r)
                                6'd0: tx_data_r <= 8'h5A;
                                6'd1: tx_data_r <= puf_challenge_r[7:0];
                                6'd2: tx_data_r <= puf_challenge_r[15:8];
                                6'd3: tx_data_r <= flags_r;
                                6'd4: tx_data_r <= {7'b0, tx_resp_buf_r[0]};
                                6'd5: tx_data_r <= 8'h5A ^ puf_challenge_r[7:0] ^ puf_challenge_r[15:8] ^ flags_r ^ {7'b0, tx_resp_buf_r[0]};
                                default: tx_data_r <= 8'd0;
                            endcase
                            tx_send_r  <= 1'b1;
                            tx_index_r <= tx_index_r + 6'd1;
                        end
                    end
                end

                S_TX_ARRAY: begin
                    // Packet format (22 bytes total):
                    // [0]: 0xCA (Header)
                    // [1]: chal_low
                    // [2]: chal_high
                    // [3]: mode
                    // [4]: flags
                    // [5..20]: 16 data bytes (tx_resp_buf_r[127:0])
                    // [21]: XOR checksum
                    if (!tx_busy_w && !tx_send_r) begin
                        if (tx_index_r == 6'd22) begin
                            fsm_state_r <= S_IDLE;
                            tx_index_r  <= 6'd0;
                        end else begin
                            case (tx_index_r)
                                6'd0: begin
                                    tx_data_r   <= 8'hCA;
                                    tx_chksum_r <= 8'hCA;
                                end
                                6'd1: begin
                                    tx_data_r   <= puf_challenge_r[7:0];
                                    tx_chksum_r <= tx_chksum_r ^ puf_challenge_r[7:0];
                                end
                                6'd2: begin
                                    tx_data_r   <= puf_challenge_r[15:8];
                                    tx_chksum_r <= tx_chksum_r ^ puf_challenge_r[15:8];
                                end
                                6'd3: begin
                                    tx_data_r   <= mode_r;
                                    tx_chksum_r <= tx_chksum_r ^ mode_r;
                                end
                                6'd4: begin
                                    tx_data_r   <= flags_r;
                                    tx_chksum_r <= tx_chksum_r ^ flags_r;
                                end
                                6'd5, 6'd6, 6'd7, 6'd8, 6'd9, 6'd10, 6'd11, 6'd12,
                                6'd13, 6'd14, 6'd15, 6'd16, 6'd17, 6'd18, 6'd19, 6'd20: begin
                                    // Extract byte (tx_index_r - 5) from 128-bit response buffer
                                    // Using variable slice
                                    reg [7:0] cur_byte;
                                    cur_byte = tx_resp_buf_r[(tx_index_r - 6'd5)*8 +: 8];
                                    tx_data_r   <= cur_byte;
                                    tx_chksum_r <= tx_chksum_r ^ cur_byte;
                                end
                                6'd21: begin
                                    tx_data_r <= tx_chksum_r;
                                end
                                default: tx_data_r <= 8'd0;
                            endcase
                            tx_send_r  <= 1'b1;
                            tx_index_r <= tx_index_r + 6'd1;
                        end
                    end
                end

                default: fsm_state_r <= S_IDLE;
            endcase
        end
    end

endmodule

`default_nettype wire
