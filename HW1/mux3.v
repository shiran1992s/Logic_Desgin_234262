module mux3 #(parameter WIDTH=8) (a, b, c, select, out);
  input [WIDTH-1:0] a, b, c;
  input [1:0] select;
  output reg [WIDTH-1:0] out;

  always @ (a, b, c, select) begin     
    case(select)
      2'd00: out <= a ;  // 00 | a
      2'd01: out <= b ;  // 01 | b
      2'd02: out <= c ;  // 02 | c
      default: out <= {WIDTH{1'bx}};
    endcase
  end 
endmodule
