module simon1 (clock, reset, in, out);
  input wire clock, reset;
  input wire [1:0] in;
  output reg [1:0] out;

  localparam [2:0]
    start = 000,
    R = 001,
    G = 010,
    B = 011,
    Y = 100,
    win = 101,
    game_over = 110;
    
  reg[2:0] state_reg, state_next; 

  always @(posedge clock, posedge reset)
  begin
    if (reset) begin
        state_reg <= start;
    end
    else begin
        state_reg <= state_next;
    end
  end 

  always @(in, state_reg) begin 
    state_next = state_reg; // default state_next
    out = 00; // default outputs
    case(state_reg)
        start : begin
            if (in==2'b00) begin
                state_next = R;
                out = 00;
            end
            else if (in==2'b01) begin
                state_next = G;
                out = 00;
            end
            else if (in==2'b10) begin
                state_next = B;
                out = 00;
            end
            else if (in==2'b11) begin
                state_next = Y;
                out = 00;
            end
            else begin // remain in current state
                state_next = start;
                out = 00;
            end
        end
        R : begin
            if (in==2'b00) begin
                out = 10;
                state_next = win;
            end
            else begin
                out = 01;
                state_next = game_over; 
            end
        end
        G : begin
            if (in==2'b01) begin
                out = 10;
                state_next = win;
            end
            else begin
                out = 01;
                state_next = game_over; 
            end
        end
        B : begin
            if (in==2'b10) begin
                out = 10;
                state_next = win;
            end
            else begin
                out = 01;
                state_next = game_over; 
            end
        end
        Y : begin
            if (in==2'b11) begin
                out = 10;
                state_next = win;
            end
            else begin
                out = 01;
                state_next = game_over; 
            end
        end
        win : begin
            out = 10;
        end
        game_over : begin
            out = 01;
        end
    endcase
  end  
endmodule 