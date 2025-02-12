using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using ScottPlot;
using Avalonia.Controls;
using Avalonia.Controls.Shapes;
using Avalonia.Layout;
using Avalonia.Media;

namespace IGDGQuantumTest.Host
{
    public class VisualizationWindow : Window
    {
        public VisualizationWindow(List<(double phi, double curvature, double G_eff)> simulationResults)
        {
            this.Title = "Simulation Visualization";
            this.Width = 800;
            this.Height = 600;

            // Create a plot for phi vs. curvature
            var plt1 = new ScottPlot.Avalonia.AvaPlot();
            plt1.Plot.Clear();
            var scatter1 = plt1.Plot.Add.Scatter(
                simulationResults.Select(r => r.phi).ToArray(),
                simulationResults.Select(r => r.curvature).ToArray()
            );
            scatter1.LegendText = "Curvature";
            plt1.Plot.Title("Curvature vs. Information Potential (phi)");
            plt1.Plot.XLabel("Information Potential (phi)");
            plt1.Plot.YLabel("Curvature");
            plt1.Plot.Legend.Alignment = ScottPlot.Alignment.UpperRight;
            plt1.Plot.ShowLegend();
            // Create a plot for phi vs. G_eff
            var plt2 = new ScottPlot.Avalonia.AvaPlot();
            plt2.Plot.Clear();
            var scatter2 = plt2.Plot.Add.Scatter(
                simulationResults.Select(r => r.phi).ToArray(),
                simulationResults.Select(r => r.G_eff).ToArray()
            );
            scatter2.LegendText = "Effective Newton's Constant (G_eff)";
            plt2.Plot.Title("Effective Newton's Constant (G_eff) vs. Information Potential (phi)");
            plt2.Plot.XLabel("Information Potential (phi)");
            plt2.Plot.YLabel("Effective Newton's Constant (G_eff)");
            plt2.Plot.Legend.Alignment = ScottPlot.Alignment.UpperRight;
            plt2.Plot.ShowLegend();
            // Combine plots into a single window
            //var plot1 = new ScottPlot.Avalonia.AvaPlot() { Plot = plt1 };
            //var plot2 = new ScottPlot.Avalonia.AvaPlot() { Plot = plt2 };

            var stackPanel = new StackPanel
            {
                Orientation = Avalonia.Layout.Orientation.Vertical,
                Children = { plt1, plt2 }
            };

            this.Content = stackPanel;
        }
        private ScottPlot.Avalonia.AvaPlot CreateScatterPlot(double[] xs, double[] ys, string title, string xLabel, string yLabel, string legendLabel) {
            var avaPlot = new ScottPlot.Avalonia.AvaPlot();
            avaPlot.Plot.Clear();
            var scatter = avaPlot.Plot.Add.Scatter(xs, ys);
            scatter.LegendText = legendLabel;
            avaPlot.Plot.Title(title);
            avaPlot.Plot.XLabel(xLabel);
            avaPlot.Plot.YLabel(yLabel);
            avaPlot.Plot.Legend.Alignment = ScottPlot.Alignment.UpperRight;
            avaPlot.Plot.ShowLegend();
            return avaPlot;
        }
    }
}
