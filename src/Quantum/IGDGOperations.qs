open Microsoft.Quantum.Intrinsic;
open Microsoft.Quantum.Measurement;
open Microsoft.Quantum.Convert;
open Microsoft.Quantum.Math;
open Microsoft.Quantum.Arrays;
open IGDGQuantumTest.Quantum.Utils; // Open Utils namespace

/// @brief Initializes a spacetime state by applying a Hadamard gate to each qubit.
/// @param qs The array of qubits to initialize.
operation InitializeSpacetimeState(qs : Qubit[]) : Unit {
    for q in qs {
        H(q); // Apply Hadamard to create superposition
    }
}

/// @brief Applies an information potential to each qubit in the given array.
/// @param qs An array of qubits representing the spacetime state.
/// @param phi The information potential parameter, a double value.
operation ApplyInformationPotential(qs : Qubit[], phi : Double) : Unit {
    for q in qs {
        Rz(phi, q); // Apply Rz rotation with angle phi to each qubit.
    }
}

/// @brief Entangles adjacent qubits in the given array to simulate entanglement entropy in spacetime.
/// @param qs An array of qubits representing the spacetime state.
operation EntangleSpacetime(qs : Qubit[]) : Unit {
    let nQubits = Length(qs);
    for i in 0 .. nQubits - 2 {
        CNOT(qs[i], qs[i + 1]); // Apply CNOT between adjacent qubits to create entanglement.
    }
}

/// @brief Measures all qubits in the array and computes an abstract "curvature" value.
/// @param qs An array of qubits representing the spacetime state.
/// @returns A Double representing the computed curvature value.
operation MeasureCurvature(qs : Qubit[]) : Double {
    let nQubits = Length(qs);
    mutable countOnes = 0;
    for q in qs {
        let result = M(q); // Measure each qubit.
        if result == One {
            set countOnes += 1;
        }
        Reset(q); // Reset qubit to |0⟩ state after measurement.
    }
    let curvature = IntAsDouble(countOnes) / IntAsDouble(nQubits);
    return curvature;
}

/// @brief Simulates the IGDG model, calculating curvature and the effective Newton's constant.
/// @param nQubits The number of qubits to use in the simulation.
/// @param phi The information potential parameter.
/// @returns A tuple containing the curvature and the effective Newton's constant (G_eff).
operation SimulateIGDG(nQubits : Int, phi : Double) : (Double, Double) {
    // Constants for G_eff calculation.
    let G0 = 6.6743E-11;     // Example value for bare Newton's constant (m^3 kg^-1 s^-2).
    let beta_G = 0.02;       // Example dimensionless constant beta_G.
    let mu0 = 1.0;           // Example reference energy scale mu0.

    use qs = Qubit[nQubits];
    // Step a: Initialize spacetime state.
    InitializeSpacetimeState(qs);

    // Step b: Apply information potential.
    ApplyInformationPotential(qs, phi);

    // Step c: Entangle spacetime.
    EntangleSpacetime(qs);

    // Step d: Measure curvature.
    let curvature = MeasureCurvature(qs);

    // Step e: Simulate running Newton's constant G_eff.
    let ln_mu_mu0 = curvature;
    let denominator = 1.0 + G0 * AbsD(beta_G) * ln_mu_mu0;
    let gEffective = G0 / denominator;

    // Step f: Return curvature and G_eff.
    return (curvature, gEffective);
}

/// @brief Entry point for the IGDG simulation.
@EntryPoint()
operation Main() : Unit {
    let nQubits = 5; // Default value for number of qubits
    let phi = 0.5;   // Default value for information potential parameter
    let (curvature, gEffective) = SimulateIGDG(nQubits, phi);
    Message($"Curvature: {curvature}");
    Message($"Effective Newton's constant (G_eff): {gEffective}");
}
