// tonegen_tb.sv - testbench for ELEX 7660 202010 Lab 4

// test tone generator with frequencies of 0 (on reset), 1Hz and
// 10Hz using a clock frequency of 20Hz

`timescale 1ms/1ms

module tonegen_tb ;

   logic [31:0] writedata = '0 ;
   logic write = '0 ;
   logic spkr ;
   logic reset, clk = '1 ;

   tonegen #(.fclk(20)) dut_0 (.*) ;      // fclk=20Hz

   initial begin

      // reset

      reset = '1 ;
      repeat(2) @(negedge clk) ;
      reset = '0 ;

      // should have no output here (freq should be zero)
      repeat(10) @(negedge clk) ;

      // set frequency to 1Hz (10 high, 10 low)
      writedata = 1 ;
      write = '1 ;
      repeat(2) @(negedge clk) ;
      write = '0 ;
      repeat(25) @(negedge clk) ;

      // set frequency to 10 Hz (1 high, 1 low)
      writedata = 10 ;
      write = '1 ;
      repeat(2) @(negedge clk) ;
      write = '0 ;
      repeat(25) @(negedge clk) ;

      $stop ;
    
   end

   // 20 Hz clock
   always
     #25ms clk = ~clk ;
   
endmodule      

