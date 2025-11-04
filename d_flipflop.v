module d_flipflop(
    input D,         // Data Input (sw[0])
    input clock,     // Clock Input (btnC)
    input reset,     // Reset Input (optional, but good practice)
    output reg Q,    // Output Q (led[0])
    output wire Q_not // Output ~Q (led[1])
);

    // Initial state setup
    initial begin
        Q <= 0;
    end

    // Following the 'byte_memory_ff' example:
    always @(posedge clock) begin
        Q <= D;
    end

    // Inverting output is simply the NOT of Q
    assign Q_not = ~Q;

endmodule