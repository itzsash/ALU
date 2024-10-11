# N-Bit ALU (Arithmetic Logic Unit)
This repository contains a **Parameterized N-bit ALU (Arithmetic Logic Unit)** design implemented in Verilog. The ALU is a core component in digital computing systems, performing a wide range of arithmetic and logical operations critical for processor and data processing units.

## What is an ALU?
An **ALU (Arithmetic Logic Unit)** is a digital circuit that performs arithmetic and logical operations. It is a fundamental building block of a CPU (Central Processing Unit), enabling the execution of operations such as addition, subtraction, logical operations, and bitwise manipulation.

![Screenshot 2024-10-11 213341](https://github.com/user-attachments/assets/30d47762-6de2-4a1c-9ccc-bf12971cd9c0)


## Key Features of N-bit ALU
This ALU design is highly customizable, with support for various arithmetic, logical, and shift operations. The bit-width (N-bit) is parameterized, making it versatile for different system requirements.

### Supported Operations:

#### Arithmetic Operations:
- **Addition**: Adds two N-bit numbers.
- **Subtraction**: Subtracts one N-bit number from another.
- **Multiplication**: Multiplies two N-bit numbers.
- **Division**: Performs integer division of two N-bit numbers.
- **Modulo**: Calculates the remainder when dividing two N-bit numbers.
- **Increment**: Adds 1 to the input operand.
- **Decrement**: Subtracts 1 from the input operand.

#### Logical Operations:
- **AND**: Bitwise AND operation between two N-bit numbers.
- **OR**: Bitwise OR operation between two N-bit numbers.
- **XOR**: Bitwise XOR (Exclusive OR) operation.
- **NOT**: Bitwise NOT (inversion) of the input operand.
- **NAND**: Bitwise NAND operation (NOT AND).
- **NOR**: Bitwise NOR operation (NOT OR).
- **XNOR**: Bitwise XNOR (Exclusive NOR).

#### Shift Operations:
- **Logical Left Shift**: Shifts the bits of the input operand to the left by a specified number of positions, inserting 0s.
- **Logical Right Shift**: Shifts the bits of the input operand to the right by a specified number of positions, inserting 0s.
- **Arithmetic Right Shift**: Shifts the bits of the input operand to the right, preserving the sign bit for signed numbers.
- **Rotate Left**: Rotates the bits of the operand to the left.
- **Rotate Right**: Rotates the bits of the operand to the right.

#### Comparison Operations:
- **Equal To (==)**: Checks if two N-bit numbers are equal.
- **Greater Than (>)**: Checks if one N-bit number is greater than another.
- **Less Than (<)**: Checks if one N-bit number is less than another.
- **Greater Than or Equal (>=)**: Checks if one N-bit number is greater than or equal to another.
- **Less Than or Equal (<=)**: Checks if one N-bit number is less than or equal to another.

#### Additional Operations:
- **Zero Detection**: Checks if the output is zero, setting a `zero` flag.
- **Sign Detection**: Detects the sign of the result for signed numbers.
- **Overflow Detection**: Monitors arithmetic operations for overflow conditions.
- **Carry Detection**: Tracks carry-out for addition and subtraction operations.

## ALU Design Considerations:
- **Parameterized Bit-Width**: The ALU's bit-width (N) can be easily adjusted, allowing it to be used in various system configurations.
- **Carry and Overflow Logic**: The ALU features carry-in and carry-out logic for arithmetic operations, along with overflow detection for cases where the result exceeds the bit-width.
- **Modular Design**: Each operation (arithmetic, logical, shift, etc.) is implemented as a separate module, making the ALU modular and easy to extend.

## Advantages:
- **Versatility**: The ALU is adaptable to various applications due to its parameterized design and wide range of supported operations.
- **Efficiency**: The design ensures minimal latency, making it suitable for high-speed digital processing.
- **Scalability**: The ALU can be scaled up or down to support different bit-widths and additional operations as needed.

## Applications:
- **Processor Design**: This ALU can be integrated into CPUs or microcontrollers to perform the core arithmetic and logical functions required for program execution.
- **Embedded Systems**: The ALU can be utilized in embedded systems for data manipulation and decision-making based on logical conditions.
- **Digital Signal Processing**: It is ideal for performing mathematical operations on digital signals in DSP applications.

## Testbench and Verification:
- **Simulation**: A Verilog testbench is provided to verify the functionality of the ALU. It tests all supported operations and handles various edge cases.
- **Edge Cases**: The testbench ensures correct behavior during overflow, underflow, carry propagation, and zero detection scenarios.

## Key Components:
- **Control Logic**: Handles operation selection, directing the ALU to perform the appropriate arithmetic, logical, or shift operation based on control inputs.
- **Operands**: Two N-bit input operands (`A` and `B`) for the ALU operations.
- **Flags**: Output flags for overflow, carry, zero, and sign detection.
- **Result Output**: N-bit result output, with support for various operations as selected by the control signals.

## Example Configuration:
- **ALU Bit-Width**: N = 32 (can be parameterized for other bit-widths)
- **Design Language**: Verilog
- **Operations**: Addition, Subtraction, AND, OR, XOR, Left Shift, Right Shift, Rotate, etc.

## Outputs

![Screenshot 2024-10-11 105742](https://github.com/user-attachments/assets/3143dbd5-fff0-44b4-b9ca-62a04f33e816)

![Screenshot 2024-10-11 105843](https://github.com/user-attachments/assets/95cf6ebf-7b30-48e2-81bd-b1ae8cf20d68)

## Future Enhancements:
- **Floating-Point Arithmetic**: Adding floating-point support for handling non-integer calculations.
- **Pipelining**: Implementing pipelining to enhance performance by allowing overlapping execution of multiple operations.
- **Custom Operations**: Additional operations, such as more advanced bit manipulations or hardware acceleration for cryptographic functions, can be added.

## Contributing:
Contributions, suggestions, and improvements are welcome! Feel free to open issues or submit pull requests.
