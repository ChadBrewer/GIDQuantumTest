import qsharp
from qsharp import compile, simulate

# Assuming the Q# code will be in src/Quantum/
qsharp.init()

# Compile the Q# operations
MeasureCurvature = compile("QuantumTest.src.Curvature.MeasureCurvature")
ComputeReducedDensityMatrix = compile("QuantumTest.src.Curvature.ComputeReducedDensityMatrix")
GetEigenvalues = compile("QuantumTest.src.Curvature.GetEigenvalues")