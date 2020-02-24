module seqDetect_tb;

    logic valid; // output valid signal for correct sequence
    logic a; // serial sequence data input
    logic [3:0] seq = 0100; // correct signal for comparison
    logic clk, reset_n;

    seqDetect dut_0 (.*);

    int i;

    initial begin
        reset_n = 0;
        clk = 0;
        a = 0;
        i = 0;
    
        #5ns reset_n = 1;
    forever begin
        #5ns clk = ~clk;
        a = seq[i%4];
        i++;
        #5ns clk = ~clk;
    end
    end

    initial begin
        #100ns reset_n = 0;
        #40ns reset_n = 1;
        #60ns $stop;
    end

endmodule