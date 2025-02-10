using System;
using Microsoft.Quantum.Simulation.Simulators;
using IGDGQuantumTest.Quantum;

namespace IGDGHost
{
    class Driver
    {
        static void Main(string[] args)
        {
            using (var simulator = new QuantumSimulator())
            {
                Console.WriteLine("Starting IGDG Quantum Simulation...");
                var result = SimulateIGDG.Run(simulator).Result;
                Console.WriteLine(result);
            }

            Console.WriteLine("Press any key to exit.");
            Console.ReadKey();
        }
    }
}
