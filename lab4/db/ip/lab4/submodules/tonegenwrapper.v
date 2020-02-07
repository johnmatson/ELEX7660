// tonegenwrapper.v

// This is a wrapper that defines the ports of the tonegen module in
// Verilog-2001 syntax and instantiates it.


module tonegenwrapper 
  #( parameter fclk = 50000000 ) 
   (
    input  wire        avs_write,     // avalon_slave.write
    input  wire [31:0] avs_writedata, //             .writedata
    input  wire        clk,       //   clock_sink.clk
    input  wire        reset,     //   reset_sink.reset
    output wire        coe_spkr       //  conduit_end.spkr
    );

   tonegen #( fclk ) tonegen0    // fclk is clock frequency, Hz          
   ( 
     .writedata(avs_writedata),     // Avalon MM bus, data
     .write(avs_write),             // " write strobe
     .spkr(coe_spkr),               // on/off output for audio 
     .reset(reset), .clk(clk) ) ;

endmodule
