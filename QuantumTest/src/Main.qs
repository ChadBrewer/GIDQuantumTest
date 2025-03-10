
open Microsoft.Quantum.Intrinsic;
open Microsoft.Quantum.Canon;
open Microsoft.Quantum.Arrays;
open Microsoft.Quantum.Measurement;

/// @brief Entry point for the GID simulation.
operation Main(): Unit {
// Example usage of SimulateGID
let nQubits : Int = 4;
let phi : Double = 1.0;
let (curvature : Double, gEffective : Double) = SimulateGID(nQubits, phi);

Message($"Curvature: {curvature}");
Message($"Effective Newton's constant: {gEffective}");
}

