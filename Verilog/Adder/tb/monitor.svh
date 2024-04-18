/* 
This file defines the definition of the testbench monitor
*/

class Monitor;

    virtual interface adder_if m_adder_vif;
    virtual interface clk_if m_clk_vif;
    
    mailbox scb_mbx;

    function new(
        mailbox mbx, 
        virtual interface adder_if adder_if,
        virtual interface clk_if clock_if
    );
        this.scb_mbx = mbx;
        this.m_adder_vif = adder_if;
        this.m_clk_vif = clock_if;
    endfunction

    task run();
        string prefix = "[Monitor] :::";

        Packet item;
        item = new();  // In ChipVerify, this new is inside forever block. Test to see if this works.
        $display("%s Monitor starting time = %0t", prefix, $time);

        forever begin
            @(posedge m_clk_vif.tb_clk);
            #1;

            item.rstn  = m_adder_vif.rstn;
            item.a     = m_adder_vif.a;
            item.b     = m_adder_vif.b;
            item.sum   = m_adder_vif.sum;
            item.carry = m_adder_vif.carry;

            item.print("Monitor");
            scb_mbx.put(item);            
        end

    endtask
endclass