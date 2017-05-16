`timescale 1ns / 1ps

module sout_tb(
    input wire CLK,
    input wire [3:0] ADDR,
    input wire [31:0] RData,
    input wire [31:0] GData,
    output wire [3:0] ADDR_Out,
    output wire ALE,
    output wire DR,
    output wire DG,
    output wire WE,
    output wire CLK_Out,
    output wire rd_en,
    input wire valid,
    input wire rst
    );

endmodule
