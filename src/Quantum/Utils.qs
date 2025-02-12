namespace IGDGQuantumTest.Quantum.Utils
{
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Diagnostics;

    // Placeholder for utility functions

    function ProcessMeasurementResult(result : Result) : Double {
        // Example utility function to process measurement results
        return result == Zero ? 0.0 | 1.0;
    }

    /// @brief Calculates the parity of measurement outcomes.
    /// @param results An array of measurement results.
    /// @return The parity of the measurement outcomes (number of Ones divided by total qubits).
    function CalculateParity(results : Result[]) : Double {
        mutable numOnes = 0;
        for result in results {
            if (result == One) {
                set numOnes = numOnes + 1;
            }
        }
        let totalQubits = Length(results);
        return IntAsDouble(numOnes) / IntAsDouble(totalQubits);
    }

    /// @brief Formats and logs simulation results for later use in visualization.
    /// @param curvature The curvature value.
    /// @param gEff The effective Newton's constant value.
    operation LogResults(curvature : Double, gEff : Double) : Unit {
        Message($"Curvature: {curvature}, G_eff: {gEff}");
    }
}
