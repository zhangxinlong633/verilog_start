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
   input CLK,
   input [3:0] INPUT_A, 
   input INPUT_B,
   output reg[7:0] LED
);
wire oflow_add;
wire oflow_sub;
wire slt;
reg[7:0] a;
reg[7:0] b;
reg[7:0] out;

reg [3:0] ctl; 

initial begin
    ctl = ALU_ADD;
    a = 8;
    b = 8;

    case(ctl) 
        `ALU_ADD:
            out = a + b;
        `ALU_AND:
            out = a & b;
        `ALU_NOR:
            out = ~(a | b);
        `ALU_OR:
            out = a | b;
        `ALU_SLT:
            out = {{31{1'b0}}, slt};
        `ALU_SUB:
            out = a - b;
        `ALU_XOR:
            out = a ^ b;
        `ALU_MUL:
            out = a * b;
        `ALU_DIV:
            out = a / b;
    endcase 
    LED = ~out;
end



endmodule

`endif 