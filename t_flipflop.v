module t_flipflop(
    input T,         // Toggle Input (sw[3])
    input clock,     // Clock Input (btnC)
    // Add reset for robust design
    output reg Q,    // Output Q (led[4])
    output wire Q_not // Output ~Q (led[5])
);
    
    // Initial state setup
    initial begin
        Q <= 0;
    end

    // T-FF logic: Toggles if T=1, Holds if T=0. 
    // This is equivalent to Qnext = (T AND NOT Q) OR (NOT T AND Q)
    // This is the XOR function: Qnext = T XOR Q
    
    // Combinatorial logic for Qnext
    wire Q_next;
    assign Q_next = T ^ Q; // T XOR Q

    // Edge-triggered logic: sensitive to the positive edge of the clock
    always @(posedge clock) begin
        Q <= Q_next;
    end

    // Inverting output
    assign Q_not = ~Q;

endmodule