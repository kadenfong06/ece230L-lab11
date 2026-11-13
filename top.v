module top (
    input btnC, btnU,
    output [6:0] led
);

    wire [2:0] ripple_state;
    wire [2:0] modulo_state;
    wire modulo_output;
    
    ripple_divider ripple (
        .clk(btnC),
        .reset(btnU),
        .state(ripple_state)
    );
    
    modulo_divider modulo (
        .clk(btnC),
        .reset(btnU),
        .state(modulo_state),
        .divided_clk(modulo_output)
    );
    
    assign led[2:0] = ripple_state;
    assign led[5:3] = modulo_state;
    assign led[6] = modulo_output;

endmodule