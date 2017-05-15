`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 05/14/2017 03:50:25 PM
// Design Name:
// Module Name: led_board_sout
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


module led_board_sout(
    input CLK_In,
    input [3:0] Addr_In,
    input [31:0] RData,
    input [31:0] GData,
    input Request,
    output Clear,
    output [3:0] Addr_Out,
    output ALE,
    output RD,
    output GD,
    output WE,
    output CLK_Out
    );

    reg [31:0] r_data;
    reg [31:0] g_data;
    reg [5:0] counter;
    reg we;
    reg [3:0] addr;
    reg ale;

    reg busy;

    assign Clear = Request & (counter >= 40);
    assign Addr_Out = addr;
    assign RD = r_data[31];
    assign GD = g_data[31];
    assign WE = we;
    assign ALE = ale;
    assign CLK_Out = (counter < 32) & CLK_In;

    initial
    begin
      busy <= 0;
      r_data <= 0;
      g_data <= 0;
      counter <= 36;
      we <= 0;
      addr <= 0;
      ale <= 0;
    end

    always @(negedge CLK_In)
    begin
      if ( Request )
      begin
        if ( ~busy )
          begin
            busy <= 1;
            counter <= 0;
            r_data <= RData;
            g_data <= GData;
            addr <= Addr_In;
          end
        else
          begin
            if ( counter <= 39 )
              begin
                counter <= counter + 1;
                r_data <= r_data << 1;
                g_data <= g_data << 1;
              end

            case (counter)
              33: ale <= 1;
              34: we <= 1;
              35: we <= 0;
              36: ale <= 0;
            endcase
          end

      end
      else
      begin
        busy <= 0;
        counter <= 36;
      end
    end

endmodule
