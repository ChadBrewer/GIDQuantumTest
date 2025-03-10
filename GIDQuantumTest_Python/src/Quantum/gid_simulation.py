import qsharp
from qsharp import compile, simulate

# Assuming the Q# code will be in src/Quantum/
qsharp.init()

# Compile the Q# operations
SimulateGID = compile("QuantumTest.src.GIDSimulation.SimulateGID")
RunFullSimulation = compile("QuantumTest.src.GIDSimulation.RunFullSimulation")