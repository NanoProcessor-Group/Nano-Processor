## Clock signal
set_property PACKAGE_PIN W5 [get_ports Clkin]
	set_property IOSTANDARD LVCMOS33 [get_ports Clkin]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports Clkin]

## Switches
#set_property PACKAGE_PIN V17 [get_ports {Reset}]
	#set_property IOSTANDARD LVCMOS33 [get_ports {Reset}]
## LEDs
set_property PACKAGE_PIN U16 [get_ports {Data7_LED[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Data7_LED[0]}]
set_property PACKAGE_PIN E19 [get_ports {Data7_LED[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Data7_LED[1]}]
set_property PACKAGE_PIN U19 [get_ports {Data7_LED[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Data7_LED[2]}]
set_property PACKAGE_PIN V19 [get_ports {Data7_LED[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Data7_LED[3]}]
	
set_property PACKAGE_PIN W3 [get_ports {A_greater}]
    set_property IOSTANDARD LVCMOS33 [get_ports {A_greater}]
set_property PACKAGE_PIN U3 [get_ports {A_equal}]
    set_property IOSTANDARD LVCMOS33 [get_ports {A_equal}]
set_property PACKAGE_PIN P3 [get_ports {A_less}]
    set_property IOSTANDARD LVCMOS33 [get_ports {A_less}]	
set_property PACKAGE_PIN N3 [get_ports {Overflow}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Overflow}]
set_property PACKAGE_PIN P1 [get_ports {Zero}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Zero}]
set_property PACKAGE_PIN L1 [get_ports {Carry}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Carry}]


##7 segment display
set_property PACKAGE_PIN W7 [get_ports {Seven_S[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Seven_S[0]}]
set_property PACKAGE_PIN W6 [get_ports {Seven_S[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Seven_S[1]}]
set_property PACKAGE_PIN U8 [get_ports {Seven_S[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Seven_S[2]}]
set_property PACKAGE_PIN V8 [get_ports {Seven_S[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Seven_S[3]}]
set_property PACKAGE_PIN U5 [get_ports {Seven_S[4]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Seven_S[4]}]
set_property PACKAGE_PIN V5 [get_ports {Seven_S[5]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Seven_S[5]}]
set_property PACKAGE_PIN U7 [get_ports {Seven_S[6]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Seven_S[6]}]

#set_property PACKAGE_PIN V7 [get_ports dp]
	#set_property IOSTANDARD LVCMOS33 [get_ports dp]

set_property PACKAGE_PIN U2 [get_ports {Anode[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Anode[0]}]
set_property PACKAGE_PIN U4 [get_ports {Anode[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Anode[1]}]
set_property PACKAGE_PIN V4 [get_ports {Anode[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Anode[2]}]
set_property PACKAGE_PIN W4 [get_ports {Anode[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Anode[3]}]


##Buttons
set_property PACKAGE_PIN U18 [get_ports Reset]
	set_property IOSTANDARD LVCMOS33 [get_ports Reset]
