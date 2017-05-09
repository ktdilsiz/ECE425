###################################################################

# Created by write_sdc on Mon May  8 14:01:22 2017

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA
set_max_delay 25  -to [get_ports {alucontrol[6]}]
set_max_delay 25  -to [get_ports {alucontrol[5]}]
set_max_delay 25  -to [get_ports {alucontrol[4]}]
set_max_delay 25  -to [get_ports {alucontrol[3]}]
set_max_delay 25  -to [get_ports {alucontrol[2]}]
set_max_delay 25  -to [get_ports {alucontrol[1]}]
set_max_delay 25  -to [get_ports {alucontrol[0]}]
