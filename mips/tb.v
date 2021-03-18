`ifndef __MIPS_TB
`define __MIPS_TB 

`timescale 1ps/1ps

module tbxxxxx();
   reg [3:0] ctl;
   reg [31:0] a, b;
   wire [31:0] out;
   wire zero;
   reg clk;
   initial begin
        $dumpfile("wave.vcd");
        $dumpvars;
   end
   initial begin
       test(`ALU_MUL, 'd10, 'd10, 'd100);
       $finish;
   end

   always begin
        #5 clk = 0;
        #5 clk = 1;
   end 

   alu a1(.clk(clk), .ctl(ctl), .a(a), .b(b), .out(out), .zero(zero));
   task test;
        input [3:0] cc;
        input [31:0] aa;
        input [31:0] bb;
        input [31:0] oo;
        begin
           ctl = cc; 
            a = aa;
            b = bb;
            @(posedge clk);
            @(negedge clk);
            if (out == oo)  
                $display("It works.");
            else
                $display("not works."); 
        end 
   endtask
    
endmodule

`endif