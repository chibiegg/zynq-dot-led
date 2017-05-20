`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 05/13/2017 10:53:15 AM
// Design Name:
// Module Name: prescaler
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


module prescaler(
    input clk_in,
    output clk_out
    );

    reg [32:0] counter;
    reg clk;

    assign clk_out = clk;
    // 9

    initial
    begin
      counter <= 0;
      clk <= 0;
    end

    always @(posedge clk_in)
    begin
      counter <= counter + 1;
    end

    always @ ( * ) begin
      clk <= counter[9];
    end

endmodule
