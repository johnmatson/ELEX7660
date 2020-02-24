module vendingMachine ( output logic valid, // output signal asserted once total change reaches $1
                        input logic nickel, dime, quarter, // $0.05, $0.10 & $0.25 inputs
                        input logic clk, reset_n);

    logic [6:0] cents; // change total

    always_ff @ (posedge clk, negedge reset_n) begin
        // check for asychronous reset
        if (~reset_n) begin
            cents <= 0;
        end

        else if (~valid) begin
            // increment appropriate dollar ammount if inputs are asserted
            if (nickel)
                cents <= cents + 5;
            if (dime)
                cents <= cents + 10;
            if (quarter)
                cents <= cents + 25;
        end
    end

    always_comb begin
        // assert valid signal once change reaches $1
        if (cents >= 100)
            valid = 1;
        else
            valid = 0;
    end

endmodule