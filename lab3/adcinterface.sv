module adcinterface(
    input logic clk, reset_n, // clock and reset
    input logic [2:0] chan, // ADC channel to sample
    output logic [11:0] result, // ADC result

    // ltc2308 signals
    output logic ADC_CONVST, ADC_SCK, ADC_SDI,
    input logic ADC_SDO
);

    logic [3:0] state; // state counter
    logic [5:0] channel; // channel (updated continuously)
    logic [5:0] channel_select; // channel (updated once per cycle
    logic [11:0] data; // temporary ADC data

    // state registers
    always_ff @ (negedge clk, negedge reset_n) begin
        if (~reset_n)
            state <= 0;
        else
            state <= state + 1;
    end

    always_comb begin

        // channel read
        channel = {1'b1, chan[0], chan[2], chan[1], 1'b1, 1'b0};

        // state logic for ADC_CONVST & ADC_SDI
        case(state)
            0 : begin
                ADC_CONVST = 1;
                ADC_SDI = 0;
            end
            1 : begin
                ADC_CONVST = 0;
                ADC_SDI = 0;
            end
            2 : begin
                ADC_CONVST = 0;
                ADC_SDI = channel_select[5];
            end
            3 : begin
                ADC_CONVST = 0;
                ADC_SDI = channel_select[4];
            end
            4 : begin
                ADC_CONVST = 0;
                ADC_SDI = channel_select[3];
            end
            5 : begin
                ADC_CONVST = 0;
                ADC_SDI = channel_select[2];
            end
            6 : begin
                ADC_CONVST = 0;
                ADC_SDI = channel_select[1];
            end
            7 : begin
                ADC_CONVST = 0;
                ADC_SDI = channel_select[0];
            end
            8 : begin
                ADC_CONVST = 0;
                ADC_SDI = 0;
            end
            9 : begin
                ADC_CONVST = 0;
                ADC_SDI = 0;
            end
            10 : begin
                ADC_CONVST = 0;
                ADC_SDI = 0;
            end
            11 : begin
                ADC_CONVST = 0;
                ADC_SDI = 0;
            end
            12 : begin
                ADC_CONVST = 0;
                ADC_SDI = 0;
            end
            13 : begin
                ADC_CONVST = 0;
                ADC_SDI = 0;
            end
            14 : begin
                ADC_CONVST = 0;
                ADC_SDI = 0;
            end
            15 : begin
                ADC_CONVST = 0;
                ADC_SDI = 0;
            end
				default : begin
                ADC_CONVST = 0;
                ADC_SDI = 0;
			end
        endcase
    end

    // adc data read
    always_ff @ (posedge clk) begin
        if ((state >= 2) && (state <= 13))
            data[13-state] <= ADC_SDO; // CHECK MATH
    end
	
    // channel load & data load - once per cycle
    always_ff @ (negedge clk) begin
        if (state == 1) begin
            channel_select = channel;
            result = data;
		end
    end

    // ADC_SCK clock assign
    assign ADC_SCK = ((state >= 2) && ((state <= 13))) ? clk : 1'b0;

endmodule