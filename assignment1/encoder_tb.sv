module encoder_tb ;

   logic [1:0] y;
   logic valid;
   logic [3:0] a;

   encoder uut1 (.*);
   
   initial begin
      for ( int i=0 ; i<=15 ; i++ ) begin
        a = i ; 
        #1us ;
        end 
      $stop ;
   end

endmodule