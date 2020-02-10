module shiftReg_tb ;

    logic [3:0] q;
    logic [3:0] a;
    logic [1:0] s;
    logic shiftIn, clk, reset_n;

    shiftReg #(.N(4)) dut_0 (.*);

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