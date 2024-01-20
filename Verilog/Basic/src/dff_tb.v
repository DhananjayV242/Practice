/* VERILOG PRACTICE MATERIAL 

Author: Dhananjay Vijayaraghavan
Date: 18 Jan 2024
Last Modified: 18 Jan 2024

This code is written as part of practicing Verilog HDL for either interviews 
or courses. The objective is this codebase is to provide an easy, workable template 
that is flexible, yet easy to use in prototyping different examples in Verilog. 

Project: D Flip Flop. 
         Design D-FF with async active-low reset and syn active-low reset. 

FILE: dff_tb.v
PURPOSE: Testbench definitions of D-FF according to the spec above. 
        
*/

`timescale 1ps/1ps
`include "src/dff.v"

module tb_dff;
reg clk;
reg rst_n;
reg data;
wire out_data;

D_FF dff 
(
    .rst (rst_n),
    .clk (clk),
    .d (data), 
    .q (out_data)
);

localparam CLK_PERIOD = 10;
always #(CLK_PERIOD/2) clk=~clk;

initial begin
    $dumpfile("tb_dff.vcd");
    $dumpvars(0, tb_dff);
end

initial begin
    rst_n <= 0; clk <= 0;
    #1 rst_n <= 1;

    #(CLK_PERIOD*3 + 4) rst_n <= 0;

    #3 rst_n <= 1;
end

initial begin

    #(CLK_PERIOD-2) data <= 0;
    #(CLK_PERIOD*2) data <= 1;

    #(CLK_PERIOD*4) data <=  0;
    #(CLK_PERIOD*2) $finish;
end

endmodule