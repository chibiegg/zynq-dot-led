//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.1 (lin64) Build 1538259 Fri Apr  8 15:45:23 MDT 2016
//Date        : Mon May 15 05:43:40 2017
//Host        : 23b712d23b45 running 64-bit unknown
//Command     : generate_target led_board_wrapper.bd
//Design      : led_board_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module led_board_wrapper
   (led_data_o,
    leds_4bits_tri_o);
  output [10:0]led_data_o;
  output [3:0]leds_4bits_tri_o;

  wire [10:0]led_data_o;
  wire [3:0]leds_4bits_tri_o;

  led_board led_board_i
       (.led_data_o(led_data_o),
        .leds_4bits_tri_o(leds_4bits_tri_o));
endmodule
