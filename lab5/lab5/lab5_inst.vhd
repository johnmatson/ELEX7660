	component lab5 is
		port (
			clk_clk       : in  std_logic                    := 'X'; -- clk
			gpio_export   : out std_logic_vector(7 downto 0);        -- export
			reset_reset_n : in  std_logic                    := 'X'; -- reset_n
			spi_MISO      : in  std_logic                    := 'X'; -- MISO
			spi_MOSI      : out std_logic;                           -- MOSI
			spi_SCLK      : out std_logic;                           -- SCLK
			spi_SS_n      : out std_logic                            -- SS_n
		);
	end component lab5;

	u0 : component lab5
		port map (
			clk_clk       => CONNECTED_TO_clk_clk,       --   clk.clk
			gpio_export   => CONNECTED_TO_gpio_export,   --  gpio.export
			reset_reset_n => CONNECTED_TO_reset_reset_n, -- reset.reset_n
			spi_MISO      => CONNECTED_TO_spi_MISO,      --   spi.MISO
			spi_MOSI      => CONNECTED_TO_spi_MOSI,      --      .MOSI
			spi_SCLK      => CONNECTED_TO_spi_SCLK,      --      .SCLK
			spi_SS_n      => CONNECTED_TO_spi_SS_n       --      .SS_n
		);

