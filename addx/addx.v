`ifndef __ADDX
`define __ADDX

module add(clk, rst, a,b,sum);
    input clk, rst;
    input [7:0] a;
    input [7:0] b;
    output reg [7:0] sum;

    always @(posedge clk or negedge rst) begin
        if (rst == 1'b0) 
            sum <= 0;
        else 
            sum <= a + b;
    end
endmodule

`endif 
