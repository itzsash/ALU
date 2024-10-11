module tb_alu;

parameter N = 8; // You can change this to test different widths

reg [N-1:0] A;        // First operand
reg [N-1:0] B;        // Second operand
reg [3:0] ALU_Sel;    // ALU operation selection
wire [N-1:0] Result;  // ALU result
wire Cout;            // Carry out for addition
wire Zero;            // Zero flag
wire Overflow;        // Overflow flag
wire Neg;             // Negative flag
wire Equal;           // Equality flag

// Instantiate the ALU
alu #(.N(N)) my_alu (
    .A(A),
    .B(B),
    .ALU_Sel(ALU_Sel),
    .Result(Result),
    .Cout(Cout),
    .Zero(Zero),
    .Overflow(Overflow),
    .Neg(Neg),
    .Equal(Equal)
);

initial begin
    // Monitor changes
    $monitor("A = %b, B = %b, ALU_Sel = %b => Result = %b, Cout = %b, Zero = %b, Overflow = %b, Neg = %b, Equal = %b", 
             A, B, ALU_Sel, Result, Cout, Zero, Overflow, Neg, Equal);
    
    // Test cases for each ALU operation
    // Addition
    A = 8'b00001111; B = 8'b00000001; ALU_Sel = 4'b0000; #10; // 15 + 1 = 16
    A = 8'b11111111; B = 8'b00000001; ALU_Sel = 4'b0000; #10; // 255 + 1 = 0 (Cout = 1)
    
    // Subtraction
    A = 8'b00001111; B = 8'b00000001; ALU_Sel = 4'b0001; #10; // 15 - 1 = 14
    A = 8'b00000000; B = 8'b00000001; ALU_Sel = 4'b0001; #10; // 0 - 1 = 255 (Cout = 1)
    
    // AND
    A = 8'b10101010; B = 8'b11001100; ALU_Sel = 4'b0010; #10; // 10101010 & 11001100 = 10001000
    
    // OR
    A = 8'b10101010; B = 8'b11001100; ALU_Sel = 4'b0011; #10; // 10101010 | 11001100 = 11101110
    
    // XOR
    A = 8'b10101010; B = 8'b11001100; ALU_Sel = 4'b0100; #10; // 10101010 ^ 11001100 = 01100110
    
    // NOT A
    A = 8'b10101010; ALU_Sel = 4'b0101; #10; // ~10101010 = 01010101
    
    // Logical Shift Left
    A = 8'b00001111; ALU_Sel = 4'b0110; #10; // 00001111 << 1 = 00011110
    
    // Logical Shift Right
    A = 8'b00001111; ALU_Sel = 4'b0111; #10; // 00001111 >> 1 = 00000111
    
    // Arithmetic Shift Right
    A = 8'b11111111; ALU_Sel = 4'b1000; #10; // 11111111 >> 1 = 11111111
    
    // Increment A
    A = 8'b00001111; ALU_Sel = 4'b1001; #10; // 15 + 1 = 16
    A = 8'b11111111; ALU_Sel = 4'b1001; #10; // 255 + 1 = 0 (Cout = 1)
    
    // Decrement A
    A = 8'b00001111; ALU_Sel = 4'b1010; #10; // 15 - 1 = 14
    A = 8'b00000000; ALU_Sel = 4'b1010; #10; // 0 - 1 = 255 (Cout = 1)
    
    // Equality Check
    A = 8'b00001111; B = 8'b00001111; ALU_Sel = 4'b1011; #10; // A == B (Equal = 1)
    A = 8'b00001111; B = 8'b00000000; ALU_Sel = 4'b1011; #10; // A != B (Equal = 0)
    
    // Less Than
    A = 8'b00000101; B = 8'b00001010; ALU_Sel = 4'b1100; #10; // 5 < 10 (Result = 1)
    A = 8'b00001010; B = 8'b00000101; ALU_Sel = 4'b1100; #10; // 10 > 5 (Result = 0)
    
    // Greater Than
    A = 8'b00001010; B = 8'b00000101; ALU_Sel = 4'b1101; #10; // 10 > 5 (Result = 1)
    A = 8'b00000101; B = 8'b00001010; ALU_Sel = 4'b1101; #10; // 5 < 10 (Result = 0)
    
    // Greater Than or Equal To
    A = 8'b00001010; B = 8'b00001010; ALU_Sel = 4'b1110; #10; // 10 >= 10 (Result = 1)
    A = 8'b00000101; B = 8'b00001010; ALU_Sel = 4'b1110; #10; // 5 < 10 (Result = 0)

    // Less Than or Equal To
    A = 8'b00001010; B = 8'b00001010; ALU_Sel = 4'b1111; #10; // 10 <= 10 (Result = 1)
    A = 8'b00000101; B = 8'b00001010; ALU_Sel = 4'b1111; #10; // 5 < 10 (Result = 1)

    // End simulation
    $finish;
end

endmodule
