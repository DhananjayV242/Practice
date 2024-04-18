/* 
This is the top level testbench module
*/

`include "environment.svh"
`include "interface.svh"

import tb_env_pkg::*;

module tb;

    adder_if adder_interface();
    clk_if clk_interface();

    adder dut(
        .rstn(adder_interface.rstn),
        .a(adder_interface.a),
        .b(adder_interface.b),
        .sum(adder_interface.sum),
        .carry(adder_interface.carry)
    );

    Environment environment;
    initial begin
        
        environment = new("Environment", adder_interface, clk_interface);

        environment.run();
        #50 $finish;
    end

endmodule