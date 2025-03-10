import qsharp
from qsharp import compile
import csv
from kivy.app import App
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.label import Label
from kivy.uix.textinput import TextInput
from kivy.uix.button import Button
from kivy.uix.scrollview import ScrollView
from kivy.clock import Clock

# Assuming the Q# code will be in src/Quantum/
qsharp.init(target_profile=qsharp.TargetProfile.Base)

class SimulationApp(App):
    def build(self):
        self.results_text = ""
        layout = BoxLayout(orientation='vertical', padding=10, spacing=10)

        # Input fields
        self.n_qubits_input = TextInput(hint_text='Number of Qubits (e.g., 6)', multiline=False)
        layout.add_widget(self.n_qubits_input)

        self.phi_start_input = TextInput(hint_text='Phi Start (e.g., 0.1)', multiline=False)
        layout.add_widget(self.phi_start_input)

        self.phi_end_input = TextInput(hint_text='Phi End (e.g., 1.0)', multiline=False)
        layout.add_widget(self.phi_end_input)

        self.phi_step_input = TextInput(hint_text='Phi Step (e.g., 0.1)', multiline=False)
        layout.add_widget(self.phi_step_input)

        # Run button
        run_button = Button(text='Run Simulation')
        run_button.bind(on_press=self.run_simulation)
        layout.add_widget(run_button)

        # Results display
        self.results_label = Label(text=self.results_text, halign='left', valign='top')
        scroll_view = ScrollView()
        scroll_view.add_widget(self.results_label)
        layout.add_widget(scroll_view)

        return layout

    def run_simulation(self, instance):
        try:
            n_qubits = int(self.n_qubits_input.text)
            phi_start = float(self.phi_start_input.text)
            phi_end = float(self.phi_end_input.text)
            phi_step = float(self.phi_step_input.text)

            # Compile the Q# operation
            RunFullSimulation = compile("QuantumTest.src.GIDSimulation.RunFullSimulation")

            # Run the simulation
            results = RunFullSimulation.simulate(nQubits=n_qubits, phiStart=phi_start, phiEnd=phi_end, phiStep=phi_step)

            # Process and display results
            self.results_text = "Simulation Results:\nphi, curvature, G_eff\n"
            for result in results:
                self.results_text += f"{result[0]}, {result[1]}, {result[2]}\n"

            # Calculate summary metrics
            average_curvature = sum(result[1] for result in results) / len(results)
            min_g_eff = min(result[2] for result in results)
            max_g_eff = max(result[2] for result in results)

            self.results_text += "\nSimulation Summary:\n"
            self.results_text += f"Average Curvature: {average_curvature}\n"
            self.results_text += f"G_eff Range: [{min_g_eff}, {max_g_eff}]\n"

            # Update the results label
            self.results_label.text = self.results_text

            # Write the results to a CSV file
            with open("simulation_results.csv", "w", newline="") as csvfile:
                writer = csv.writer(csvfile)
                writer.writerow(["phi", "curvature", "G_eff"])
                for result in results:
                    writer.writerow([result[0], result[1], result[2]])

        except ValueError:
            self.results_text = "Invalid input. Please enter numeric values."
            self.results_label.text = self.results_text
        except Exception as e:
            self.results_text = f"An error occurred: {e}"
            self.results_label.text = self.results_text

if __name__ == '__main__':
    SimulationApp().run()