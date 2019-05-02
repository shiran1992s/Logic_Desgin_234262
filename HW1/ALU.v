module ALU (a, b, alu_control, out);
  input signed [31:0] a, b;
  input [2:0] alu_control;
  output reg signed [31:0] out;

  always @ (a, b, alu_control) begin     
    case(alu_control)
      3'b000: out <= (a + b) ;   // ADD 3'b000
      3'b001: out <= (a - b) ;   // SUB 3'b001
      3'b010: out <= (a & b) ;  // AND 3'b010
      3'b011: out <= (a | b) ;  // OR  3'b011
      3'b100: out <= ~(a | b) ;  // NOR 3'b100
      3'b101: out <= (a ^ b) ;  // XOR 3'b101
      default: out <= {32{1'bx}};
    endcase
  end 
  
endmodule
