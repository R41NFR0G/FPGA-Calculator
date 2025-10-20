`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2021 04:08:11 PM
// Design Name: 
// Module Name: cntr
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


module cntr(input wire clk ,output wire out);
// signal declaration
reg [31:0] r_reg;
wire [31:0] r_next;
// Register
always @ (posedge clk)
r_reg <= r_next;
//next state logic
//assign r_next = (r_reg == 100000000) ? 0 : r_reg +1; //output logic
//assign out = ( r_reg == 100000000) ? 1'b1 : 1'b0;
assign r_next = (r_reg == 10) ? 0 : r_reg +1; //output logic
assign out = ( r_reg == 10) ? 1'b1 : 1'b0;
endmodule