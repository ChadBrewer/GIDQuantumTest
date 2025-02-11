namespace IGDGQuantumTest.Quantum {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Measurement;

    // Initializes a quantum state representing a "spacetime" configuration.
    operation InitializeSpacetimeState(nQubits : Int) : Qubit[] {
        use qs = Qubit[nQubits];
        ApplyToEach(H, qs);
        return qs;
    }

    // Applies an information potential to the quantum state.
    operation ApplyInformationPotential(qs : Qubit[], phi : Double) : Unit {
        // Apply a rotation around the Z-axis to each qubit based on phi.
        for (q in qs) {
            Rz(phi, q);
        }
    }

    // Entangles the qubits to simulate information connectivity.
    operation EntangleSpacetime(qs : Qubit[]) : Unit {
        for (i in 0 .. Length(qs)-2) {
            CNOT(qs[i], qs[i+1]);
        }
    }

    // Measures the state and returns a curvature value based on the measurement outcomes.
    operation MeasureCurvature(qs : Qubit[]) : Double {
        let results = MultiM(qs);
        // Calculate an abstract "curvature" as the normalized difference between zeros and ones.
        mutable ones = 0;
        for (r in results) {
            if (r == One) { set ones += 1; }
        }
        let curvature = (IntAsDouble(ones) / IntAsDouble(Length(qs)));
        return curvature;
    }

    // Combines the operations to simulate IGDG.
    operation SimulateIGDG(nQubits : Int, phi : Double) : Double {
        mutable curvature = 0.0;
        let qs = InitializeSpacetimeState(nQubits);
        ApplyInformationPotential(qs, phi);
        EntangleSpacetime(qs);
        set curvature = MeasureCurvature(qs);
        ResetAll(qs);
        return curvature;
    }
}
