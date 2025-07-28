# StatisticalAnalysis

## Project Overview
This project was developed to read a tab-separated file (.TSV) and display the (first) header line on a table 
so that numeric fields could be chosen for statistical analysis and display. Different statistical metrics are 
displayed for a single choice, a choice of two columns or multiple field displays.
	
This Xojo project contains the following components:


## Windows

### TSVAnalyzerWindow

#### Properties

- **DefaultLocation**: 2
- **HasCloseButton**: True
- **HasMaximizeButton**: True
- **HasMinimizeButton**: True
- **Height**: 20
- **MaximumHeight**: 32000
- **MaximumWidth**: 32000
- **MinimumHeight**: 64
- **MinimumWidth**: 64
- **Resizeable**: True
- **Title**: "Statistis from .TSV"
- **Type**: 0
- **Visible**: True
- **Width**: 80

#### Events

##### LoadButton:
- **Pressed**

##### ProcessButton:
- **Pressed**

##### ExportButton:
- **Pressed**

##### ClearBevelButton:
- **Pressed**

---

### DualHeaderWindow

#### Properties

- **DefaultLocation**: 2
- **HasCloseButton**: True
- **HasMaximizeButton**: True
- **HasMinimizeButton**: True
- **Height**: 22
- **MaximumHeight**: 32000
- **MaximumWidth**: 32000
- **MinimumHeight**: 64
- **MinimumWidth**: 64
- **Resizeable**: True
- **Title**: "Statistical Analysis Demonstration"
- **Type**: 0
- **Visible**: True
- **Width**: 160

#### Events

##### TwoBoxplotsBevelButton:
- **Pressed**

##### BA_BevelButton:
- **Pressed**

##### PB_BevelButton:
- **Pressed**

##### JD_BevelButton1:
- **Pressed**

##### Heatmap_BevelButton:
- **Pressed**

---

### SingleHeaderWindow

#### Properties

- **DefaultLocation**: 2
- **HasCloseButton**: True
- **HasMaximizeButton**: True
- **HasMinimizeButton**: True
- **Height**: 22
- **MaximumHeight**: 32000
- **MaximumWidth**: 32000
- **MinimumHeight**: 64
- **MinimumWidth**: 64
- **Resizeable**: True
- **Title**: "Statistical Analysis Demonstration"
- **Type**: 0
- **Visible**: True
- **Width**: 101

#### Events

##### BoxPlotBevelButton:
- **Pressed**

##### QQBevelButton:
- **Pressed**

##### densityPlotBevelButton:
- **Pressed**

##### StatsBevelButton:
- **Pressed**

##### HistogramBevelButton:
- **Pressed**

---

### StatsWindow

#### Properties

- **DefaultLocation**: 2
- **HasCloseButton**: True
- **HasMaximizeButton**: True
- **HasMinimizeButton**: True
- **Height**: 22
- **MaximumHeight**: 32000
- **MaximumWidth**: 32000
- **MinimumHeight**: 64
- **MinimumWidth**: 64
- **Resizeable**: True
- **Title**: "Statistical Analysis Demonstration"
- **Type**: 0
- **Visible**: True
- **Width**: 101

#### Events

##### BoxPlotBevelButton:
- **Pressed**

##### TwoBoxplotsBevelButton:
- **Pressed**

##### BA_BevelButton:
- **Pressed**

##### QQBevelButton:
- **Pressed**

##### DistributionBevelButton:
- **Pressed**

##### StatsBevelButton:
- **Pressed**

##### ScatterPlotBevelButton1:
- **Pressed**

##### HistogramBevelButton:
- **Pressed**

---

### dictViewerWindow

#### Properties

- **DefaultLocation**: 2
- **HasCloseButton**: True
- **HasMaximizeButton**: True
- **HasMinimizeButton**: True
- **Height**: 424
- **MaximumHeight**: 32000
- **MaximumWidth**: 32000
- **MinimumHeight**: 64
- **MinimumWidth**: 64
- **Resizeable**: True
- **Title**: "Statistical Results"
- **Type**: 0
- **Visible**: True
- **Width**: 852

#### Events

##### CSVBevelButton:
- **Pressed**

##### CipboardBevelButton:
- **Pressed**

---

### ColumnAnalyzerWindow

#### Events

##### LoadButton:
- **Pressed**

##### ProcessButton:
- **Pressed**

