module seqDetect (  output logic valid, // output valid signal for correct sequence
                    input logic a, // serial sequence data input
                    input logic [3:0] seq, // correct signal for comparison
                    input logic clk, reset_n); 

    logic [3:0] A; // concatenated sequence from input signal a

    always_ff @ (posedge clk, negedge reset_n) begin

        // check for asychronous resest
        if (~reset_n) begin
            valid <= 0;
            A <= 0;
        end

        // shift a bit in and compare sequence
        else begin
            A <= {A[2:0], a};
            if (A==seq)
                valid <= 1;
            else
                valid <= 0;
        end
    end

endmodule