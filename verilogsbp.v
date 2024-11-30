/*
This file contains example Verilog code.
The circuit represented below is a genetic circuit implementing an edge detector.
*/

// AND gate for PigmentBlack activation
module and_gate (in_A, in_B, out);
    input in_A;
    input in_B;
    output out;

    and(out, in_A, in_B);
endmodule   

// NOT gate for Darkness inversion
module not_gate (in, out);
    input in;
    output out;

    not(out, in);
endmodule

// Complete Edge Detector Circuit
module edge_detector (
    input Darkness,    // Darkness signal
    input AHL,         // AHL signal
    output PigmentBlack // Output signal to produce black pigment
);

    wire not_Darkness; // Inverted Darkness signal
    wire Pigment_logic; // Intermediate logic

    // Invert Darkness
    not_gate invert_darkness (
        .in(Darkness),
        .out(not_Darkness)
    );

    // AND gate for PigmentBlack
    and_gate pigment_and (
        .in_A(AHL),
        .in_B(not_Darkness),
        .out(PigmentBlack)
    );

endmodule
