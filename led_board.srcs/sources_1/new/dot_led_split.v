`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 05/16/2017 01:01:01 PM
// Design Name:
// Module Name: dot_led_split
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module dot_led_split(
    input wire [67:0] data,
    output wire [3:0] ADDR,
    output wire [31:0] RData,
    output wire [31:0] GData
    );

    assign ADDR = data[3:0];
    assign RData = data[35:4];
    assign GData = data[67:36];
endmodule
