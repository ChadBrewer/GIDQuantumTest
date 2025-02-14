using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using ScottPlot;
using Avalonia;
using Avalonia.Controls;
using Avalonia.Controls.ApplicationLifetimes;
using Avalonia.Markup.Xaml;
using Avalonia.Layout;
using Avalonia.Media;
using Avalonia.Diagnostics;
using Avalonia.ReactiveUI;

namespace src
{
    public partial class App : Application
    {
        //public static class DevTools 
        //{
            public override void Initialize()
            {
                AvaloniaXamlLoader.Load(this);
            }

            public override void OnFrameworkInitializationCompleted()
            {
                if (ApplicationLifetime is IClassicDesktopStyleApplicationLifetime desktop)
                {
                    if (desktop.MainWindow != null) {
                        #if DEBUG
                        if (desktop.MainWindow is ReactiveWindow<MainWindow> mainWindow)
                        {
                            desktop.MainWindow.AttachDevTools();
                        }
                        #endif
                    }
                }

                base.OnFrameworkInitializationCompleted();
            }
        }

        public partial class MainWindow : Window
        {
            public MainWindow()
            {
                InitializeComponent();
        #if DEBUG
                this.AttachDevTools();
        #endif

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

            public void InitializeComponent()
            {
                AvaloniaXamlLoader.Load(this);
            }

            public void ShowVisualization(List<(double phi, double curvature, double G_eff)> simulationResults)
            {
                var visualizationWindow = new VisualizationWindow(simulationResults);
                visualizationWindow.Show();
            }
        }

        public class VisualizationWindow : Window
        {
            public VisualizationWindow(List<(double phi, double curvature, double G_eff)> simulationResults)
            {
                this.Title = "Simulation Visualization";
                this.Width = 800;
                this.Height = 600;

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

                var stackPanel = new StackPanel
                {
                    Orientation = Avalonia.Layout.Orientation.Vertical,
                    Children = { plt1, plt2 }
                };

                this.Content = stackPanel;
            }

            public ScottPlot.Avalonia.AvaPlot CreateScatterPlot(double[] xs, double[] ys, string title, string xLabel, string yLabel, string legendLabel)
            {
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
    //}
}