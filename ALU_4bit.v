`timescale 1ns/1ps

module ALU_4bit_simple_tb;

    reg [3:0] A, B;
    reg [2:0] opcode;
    wire [3:0] Result;

    ALU_4bit_simple uut (
        .A(A), .B(B), .opcode(opcode), .Result(Result)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, ALU_4bit_simple_tb);

        $display("A     B     Opcode  Result");
        A = 4'b0101; B = 4'b0011;

        opcode = 3'b000; #10; $display("%b  %b  %b   %b", A, B, opcode, Result); // AND
        opcode = 3'b001; #10; $display("%b  %b  %b   %b", A, B, opcode, Result); // OR
        opcode = 3'b010; #10; $display("%b  %b  %b   %b", A, B, opcode, Result); // ADD
        opcode = 3'b011; #10; $display("%b  %b  %b   %b", A, B, opcode, Result); // SUB

        $finish;
    end

endmodule
