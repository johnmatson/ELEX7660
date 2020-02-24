module vendingMachine_tb;

    logic valid; // output signal asserted once total change reaches $1
    logic nickel, dime, quarter; // $0.05, $0.10 & $0.25 inputs
    logic clk, reset_n;

    vendingMachine dut_0 (.*);

    initial begin
        nickel = 0;
        dime = 0;
        quarter = 0;
        reset_n = 0;
        clk = 0;

        #5ns reset_n = 1;

        forever begin
            #5ns nickel = 1;
            dime = 0;
            quarter = 0;
            clk = ~clk;
            #5ns clk = ~clk;

            #5ns nickel = 0;
            dime = 1;
            quarter = 0;
            clk = ~clk;
            #5ns clk = ~clk;

            #5ns nickel = 0;
            dime = 0;
            quarter = 1;
            clk = ~clk;
            #5ns clk = ~clk;
        end
    end
    
    initial begin
        #100ns reset_n = 0;
        #10ns reset_n = 1;
        #100ns $stop;
    end
endmodule