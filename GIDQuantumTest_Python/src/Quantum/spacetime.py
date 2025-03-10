import qsharp
from qsharp import compile, simulate

# Assuming the Q# code will be in src/Quantum/
qsharp.init()

# Compile the Q# operations
InitializeSpacetimeState = compile("QuantumTest.src.Spacetime.InitializeSpacetimeState")
ApplyInformationPotential = compile("QuantumTest.src.Spacetime.ApplyInformationPotential")
EntangleSpacetime = compile("QuantumTest.src.Spacetime.EntangleSpacetime")