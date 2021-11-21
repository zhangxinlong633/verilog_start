module blink2(input CLK, output LED);
    reg [25:0] counter;

// 下标越大，闪得越慢，18看不清了
    assign LED = ~counter[24];

    initial begin
        counter = 0;
    end

    always @(posedge CLK) begin
        counter <= counter + 1;
    end

endmodule
