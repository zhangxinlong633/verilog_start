`ifndef __TB_XXX
`define __TB_XXX

`timescale 1ps/1ps

module tbxxx();
    reg [7:0] start;
    reg [7:0] stop;
    wire [16:0] sum;
    reg clk, rst;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars;
        rst = 1;
        test(4'b0001, 4'b0011, 4'b0110);
        $finish;
    end

    always begin
        #5 clk = 0;
        #5 clk = 1;
    end

    sum100 s(.clk(clk), .rst(rst), .start(start), .stop(stop), .sum(sum));
    task test;
        input [7:0] in1;
        input [7:0] in2;
        input [16:0] in3;
        begin
            start = in1;
            stop = in2;
            @(posedge clk);
            @(negedge clk);
            if (sum == in3) 
                $display("It works.");
            else 
                $display("Not works.");
        end
    endtask
endmodule

`endif