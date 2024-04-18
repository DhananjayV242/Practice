/*
This file contains the definition of the testbench packet generator
*/

class Generator;
    
    Packet item;
    mailbox drv_mbx;

    int loopCount = 10;
    event drv_done;
    

    function new(mailbox mbx);
        this.drv_mbx = mbx; 
    endfunction

    task run();
    
        string prefix = "[Generator] :::";
        for(int i=0; i<loopCount; i++)begin
            
            item = new();
        `ifdef NO_RAND
            item.custom_randomize();
        `else
            assert(item.randomize());
        `endif
            $display("%s Time: %0t  Packet generated", prefix, $time);
            drv_mbx.put(item);
            $display("%s Time: %0t  Wait for driver to be done", prefix, $time);
            @(drv_done);
        end
    endtask

endclass