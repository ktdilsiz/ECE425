###################################################################

# Created by write_sdc on Tue Mar 28 14:48:49 2017

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA
set_propagated_clock [get_ports clk]
create_clock [get_ports clk]  -period 100  -waveform {0 50}
set_propagated_clock [get_clocks clk]
set_max_delay 25  -to [get_ports memwrite]
set_max_delay 25  -to [get_ports alusrca]
set_max_delay 25  -to [get_ports memtoreg]
set_max_delay 25  -to [get_ports iord]
set_max_delay 25  -to [get_ports pcwrite]
set_max_delay 25  -to [get_ports brnch]
set_max_delay 25  -to [get_ports regwrite]
set_max_delay 25  -to [get_ports regdst]
set_max_delay 25  -to [get_ports {pcsrc[1]}]
set_max_delay 25  -to [get_ports {pcsrc[0]}]
set_max_delay 25  -to [get_ports {alusrcb[1]}]
set_max_delay 25  -to [get_ports {alusrcb[0]}]
set_max_delay 25  -to [get_ports {aluop[1]}]
set_max_delay 25  -to [get_ports {aluop[0]}]
set_max_delay 25  -to [get_ports {irwrite[3]}]
set_max_delay 25  -to [get_ports {irwrite[2]}]
set_max_delay 25  -to [get_ports {irwrite[1]}]
set_max_delay 25  -to [get_ports {irwrite[0]}]
set_load 0.000172939  [get_nets n4]
set_load 8.55277e-05  [get_nets {next[0]}]
set_load 0.000282382  [get_nets N25]
set_load 0.000558889  [get_nets {next[1]}]
set_load 0.00103201  [get_nets N26]
set_load 0.00141487  [get_nets {next[2]}]
set_load 0.00027297  [get_nets N27]
set_load 0.00105841  [get_nets {next[3]}]
set_load 0.000401316  [get_nets N28]
set_load 0.00616379  [get_nets n1]
set_load 0.000563527  [get_nets n44]
set_load 0.00020208  [get_nets n46]
set_load 0.000230387  [get_nets n45]
set_load 0.00196564  [get_nets n28]
set_load 0.000519549  [get_nets n41]
set_load 0.00350226  [get_nets n5]
set_load 0.00073688  [get_nets n42]
set_load 0.000186492  [get_nets n2]
set_load 0.000660948  [get_nets n40]
set_load 0.000657482  [get_nets N102]
set_load 0.00161115  [get_nets n34]
set_load 0.000588779  [get_nets n37]
set_load 0.00114527  [get_nets n31]
set_load 0.00216418  [get_nets n7]
set_load 0.000201867  [get_nets n36]
set_load 0.000142795  [get_nets n18]
set_load 0.000139114  [get_nets n33]
set_load 0.00320273  [get_nets N99]
set_load 0.00117539  [get_nets n32]
set_load 0.000499025  [get_nets n27]
set_load 0.000663231  [get_nets n11]
set_load 0.000278101  [get_nets n30]
set_load 0.000285697  [get_nets n6]
set_load 0.000737622  [get_nets n29]
set_load 0.0010309  [get_nets n25]
set_load 0.00276515  [get_nets n15]
set_load 0.000565329  [get_nets n10]
set_load 0.00481123  [get_nets {state[2]}]
set_load 0.00018861  [get_nets n20]
set_load 0.000884913  [get_nets n57]
set_load 0.00339982  [get_nets n12]
set_load 0.000902903  [get_nets n17]
set_load 0.000438064  [get_nets n43]
set_load 0.000816946  [get_nets n21]
set_load 0.00225085  [get_nets n19]
set_load 0.000712353  [get_nets n23]
set_load 0.00174418  [get_nets n35]
set_load 0.000388095  [get_nets n58]
set_load 0.003051  [get_nets {state[3]}]
set_load 0.00449502  [get_nets {state[0]}]
set_load 0.000315613  [get_nets n59]
set_load 0.000205869  [get_nets n56]
set_load 0.00126278  [get_nets n38]
set_load 0.000680453  [get_nets n55]
set_load 0.000435287  [get_nets n39]
set_load 0.000722931  [get_nets n16]
set_load 0.000164989  [get_nets n48]
set_load 0.00290729  [get_nets n22]
set_load 0.000203346  [get_nets n50]
set_load 0.00144422  [get_nets n53]
set_load 0.000845032  [get_nets n54]
set_load 0.000525797  [get_nets n52]
set_load 0.000299983  [get_nets n14]
set_load 0.00157596  [get_nets n51]
set_load 0.00346741  [get_nets {state[1]}]
set_load 0.0031745  [get_nets n24]
set_load 0.000335104  [get_nets n49]
set_load 0.00158343  [get_nets n9]
set_load 0.000200601  [get_nets n47]
set_load 0.000913562  [get_nets N101]
set_load 0.00534226  [get_nets n26]
set_load 0.00114398  [get_nets regwrite]
set_load 0.00778112  [get_nets {pcsrc[0]}]
set_load 0.000874281  [get_nets pcwrite]
set_load 0.00114064  [get_nets iord]
set_load 0.000884897  [get_nets memtoreg]
set_load 0.000677288  [get_nets alusrca]
set_load 0.00178896  [get_nets memwrite]
set_load 0.000926441  [get_nets reset]
set_load 2.184e-07  [get_nets clk]
set_resistance 8.33333e-07  [get_nets clk]
set_load 0.00196763  [get_nets {irwrite[1]}]
set_load 0.00140136  [get_nets {irwrite[0]}]
set_load 0.00475857  [get_nets {aluop[1]}]
set_load 0.00584316  [get_nets {alusrcb[1]}]
set_load 0.00502778  [get_nets {alusrcb[0]}]
set_load 0.00127318  [get_nets {pcsrc[1]}]
set_load 0.00360834  [get_nets {op[5]}]
set_load 0.000712706  [get_nets {op[4]}]
set_load 0.00341351  [get_nets {op[3]}]
set_load 0.00174146  [get_nets {op[2]}]
set_load 0.00205415  [get_nets {op[1]}]
set_load 0.000936327  [get_nets {op[0]}]