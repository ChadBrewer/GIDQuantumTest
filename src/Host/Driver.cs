using System;
using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;
using Microsoft.Quantum.Simulation.Core;
using Microsoft.Quantum.Simulation.Simulators;
using IGDGQuantumTest.Quantum.Simulation;
using System.Linq;
// using Avalonia;
// using Avalonia.Controls;
// using Avalonia.Markup.Xaml;

namespace IGDGQuantumTest.Host
{
    class Program
    {
        static async Task Main(string[] args)
        {
            try
            {
                // Instantiate a QuantumSimulator
                using (var sim = new QuantumSimulator())
                {
                    // Define simulation parameters
                    int nQubits = 6;
                    double phiStart = 0.1;
                    double phiEnd = 1.0;
                    double phiStep = 0.1;

                    // Call the Q# operation RunFullSimulation with these parameters and await the result
                    var results = await RunFullSimulation.Run(sim, nQubits, phiStart, phiEnd, phiStep);

                    // Print the simulation results to the console
                    Console.WriteLine("Simulation Results:");
                    Console.WriteLine("phi, curvature, G_eff");
                    foreach (var result in results)
                    {
                        Console.WriteLine($"{result.phi}, {result.curvature}, {result.G_eff}");
                    }

                    // Write the results to a CSV file for later visualization
                    using (var writer = new StreamWriter("simulation_results.csv"))
                    {
                        writer.WriteLine("phi, curvature, G_eff");
                        foreach (var result in results)
                        {
                            writer.WriteLine($"{result.phi}, {result.curvature}, {result.G_eff}");
                        }
                    }

                    // Calculate summary metrics
                    double averageCurvature = results.Average(r => r.curvature);
                    double minGEff = results.Min(r => r.G_eff);
                    double maxGEff = results.Max(r => r.G_eff);

                    // Print summary to console
                    Console.WriteLine("\nSimulation Summary:");
                    Console.WriteLine($"Average Curvature: {averageCurvature}");
                    Console.WriteLine($"G_eff Range: [{minGEff}, {maxGEff}]");

                    // Create and show the visualization window
                    // var visualizationWindow = new VisualizationWindow(results);
                    // visualizationWindow.Show();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"An error occurred: {ex.Message}");
            }
        }
    }
}
