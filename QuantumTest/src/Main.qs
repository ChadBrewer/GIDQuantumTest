
open Microsoft.Quantum.Intrinsic;
open Microsoft.Quantum.Canon;
open Microsoft.Quantum.Arrays;
open Microsoft.Quantum.Measurement;
//open GIDSimulation; 

/// @brief Entry point for the GID simulation.
operation Main(): Unit {
// Example usage of SimulateGID
let nQubits = 4;
let phi = 1.0;
let (curvature, gEffective) = GIDSimulation.SimulateGID(nQubits, phi);

Message($"Curvature: {curvature}");
Message($"Effective Newton's constant: {gEffective}");
}

