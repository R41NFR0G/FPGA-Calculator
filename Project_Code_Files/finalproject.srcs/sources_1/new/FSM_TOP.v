`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2021 03:50:29 PM
// Design Name: 
// Module Name: FSM_TOP
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


module FSM_TOP(
input wire clk,
input wire reset, input wire sw,
input wire Add, Mul, Sub,
input wire pb1, pb2, pb3, pb4, pb5,
output wire [7:0] an,
output wire [7:0] sseg,
output wire N
);

//signal declaration 
wire [3:0] d1,d2,d3,d4;
wire new_clk;
wire two_clk;

//instantiate 7-segment LED Display module
disp_hex disp_unit(.clk(clk),.reset(reset), 
                       .hex7(4'b1100),.hex6(4'b1010),.hex5(4'b1110),.hex4(4'b1100),.hex3(d4),.hex2(d3),.hex1(d2),.hex0(d1),
                       .dp_in(8'b11111111),.an(an),
                       .sseg(sseg));


//disp_hex calc(.clk(two_clk), .reset(reset), .an(an[3:0]), .sseg(sseg));
//instantiate control counter to lower 50 MHz to 10 Hz
cntr cntr(.clk(clk), .out(new_clk));
//instantiate the fsm
fsm fsm_call(.clk(new_clk), .reset(reset), .sw(sw),
             .Add(Add), .Mul(Mul), .Sub(Sub), 
             .pb1(pb1), .pb2(pb2), .pb3(pb3), .pb4(pb4), .pb5(pb5),
             .N(N), .d1(d1), .d2(d2), .d3(d3), .d4(d4));
             

endmodule          

