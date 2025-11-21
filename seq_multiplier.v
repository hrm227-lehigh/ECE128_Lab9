module seq_mult (
    input clk, rst,
    input [3:0] a, b,
    output reg [7:0] p
);
    reg [1:0] ps, ns;
    reg [3:0] operand_b, shift_count;
    reg [7:0] partial, multiplicand;


    parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;

    always @(posedge clk or posedge rst) begin
        if (rst)
            ps <= s0;
        else
            ps <= ns;
    end

    always @(*) begin
        ns = ps;
        case (ps)
            s0: ns = s1;
            s1: if (shift_count == 4) ns = s2;
            s2: ns = s3;
            s3: ns = s0;
        endcase
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            multiplicand <= 8'b0;
            partial <= 8'b0;
            shift_count <= 0;
            operand_b <= 0;
            p <= 0;
        end else begin
            case (ps)
                s0: begin
                    multiplicand <= {4'b0, a};
                    partial <= 8'b0;
                    shift_count <= 0;
                    operand_b <= b;
                end

                s1: begin
                    if (shift_count < 4) begin
                        if (operand_b[0] == 1)
                            partial <= partial + multiplicand;
                        multiplicand <= multiplicand << 1;
                        operand_b <= operand_b >> 1;
                        shift_count <= shift_count + 1;
                    end
                end

                s2: begin
                    p <= partial;
                end

                s3: begin
                    p <= p;
                end
            endcase
        end
    end

endmodule