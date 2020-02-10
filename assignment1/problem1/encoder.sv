module encoder (output logic [1:0] y,
                output logic valid,
                input logic [3:0] a);

    always_comb begin
        if (a) begin
            valid = 'b1;
            if (a[3])
                y = 'b11;
            else if (a[2])
                y = 'b10;
            else if (a[1])
                y = 'b01;
            else if (a[0])
                y = 'b00;
        end
        else begin
            valid = 'b0;
            y = 'b00;
        end
    end

endmodule