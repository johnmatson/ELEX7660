// lab5top.sv - top-level module for ELEX 7660 lab5
// Robert Trost  Feb 3, 2020

module lab5top (
                input logic FPGA_CLK1_50,
                input logic [1:0] KEY,
                output logic rgb_din, rgb_clk, rgb_cs, rgb_dc, rgb_res ) ;

	supply0 gnd;
	logic [7:0] gpio;
					 
	// instantiate processor system here
	lab5 u0 (
		.clk_clk       (FPGA_CLK1_50),       //   clk.clk
		.gpio_export   (gpio),   //  gpio.export
		.reset_reset_n (KEY[0]), // reset.reset_n
		.spi_MISO      (gnd),      //   spi.MISO
		.spi_MOSI      (rgb_din),      //      .MOSI
		.spi_SCLK      (rgb_clk),      //      .SCLK
		.spi_SS_n      (rgb_cs)       //      .SS_n
	);


	
    // control the display data/command (rgb_dc) with the gpio[0] from processor
	assign rgb_dc = gpio[0];
	
    // Connect active low display reset (rgb_res) to KEY[0]
	assign rgb_res = KEY[0];

endmodule