##### ExportButton:
- **Pressed**

---

### MultiHeaderWindow

#### Properties

- **DefaultLocation**: 2
- **HasCloseButton**: True
- **HasMaximizeButton**: True
- **HasMinimizeButton**: True
- **Height**: 22
- **MaximumHeight**: 32000
- **MaximumWidth**: 32000
- **MinimumHeight**: 64
- **MinimumWidth**: 64
- **Resizeable**: True
- **Title**: "Statistical Analysis Demonstration"
- **Type**: 0
- **Visible**: True
- **Width**: 160

#### Events

##### PieBevelButton:
- **Pressed**

##### PieBevelButton1:
- **Pressed**

##### SPMatrixButton:
- **Pressed**

##### Heatmap_BevelButton:
- **Pressed**

##### VP_BevelButton:
- **Pressed**

---

## Project Components

- **Classes:** 3 (App, StatisticalAnalyzer, ViolinPlotRenderer)
- **Modules:** 2 (LobalModule, iolinStatsUtils)
- **Windows:** 7 (TSVAnalyzerWindow, DualHeaderWindow, SingleHeaderWindow, StatsWindow, dictViewerWindow, ColumnAnalyzerWindow, MultiHeaderWindow)
- **Menus:** 1 (MainMenuBar)

## Classes

### App

#### Properties

- **`kEditClear`** Public String

- **`kFileQuit`** Public String

- **`kFileQuitShortcut`** Public String

#### Methods

None

#### Events

None

---

### StatisticalAnalyzer

#### Properties

- **`Pi`** Public Double

#### Methods

- **`AndersonDarlingTest`** Public Function
  - **Parameters:** `data() As Double`
  - **Returns:** `Dictionary`
  - **Signature:** `Public Function AndersonDarlingTest(data() As Double) As Dictionary`

- **`AssessHeteroscedasticity`** Public Function
  - **Parameters:** `xVals() As Double, yVals() As Double, slope As Double, intercept As Double, se As Double`
  - **Returns:** `String`
  - **Signature:** `Public Function AssessHeteroscedasticity(xVals() As Double, yVals() As Double, slope As Double, intercept As Double, se As Double) As String`

- **`Average`** Public Function
  - **Parameters:** `data() As Double`
  - **Returns:** `Double`
  - **Signature:** `Public Function Average(data() As Double) As Double`

- **`BlandAltmanAnalysis`** Public Function
  - **Parameters:** `method1() As Double, method2() As Double`
  - **Returns:** `Dictionary`
  - **Signature:** `Public Function BlandAltmanAnalysis(method1() As Double, method2() As Double) As Dictionary`

- **`BootstrapCI`** Public Function
  - **Parameters:** `data() As Double, iterations As Integer = 10000`
  - **Returns:** `Dictionary`
  - **Signature:** `Public Function BootstrapCI(data() As Double, iterations As Integer = 10000) As Dictionary`

- **`BootstrapMedianCI`** Public Function
  - **Parameters:** `data() As Double, iterations As Integer = 10000`
  - **Returns:** `Dictionary`
  - **Signature:** `Public Function BootstrapMedianCI(data() As Double, iterations As Integer = 10000) As Dictionary`

- **`CalculateRSquared`** Public Function
  - **Parameters:** `xVals() As Double, yVals() As Double, slope As Double, intercept As Double`
  - **Returns:** `double`
  - **Signature:** `Public Function CalculateRSquared(xVals() As Double, yVals() As Double, slope As Double, intercept As Double) As double`

- **`CalculateVariance`** Public Function
  - **Parameters:** `values() As Double`
  - **Returns:** `Double`
  - **Signature:** `Public Function CalculateVariance(values() As Double) As Double`

- **`CloneDoubleArray`** Private Function
  - **Parameters:** `sourceArray() As Double`
  - **Returns:** `Double()`
  - **Signature:** `Private Function CloneDoubleArray(sourceArray() As Double) As Double()`

- **`CreateBlandAltmanPlot`** Public Function
  - **Parameters:** `method1() As Double, method2() As Double, title As String, width As Integer, height As Integer`
  - **Returns:** `Picture`
  - **Signature:** `Public Function CreateBlandAltmanPlot(method1() As Double, method2() As Double, title As String, width As Integer, height As Integer) As Picture`

