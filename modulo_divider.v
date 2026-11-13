module modulo_divider (
    input clk, reset,
    output [2:0] state,
    output divided_clk
);

    wire [2:0] incremented;
    wire [2:0] next_state;
    
    wire carry0;
    wire carry1;
    wire carry2;
    
    wire terminal_count;
    wire next_divided_clk;
    
    full_adder fa0 (
        .a(state[0]),
        .b(1'b1),
        .cin(1'b0),
        .sum(incremented[0]),
        .cout(carry0)
    );

    full_adder fa1 (
        .a(state[1]),
        .b(1'b0),
        .cin(carry0),
        .sum(incremented[1]),
        .cout(carry1)
    );
    
    full_adder fa2 (
        .a(state[2]),
        .b(1'b0),
        .cin(carry1),
        .sum(incremented[2]),
        .cout(carry2)
    );
    
    assign terminal_count = state[2] & ~state[1] & state[0];
    
    assign next_state[0] = incremented[0] & ~terminal_count;
    assign next_state[1] = incremented[1] & ~terminal_count;
    assign next_state[2] = incremented[2] & ~terminal_count;
    
    assign next_divided_clk = divided_clk ^ terminal_count;
    
    d_flip_flop_sync dff0 (
        .clk(clk),
        .reset(reset),
        .d(next_state[0]),
        .q(state[0])
    );
    
    d_flip_flop_sync dff1 (
        .clk(clk),
        .reset(reset),
        .d(next_state[1]),
        .q(state[1])
    );
    
    d_flip_flop_sync dff2 (
        .clk(clk),
        .reset(reset),
        .d(next_state[2]),
        .q(state[2])
    );
    
    d_flip_flop_sync dff_out (
        .clk(clk),
        .reset(reset),
        .d(next_divided_clk),
        .q(divided_clk)
    );

endmodule