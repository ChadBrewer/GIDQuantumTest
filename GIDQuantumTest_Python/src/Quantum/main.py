import qsharp
from qsharp import compile, simulate

# Assuming the Q# code will be in src/Quantum/
qsharp.init()

# Compile the Q# operation
Main = compile("QuantumTest.src.Main")

# Run the simulation
# Main.simulate()  # Removed since it's not directly called in the driver.py