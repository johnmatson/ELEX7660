module encoder_tb ;

   logic [1:0] y; // 4-2 bit encoder output
   logic valid; // non-zero output signal
   logic [3:0] a; // 4-bit encoder input

   encoder uut1 (.*);
   
   // step though all possible 4-bit inputs
   initial begin
      for ( int i=0 ; i<=15 ; i++ ) begin
        a = i ; 
        #1us ;
        end 
      $stop ;
   end

endmodule