// lab5top.sv - top-level module for ELEX 7660 lab5
// Robert Trost  Feb 3, 2020

module lab5top (
                input logic FPGA_CLK1_50,
                input logic [1:0] KEY,
                output logic rgb_din, rgb_clk, rgb_cs, rgb_dc, rgb_res ) ;

	// instantiate processor system here
    ???
	
    // control the display data/command (rgb_dc) with the gpio[0] from processor
	???
	
    // Connect active low display reset (rgb_res) to KEY[0]
	???

endmodule
