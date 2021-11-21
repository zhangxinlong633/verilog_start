
module led_blink(input CLK, output [7:0] LED);
    reg [25:0] counter;
    wire led_clk = counter[21];

    initial begin
        LED = 8'b11110000;
    end
    always @(posedge CLK) begin
        counter <= counter + 1;
    end
    always @(posedge led_clk) begin
        LED <= {LED[6:0], LED[7]};
    end

endmodule
