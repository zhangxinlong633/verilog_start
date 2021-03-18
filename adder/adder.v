
module adder(clk, rst_n, a, b, c);
	input [3:0] a;
	input [3:0] b;
	output reg [7:0] c;
	input clk, rst_n;

	always @(posedge clk or negedge rst_n) begin
		if (rst_n == 1'b0)
			c <= 8'b0;
		else
			c <= a+b;
	end
endmodule

