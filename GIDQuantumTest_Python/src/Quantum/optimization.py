import qsharp
from qsharp import compile, simulate

# Assuming the Q# code will be in src/Quantum/
qsharp.init()

# Compile the Q# operations
CostFunction = compile("QuantumTest.src.Optimization.CostFunction")
MeasureEinsteinTensor = compile("QuantumTest.src.Optimization.MeasureEinsteinTensor")
GradientDescent = compile("QuantumTest.src.Optimization.GradientDescent")
CalculateGradient = compile("QuantumTest.src.Optimization.CalculateGradient")
VariationalCircuit = compile("QuantumTest.src.VariationalCircuit.VariationalCircuit")