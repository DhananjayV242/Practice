
//This file contains the definition of the testbench driver. 

typedef Packet;
class Driver;
    
    virtual interface adder_if m_adder_vif;
    virtual interface clk_if m_clk_vif;

    event drv_done;
    mailbox drv_mbx;

    function new(
        mailbox mbx,
        virtual interface adder_if add_vif,  
        virtual interface clk_if clock_if
    );

        this.drv_mbx = mbx;
        this.m_adder_vif = add_vif;
        this.m_clk_vif = clock_if;

    endfunction

    task run();
        string prefix = "[Driver] :::";
        $display("%s Driver Starting time = %0t", prefix, $time);

        forever begin
            Packet item;
            drv_mbx.get(item);
            $display("%s Time = %0t Waiting for item ......", prefix , $time);
            @(posedge m_clk_vif.tb_clk);
            item.print("Driver");

            m_adder_vif.rstn <= item.rstn;
            m_adder_vif.a    <= item.a;
            m_adder_vif.b    <= item.b;
            ->drv_done;
        end
    endtask // run
endclass