# IGDGQuantumTest

Hypothesis: Information-Geometric Duality Gravity

## Overview

This project simulates the effects of information potential on spacetime curvature and computes the effective Newton's constant (G_eff) based on the simulation results. The project is implemented using Q# for quantum operations and C# for the host application and visualization.

## Theoretical Background

The simulation is based on the following equations:

- **Curvature**: The curvature is measured as the ratio of the number of qubits in the state |1⟩ to the total number of qubits.
  - `curvature = (number of Ones) / (total qubits)`

- **Effective Newton's Constant (G_eff)**: The effective Newton's constant is computed using the formula:
  - `G_eff = G0 / (1 + G0 * |beta_G| * ln(mu / mu0))`
  - For simulation purposes, the measured curvature is mapped to `ln(mu / mu0)`.

## Building and Running the Simulation

1. **Install the Microsoft Quantum Development Kit**: Ensure you have the Microsoft Quantum Development Kit installed. You can install it via the Visual Studio Code extension or by following the instructions on the [Microsoft Quantum documentation](https://docs.microsoft.com/en-us/quantum/install-guide/).

2. **Build the Project**:
   - Open the project in Visual Studio Code.
   - Run the following command in the terminal:
     ```bash
     dotnet build
     ```

3. **Run the Simulation**:
   - Run the following command in the terminal:
     ```bash
     dotnet run --project src/Host/IGDGQuantumTest.Host.csproj
     ```

## Visualization

The simulation results are visualized using ScottPlot, a .NET plotting library. The visualization includes two plots:

1. **Curvature vs. Information Potential (phi)**: This plot shows the relationship between the information potential (phi) and the measured curvature.
2. **Effective Newton's Constant (G_eff) vs. Information Potential (phi)**: This plot shows the relationship between the information potential (phi) and the computed effective Newton's constant (G_eff).

To view the visualization, run the simulation as described above. The plots will be displayed in a separate window.

## Instructions for Viewing Visualization Outputs

- After running the simulation, a window will open displaying the two plots.
- The plots are generated from the `simulation_results.csv` file, which is created in the root directory of the project.
