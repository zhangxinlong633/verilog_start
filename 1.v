counter = 'd100; /* 十进制100 */
counter_8 = 'o123; /* 八进制 */
counter_16 = 'habcd_def0; /* 十六进制 */
counter_2 = 'b01010101_0z0x000; /* 二进制 */

counter_neg = -6'd15

reg[0:14*8-1] str;
assign str = "www.hello.com"

wire intterrupt;
wire flag1, flag2;
wire gnd = 1'b0;

reg clk_temp;

reg rstn;
initial begin
	rstn = 1'b0;
	#100;
	rstn = 1'b1;
end

reg[3:0] counter; /* 4bit 寄存器 counter */
wire[32-1:0] gpio_data; /* 32bit位宽的线型变量gpio_data */
wire[8:2] addr; /* 7bit位宽的addr, 位宽范围 8:2*/
reg[0:31] data; /*声明 32bit 位宽的寄存器亦是data, 最高有效位为0.*/

reg[31:0] data1;
reg [3:0] byte1[7:0];

integer j;
always @(*) begin
	for (j = 0; j <= 31; j ++) begin
		byte1[j] = data1[(j + 1) * 8 - 1 : j * 8]; 
		/* 将0-7赋值给byte[0-7], 8-15=>byte1[8-15] ...*/
	end
end


reg[31:0] src;
reg[3:0] dst[7:0];
integer  i;
always @(*) begin
	for (i = 0; i < 4; i ++) begin
		dst[i] = src[ (i + 1) * 8 - 1 : i * 8]
	end
end

/*[bit+: width] : 从起始 bit 位开始递增，位宽为 width。
[bit-: width] : 从起始 bit 位开始递减，位宽为 width。 */
A = data1[31- : 8];
A = data1[31 : 24]; /* 等效 */

B = data1[0+ : 8 ];
B = data1[0 : 7];

real sum;
integer i;
always @(*) begin
	sum = 0
	for (i = 0; i < 100; i ++) begin
		sum += i;	
	end
	@display("sum is %d\n", sum);
end

time now;
initial begin
	#100 :
		now = $time; /* 当前时间 */
end

/* 在 Verilog 中允许声明 reg, wire, integer, time, real 及其向量类型的数组。*/
integer flag [7:0];
reg[63:0] counter[CPU_MAX:0];
wire[7:0] addr_bus[3:0]; /* 4个8bit wire型 */
reg membit[0:255]; /* 256 个1bit存储器 */
reg [7:0] mem[0:1023]; /* 1K个存储器，位宽为8bit. */
mem[511] = 8'b0; /* 512个8bit的存储单元为0*/
/* mem类似于c语言  char mem[1024]; mem[511] = 0; verilog的内存结构和c一样， 
多维数组其实就是一个一维数组。 */

parameter data_width = 8'd32;
parameter i  = 1, j = 2, k = 3;
parameter mem_size = data_width * 10;

reg[0:14*8 -1] str;
reg[7:0] str[0:14] str2;
assign str = "www.run.com";
assign str2 = "www.run.com";

integer a = 100;
integer b = 200;
integer c = a ^ b;

address[9:0] + 10'b1;
flag1 && flag2;


module test;

real a, b, c;	
c = a + b;

reg[3:0] c1, c2;
always @(posedge clk) begin
	c2 = c1 ^c2;
end

reg flag1;
flag  = cacl_result(a, b);

endmodule

