`timescale 1ps/1ps
module adder_tb();
	reg [3:0] a;
	reg [3:0] b;
	wire [7:0] c;

	reg clk,rst_n;

	initial begin
        $dumpfile("wave.vcd"); // 指定用作dumpfile的文件
		$dumpvars; // dump all vars
	end

	adder DUT (
		.clk(clk),
		.rst_n(rst_n),
		.a(a),
		.b(b),
		.c(c)
	);

	always begin
		#5 clk = 0;
		#5 clk = 1;
	end

	initial begin
		rst_n = 1;
		test(4'b0001, 4'b0001, 5'b0010);
		$finish;
	end
	task test;
		input [3:0] in;
		input [3:0] in2;
		input [7:0] e;
		begin
			a = in;
			b = in2;
			@(posedge clk);
			@(negedge clk);
			if (c == e) begin
				$display("It works");
			end else begin
				$display("opps %d + %d ~= %d, expect %d", in, in2, c, e);
			end
		end
	endtask
endmodule


