
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Math;

    /// @brief Tests the SimulateGID operation with different parameters.
    @Test()
    operation TestSimulateGID(): Unit {
        // Test with different parameters
        let nQubits = 4; // Number of qubits
        let phiValues = [0.1, 0.5, 1.0]; // Different values for phi

        for phi in phiValues {
            let (curvature, gEffective) = SimulateGID(nQubits, phi);

            // Compare with expected results (replace with actual expected values)
            let expectedCurvature = 0.0; // Replace with expected value for this phi
            let expectedGEffective = 6.6743E-11; // Replace with expected value for this phi

            //CheckOperationsAreEqual(curvature, expectedCurvature, 1e-5, "Curvature does not match expected value.");
            //CheckOperationsAreEqual(gEffective, expectedGEffective, 1e-15, "G_eff does not match expected value.");
        }
    }

    /// @brief Tests the SimulateGID operation with multiple runs and analyzes correlations.
    @Test()
    operation TestSimulateGIDMultipleRuns(): Unit {
        // Test with multiple runs and analyze correlations
        let nQubits = 4;
        let phi = 1.0;
        let numRuns = 100;

        mutable curvatureValues = new Double[numRuns];

        for i in 0..numRuns - 1 {
            let (curvature, _) = SimulateGID(nQubits, phi);
            set curvatureValues w/= i <- curvature;
        }

        // Analyze statistical correlations (example: calculate standard deviation)
        let stdDev = CalculateStandardDeviation(curvatureValues);
        Message($"Standard deviation of curvature: {stdDev}");

        // You can add more analysis here, such as:
        // - Calculate the average curvature
        // - Plot the distribution of curvature values
        // - Analyze the correlation between curvature and G_eff
    }

    // Helper function to calculate standard deviation
    function CalculateStandardDeviation(data: Double[]): Double {
        let mean = Average(data);
        let variance = Fold((acc, x) -> acc + (x - mean) * (x - mean), 0.0, data) / IntAsDouble(Length(data));
        return Sqrt(variance);
    }

    // Helper function to calculate average
    function Average(data: Double[]): Double {
        return Fold((acc, x) -> acc + x, 0.0, data) / IntAsDouble(Length(data));
    }
