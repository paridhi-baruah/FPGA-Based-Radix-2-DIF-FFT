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
module test_butterfly8;
reg [31:0] a_real[0:7];
reg [31:0] a_imag[0:7];
wire [31:0] d_real[0:7];
wire [31:0] d_imag[0:7];
  butterfly8 uut ( a_real[0],a_real[1],a_real[2],a_real[3],a_real[4],a_real[5],a_real[6],a_real[7],a_imag[0],a_imag[1],a_imag[2],a_imag[3],a_imag[4],a_imag[5],a_imag[6],a_imag[7], d_real[0],d_real[1],d_real[2],d_real[3],d_real[4],d_real[5],d_real[6],d_real[7],d_imag[0],d_imag[1],d_imag[2],d_imag[3],d_imag[4],d_imag[5],d_imag[6],d_imag[7]
);
initial begin
$dumpfile("dump.vcd");
$dumpvars(1);
end
// Initial stimulus values
initial begin
a_real[0] = 1;
a_real[1] = 2;
a_real[2] = 3;
a_real[3] = 4;
a_real[4] = 5;
a_real[5] = 6;
a_real[6] = 7;
a_real[7] = 8;
a_imag[0] = 10;
a_imag[1] = 11;
a_imag[2] = 12;
a_imag[3] = 13;
a_imag[4] = 14;
a_imag[5] = 15;
a_imag[6] = 16;
a_imag[7] = 17;
  $display("Cycle 0: d_real=%d %d %d %d %d %d %d %d", d_real[0], d_real[1], d_real[2], d_real[3], d_real[4], d_real[5], d_real[6], d_real[7]);
  $display("Cycle 0: d_imag=%d %d %d %d %d %d %d %d", d_imag[0], d_imag[1], d_imag[2], d_imag[3], d_imag[4], d_imag[5], d_imag[6], d_imag[7]);
#10;
  $display("Cycle 0: d_real=%d %d %d %d %d %d %d %d", d_real[0], d_real[1], d_real[2], d_real[3], d_real[4], d_real[5], d_real[6], d_real[7]);
  $display("Cycle 0: d_imag=%d %d %d %d %d %d %d %d", d_imag[0], d_imag[1], d_imag[2], d_imag[3], d_imag[4], d_imag[5], d_imag[6], d_imag[7]);
end
endmodule
