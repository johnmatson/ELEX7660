module encoder (output logic [1:0] y, // 4-2 bit encoder output
                output logic valid, // non-zero output signal
                input logic [3:0] a); // 4-bit encoder input

    always_comb begin
        if (a) begin
            valid = 'b1;
            if (a[3])
                y = 'b11;
            else if (a[2])
                y = 'b10;
            else if (a[1])
                y = 'b01;
            else
                y = 'b00;
        end
        else begin
            valid = 'b0;
            y = 'b00;
        end
    end

endmodule