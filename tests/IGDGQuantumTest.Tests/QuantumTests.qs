namespace IGDGQuantumTest.Tests 
{
    open IGDGQuantumTest.Quantum; // Replace with the correct namespace
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Diagnostics;

    @EntryPoint()
    function TestSimulateIGDG() : Unit 
    {
        Message("Running test for SimulateIGDG operation.");
        let result = SimulateIGDG();
        Fact(result == "Simulation complete: IGDG effects simulated.", "Check simulation result.");
    }
}
