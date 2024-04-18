/*
This file contains the definition for the 
testbench environment

The environment is encapsulated into a package
*/

package tb_env_pkg;

`include "driver.svh"
`include "monitor.svh"
`include "generator.svh"
`include "scoreboard.svh"
`include "packet.svh"

class Environment;

    Driver driver;
    Monitor monitor;
    Generator generator;
    Scoreboard scoreboard;

    string env_name;

    mailbox drv_mbx;
    mailbox scb_mbx;

    virtual interface adder_if m_adder_vif;
    virtual interface clk_if m_clk_vif;

    event drv_done;

    function new(
        string name,
        virtual interface adder_if addr_if,
        virtual interface clk_if clock_if
        );

        $display("[Environment] ::: Time = %0t Test Environment created ", $time);
        
        this.m_adder_vif = addr_if;
        this.m_clk_vif = clock_if;

        drv_mbx = new();
        scb_mbx = new();

        driver = new(drv_mbx, m_adder_vif, m_clk_vif);
        generator = new(drv_mbx);
        monitor = new(scb_mbx, m_adder_vif, m_clk_vif);
        scoreboard = new(scb_mbx);

        // Connecting events in driver and generator
        driver.drv_done = this.drv_done;
        generator.drv_done = this.drv_done;

    endfunction

    task run();
        $display("[Environment] ::: Time = %0t Run called ", $time);
        fork
            driver.run();
            monitor.run();
            generator.run();
            scoreboard.run();
        join_any
    endtask

endclass
endpackage