//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.1 (lin64) Build 1538259 Fri Apr  8 15:45:23 MDT 2016
//Date        : Wed May 17 15:37:19 2017
//Host        : 2c1b35e64c66 running 64-bit unknown
//Command     : generate_target led_board_wrapper.bd
//Design      : led_board_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module led_board_wrapper
   (dot_led_addr,
    dot_led_ale,
    dot_led_clk,
    dot_led_dg,
    dot_led_dr,
    dot_led_ram,
    dot_led_se,
    dot_led_we,
    leds_6bits_tri_o);
  output [3:0]dot_led_addr;
  output dot_led_ale;
  output dot_led_clk;
  output dot_led_dg;
  output dot_led_dr;
  output dot_led_ram;
  output dot_led_se;
  output dot_led_we;
  output [5:0]leds_6bits_tri_o;

  wire [3:0]dot_led_addr;
  wire dot_led_ale;
  wire dot_led_clk;
  wire dot_led_dg;
  wire dot_led_dr;
  wire dot_led_ram;
  wire dot_led_se;
  wire dot_led_we;
  wire [5:0]leds_6bits_tri_o;

  led_board led_board_i
       (.dot_led_addr(dot_led_addr),
        .dot_led_ale(dot_led_ale),
        .dot_led_clk(dot_led_clk),
        .dot_led_dg(dot_led_dg),
        .dot_led_dr(dot_led_dr),
        .dot_led_ram(dot_led_ram),
        .dot_led_se(dot_led_se),
        .dot_led_we(dot_led_we),
        .leds_6bits_tri_o(leds_6bits_tri_o));
endmodule
