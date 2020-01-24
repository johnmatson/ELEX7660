// John Matson
// A00991330
// ELEX 7660
// Lab 2 - Matrix Keypad Input

module kpdecode (   input logic kpr[3:0], kpr[3:0], // keypad rows and columns
                    output logic num[3:0], ct[0]); // button value and 7-segment LSD control

    logic kphit[0];

    always_comb begin
        case (kpc)

            b0111 : begin
                kphit = 1;
                case (kpr)
                    b0111 : num = 0;
                    b1011 : num = 1;
                    b1101 : num = 2;
                    b1110 : num = 3;
                    default : kphit = 0;
                endcase
            end

            b1011 : begin
                kphit = 1;
                case (kpr)
                    b0111 : num = 4;
                    b1011 : num = 5;
                    b1101 : num = 6;
                    b1110 : num = 7;
                    default : kphit = 0;
                endcase
            end

            b1101 : begin
                kphit = 1;
                case (kpr)
                    b0111 : num = 8;
                    b1011 : num = 9;
                    b1101 : num = 10;
                    b1110 : num = 11;
                    default : kphit = 0;
                endcase
            end

            b1110 : begin
                kphit = 1;
                case (kpr)
                    b0111 : num = 12;
                    b1011 : num = 13;
                    b1101 : num = 14;
                    b1110 : num = 15;
                    default : kphit = 0;
                endcase
            end

            default : kphit = 0;

        endcase

        if (kphit == 1)
            ct = 1;
    end

endmodule