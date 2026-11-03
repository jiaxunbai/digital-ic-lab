# digital-ic-lab

数字 IC 学习练习仓库。每个模块一个目录，包含 RTL、testbench、仿真脚本与验证记录。

## 模块索引

| 模块 | 内容 | 状态 | 目录 |
| --- | --- | --- | --- |
| adder-4bit | 4 位行波进位加法器 | 进行中 | `adder-4bit/` |
| alu-8bit | 8 位 ALU（加、减、与、或、异或、比较） | 待开始 | — |
| decoder-3to8 | 3-8 译码器 | 待开始 | — |
| fsm-seq-detect | 序列检测状态机（三段式） | 待开始 | — |
| regfile | 寄存器堆（双读单写） | 待开始 | — |
| uart-tx | UART 发送模块 | 待开始 | — |

## 环境

- 仿真器：Icarus Verilog（`iverilog` + `vvp`）
- 波形：GTKWave
- 语言：Verilog-2001 / SystemVerilog（`-g2012`）

## 怎么跑一个模块

    cd adder-4bit && bash sim/run.sh

脚本会把 `rtl/` 与 `tb/` 下所有 `.v` 一起编译，生成 `build/wave.vcd`。
