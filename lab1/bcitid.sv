// John Matson
// A00991330
// ELEX 7660
// Lab 1 - 7-Segment LED Display Decoder

// This file implements a 2-to-4 bit memory to provide ID number values to the 7-segment decoder

module bcitid (input logic [1:0] digit, // 2-bit clock input vector
            output logic [3:0] idnum); // 4-bit output vector for ID number values

    always_comb // specify combinational 
        case (digit) // 2-bit to 4-bit memory for ID number values
            3 : idnum = 1;
            2 : idnum = 3;
            1 : idnum = 3;
            0 : idnum = 0;
        endcase

endmodule