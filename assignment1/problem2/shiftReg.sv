module shiftReg #(parameter N = 8) (output logic [N-1:0] q,
                                    input logic [N-1:0] a,
                                    input logic [1:0] s,
                                    input logic shiftIn, clk, reset_n);

    logic [N-1:0] memory;

    always_ff @ (posedge clk, negedge reset_n) begin
        if (~reset_n) begin
            memory <= 0;
            q <= 0;
        end

        case (s)
            0 : begin
                memory <= a;
                q <= memory;
            end
            1 : begin
                memory <= memory>>1;
                memory[N-1] <= shiftIn;
                q <= memory;
            end
            2 : begin
                memory <= memory<<1;
                memory[0] <= shiftIn;
                q <= memory;
            end
            3 : begin
                memory <= memory;
                q <= memory;
            end
            default : begin
                memory <= 0;
                q <= 0;
            end
        endcase
    end

endmodule