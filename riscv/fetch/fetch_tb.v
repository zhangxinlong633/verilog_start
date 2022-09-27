`ifndef __MIPS_TB_FETCH
`define __MIPS_TB_FETCH

`timescale 1ps/1ps

module tb_fetch();
   reg clk;
   reg [31:0] addr;
   wire [31:0] data; 
   fetch a1(.clk(clk), .addr(addr), .data(data));

   initial begin
       $dumpfile("wave.vcd");
       $dumpvars;
       $display("begin tb.");
       test('d00, 'd1);
       $display("test end tb.");
       $finish;
   end

   always begin
        #5 clk = 0;
        #5 clk = 1;
   end 

   task test;
        input [31:0] addr_in;
        input [31:0] data_out;
        begin
           addr = addr_in; 
           @(posedge clk);
           @(negedge clk);
           if (data == data_out)  
               $display("It works.");
           else
               $display("not works."); 
        end 
   endtask
    
endmodule

`endif