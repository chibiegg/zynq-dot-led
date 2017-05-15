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

    assign clk_out = counter[9];
    // 6

    initial
    begin
      counter <= 0;
    end

    always @(posedge clk_in)
    begin
      counter <= counter + 1;
    end
endmodule
