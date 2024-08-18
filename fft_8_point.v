`timescale 1ns / 1fs
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.06.2024 12:59:15
// Design Name: 
// Module Name: 8_phase
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

module butterfly2(
input [31:0] a_real0,a_real1,
input [31:0] a_imag0,a_imag1,
output [31:0] c_real0,c_real1,
output [31:0] c_imag0,c_imag1
);
assign c_real0 = a_real0 + a_real1;
assign c_imag0 = a_imag0 + a_imag1;
assign c_real1 = a_real0 - a_real1;
assign c_imag1 = a_imag0 - a_imag1;
endmodule
module twiddle_factor(
input [31:0] i_real3,i_imag3,
output [31:0] j_real3,j_imag3
);
assign j_imag3=-i_real3;
assign j_real3=i_imag3;
endmodule
module twiddle_factor4 (
input [31:0] i_real5,i_real6,i_real7,i_imag5,i_imag6,i_imag7,
output [31:0] j_real5,j_real6,j_real7,j_imag5,j_imag6,j_imag7
);
wire [31:0] a = 'd7071;
assign j_imag6=-i_real6;
assign j_real6=i_imag6;
assign j_real5=(i_real5*a)+(i_imag5*a) ;
assign j_imag5=(-i_real5*a)+(i_imag5*(a));
assign j_real7=(-i_real7*a)+(i_imag7*a);
assign j_imag7=(-i_real7*a)-(i_imag7*a);
endmodule
module butterfly4(
input [31:0] a_real0,a_real1,a_real2,a_real3,
input [31:0] a_imag0,a_imag1,a_imag2,a_imag3,
output [31:0] c_real0,c_real1,c_real2,c_real3,
output [31:0] c_imag0,c_imag1,c_imag2,c_imag3
);
wire [31:0] i_real[0:3];
wire [31:0] i_imag[0:3];
wire [31:0] j_real[0:3];
wire [31:0] j_imag[0:3];
butterfly2 b0(a_real0, a_real2, a_imag0, a_imag2, i_real[0], i_real[1], i_imag[0], i_imag[1]);
butterfly2 b1(a_real1, a_real3, a_imag1, a_imag3, i_real[2], i_real[3], i_imag[2], i_imag[3]);
twiddle_factor t1(i_real[3],i_imag[3],j_real[3],j_imag[3]);
butterfly2 b2(i_real[0], i_real[2], i_imag[0], i_imag[2], c_real0, c_real2, c_imag0, c_imag2);
butterfly2 b3(i_real[1], j_real[3], i_imag[1], j_imag[3], c_real1, c_real3, c_imag1, c_imag3);
endmodule
module scaler(
  input [31:0] i_real0,i_real1,i_real2,i_real3,i_real4,i_real5,i_real6,i_real7,i_imag0,i_imag1,i_imag2,i_imag3,i_imag4,i_imag5,i_imag6,i_imag7,
  output [31:0] j_real0,j_real1,j_real2,j_real3,j_real4,j_real5,j_real6,j_real7,j_imag0,j_imag1,j_imag2,j_imag3,j_imag4,j_imag5,j_imag6,j_imag7
);
parameter scaling_factor=10000;
assign j_real0 = (i_real0)*(scaling_factor);
assign j_real1 = (i_real1)*(scaling_factor);
assign j_real2 = (i_real2)*(scaling_factor);
assign j_real3 = (i_real3)*(scaling_factor);
assign j_real4 = (i_real4)*(scaling_factor);
assign j_real5 = (i_real5);
assign j_real6 = (i_real6)*(scaling_factor);
assign j_real7 = (i_real7);
assign j_imag0 = (i_imag0)*(scaling_factor);
assign j_imag1 = (i_imag1)*(scaling_factor);
assign j_imag2 = (i_imag2)*(scaling_factor);
assign j_imag3 = (i_imag3)*(scaling_factor);
assign j_imag4 = (i_imag4)*(scaling_factor);
assign j_imag5 = (i_imag5);
assign j_imag6 = (i_imag6)*(scaling_factor);
assign j_imag7 = (i_imag7);
endmodule
module butterfly8(
input [31:0] a_real0,a_real1,a_real2,a_real3,a_real4,a_real5,a_real6,a_real7,
input [31:0] a_imag0,a_imag1,a_imag2,a_imag3,a_imag4,a_imag5,a_imag6,a_imag7,
output [31:0] c_real0,c_real1,c_real2,c_real3,c_real4,c_real5,c_real6,c_real7,
output [31:0] c_imag0,c_imag1,c_imag2,c_imag3,c_imag4,c_imag5,c_imag6,c_imag7
);
wire [31:0] i_real[0:7];
wire [31:0] i_imag[0:7];
wire [31:0] j_real[0:7];
wire [31:0] j_imag[0:7];
wire [31:0] k_real[0:7];
wire [31:0] k_imag[0:7];
  butterfly4 b0(a_real0, a_real2, a_real4, a_real6, a_imag0, a_imag2, a_imag4, a_imag6, i_real[0], i_real[1], i_real[2], i_real[3], i_imag[0], i_imag[1], i_imag[2], i_imag[3]);
  butterfly4 b1(a_real1, a_real3, a_real5, a_real7, a_imag1, a_imag3, a_imag5, a_imag7, i_real[4], i_real[5], i_real[6], i_real[7], i_imag[4], i_imag[5], i_imag[6], i_imag[7]);
  twiddle_factor4 t2(i_real[5],i_real[6],i_real[7],i_imag[5],i_imag[6],i_imag[7],j_real[5],j_real[6],j_real[7],j_imag[5],j_imag[6],j_imag[7]);
scaler s1(i_real[0],i_real[1],i_real[2],i_real[3],i_real[4],j_real[5],j_real[6],j_real[7],i_imag[0],i_imag[1],i_imag[2],i_imag[3],i_imag[4],j_imag[5],j_imag[6],j_imag[7], k_real[0],k_real[1],k_real[2],k_real[3],k_real[4],k_real[5],k_real[6],k_real[7],k_imag[0],k_imag[1],k_imag[2],k_imag[3],k_imag[4],k_imag[5],k_imag[6],k_imag[7]);
  butterfly2 b2(k_real[0], k_real[4], k_imag[0], k_imag[4], c_real0, c_real4, c_imag0, c_imag4);
  butterfly2 b3(k_real[1], k_real[5], k_imag[1], k_imag[5], c_real1, c_real5, c_imag1, c_imag5);
  butterfly2 b4(k_real[2], k_real[6], k_imag[2], k_imag[6], c_real2, c_real6, c_imag2, c_imag6);
  butterfly2 b5(k_real[3], k_real[7], k_imag[3], k_imag[7], c_real3, c_real7, c_imag3, c_imag7);
endmodule
