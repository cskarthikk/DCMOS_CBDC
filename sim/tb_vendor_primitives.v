`timescale 1ns/1ps
`default_nettype none
// Compile ONLY with AMD primitives, never sim_unisim_primitives.v.
module tb_vendor_primitives;
    reg [1:0] pins=0;
    wire ep,e2;
    cbdc_puf_element p (.sig_i(pins[0]),.c_i(pins[1]),.sig_o(ep));
    cbdc_puf_element #(.ELEMENT_STYLE(1)) v (.sig_i(pins[0]),.c_i(pins[1]),.sig_o(e2));
    reg c=0,ce=0,clr=1,d=0;
    wire q;
    FDCE_1 arb (.C(c),.CE(ce),.CLR(clr),.D(d),.Q(q));
    integer i;
    initial begin
        #120; // AMD glbl.GSR has completed before functional checks.
        for(i=0;i<4;i=i+1) begin
            pins=i; #2;
            if(ep !== (pins[0]^pins[1]) || e2 !== ep) $fatal(1,"Vendor element truth table");
        end
        clr=0; ce=1; d=1; #2; c=1; #2;
        if(q!==0) $fatal(1,"Vendor FDCE_1 captured rising edge");
        c=0; #2; if(q!==1) $fatal(1,"Vendor falling-edge capture");
        ce=0; d=0; c=1; #2; c=0; #2; if(q!==1) $fatal(1,"Vendor CE retention");
        clr=1; #2; if(q!==0) $fatal(1,"Vendor asynchronous clear");
        clr=0; ce=1; d=1; c=1; #2; clr=1; c=0; #2;
        if(q!==0) $fatal(1,"Vendor clear priority");
        $display("PASS: AMD vendor element truth tables and FDCE_1 polarity/enable/clear");
        $finish;
    end
    initial begin #1000; $fatal(1,"Vendor watchdog"); end
endmodule
`default_nettype wire
