namespace IGDGQuantumTest.Quantum.Simulation
{
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Convert;


    // Entry point operation
    @EntryPoint()
    operation Main() : Unit {
        // Call the RunFullSimulation operation
        RunFullSimulation(3, 0.0, 1.0, 0.1);
    }

    // Operation to initialize the spacetime state
    operation InitializeSpacetimeState(qs : Qubit[]) : Unit {
        // Apply Hadamard gate to the first qubit to create a superposition
        H(qs[0]);
    }

    // Operation to apply the information potential
    operation ApplyInformationPotential(qs : Qubit[], phi : Double) : Unit {
        // Apply Rz gate to the second qubit with angle phi
        Rz(phi, qs[1]);
    }

    // Operation to entangle the spacetime qubits
    operation EntangleSpacetime(qs : Qubit[]) : Unit {
        // Apply CNOT gate to entangle the first and second qubits
        CNOT(qs[0], qs[1]);
    }

    // Operation to measure the curvature
    operation MeasureCurvature(qs : Qubit[]) : Double {
        // Measure the first qubit
        let result = M(qs[0]);
        Reset(qs[0]);
        // Return 1.0 if the result is |1⟩, otherwise return 0.0
        if (result == One){
            return 1.0;
        } else {
            return 0.0
        }
    }

    // Operation to run the full simulation
    operation RunFullSimulation(nQubits : Int, phiStart : Double, phiEnd : Double, phiStep : Double) : (Double, Double, Double)[] {
        // Define constant values for G0, beta_G, and mu0
        let G0 = 1.0;
        let beta_G = 0.5;
        let mu0 = 1.0;

        // Initialize an empty array to store the results
        mutable results = [];

        // Allocate qubits and run the simulation
        use qs = Qubit[nQubits];
        let numSteps = Round((phiEnd - phiStart) / phiStep) + 1;
        for i in 0..numSteps - 1 {
            let phi = phiStart + (IntAsDouble(i) * phiStep);
            // Initialize the spacetime state
            InitializeSpacetimeState(qs);
            // Apply the information potential
            ApplyInformationPotential(qs, phi);
            // Entangle the spacetime qubits
            EntangleSpacetime(qs);
            // Measure the curvature
            let curvature = MeasureCurvature(qs);
            // Compute the effective Newton's constant (G_eff)
            let G_eff = G0 / (1.0 + G0 * beta_G * Log(phi / mu0));
            // Store the results for each phi value as a tuple (phi, curvature, G_eff) in an array
            set results = results + [(phi, curvature, G_eff)];
            // Reset the qubits after each iteration
            ResetAll(qs);
        }
        // Return the array of tuples as the simulation result
        return results;
    }
}
