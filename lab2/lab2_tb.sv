// lab2_tb.sv - testbench for ELEX 7660 201710 Lab2
// Ed.Casas 2017-1-13

// The testbench turns on each switch and checks the keypad and
// led decoders


// model for a 4x4 switch matrix keypad with row pull-ups

module lab2_kp ( inout wire [3:0] cols, // column lines
                 inout wire [3:0] rows, // row lines
                 input logic [3:0][3:0] keys ) ; // switches ([row][col])

   genvar row, col ;
   
   generate
      for ( row=3 ; row>=0 ; row-- ) begin
         pullup p0 ( rows[row] ) ;
         for ( col=3 ; col>=0 ; col-- ) begin
            tranif1 sw0 ( rows[row], cols[col], keys[row][col] ) ;
         end
      end
   endgenerate

endmodule


// return the value of the pressed key or x if no match

function logic [3:0] decodekp ( logic [3:0] row, logic [3:0] col ) ;

   static int keyval [16] = '{ 'h1, 'h2, 'h3, 'ha, 
                               'h4, 'h5, 'h6, 'hb,
                               'h7, 'h8, 'h9, 'hc, 
                               'he, 'h0, 'hf, 'hd } ;

   for ( int i=3, int k=0 ; i>=0 ; i-- )
     for ( int j=3 ; j>=0 ; j--, k++ )
       if ( (row^(1<<i)) == 'hf && (col^(1<<j)) == 'hf ) 
         return keyval[k] ;

   return 4'hx ;

endfunction


// testbench for lab2 - tests reset and valid key presses

module lab2_tb ;

   logic [0:15] keys ;
   wire [3:0] kpc, kpr ;
   logic [3:0] num, num_ok ;
   logic [7:0] leds, leds_ok ;
   logic kphit, reset_n, clk ;
            
   // (obfuscated) 7-segment LED decoder
   logic [7:0] check7seg[16] = '{ 8'h2d, 8'h14, 8'h49, 8'h5d, 
                                  8'h74, 8'h7f, 8'h6f, 8'h15, 
                                  8'h6d, 8'h7d, 8'h65, 8'h6e, 
                                  8'h2b, 8'h4c, 8'h6b, 8'h63 } ;
   
   // instantiate student-supplied modules
   
   colseq colseq_0 (.kpr, .kpc, .reset_n, .clk) ;
   kpdecode kpdecode_0 (.kpr, .kpc, .kphit, .num ) ;
   decode7 decode7_0 (.num, .leds ) ;

   // instantiate keypad model

   lab2_kp kp (.cols(kpc), .rows(kpr), .keys) ;

   // run tests

   initial begin

      keys = 16'b0 ;            // all switches off
      
      // test reset

      clk = ( reset_n = '0 ) ;
      repeat(2) @(posedge clk) ; 
      @(negedge clk) $display("on reset kpc = %b (should be 0111)", kpc) ;
      reset_n = '1 ;

      // test each key

      for ( int i=0 ; i<16 ; i++ ) begin: keytests

         // release all keys
         keys = '0 ;
         repeat(2) @(posedge clk) ;

         // close one switch & wait maximum scan time
         keys[i] = '1 ;
         repeat(5) @(posedge clk) ;

         // check keypad decoder
         num_ok = decodekp(kpr, kpc) ;
         $display("%s: key %2d => num  %h (should be  %h)",
                  num === num_ok ? "PASS" : "FAIL", i, num, num_ok) ;

         // check LED decoder
         leds_ok = check7seg[num]^8'hed ;
         $display("%s: num %2d => led %2h (should be %2h)",
                  leds === leds_ok ? "PASS" : "FAIL", num, leds, leds_ok) ;

      end: keytests
      
      $stop ;
      // $finish ;
   end

   // clock
   always
     #500ns clk = ~clk ;
   
endmodule      

