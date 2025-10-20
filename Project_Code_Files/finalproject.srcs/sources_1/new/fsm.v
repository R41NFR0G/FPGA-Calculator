`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2021 01:22:13 PM
// Design Name: 
// Module Name: fsm
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


module fsm(clk, reset,sw, Add, Mul, Sub, pb1, pb2, pb3, pb4, pb5, N, d1, d2, d3, d4);

input clk, reset,sw, pb1, pb2, pb3, pb4, pb5, Add, Mul, Sub;
output reg N;
output reg[3:0] d1,d2,d3,d4;


reg[2:0]y;
reg[7:0] result;
reg [3:0] operand;
parameter[2:0] A= 3'b000, B=3'b001,C=3'b010,D=3'b011,E=3'b100,F=3'b101;

always @(posedge clk)

if(reset) begin
y<=A;
N<=0;
d1=4'b0000; d2=4'b0000; d3=4'b0000;d4=4'b0000;
end
else
case(y)

A:
begin
d1=4'b0000; d2=4'b0000; d3=4'b0000;d4=4'b0000;
    if (pb1==1)begin //checking for first operand
    d1=4'b0001;
    y<=B;
    end
    else if (pb2==1)begin 
    d1=4'b0010;
    y<=B;
    end
    else if (pb3==1)begin
    d1=4'b0011;
    y<=B;
    end
    else if (pb4==1)begin
    d1=4'b0100;
    y<=B;
    end
    else if (pb5==1)begin
    d1=4'b0101;
    y<=B;
    end
    else
    y<=A;
    end
B:
begin
d2=4'b0000; d3=4'b0000;d4=4'b0000;
    if (sw==1 && pb1==1)begin //checking for second operand
    d2=4'b0001;
    y<=C;
    end
    else if (sw==1 &&  pb2==1)begin 
    d2=4'b0010;
    y<=C;
    end
    else if (sw==1 &&  pb3==1)begin
    d2=4'b0011;
    y<=C;
    end
    else if (sw==1 && pb4==1)begin
    d2=4'b0100;
    y<=C;
    end
    else if (sw==1 && pb5==1)begin
    d2=4'b0101;
    y<=C;
    end
    else
    y<=B;
    end
C:
begin
d3=4'b0000;d4=4'b0000;
    if (Add==1)begin //checking for operator
    result = d1 + d2;
    y<=D;
    end
    else if (Mul==1)begin 
    result = d1*d2;
    y<=E;
    end
    else if (Sub==1)begin
    y<=F;
    end
    else
    y<=C;
    end
    
D: // addition
begin
d3=4'b0000;d4=4'b0000;
d3=result[3:0];
d4=result[7:4];
if (result==10) begin d4=4'b0001; d3=4'b0000; end

end
E: //multiplication
begin
d3=4'b0000;d4=4'b0000;
d3=result[3:0];
d4=result[7:4];
if (result>=10) begin d4=4'b0001; d3=4'b0000; end
if (result==11) begin d3=4'b0001; end
else if (result==12) begin d3=4'b0010; end
else if (result==15) begin d3=4'b0101; end
else if (result==16) begin d3=4'b0110; end
else if (result==20) begin d4=4'b0010; d3=4'b0000; end
else if (result==25) begin d4=4'b0010; d3=4'b0101; end
end

F://subtraction
begin
//d3=4'b0000;d4=4'b0000;
operand = ~d1 +1; operand= operand + d2;
if (operand[3]==1) begin
    N=1;
    d4=4'b1111;
    operand=~operand+1; d3=operand;end
else
    d3=d2-d1;
end 

endcase
endmodule
