module alu #(parameter N = 8) (
    input [N-1:0] A,        // First operand
    input [N-1:0] B,        // Second operand
    input [3:0] ALU_Sel,    // ALU operation selection
    output reg [N-1:0] Result,  // ALU result
    output reg Cout,            // Carry out for addition
    output reg Zero,            // Zero flag
    output reg Overflow,        // Overflow flag
    output reg Neg,             // Negative flag
    output reg Equal            // Equality flag
);

always @(*) begin
    // Default outputs
    Result = 0;
    Cout = 0;
    Zero = 0;
    Overflow = 0;
    Neg = 0;
    Equal = 0;

    case (ALU_Sel)
        4'b0000: begin // Addition
            {Cout, Result} = A + B;
            Overflow = (A[N-1] == B[N-1]) && (Result[N-1] != A[N-1]);
        end
        4'b0001: begin // Subtraction
            {Cout, Result} = A - B;
            Overflow = (A[N-1] != B[N-1]) && (Result[N-1] != A[N-1]);
        end
        4'b0010: begin // AND
            Result = A & B;
        end
        4'b0011: begin // OR
            Result = A | B;
        end
        4'b0100: begin // XOR
            Result = A ^ B;
        end
        4'b0101: begin // NOT A
            Result = ~A;
        end
        4'b0110: begin // Logical Shift Left
            Result = A << 1;
        end
        4'b0111: begin // Logical Shift Right
            Result = A >> 1;
        end
        4'b1000: begin // Arithmetic Shift Right
            Result = $signed(A) >>> 1;
        end
        4'b1001: begin // Increment A
            {Cout, Result} = A + 1;
            Overflow = (A[N-1] == 1 && Result[N-1] == 0);
        end
        4'b1010: begin // Decrement A
            {Cout, Result} = A - 1;
            Overflow = (A[N-1] == 0 && Result[N-1] == 1);
        end
        4'b1011: begin // Equality Check
            Result = (A == B) ? 1 : 0;
            Equal = (A == B);
        end
        4'b1100: begin // Less Than
            Result = (A < B) ? 1 : 0;
        end
        4'b1101: begin // Greater Than
            Result = (A > B) ? 1 : 0;
        end
        4'b1110: begin // Greater Than or Equal To
            Result = (A >= B) ? 1 : 0;
        end
        4'b1111: begin // Less Than or Equal To
            Result = (A <= B) ? 1 : 0;
        end
    endcase

    // Setting the Zero flag
    Zero = (Result == 0);

    // Setting the Negative flag
    Neg = Result[N-1];
end

endmodule
