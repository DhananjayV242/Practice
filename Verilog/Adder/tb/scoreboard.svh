
/* 
This file contains the definition of the testbench scoreboard
*/

class Scoreboard;

    mailbox scb_mbx;

    function new(mailbox mbx);
        this.scb_mbx = mbx;
    endfunction
    
    task run();

        string prefix = "[Scoreboard] :::";
        $display("%s Scoreboard started at time = %0t", prefix, $time);

        forever begin
            Packet item, ref_item;  // ChipVerify code is inside, check to see if this works
            ref_item = new();

            scb_mbx.get(item);
            $display("%s Received packet at time = %0t", prefix, $time);
            item.print("Scoreboard");

            ref_item.copy(item);
            gen_exp_packet(ref_item);

            if(item.compare(ref_item))begin                
                $display("\n\n %s Compare PASS!!! ", prefix);
                item.print("DUT Result packet");
                ref_item.print("Reference packet");
                $display("\n\n");
            end
            else begin                    
                $error("\n\n %s Compare FAIL!!! ", prefix);
                item.print("DUT Result packet");
                ref_item.print("Reference packet");
                $display("\n\n");   
            end
        end

    endtask

    function void gen_exp_packet(Packet item);
        
        item.copy(item);

        if(!item.rstn)begin
            item.sum = 0;
            item.carry = 0;
        end else begin
            {item.carry, item.sum} = item.a + item.b;
        end

    endfunction

endclass