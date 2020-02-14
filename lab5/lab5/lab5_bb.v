
module lab5 (
	clk_clk,
	gpio_export,
	reset_reset_n,
	spi_MISO,
	spi_MOSI,
	spi_SCLK,
	spi_SS_n);	

	input		clk_clk;
	output	[7:0]	gpio_export;
	input		reset_reset_n;
	input		spi_MISO;
	output		spi_MOSI;
	output		spi_SCLK;
	output		spi_SS_n;
endmodule
