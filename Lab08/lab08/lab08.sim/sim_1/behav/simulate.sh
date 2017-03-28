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
ExecStep $xv_path/bin/xsim mips_testbench_behav -key {Behavioral:sim_1:Functional:mips_testbench} -tclbatch mips_testbench.tcl -log simulate.log
