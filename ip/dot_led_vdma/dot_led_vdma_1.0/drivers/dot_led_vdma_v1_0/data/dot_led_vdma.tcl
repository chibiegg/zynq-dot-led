

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "dot_led_vdma" "NUM_INSTANCES" "DEVICE_ID"  "C_S_AXI_L_BASEADDR" "C_S_AXI_L_HIGHADDR"
}
