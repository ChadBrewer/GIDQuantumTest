using System;
using System.Collections.Generic;
using System.Linq;
using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;
using Avalonia.Diagnostics; // Add this using directive

namespace IGDGQuantumTest.Host
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
#if DEBUG
            DevTools.Attach(this); // Attach the Avalonia DevTools
#endif

            // Simulate some data for demonstration purposes
            var simulationResults = new List<(double phi, double curvature, double G_eff)>
            {
                (0.1, 0.5, 0.8),
                (0.2, 0.6, 0.9),
                (0.3, 0.7, 1.0),
                (0.4, 0.8, 1.1),
                (0.5, 0.9, 1.2)
            };

            ShowVisualization(simulationResults);
        }

        private void InitializeComponent()
        {
            AvaloniaXamlLoader.Load(this);
        }

        public void ShowVisualization(List<(double phi, double curvature, double G_eff)> simulationResults)
        {
            var visualizationWindow = new VisualizationWindow(simulationResults);
            visualizationWindow.Show();
        }
    }
}
