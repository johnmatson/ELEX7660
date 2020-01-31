// lab4top.sv - top-level module for ELEX 7660 lab4
// Robert Trost Jan 27, 2020

module lab4top (
                input logic FPGA_CLK1_50, 
                input logic [1:0] KEY,
                output logic [7:0] LED,
                output logic spkr ) ;
   
   lab4 u0 (
            .clk_clk       (FPGA_CLK1_50),
            .led_export    (LED),  
            .reset_reset_n (KEY[0]),
            .spkr_export   (spkr) 
            );

endmodule
