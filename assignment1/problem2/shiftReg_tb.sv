module shiftReg_tb ;

    logic [3:0] q; // n-bit bus output
    logic [3:0] a; // n-bit bus input
    logic [1:0] s; // input command selector
    logic shiftIn, clk, reset_n;

    shiftReg #(.N(4)) dut_0 (.*); // configure 4-bit bus parameter

    initial begin
        reset_n = 0;
        clk = 0;

        #5ns reset_n = 1;
        shiftIn = 1;
        a = 'b0110;
        s = 0;

        #5ns clk = 1;

        #5ns clk = 0;
        s = 1;

        #5ns clk = 1;

        #5ns clk = 0;
        s = 2;

        #5ns clk = 1;

        #5ns clk = 0;
        s = 3;

        #5ns clk = 1;

        #5ns clk = 0;

        #5ns clk = 1;

        #5ns reset_n = 0;
    end

endmodule