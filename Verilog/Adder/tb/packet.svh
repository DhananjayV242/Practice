/* 
This file contains the transaction object for the 
adder. 

Includes functions to print and copy
*/

class Packet;
    rand bit rstn;
    rand bit [7:0] a;
    rand bit [7:0] b;
    
    bit [7:0] sum;
    bit carry;

    function void print(string tag="");
        $display("[Packet] ::: Time=  %0t  %s Reset = 0x%0h a = 0x%0h, b = 0x%0h, sum = 0x%0h, carry = 0x%0h", $time, tag, rstn, a, b, sum, carry);
        
    endfunction

    function void copy(Packet tmp);
        this.rstn = tmp.rstn;
        this.a = tmp.a;
        this.b = tmp.b;
        this.sum = tmp.sum;
        this.carry = tmp.carry;
    endfunction

    function bit compare(Packet tmp);

        if ((this.rstn == tmp.rstn) &&
            (this.a == tmp.a) &&
            (this.b == tmp.b) &&
            (this.sum == tmp.sum) &&
            (this.carry == tmp.carry)) begin
            
            return 1'b1;
        end
        return 1'b0;
    endfunction

    function void custom_randomize();
        int randNum;
        randNum = $urandom_range(0,1);

        case(randNum)
            0: begin
                rstn = 0;
                a = $urandom_range(0, 255);
                b = $urandom_range(0, 255);
            end
            1: begin
                rstn = 1;
                a = $urandom_range(0, 255);
                b = $urandom_range(0, 255);
            end
        endcase
    endfunction

endclass //Packet

