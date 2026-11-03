`timescale 1ps/1ps
// Simulation-only CE gate model; artificial 50 ps delay, no analog timing proof.
module LUT4 #(parameter [15:0] INIT=0)(output wire O,input wire I0,I1,I2,I3);
 function automatic evaluate(input [3:0] pins);
  integer i,j;reg compatible,first,value;
  begin first=1;value=1'bx;
   for(i=0;i<16;i=i+1)begin
    compatible=1;
    for(j=0;j<4;j=j+1)if(pins[j]===1'b0 || pins[j]===1'b1)if(pins[j]!==((i>>j)&1))compatible=0;
    if(compatible)begin if(first)begin value=INIT[i];first=0;end else if(value!==INIT[i])value=1'bx;end
   end
   evaluate=value;
  end
 endfunction
 assign #50 O=evaluate({I3,I2,I1,I0});
endmodule
