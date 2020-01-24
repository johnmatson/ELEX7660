// John Matson
// A00991330
// ELEX 7660
// Lab 2 - Matrix Keypad Input

module colseq ( input logic clk, reset_n, kpr[3:0], // clock, reset & keypad rows
                output logic kpc[3:0]); // keypad columns

    logic [1:0] state;

    always_ff @ (posedge clk, negedge reset_n) begin
        if (~reset_n)
            state <= 0;
        else
            state++;
    end

    always_comb begin
        case (state)

            0 : begin
                kpc = b0111;
                case (kpr)
                    b0111 : while (kpr[3] == 0);
                    b1011 : while (kpr[2] == 0);
                    b1101 : while (kpr[1] == 0);
                    b1110 : while (kpr[0] == 0);
                endcase
            end

            1 : begin
                kpc = b1011;
                case (kpr)
                    b0111 : while (kpr[3] == 0);
                    b1011 : while (kpr[2] == 0);
                    b1101 : while (kpr[1] == 0);
                    b1110 : while (kpr[0] == 0);
                endcase
            end

            2 : begin
                kpc = b1101;
                case (kpr)
                    b0111 : while (kpr[3] == 0);
                    b1011 : while (kpr[2] == 0);
                    b1101 : while (kpr[1] == 0);
                    b1110 : while (kpr[0] == 0);
                endcase
            end

            3 : begin
                kpc = b1110;
                case (kpr)
                    b0111 : while (kpr[3] == 0);
                    b1011 : while (kpr[2] == 0);
                    b1101 : while (kpr[1] == 0);
                    b1110 : while (kpr[0] == 0);
                endcase
            end

        endcase
    end

endmodule