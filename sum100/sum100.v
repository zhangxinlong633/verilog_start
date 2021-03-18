`ifndef __SUM100
`define __SUM100

module sum100(clk, rst, start, stop, sum);
    input clk, rst;
    input [7:0] start;
    input [7:0] stop;
    output reg [16:0] sum = 0;

    reg [7:0] i = 0;
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            sum <= 0;
        end else begin
            for (i = start; i <= stop; i ++) begin
                sum += i;
            end
        end
    end
endmodule

`endif
