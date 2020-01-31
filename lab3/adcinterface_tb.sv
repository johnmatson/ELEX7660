// ELEX 7660 202010 Lab 3
// Testbench to test the ADC interface module
// Robert Trost 2020/1/21

module adcinterface_tb();

logic clk, reset_n;			 // clock and reset
logic [2:0] chan;			 // channel to be sampled
logic [11:0] result;		 // result read by adc interface module
logic [11:0] adcoutput = 0;  // randomly generated ADC output
logic [11:0] configword = 0; // capture configuration word from adcinterface
	
// ltc2308 signals
logic ADC_CONVST, ADC_SCK, ADC_SDI;
logic ADC_SDO = 0;

adcinterface dut_0 (.*);  // device under test


initial begin
	clk = 0;
	reset_n = 0;
	chan = 0;
	
	repeat(2) @(posedge clk);
	
	reset_n = 1;
	
	// loop for each possible channel
	do begin

	// wait for conversion start signal
	@(posedge ADC_CONVST);
	
		// generate a random 12-bit ADC output
		adcoutput = $urandom_range(12'hfff, 0);

		for (int i = 11; i>=0; i--)	begin
			// place each data bit on SDO and wait for negative edge of serial clock to change output
			ADC_SDO = adcoutput[i];
			@(posedge ADC_SCK);
			// capture config word on positive edge
			configword[i] = ADC_SDI;
			@(negedge ADC_SCK);
		end
		
	@(posedge clk);
	$display ("%s: expected ADC ouput %3h, received %3h",  adcoutput == result ? "PASS" : "FAIL", adcoutput, result);
	$display ("%s: channel %1d, expected config word %2h, received %2h",  configword[11:6] == {1'b1, chan[0], chan[2:1], 1'b1, 1'b0} ? "PASS" : "FAIL", chan, {1'b1, chan[0], chan[2:1], 1'b1, 1'b0}, configword[11:6]);

	chan++;
	
	end while (chan != 0);
		
	$stop;

end

// generate clock
always
	#1ms clk = ~clk;
	

endmodule

