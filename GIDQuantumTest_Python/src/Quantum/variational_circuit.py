import qsharp
from qsharp import compile, simulate

# Assuming the Q# code will be in src/Quantum/
qsharp.init()

# Compile the Q# operation
VariationalCircuit = compile("QuantumTest.src.VariationalCircuit.VariationalCircuit")