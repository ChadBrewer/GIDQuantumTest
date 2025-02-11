namespace IGDGQuantumTest.Quantum {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Convert;

    /// # Summary
    /// Initializes a quantum state representing a "spacetime" configuration by allocating and preparing qubits.
    ///
    /// # Input
    /// ## nQubits
    /// The number of qubits to allocate for the spacetime state.
    ///
    /// # Output
    /// Qubit[]: An array of qubits in superposition, representing the initialized spacetime state.
    operation InitializeSpacetimeState(nQubits : Int) : Qubit[] {
        use qubits = Qubit[nQubits]; // Allocate qubits using 'use' keyword for automatic release.
        ApplyToEach(H, qubits); // Apply Hadamard to each qubit to create superposition.
        return qubits; // Return the allocated and initialized qubits.
    }

    /// # Summary
    /// Applies an information potential to the quantum state by rotating each qubit around the Z-axis.
    ///
    /// # Input
    /// ## qs
    /// The array of qubits representing the spacetime state.
    /// ## phi
    /// The angle of rotation, representing the information potential strength.
    operation ApplyInformationPotential(qs : Qubit[], phi : Double) : Unit {
        for q in qs {
            Rz(phi, q); // Apply Rz rotation to each qubit.
        }
    }

    /// # Summary
    /// Entangles the qubits to simulate information connectivity using CNOT gates.
    ///
    /// # Input
    /// ## qs
    /// The array of qubits to entangle.
    operation EntangleSpacetime(qs : Qubit[]) : Unit {
        if (Length(qs) > 1) { // Ensure there are at least two qubits to entangle.
            for i in 0 .. Length(qs) - 2 {
                CNOT(qs[i], qs[i + 1]); // Apply CNOT between adjacent qubits.
            }
        }
    }

    /// # Summary
    /// Measures the state of the qubits and returns a curvature value based on measurement outcomes.
    ///
    /// # Input
    /// ## qs
    /// The array of qubits to measure.
    ///
    /// # Output
    /// Double: A curvature value calculated from the measurement outcomes.
    operation MeasureCurvature(qs : Qubit[]) : Double {
    mutable ones = 0;
    for q in qs {
        let result = Measure([PauliZ], [q]);
        if result == One {
            set ones += 1;
        }
    }
        let curvature = IntAsDouble(ones) / IntAsDouble(Length(qs));
        return curvature;
    }

    /// # Summary
    /// Combines all operations to simulate the IGDG process and returns a curvature value.
    ///
    /// # Input
    /// ## nQubits
    /// The number of qubits to use for the simulation.
    /// ## phi
    /// The information potential strength.
    ///
    /// # Output
    /// Double: The measured curvature value from the simulation.
    operation SimulateIGDG(nQubits : Int, phi : Double) : Double {
        let qubits = InitializeSpacetimeState(nQubits); // Initialize spacetime state.
        ApplyInformationPotential(qubits, phi); // Apply information potential.
        EntangleSpacetime(qubits); // Entangle qubits.
        let curvature = MeasureCurvature(qubits); // Measure curvature.
        ResetAll(qubits); // Reset qubits for reuse.
        return curvature; // Return the measured curvature.
    }

    @EntryPoint()
    operation EntryPointOperation() : Double {
        let nQubits = 4;
        let phi = 0.5;
        return SimulateIGDG(nQubits, phi);
    }
}
