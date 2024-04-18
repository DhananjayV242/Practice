/* 
This file defines all the interfaces used in the design
*/

interface adder_if();
    
    logic rstn;
    logic [7:0] a;
    logic [7:0] b;
    logic [7:0] sum;
    logic carry;

endinterface //adder_if

interface clk_if();

    logic tb_clk;
    
    initial begin
        tb_clk <= 0;
    end
    
    always #10 tb_clk = ~tb_clk;

endinterface