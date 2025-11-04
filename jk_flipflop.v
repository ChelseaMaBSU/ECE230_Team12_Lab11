module jk_flipflop(
    input J,         // Input J (sw[1])
    input K,         // Input K (sw[2])
    input clock,     // Clock Input (btnC)
    // Add reset for robust design, often tied to a dedicated button or 'power-on' reset
    output reg Q,    // Output Q (led[2])
    output wire Q_not // Output ~Q (led[3])
);

    // Initial state setup
    initial begin
        Q <= 0;
    end
    
    // Combinatorial logic for the D input based on J, K, and current Q/Q_not
    // D = (J AND NOT Q) OR (NOT K AND Q)
    wire D_input;
    assign D_input = (J & ~Q) | (~K & Q); 

    // Edge-triggered logic: sensitive to the positive edge of the clock
    always @(posedge clock) begin
        Q <= D_input;
    end

    // Inverting output
    assign Q_not = ~Q;
    
endmodule