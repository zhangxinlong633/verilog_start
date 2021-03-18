`ifndef __MIPS_ALU
`define __MIPS_ALU


`define ALU_ADD 4'd2
`define ALU_AND 4'd0
`define ALU_NOR 4'd12
`define ALU_OR  4'd1
`define ALU_SLT 4'd7
`define ALU_SUB 4'd6
`define ALU_XOR 4'd13
`define ALU_MUL 4'd10
`define ALU_DIV 4'd11

module alu (
    input clk,
   input [3:0] ctl,
   input [31:0] a, b,
   output reg[31:0] out,
   output zero
);
wire [31:0] sub_ab;
wire [31:0] add_ab;
wire oflow_add;
wire oflow_sub;
wire slt;

assign zero = (0 == out);
assign sub_ab = a - b;
assign add_ab = a + b;
assign oflow_add = (a[31] == b[31] && add_ab[31] != a[31]) ? 1 : 0;
assign oflow_sub = (a[31] == b[31] && sub_ab[31] != a[31]) ? 1 : 0;

assign oflow = (ctl == 4'b0010) ? oflow_add : oflow_sub;

assign slt = oflow_sub ? ~(a[31]) : a[31];

always @(posedge clk) begin
    case(ctl) 
        `ALU_ADD:
            out = add_ab;
        `ALU_AND:
            out = a & b;
        `ALU_NOR:
            out = ~(a | b);
        `ALU_OR:
            out = a | b;
        `ALU_SLT:
            out = {{31{1'b0}}, slt};
        `ALU_SUB:
            out = sub_ab;
        `ALU_XOR:
            out = a ^ b;
        `ALU_MUL:
            out = a * b;
        `ALU_DIV:
            out = a / b;
    endcase 
end
endmodule

`endif 