- **`CreateBoxPlot`** Public Function
  - **Parameters:** `data() As Double, title As String = "Box Plot", width As Integer = 400, height As Integer = 600`
  - **Returns:** `Picture`
  - **Signature:** `Public Function CreateBoxPlot(data() As Double, title As String = "Box Plot", width As Integer = 400, height As Integer = 600) As Picture`

- **`CreateBoxPlotWithScale`** Public Function
  - **Parameters:** `data() As Double, title As String, width As Integer, height As Integer, minVal As Double, maxVal As Double`
  - **Returns:** `Picture`
  - **Signature:** `Public Function CreateBoxPlotWithScale(data() As Double, title As String, width As Integer, height As Integer, minVal As Double, maxVal As Double) As Picture`

- **`CreateDistributionPlot`** Public Function
  - **Parameters:** `data() As Double, distType As String = "normal", width As Integer, height As Integer`
  - **Returns:** `Picture`
  - **Signature:** `Public Function CreateDistributionPlot(data() As Double, distType As String = "normal", width As Integer, height As Integer) As Picture`

- **`CreateDualBoxPlot`** Public Function
  - **Parameters:** `data1() As Double, data2() As Double, title As String, label1 As String, label2 As String, width As Integer, height As Integer`
  - **Returns:** `Picture`
  - **Signature:** `Public Function CreateDualBoxPlot(data1() As Double, data2() As Double, title As String, label1 As String, label2 As String, width As Integer, height As Integer) As Picture`

- **`CreateErrorPlot`** Public Function
  - **Parameters:** `errorMessage As String, width As Integer, height As Integer`
  - **Returns:** `Picture`
  - **Signature:** `Public Function CreateErrorPlot(errorMessage As String, width As Integer, height As Integer) As Picture`

- **`CreateHistogram`** Public Function
  - **Parameters:** `data() As Double, title As String = "Histogram", bins As Integer = 0, width As Integer = 600, height As Integer = 400`
  - **Returns:** `Picture`
  - **Signature:** `Public Function CreateHistogram(data() As Double, title As String = "Histogram", bins As Integer = 0, width As Integer = 600, height As Integer = 400) As Picture`

- **`CreateQQPlot`** Public Function
  - **Parameters:** `data() As Double, title As String, width As Integer, height As Integer`
  - **Returns:** `Picture`
  - **Signature:** `Public Function CreateQQPlot(data() As Double, title As String, width As Integer, height As Integer) As Picture`

- **`CreateScatterPlot`** Public Function
  - **Parameters:** `xData() as Double, yData() as Double, width as Integer, height as Integer, showRegression as Boolean = True, title as String, xLabel as String, yLabel as String`
  - **Returns:** `Picture`
  - **Signature:** `Public Function CreateScatterPlot(xData() as Double, yData() as Double, width as Integer, height as Integer, showRegression as Boolean = True, title as String, xLabel as String, yLabel as String) As Picture`

- **`DescriptiveStatistics`** Public Function
  - **Parameters:** `data() As Double`
  - **Returns:** `Dictionary`
  - **Signature:** `Public Function DescriptiveStatistics(data() As Double) As Dictionary`

- **`DrawDashedLine`** Public Sub
  - **Parameters:** `g as Graphics, x1 as Integer, y1 as Integer, x2 as Integer, y2 as Integer, dashlength as integer`
  - **Signature:** `Public Sub DrawDashedLine(g as Graphics, x1 as Integer, y1 as Integer, x2 as Integer, y2 as Integer, dashlength as integer)`

- **`DrawDashedLine1`** Public Sub
  - **Parameters:** `g as Graphics, x1 as Integer, y1 as Integer, x2 as Integer, y2 as Integer, dashlength as integer`
  - **Signature:** `Public Sub DrawDashedLine1(g as Graphics, x1 as Integer, y1 as Integer, x2 as Integer, y2 as Integer, dashlength as integer)`

- **`DrawDashedRectangle`** Private Sub
  - **Parameters:** `g As Graphics, x As Integer, y As Integer, width As Integer, height As Integer, dashLength As Integer`
  - **Signature:** `Private Sub DrawDashedRectangle(g As Graphics, x As Integer, y As Integer, width As Integer, height As Integer, dashLength As Integer)`

- **`Factorial`** Public Function
  - **Parameters:** `n As Integer`
  - **Returns:** `Double`
  - **Signature:** `Public Function Factorial(n As Integer) As Double`

