//Subject:     CO project 1 - ALU
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      0313342吳望真
//----------------------------------------------
//Date:        March 24, 2016
//----------------------------------------------
//Description: Implement a 32-Bits ALU which computes the arithmetic and the logic operations.
//--------------------------------------------------------------------------------

module ALU(
	rst_n,
   src1_i,
	src2_i,
	ctrl_i,
	result_o,
	zero_o
	);
     
//I/O ports
input rst_n;
input signed [32-1:0]  src1_i;
input signed [32-1:0]  src2_i;
input [4-1:0]   ctrl_i;

output [32-1:0]  result_o;
output           zero_o;

//Internal signals
reg    [32-1:0]  result_o;
wire             zero_o;

//Parameter

//Combinational
assign zero_o = ~|result_o;

//Main function
always @(*)begin
   if(!rst_n)begin
      result_o <= 32'b0;
   end
   else begin
      case(ctrl_i)
         4'b0000 : result_o = src1_i & src2_i;		//AND
         4'b0001 : result_o = src1_i | src2_i;		//OR
         4'b0010 : result_o = src1_i + src2_i;		//Addtion
         4'b0110 : result_o = src1_i - src2_i;		//Subtract
         4'b1100 : result_o = ~(src1_i | src2_i);	//Nor
         4'b1101 : result_o = ~(src1_i & src2_i);	//Nand
         4'b0111 : result_o = src1_i < src2_i;		//Set less than
         4'b1000 : result_o = src1_i > src2_i;		//Set great than
         4'b1001 : result_o = src1_i <= src2_i;		//Set less equal
         4'b1010 : result_o = src1_i >= src2_i;		//Set great equal
         4'b1011 : result_o = src1_i == src2_i;		//Set equal
         4'b1110 : result_o = src1_i != src2_i;		//Set non equal
         4'b0011 : result_o = src1_i * src2_i;		//Multiplication
         4'b0100 : result_o = src1_i == 32'b0;	//Set equal zero
         default : result_o = 32'b0;
      endcase
   end
end




endmodule

