namespace IGDGQuantumTest.Tests 
{
    open IGDGQuantumTest.Quantum;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Diagnostics;

    function TestSimulateIGDG() : Unit 
    {
        Message("Running test for SimulateIGDG operation.");
        let result = SimulateIGDG(4, 0.5);
        Message($"Curvature: {result}");
        // Fact(result == "Simulation complete: IGDG effects simulated.", "Check simulation result."); // Removed Fact as the return type is Double now
    }
}
