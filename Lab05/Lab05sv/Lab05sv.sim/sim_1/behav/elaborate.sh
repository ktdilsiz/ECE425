#!/bin/bash -f
xv_path="/opt/Xilinx/Vivado/2016.2"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xelab -wto 99ec22f86e524b9ea4e91f2d6966c398 -m64 --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot alu_decoder_testbench_behav xil_defaultlib.alu_decoder_testbench xil_defaultlib.glbl -log elaborate.log
