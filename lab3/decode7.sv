// John Matson
// A00991330
// ELEX 7660
// Lab 1 - 7-Segment LED Display Decoder

// This file implements a 4-to-8 bit decoder to drive the 7-segment display inputs

module decode7 (input logic [3:0] num, // 4-bit input vector for 0-F
                output logic [7:0] leds); // 8-bit output vecctor to 7-segment
    
    always_comb // specify combinational 
        case (num) // 4-bit to 8-bit decoder for 7-segment display
            0 : leds = 'b11000000;
            1 : leds = 'b11111001;
            2 : leds = 'b10100100;
            3 : leds = 'b10110000;
            4 : leds = 'b10011001;
            5 : leds = 'b10010010;
            6 : leds = 'b10000010;
            7 : leds = 'b11111000;
            8 : leds = 'b10000000;
            9 : leds = 'b10011000;
			10: leds = 'b10001000;
			11: leds = 'b10000011;
			12: leds = 'b11000110;
			13: leds = 'b10100001;
			14: leds = 'b10000110;
			15: leds = 'b10001110;
        endcase

endmodule