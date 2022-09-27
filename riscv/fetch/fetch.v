`ifndef _fetch
`define _fetch

module fetch(input wire clk, input [31:0] addr, output [31:0] data);
	parameter NMEM = 128;
	parameter IM_DATA = "im_data.txt";

	reg[31:0] mem[0:127];
	initial begin
		$readmemh(IM_DATA, mem, 0, NMEM-1);
        $display("Read from file.");
	end

	assign data = mem[addr[8:2]][31:0];
endmodule

`endif
