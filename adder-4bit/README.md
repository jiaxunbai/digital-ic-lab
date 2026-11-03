# adder-4bit 四位行波进位加法器

S0 阶段第一个模块：组合逻辑 + 结构化建模 + testbench。

## 功能

两个 4 位无符号/补码数相加，输出 4 位和与进位。
`{cout, sum[3:0]} = a[3:0] + b[3:0] + cin`

## 接口

| 端口 | 方向 | 位宽 | 说明 |
| --- | --- | --- | --- |
| a | input | 4 | 加数 |
| b | input | 4 | 被加数 |
| cin | input | 1 | 低位进位，默认 0 |
| sum | output | 4 | 和 |
| cout | output | 1 | 向高位进位 |

文件：`rtl/adder4.v`，模块名必须与文件名一致。

## 仿真

    bash sim/run.sh

脚本会编译 `rtl/*.v` 与 `tb/*.v`，运行并生成 `build/wave.vcd`，可用 GTKWave 打开：

    gtkwave build/wave.vcd

## 验证记录

写清楚你测了什么、怎么判断对错，这是简历和面试里唯一能讲的东西。

| 用例 | 输入 | 期望输出 | 实际 | 结论 |
| --- | --- | --- | --- | --- |
| 全 0 | a=0,b=0,cin=0 | sum=0,cout=0 |  |  |
| 无进位普通加 | a=3,b=5,cin=0 | sum=8,cout=0 |  |  |
| 产生进位 | a=15,b=1,cin=0 | sum=0,cout=1 |  |  |
| 边界 15+15 | a=15,b=15,cin=0 | sum=14,cout=1 |  |  |
| cin=1 | a=0,b=0,cin=1 | sum=1,cout=0 |  |  |
| 随机 100 组 | 随机 a,b,cin | 与参考模型一致 |  |  |

参考模型思路：在 testbench 里用行为级 `sum_ref = a + b + cin;` 与 DUT 输出比对，不比期望值列表更省力。

## 收获（学完再写）

- 为什么用 `assign {cout, sum} = a + b + cin;` 能自动处理进位？
- 行波进位为什么要 4 个全加器串联，延迟是多少个门？
- 结构化建模（实例化 4 个 full_adder）与行为级建模的差别在哪？
