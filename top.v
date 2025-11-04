module top (
    // Inputs from the FPGA Board
    input [3:0] sw,    // Switches sw[0] to sw[3]
    input btnC,        // Center button for the Clock (btnC)
    // Outputs to the FPGA Board
    output [5:0] led   // LEDs led[0] to led[5]
);

    // Signal Declarations (Internal Connect
    // The outputs of the D Flip Flop
    wire dff_Q;
    wire dff_Q_not;

    // The outputs of the JK Flip Flop
    wire jkff_Q;
    wire jkff_Q_not;

    // The outputs of the T Flip Flop
    wire tff_Q;
    wire tff_Q_not;

    // Instantiate D Flip-Flop
    // sw[0] -> D
    // btnC -> clock
    // led[0] -> Q
    // led[1] -> ~Q
    d_flipflop UUT_DFF (
        .D      (sw[0]),
        .clock  (btnC),
        // Note: Reset is not explicitly used here as it wasn't in the final lab DFF code
        .Q      (dff_Q),
        .Q_not  (dff_Q_not)
    );

    // Instantiate JK Flip-Flop
    // sw[1] -> J
    // sw[2] -> K
    // btnC -> clock
    // led[2] -> Q
    // led[3] -> ~Q
    jk_flipflop UUT_JKFF (
        .J      (sw[1]),
        .K      (sw[2]),
        .clock  (btnC),
        .Q      (jkff_Q),
        .Q_not  (jkff_Q_not)
    );

    // Instantiate T Flip-Flop
    // sw[3] -> T
    // btnC -> clock
    // led[4] -> Q
    // led[5] -> ~Q
    t_flipflop UUT_TFF (
        .T      (sw[3]),
        .clock  (btnC),
        .Q      (tff_Q),
        .Q_not  (tff_Q_not)
    );

    // Final Wiring to Physical LED Outputs
    assign led[0] = dff_Q;
    assign led[1] = dff_Q_not;
    assign led[2] = jkff_Q;
    assign led[3] = jkff_Q_not;
    assign led[4] = tff_Q;
    assign led[5] = tff_Q_not;

endmodule