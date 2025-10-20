`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2021 02:16:41 PM
// Design Name: 
// Module Name: fsm_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fsm_tb( );

reg clk,reset, sw, pb1,pb2,pb3,pb4,pb5,Add,Mul,Sub;
wire N;
wire[3:0]d1,d2,d3,d4;
parameter[2:0] A=3'b000, B=3'b001, C=3'b010, D=3'b011, E=3'b100, F=3'b101;

fsm uut(clk,reset, sw, Add,Mul,Sub,pb1,pb2,pb3,pb4,pb5,N,d1,d2,d3,d4);
//added sw since on the hardware it did not allow different inputs for operand
// 1 and 2 since it took the inputs too quickly

initial 
begin
clk=0; Add=0; Mul=0; Sub=0; sw=0;
pb1=0; pb2=0;pb3=0;pb4=0; pb5=0;
reset = 1;
end

always #10 clk=~clk;
initial begin
#20; reset = 0;
#20;pb1=1;
#20; pb1=0; sw=1; pb2=1;
#20; Mul = 1;
#50; reset = 1;
//#20; reset = 0; 
//#20;pb5=1;
//#20; pb5=0; sw=1; pb3=1;
//#20; Sub = 1;
end

endmodule
