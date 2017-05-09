###################################################################

# Created by write_sdc on Mon May  8 13:56:16 2017

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA
set_max_delay 25  -to [get_ports memwrite]
set_max_delay 25  -to [get_ports alusrca]
set_max_delay 25  -to [get_ports memtoreg]
set_max_delay 25  -to [get_ports iord]
set_max_delay 25  -to [get_ports pcen]
set_max_delay 25  -to [get_ports regwrite]
set_max_delay 25  -to [get_ports regdst]
set_max_delay 25  -to [get_ports {pcsrc[1]}]
set_max_delay 25  -to [get_ports {pcsrc[0]}]
set_max_delay 25  -to [get_ports {alusrcb[1]}]
set_max_delay 25  -to [get_ports {alusrcb[0]}]
set_max_delay 25  -to [get_ports {alucontrol[6]}]
set_max_delay 25  -to [get_ports {alucontrol[5]}]
set_max_delay 25  -to [get_ports {alucontrol[4]}]
set_max_delay 25  -to [get_ports {alucontrol[3]}]
set_max_delay 25  -to [get_ports {alucontrol[2]}]
set_max_delay 25  -to [get_ports {alucontrol[1]}]
set_max_delay 25  -to [get_ports {alucontrol[0]}]
set_max_delay 25  -to [get_ports {irwrite[3]}]
set_max_delay 25  -to [get_ports {irwrite[2]}]
set_max_delay 25  -to [get_ports {irwrite[1]}]
set_max_delay 25  -to [get_ports {irwrite[0]}]
