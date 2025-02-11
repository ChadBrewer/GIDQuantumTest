using System;
using System.Threading.Tasks;
using Microsoft.Quantum.Simulation.Core;
using Microsoft.Quantum.Simulation.Simulators;
using IGDGQuantumTest.Quantum;

namespace IGDGQuantumTest.Host {
    class Driver {
        static async Task Main(string[] args) {
            using var simulator = new QuantumSimulator();

            // Define simulation parameters.
            int nQubits = 6;      // Number of qubits representing spacetime dimensions.
            double phi = 0.5;     // Information potential parameter.

            Console.WriteLine("Starting IGDG quantum simulation...");
            double curvature = await SimulateIGDG.Run(simulator, nQubits, phi);
            Console.WriteLine($"Simulated curvature (proxy for gravitational effect): {curvature}");

            // Optionally, implement a parameter sweep to test different phi values.
            Console.WriteLine("Simulation complete. Press any key to exit.");
            Console.ReadKey();
        }
    }
}
