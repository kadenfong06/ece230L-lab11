module t_flip_flop(
    input clk, reset, t,
    output q
    );
    
    wire next_q;
    
    assign next_q = t ^ q;
    
    d_flip_flop dff (
        .clk(clk),
        .reset(reset),
        .d(next_q),
        .q(q)
    );
    
endmodule