/* 运算符和 c中一样 */
/* 归约运算,c中没有 */
A = 4'b1010 ;
&A ;      //结果为 1 & 0 & 1 & 0 = 1'b0，可用来判断变量A是否全1
~|A ;     //结果为 ~(1 | 0 | 1 | 0) = 1'b0, 可用来判断变量A是否为全0
^A ;      //结果为 1 ^ 0 ^ 1 ^ 0 = 1'b0
/* 拼接操作符 */
A = 4'b1010 ;
B = 1'b1 ;
Y1 = {B, A[3:2], A[0], 4'h3 };  //结果为Y1='b1100_0011
Y2 = {4{B}, 3'd4};  //结果为 Y2=7'b111_1100
Y3 = {32'{1'b0}};  //结果为 Y3=32h0，常用作寄存器初始化时匹配位宽的赋初值


/*在编译阶段，`define 用于文本替换，类似于 C 语言中的 #define。 */
`define DATA_DW 32
`define TEST "hello"
`undef TEST
`ifdef       MCU51
    parameter DATA_DW = 8   ;
`elsif       WINDOW
    parameter DATA_DW = 64  ;
`else
    parameter DATA_DW = 32  ;
`endif

`ifndef     WINDOW
    parameter DATA_DW = 32 ;  
`else
    parameter DATA_DW = 64 ;
`endif

`include "test.v"
`timescale 1ns/100ps /* 时间单位为1ns, 精度为100ps. */
module AndFunc(Z,A,B);
	output Z;
	input A,B;
	assign #5.207 Z = A & B;
	/* 5.21ns 输出 A & B 结果 */
endmodule

`default_nettype wand 
`default_nettype none
`celldefine
module (
    input      clk,
    input      rst,
    output     clk_pll,
    output     flag);
        ……
endmodule
`endcelldefine
/* 非阻塞赋值语句使用小于等于号 <= 作为赋值符。 */
`timescale 1ns/1ns
 
module test ;
    reg [3:0]   ai, bi ;
    reg [3:0]   ai2, bi2 ;
    reg [3:0]   value_blk ;
    reg [3:0]   value_non ;
    reg [3:0]   value_non2 ;
 
    initial begin
        ai            = 4'd1 ;   //(1)
        bi            = 4'd2 ;   //(2)
        ai2           = 4'd7 ;   //(3)
        bi2           = 4'd8 ;   //(4)
        #20 ;                    //(5)
 
        //non-block-assigment with block-assignment
        ai            = 4'd3 ;     //(6)
        bi            = 4'd4 ;     //(7)
        value_blk     = ai + bi ;  //(8)
        value_non     <= ai + bi ; //(9)
 
        //non-block-assigment itself
        ai2           <= 4'd5 ;           //(10)
        bi2           <= 4'd6 ;           //(11)
        value_non2    <= ai2 + bi2 ;      //(12)
    end
 
   //stop the simulation
    always begin
        #10 ;
        if ($time >= 1000) $finish ;
    end
 
endmodule

/* Verilog 时序控制 */
/*
常规时延
遇到常规延时时，该语句需要等待一定时间，然后将计算结果赋值给目标信号。 
*/
reg value_test;
reg value_genral;
#10 value_genral = value_test;
#10;
value_ single         = value_test ;
/*
内嵌时延
遇到内嵌延时时，该语句先将计算结果保存，然后等待一定的时间后赋值给目标信号。
*/
reg value_test;
reg value_embed;
value_embed = #10 value_test;

`timescale 1ns / 1ns
module test1;
	reg value_test;
	reg value_general, value_embed, value_single;

	initial begin
		value_test = 0;
		#25; value_test = 1;
		#35; value_test = 0;
		#40; value_test = 1;
		#10; value_test = 0;
	end

	initial begin
		value_general = 1;
		#10 value_general = value_test;
		#45 value_general = value_test;
		#30 value_general = value_test;
		#20 value_general = value_test;
	end

	initial begin
		value_embed = 1;
		value_embed = #10 value_test;
		value_embed = #45 value_test;
		value_embed = #30 value_test;
		value_embed = #20 value_test;
	end

	initial begin
		value_single = 1;
		#10;
		value_single = value_test;
		#45;
		value_single = value_test;
		#30;
		value_single = value_test;
		#20;
		value_single = value_test;
	end

	always @(*) begin
		#10;
		if ($time >= 150) begin
			$finish;
		end
	end
endmodule

/* 
posedge 指信号发生边沿正向跳变，negedge 指信号发生负向边沿跳变，
未指明跳变方向时，则 2 种情况的边沿变化都会触发相关事件 
*/
always @(clk) q <= d;
always @(posedge clk)  q <= d;
always @(negedge clk) q <= d;
q = @(posedge clk) d;

/* 
用户可以声明 event（事件）类型的变量，并触发该变量来识别该事件是否发生。
命名事件用关键字 event 来声明，触发信号用 -> 表示。例如： 
*/
event start_reciving;
always @(posedge clk_samp) begin
	-> start_reciving;
end

always @(start_receiving) begin
	data_buf = {data_if[0],data_if[1]};
end

always @(posedge clk_samp or start_receiving) begin
	if (! start_reciving) begin
		q <= 1'b;
	end
	else begin
		q <= 0'b;
	end
end

initial begin
	wait (start_enable);
	forever begin
		@(posedge clk_samp);
		data_buf = {data_if[0], data_if[1]};
	end
end

module mux4to1 (
	input [1:0] sel,	
	input [1:0] p0,
	input [1:0] p1,
	input [1:0] p2,
	input [1:0] p3,
	output [1:0] sout
);
	reg [1:0] sout_t;	
	always @(*) begin
		if (sel == 2'b00) 
			sout_t = p0;
		else if (sel == 2'b01) 
			sout_t = p1;
		else if (sel == 2'b10) 
			sout_t = p2;
		else
			sout_t = p3;
	end	
	assign sout = sout_t;
endmodule

`timescale 1ns/1ns

module test;

	reg [1:0] sel;
	wire [1:0] sout;

	initial begin
		sel = 0;
		#10 sel = 3;
		#10 sel = 1;
		#10 sel = 0;
		#10 sel = 2;
	end

	mux4to1 u_mux4to1 (
		.sel (sel),
		.p0(2'b00),
		.p1(2'b01),
		.p2(2'b10),
		.p3(2'b11),
		.sout(sout)
	);

	always begin
		#100;
		if ($time > 1000) $finish;
	end
endmodule


module mux4to1 (
	input [1:0] sel,	
	input [1:0] p0,
	input [1:0] p1,
	input [1:0] p2,
	input [1:0] p3,
	output [1:0] sout
);
	reg [1:0] sout_t;	
	always @(*) begin
		case (sel)
		2'b00: 
			sout_t = p0;
		2'b01: 
			sout_t = p1;
		2'b10:
			sout_t = p2;
		default:	
			sout_t = p3;
		endcase
	end
	assign sout = sout_t;
endmodule

/* 输入端口

模块例化时，从模块外部来讲， input 端口可以连接 wire 或 reg 型变量。这与模块声明是不同的，从模块内部来讲，input 端口必须是 wire 型变量。
输出端口

模块例化时，从模块外部来讲，output 端口必须连接 wire 型变量。这与模块声明是不同的，从模块内部来讲，output 端口可以是 wire 或 reg 型变量。

输入输出端口

模块例化时，从模块外部来讲，inout 端口必须连接 wire 型变量。这与模块声明是相同的。
*/

module ram_4x4(input clk, 
				input [4-1:0] a,
				input [4-1:0] d,
				input 		  en,
				input 		  wr,
				output reg[4-1:0] q);
	parameter mask = 3;
	reg[4-1:0] mem[0:(1<<4) - 1];
	always @(posedge clk) begin
		if (en && wr) begin
			mem[A] <= d & mask;
		end
		else if (en && !wr) begin
			q <= mem[a] & mask;
		end
	end
endmodule

defparam u_ram_4x4.mask = 7;
ram_4x4 u_ram_4x4(
	.clk(clk),
	.a(a[4-1:0]),
	.d(d),
	.en(en),
	.wr(wr),
	.q(q)
);

