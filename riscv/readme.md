# riscv

stage 1: 从文件或者内存中将指令读出来
stage 2: 将指令加载到寄存器
stage 3: 翻译指令 
stage 4: alu计算指令
stage 5: 将数据写回, pc ++. 

## 伪码

mem, mem_end = read_instructsion_from_file_or_mem;
// stage 1
pc = mem
while (pc++ != mem_end) {
    // stage 2
    instruction = (32_bit)pc

    //stage3 
    {op, a, b} = instruction

    // stage 4 
    alu(op, a, b, output)

    // stage 5 
    reg[x] -= output;
}
