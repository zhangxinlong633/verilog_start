`ifndef __MIPS_ALU
`define __MIPS_ALU

`include "public.v"

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
       `ALU_LESS_THAN : 
            out = (a < b) ? 32'h1 : 32'h0;
       `ALU_LESS_THAN_SIGNED : 
            if (a[31] != b[31])
                out = a[31] ? 32'h1 : 32'h0;
            else
                out = sub_res_w[31] ? 32'h1 : 32'h0;            
        default : 
            out = a;
    endcase 
end
endmodule

`endif 