- **`FormatToTwoDecimals`** Private Function
  - **Parameters:** `value As Double`
  - **Returns:** `String`
  - **Signature:** `Private Function FormatToTwoDecimals(value As Double) As String`

- **`InverseNormalCDF`** Public Function
  - **Parameters:** `p As Double`
  - **Returns:** `Double`
  - **Signature:** `Public Function InverseNormalCDF(p As Double) As Double`

- **`LinearRegression`** Public Function
  - **Parameters:** `xData() As Double, yData() As Double`
  - **Returns:** `Dictionary`
  - **Signature:** `Public Function LinearRegression(xData() As Double, yData() As Double) As Dictionary`

- **`NormalCDF`** Public Function
  - **Parameters:** `z As Double`
  - **Returns:** `Double`
  - **Signature:** `Public Function NormalCDF(z As Double) As Double`

- **`NormalPDF`** Public Function
  - **Parameters:** `x As Double, mean As Double, stddev As Double`
  - **Returns:** `Double`
  - **Signature:** `Public Function NormalPDF(x As Double, mean As Double, stddev As Double) As Double`

- **`OneSampleTTest`** Public Function
  - **Parameters:** `data() As Double, mu0 As Double, alpha As Double = 0.05`
  - **Returns:** `Dictionary`
  - **Signature:** `Public Function OneSampleTTest(data() As Double, mu0 As Double, alpha As Double = 0.05) As Dictionary`

- **`PairedTTest`** Public Function
  - **Parameters:** `data1() As Double, data2() As Double, alpha As Double = 0.05`
  - **Returns:** `Dictionary`
  - **Signature:** `Public Function PairedTTest(data1() As Double, data2() As Double, alpha As Double = 0.05) As Dictionary`

- **`PoissonPDF`** Public Function
  - **Parameters:** `k As Integer, lambda As Double`
  - **Returns:** `Double`
  - **Signature:** `Public Function PoissonPDF(k As Integer, lambda As Double) As Double`

- **`Quartile`** Public Function
  - **Parameters:** `sortedData() As Double, q As Integer`
  - **Returns:** `Double`
  - **Signature:** `Public Function Quartile(sortedData() As Double, q As Integer) As Double`

- **`StandardDeviation`** Public Function
  - **Parameters:** `data() As Double`
  - **Returns:** `Double`
  - **Signature:** `Public Function StandardDeviation(data() As Double) As Double`

- **`TDistributionCDF`** Public Function
  - **Parameters:** `t As Double, df As Integer`
  - **Returns:** `Double`
  - **Signature:** `Public Function TDistributionCDF(t As Double, df As Integer) As Double`

- **`TDistributionInverse`** Public Function
  - **Parameters:** `p As Double, df As Integer`
  - **Returns:** `Double`
  - **Signature:** `Public Function TDistributionInverse(p As Double, df As Integer) As Double`

- **`TValue95`** Public Function
  - **Parameters:** `n As Integer`
  - **Returns:** `Double`
  - **Signature:** `Public Function TValue95(n As Integer) As Double`

- **`TwoSampleTTest`** Public Function
  - **Parameters:** `data1() As Double, data2() As Double, equalVariances As Boolean = True, alpha As Double = 0.05`
  - **Returns:** `Dictionary`
  - **Signature:** `Public Function TwoSampleTTest(data1() As Double, data2() As Double, equalVariances As Boolean = True, alpha As Double = 0.05) As Dictionary`

- **`ValueToYCoordinate`** Private Function
  - **Parameters:** `value As Double, minVal As Double, maxVal As Double, margins As Integer, plotHeight As Integer`
  - **Returns:** `Integer`
  - **Signature:** `Private Function ValueToYCoordinate(value As Double, minVal As Double, maxVal As Double, margins As Integer, plotHeight As Integer) As Integer`

#### Events

None

---

### ViolinPlotRenderer

#### Properties

- **`PlotHeight`** Public Integer = 300

- **`PlotHeight1`** Public Integer = 300

#### Methods

None

#### Events

None

---

## Requirements

- **Xojo:** Latest compatible version

## Installation

1. Clone or download this repository
2. Open the `.xojo_project` file in Xojo
3. Build and run the project

## Usage

[Add specific usage instructions for your application]

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## License

MIT License

Copyright (c) 2025 Philip Cumpston

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
---



---
*This README was automatically generated from a Xojo project file on 29/7/2025*
