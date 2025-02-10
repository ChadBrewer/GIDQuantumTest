# IGDGQuantumTest

## Overview

This project is a simulation framework to explore aspects of the Information-Geometric Duality Gravity (IGDG) hypothesis using quantum computing. It is built using Q# for quantum simulations and C# for the host environment and testing.

## Project Structure

- `IGDGQuantumTest.sln`: Visual Studio solution file.
- `src/`: Source code directories.
    - `Quantum/`: Q# source code for quantum simulations.
    - `Host/`: C# source code for the host application.
- `tests/`: Test projects.
    - `IGDGQuantumTest.Tests/`: C# and Q# test project.
- `docs/`: Documentation files.
- `build/`: Build scripts.
- `.gitignore`: Git ignore file.

## Prerequisites

- [.NET SDK](https://dotnet.microsoft.com/download)
- [Quantum Development Kit](https://learn.microsoft.com/en-us/quantum/install-guide/)

## Build and Run

1.  **Build the solution:**
    ```bash
    dotnet build IGDGQuantumTest.sln
    ```

2.  **Run the host application:**
    Navigate to the host project directory (`src/Host`) and run:
    ```bash
    dotnet run
    ```

3.  **Run tests:**
    Navigate to the test project directory (`tests/IGDGQuantumTest.Tests`) and run:
    ```bash
    dotnet test
    ```

## Design Documentation

See [docs/DESIGN.md](docs/DESIGN.md) for details on the project design and the IGDG hypothesis simulation.
