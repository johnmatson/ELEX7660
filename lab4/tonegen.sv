module tonegen
  #( parameter logic [31:0] fclk )  // clock frequency, Hz
   ( input logic [31:0] writedata,  // Avalon MM bus, data
     input logic write,             // write enable
     output logic spkr,             // output for audio
     input logic reset, clk ) ;     // active high reset and clock

//  initial begin
    logic [31:0] count;
    logic [31:0] freq;
//  end

  always_ff @ (posedge clk) begin
    if (write)
      freq <= writedata;
  end

  always_ff @ (posedge clk, posedge reset) begin
    if (reset) begin
      count <= 0;
      spkr <= 0;
    end
    else begin
      if (count >= ((fclk/2/freq)-1)) begin
          spkr <= ~spkr;
          count <= 0;
        end
      else
        count <= count + 1;
    end
  end

endmodule