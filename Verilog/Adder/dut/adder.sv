/* This file designs the adder. 
Currently the example is taken from ChipVerify, but
I plan to modify it in some way to increase learning. 
*/

module adder(
    input  logic rstn, 
    input  logic [7:0] a,
    input  logic [7:0] b,
    output logic [7:0] sum, 
    output logic carry
);

always_comb begin
    if(!rstn) begin
        sum <= 0;
        carry <= 0;
    end else begin
        {carry , sum} <= a+b;
    end
end

endmodule

