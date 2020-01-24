// bcit_tb.sv - ELEX 7660 201710 testbench for lab1 bcitid.sv
// Ed.Casas 2017-1-9

module bcitid_tb ;

   logic [1:0] digit ;
   logic [3:0] idnum ;

   bcitid uut1 (.*);
   
   initial begin
      for ( int i=0 ; i<=3 ; i++ ) begin
        digit = i ; 
        #1us ;
        end 
      $stop ;
   end
   
endmodule
