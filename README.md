# StatisticalAnalysis

## Project Overview
This project was developed to read a tab-separated file (.TSV) and display the (first) header line on a table 
so that numeric fields could be chosen for statistical analysis and display. Different statistical metrics are 
displayed for a single choice, a choice of two columns or multiple field displays.
	
This Xojo project contains the following components:

### Project Components

- **Classes:** 2 (App, StatisticalAnalyzer)
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

- **`BlandAltmanAnalysis`** Public Function
  - **Parameters:** `method1() As Double, method2() As Double`
  - **Returns:** `Dictionary`
  - **Signature:** `Public Function BlandAltmanAnalysis(method1() As Double, method2() As Double) As Dictionary`

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
  - **Parameters:** `xData() As Double, yData() As Double, title As String = "Scatter Plot", showRegression As Boolean = True, width As Integer = 600, height As Integer = 500`
  - **Returns:** `Picture`
  - **Signature:** `Public Function CreateScatterPlot(xData() As Double, yData() As Double, title As String = "Scatter Plot", showRegression As Boolean = True, width As Integer = 600, height As Integer = 500) As Picture`

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

- **`OneSampleTTest`** Public Function
  - **Parameters:** `data() As Double, mu0 As Double, alpha As Double = 0.05`
  - **Returns:** `Dictionary`
  - **Signature:** `Public Function OneSampleTTest(data() As Double, mu0 As Double, alpha As Double = 0.05) As Dictionary`

- **`PairedTTest`** Public Function
  - **Parameters:** `data1() As Double, data2() As Double, alpha As Double = 0.05`
  - **Returns:** `Dictionary`
  - **Signature:** `Public Function PairedTTest(data1() As Double, data2() As Double, alpha As Double = 0.05) As Dictionary`

- **`Quartile`** Public Function
  - **Parameters:** `sortedData() As Double, q As Integer`
  - **Returns:** `Double`
  - **Signature:** `Public Function Quartile(sortedData() As Double, q As Integer) As Double`

- **`TDistributionCDF`** Public Function
  - **Parameters:** `t As Double, df As Integer`
  - **Returns:** `Double`
  - **Signature:** `Public Function TDistributionCDF(t As Double, df As Integer) As Double`

- **`TDistributionInverse`** Public Function
  - **Parameters:** `p As Double, df As Integer`
  - **Returns:** `Double`
  - **Signature:** `Public Function TDistributionInverse(p As Double, df As Integer) As Double`

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

## Requirements

- **Xojo:** Latest compatible version

## Installation

1. Clone or download this repository
2. Open the `.xojo_project` file in Xojo
3. Build and run the project

## Usage

Load a tab-separated file that has columns labelled in the first line.

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
*This README was automatically generated from the Xojo project file on 14/7/2025*
