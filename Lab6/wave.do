onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_usb_receiver/CLK_PERIOD
add wave -noupdate /tb_usb_receiver/clk
add wave -noupdate /tb_usb_receiver/clk2
add wave -noupdate /tb_usb_receiver/n_rst
add wave -noupdate /tb_usb_receiver/d_plus
add wave -noupdate /tb_usb_receiver/d_minus
add wave -noupdate /tb_usb_receiver/r_enable
add wave -noupdate /tb_usb_receiver/r_data
add wave -noupdate /tb_usb_receiver/empty
add wave -noupdate /tb_usb_receiver/full
add wave -noupdate /tb_usb_receiver/rcving
add wave -noupdate /tb_usb_receiver/r_error
add wave -noupdate -divider EDGE
add wave -noupdate /tb_usb_receiver/TOP/EDGE/clk
add wave -noupdate /tb_usb_receiver/TOP/EDGE/n_rst
add wave -noupdate /tb_usb_receiver/TOP/EDGE/d_plus
add wave -noupdate /tb_usb_receiver/TOP/EDGE/d_edge
add wave -noupdate /tb_usb_receiver/TOP/EDGE/d_plus_old
add wave -noupdate /tb_usb_receiver/TOP/EDGE/next_d_edge
add wave -noupdate -divider TIM
add wave -noupdate /tb_usb_receiver/TOP/TIM/clk
add wave -noupdate /tb_usb_receiver/TOP/TIM/n_rst
add wave -noupdate /tb_usb_receiver/TOP/TIM/d_edge
add wave -noupdate /tb_usb_receiver/TOP/TIM/rcving
add wave -noupdate /tb_usb_receiver/TOP/TIM/shift_enable
add wave -noupdate /tb_usb_receiver/TOP/TIM/byte_received
add wave -noupdate /tb_usb_receiver/TOP/TIM/flag
add wave -noupdate /tb_usb_receiver/TOP/TIM/count1
add wave -noupdate /tb_usb_receiver/TOP/TIM/count2
add wave -noupdate -divider RCU
add wave -noupdate /tb_usb_receiver/TOP/RCU/clk
add wave -noupdate /tb_usb_receiver/TOP/RCU/n_rst
add wave -noupdate /tb_usb_receiver/TOP/RCU/d_edge
add wave -noupdate /tb_usb_receiver/TOP/RCU/eop
add wave -noupdate /tb_usb_receiver/TOP/RCU/shift_enable
add wave -noupdate /tb_usb_receiver/TOP/RCU/rcv_data
add wave -noupdate /tb_usb_receiver/TOP/RCU/byte_received
add wave -noupdate /tb_usb_receiver/TOP/RCU/rcving
add wave -noupdate /tb_usb_receiver/TOP/RCU/w_enable
add wave -noupdate /tb_usb_receiver/TOP/RCU/r_error
add wave -noupdate /tb_usb_receiver/TOP/RCU/curr
add wave -noupdate /tb_usb_receiver/TOP/RCU/next
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1 ns}
