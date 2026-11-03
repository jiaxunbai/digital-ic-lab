#!/usr/bin/env bash
# 一键仿真：编译 rtl/ 与 tb/ 下所有 .v，运行，生成 build/wave.vcd
# 用法：在 Git Bash 里执行 bash sim/run.sh
set -euo pipefail

cd "$(dirname "$0")/.."

if ! command -v iverilog >/dev/null 2>&1; then
    echo "[错误] 没找到 iverilog。"
    echo "  Windows: 下载 http://bleyer.org/icarus/ 的安装包，安装时勾选 Add to PATH"
    echo "  WSL/Ubuntu: sudo apt install iverilog gtkwave"
    exit 1
fi

if ! ls rtl/*.v >/dev/null 2>&1; then
    echo "[错误] rtl/ 下没有 .v 文件，先把模块写出来。"
    exit 1
fi

mkdir -p build
echo "[1/2] 编译 rtl/*.v tb/*.v"
iverilog -g2012 -Wall -o build/sim.vvp rtl/*.v tb/*.v

echo "[2/2] 运行仿真"
vvp build/sim.vvp

if [ -f build/wave.vcd ]; then
    echo "波形已生成：build/wave.vcd"
    echo "打开方式：gtkwave build/wave.vcd"
fi
