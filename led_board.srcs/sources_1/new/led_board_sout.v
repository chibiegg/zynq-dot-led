`timescale 1ns / 1ps

module led_board_sout(
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

    reg [31:0] r_data;
    reg [31:0] g_data;
    reg [3:0] addr;
    reg [5:0] counter;
    reg we;
    reg ale;
    reg clk_en;
    reg _rd_en;
    reg busy;

    assign ADDR_Out = addr;
    assign DR = r_data[31];
    assign DG = g_data[31];
    assign WE = we;
    assign ALE = ale;
    assign CLK_Out = clk_en & ~CLK;
    assign rd_en = _rd_en;

    always @(posedge CLK) begin
      if (rst) begin
        r_data <= 0;
        g_data <= 0;
        addr <= 0;
        counter <= 0;
        clk_en <= 0;
        _rd_en <= 0;
        busy <= 0;

        we <= 0;
        ale <= 0;
      end
      else begin

        // Not Changed
        addr <= addr;
        clk_en <= clk_en;
        _rd_en <= _rd_en;

        if(busy) begin
          // Busy
          case (counter)
            31: begin
              ale <= 1;
              we <= 0;
              busy <= busy;
            end
            32: begin
              ale <= 1;
              we <= 1;
              busy <= busy;
            end
            33: begin
              ale <= 0;
              we <= 0;
              busy <= 0;
            end
            default: begin
              ale <= ale;
              we <= we;
              busy <= busy;
            end
          endcase
          r_data <= r_data << 1;
          g_data <= g_data << 1;
          counter <= counter + 1;
        end
        else begin
          // Not Busy
          we <= 0;
          ale <= 0;
          addr <= ADDR;
          r_data <= RData;
          g_data <= GData;
          counter <= 0;
          if (_rd_en & valid) begin
            _rd_en <= 0;
            busy <= 1;
            clk_en <= 1;
          end
          else begin
            _rd_en <= 1;
            busy <= 0;
            clk_en <= 0;
          end
        end
      end
    end

    /*
    always @(negedge CLK)
    begin
      if (~busy)
      begin
        counter <= 0;
        if (~empty)
        begin
          _rd_en <= 1;
        end
      end
      else
      begin
        // ?????????
        case (counter)
          0: begin
            _rd_en <= 0;
            r_data_tmp <= r_data;
            g_data_tmp <= g_data;
            clk_en <= 1;
          end
          32: begin
            clk_en <= 0;
            ale <= 1;
          end
          33: we <= 1;
          34: begin
            ale <= 0;
            we <= 0;
          end
          default: begin
            r_data_tmp <= r_data_tmp << 1;
            g_data_tmp <= g_data_tmp << 1;
          end
        endcase
        counter <= counter + 1;
      end
    end
    */

endmodule
