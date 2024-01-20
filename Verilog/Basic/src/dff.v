/* VERILOG PRACTICE MATERIAL 

Author: Dhananjay Vijayaraghavan
Date: 18 Jan 2024
Last Modified: 18 Jan 2024

This code is written as part of practicing Verilog HDL for either interviews 
or courses. The objective is this codebase is to provide an easy, workable template 
that is flexible, yet easy to use in prototyping different examples in Verilog. 

Project: D Flip Flop. 
         Design D-FF with async active-low reset and syn active-low reset. 

FILE: dff.v
PURPOSE: Module definitions of D-FF according to the spec above. 
        
*/

module D_FF(input clk, 
            input rst,
            input d, 
            output reg q);

always @(posedge clk or negedge rst) begin
    
    if (!rst)
      q <= 0;
    else
      q <= d;

end
endmodule

module D_FF_SYNC_RST(input clk, 
                     input rst,
                     input d, 
                     output reg q);

always @(posedge clk) begin
    
    if (!rst)
      q <= 0;
    else
      q <= d;

end
endmodule

