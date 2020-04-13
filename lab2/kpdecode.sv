// John Matson
// A00991330
// ELEX 7660
// Lab 2 - Matrix Keypad Input

module kpdecode (   input logic [3:0] kpr, kpc, // keypad rows and columns
                    output logic [3:0] num, // button value
					output logic kphit); // keypad hit signal for 7-segment LSD control

    always_comb begin
		kphit = 0;
		num = 0;

		if (kpr != 15) begin
		kphit = 1;
			case (kpr)

				'b1110 : begin
					kphit = 1;
					case (kpc)
						'b0111 : num = 1;
						'b1011 : num = 4;
						'b1101 : num = 7;
						'b1110 : num = 14;
					endcase
				end

				'b1101 : begin
					kphit = 1;
					case (kpc)
						'b0111 : num = 2;
						'b1011 : num = 5;
						'b1101 : num = 8;
						'b1110 : num = 0;
					endcase
				end

				'b1011 : begin
					kphit = 1;
					case (kpc)
						'b0111 : num = 3;
						'b1011 : num = 6;
						'b1101 : num = 9;
						'b1110 : num = 15;
					endcase
				end

				'b0111 : begin
					kphit = 1;
					case (kpc)
						'b0111 : num = 10;
						'b1011 : num = 11;
						'b1101 : num = 12;
						'b1110 : num = 13;
					endcase
				end

				default : kphit = 0;

			endcase
		end
    end

endmodule