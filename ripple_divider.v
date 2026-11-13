module ripple_divider (
    input clk, reset,
    output [2:0] state
);

    t_flip_flop tff0 (
        .clk(clk),
        .reset(reset),
        .t(1'b1),
        .q(state[0])
    );
    
    t_flip_flop tff1 (
        .clk(state[0]),
        .reset(reset),
        .t(1'b1),
        .q(state[1])
    );
    
    t_flip_flop tff2 (
        .clk(state[1]),
        .reset(reset),
        .t(1'b1),
        .q(state[2])
    );

endmodule