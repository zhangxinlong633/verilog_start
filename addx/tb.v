`ifndef __TB
`define __TB

`timescale 1ps/1ps

module add_tb();
    reg [7:0] a;
    reg [7:0] b;
    wire [7:0] sum;
    reg clk, rst;
    
    initial begin
        $dumpfile("$wave.vcd");
        $dumpvars;
    end

    add aa2(.clk(clk),.rst(rst), .a(a), .b(b), .sum(sum));

    always begin
        #5 clk = 0;
        #5 clk = 1;
    end

    initial begin
        rst = 1;
        test(4'b0001, 4'b0001, 4'b0010);
        $finish;
    end

    task test;
        input [7:0] in1;
        input [7:0] in2;
        input [7:0] out1;
        begin
            a = in1;
            b = in2;
            @(posedge clk);
            @(negedge clk);
            if (out1 == sum) begin
               $display("It works"); 
            end else begin
                $display("error");
            end
        end
    endtask


endmodule

`endif
