#tag Class
Protected Class StatisticalAnalyzer
	#tag Method, Flags = &h0
		Function AndersonDarlingTest(data() As Double) As Dictionary
		  // Anderson-Darling test for normality
		  // Returns dictionary with A2 statistic and p-value
		  
		  Var result As New Dictionary
		  Var n As Integer = data.Count
		  
		  If n < 8 Then
		    result.Value("error") = "Sample size too small for Anderson-Darling test (minimum 8)"
		    Return result
		  End If
		  
		  // Sort data
		  Var sortedData() As Double = CloneDoubleArray(data)
		  // Calculate mean and standard deviation
		  Var stats As Dictionary = DescriptiveStatistics(data)
		  Var mean As Double = stats.Value("mean")
		  Var stdDev As Double = stats.Value("std_dev")
		  
		  // Calculate A² statistic
		  Var A2 As Double = 0.0
		  For i As Integer = 0 To n - 1
		    Var zi As Double = (sortedData(i) - mean) / stdDev
		    Var Fi As Double = NormalCDF(zi)
		    
		    If Fi > 0 And Fi < 1 Then
		      A2 = A2 + (2 * i + 1) * Log(Fi) + (2 * (n - i) - 1) * Log(1 - Fi)
		    End If
		  Next
		  
		  A2 = -n - (A2 / n)
		  
		  // Adjust for sample size
		  A2 = A2 * (1 + 0.75/n + 2.25/(n*n))
		  
		  // Calculate p-value (approximate)
		  Var pValue As Double
		  If A2 >= 0.6 Then
		    pValue = Exp(1.2937 - 5.709 * A2 + 0.0186 * A2 * A2)
		  ElseIf A2 >= 0.34 Then
		    pValue = Exp(0.9177 - 4.279 * A2 - 1.38 * A2 * A2)
		  ElseIf A2 >= 0.2 Then
		    pValue = 1 - Exp(-8.318 + 42.796 * A2 - 59.938 * A2 * A2)
		  Else
		    pValue = 1 - Exp(-13.436 + 101.14 * A2 - 223.73 * A2 * A2)
		  End If
		  
		  result.Value("A2") = A2
		  result.Value("p_value") = pValue
		  result.Value("is_normal") = pValue > 0.05
		  result.Value("test") = "Anderson-Darling"
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AssessHeteroscedasticity(xVals() As Double, yVals() As Double, slope As Double, intercept As Double, se As Double) As String
		  //Function AssessHeteroscedasticity(xVals() As Double, yVals() As Double, slope As Double, intercept As Double, se As Double) As String
		  Var n As Integer = xVals.Count
		  Var firstHalf() As Double
		  Var secondHalf() As Double
		  
		  // Split residuals into two halves
		  For i As Integer = 0 To n - 1
		    Var predicted As Double = intercept + slope * xVals(i)
		    Var residual As Double = Abs(yVals(i) - predicted)
		    
		    If i < n / 2 Then
		      firstHalf.Add(residual)
		    Else
		      secondHalf.Add(residual)
		    End If
		  Next
		  
		  // Calculate variance of each half
		  Var var1 As Double = CalculateVariance(firstHalf)
		  Var var2 As Double = CalculateVariance(secondHalf)
		  Var ratio As Double = Max(var1, var2) / Min(var1, var2)
		  
		  If ratio > 2.0 Then
		    Return "HETEROSCEDASTIC: Unequal variances detected (ratio=" + Format(ratio, "0.1") + ")"
		  Else
		    Return "HOMOSCEDASTIC: Equal variances assumed (ratio=" + Format(ratio, "0.1") + ")"
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Average(data() As Double) As Double
		  //Public Function Average(data() As Double) As Double
		  If data.Count = 0 Then Return 0
		  Var sum As Double
		  For Each d As Double In data
		    sum = sum + d
		  Next
		  Return sum / data.Count
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BlandAltmanAnalysis(method1() As Double, method2() As Double) As Dictionary
		  // Bland-Altman analysis for method comparison
		  
		  Var result As New Dictionary
		  
		  If method1.Count <> method2.Count Then
		    result.Value("error") = "Arrays must have the same length"
		    Return result
		  End If
		  
		  Var n As Integer = method1.Count
		  Var differences() As Double
		  Var averages() As Double
		  
		  // Calculate differences and averages
		  For i As Integer = 0 To n - 1
		    differences.Add(method1(i) - method2(i))
		    averages.Add((method1(i) + method2(i)) / 2)
		  Next
		  
		  // Calculate statistics
		  Var diffStats As Dictionary = DescriptiveStatistics(differences)
		  Var meanDiff As Double = diffStats.Value("mean")
		  Var sdDiff As Double = diffStats.Value("std_dev")
		  
		  // Limits of agreement
		  Var upperLimit As Double = meanDiff + 1.96 * sdDiff
		  Var lowerLimit As Double = meanDiff - 1.96 * sdDiff
		  
		  result.Value("mean_difference") = meanDiff
		  result.Value("std_dev_difference") = sdDiff
		  result.Value("upper_limit") = upperLimit
		  result.Value("lower_limit") = lowerLimit
		  result.Value("differences") = differences
		  result.Value("averages") = averages
		  result.Value("n") = n
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BootstrapCI(data() As Double, iterations As Integer = 10000) As Dictionary
		  // Function BootstrapCI(data() As Double, iterations As Integer = 10000) As Dictionary
		  Var n As Integer = data.Count
		  If n = 0 Then Return New Dictionary("error": "Empty data")
		  
		  Var rng As New Random
		  Var means() As Double
		  
		  For i As Integer = 0 To iterations - 1
		    Var sample() As Double
		    For j As Integer = 0 To n - 1
		      sample.Add(data(rng.InRange(0, n - 1)))
		    Next
		    Var sum As Double = 0
		    For Each v As Double In sample
		      sum = sum + v
		    Next
		    means.Add(sum / n)
		  Next
		  
		  means.Sort
		  Var lowerIndex As Integer = iterations * 0.025
		  Var upperIndex As Integer = iterations * 0.975
		  
		  Return New Dictionary("lower": means(lowerIndex), "upper": means(upperIndex))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BootstrapMedianCI(data() As Double, iterations As Integer = 10000) As Dictionary
		  // Function BootstrapMedianCI(data() As Double, iterations As Integer = 10000) As Dictionary
		  Var n As Integer = data.Count
		  If n = 0 Then Return New Dictionary("error": "Empty data")
		  
		  Var rng As New Random
		  Var medians() As Double
		  
		  For i As Integer = 0 To iterations - 1
		    Var sample() As Double
		    For j As Integer = 0 To n - 1
		      sample.Add(data(rng.InRange(0, n - 1)))
		    Next
		    
		    sample.Sort
		    Var median As Double
		    If n Mod 2 = 0 Then
		      median = (sample(n \ 2 - 1) + sample(n \ 2)) / 2
		    Else
		      median = sample(n \ 2)
		    End If
		    medians.Add(median)
		  Next
		  
		  medians.Sort
		  Var lowerIndex As Integer = iterations * 0.025
		  Var upperIndex As Integer = iterations * 0.975
		  
		  Return New Dictionary("lower": medians(lowerIndex), "upper": medians(upperIndex))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CalculateRSquared(xVals() As Double, yVals() As Double, slope As Double, intercept As Double) As double
		  //Function CalculateRSquared(xVals() As Double, yVals() As Double, slope As Double, intercept As Double) As Double
		  Var n As Integer = xVals.Count
		  Var sumY As Double = 0
		  Var sumSquaredResiduals As Double = 0
		  Var sumSquaredTotal As Double = 0
		  
		  For i As Integer = 0 To n - 1
		    sumY = sumY + yVals(i)
		  Next
		  Var meanY As Double = sumY / n
		  
		  For i As Integer = 0 To n - 1
		    Var predicted As Double = intercept + slope * xVals(i)
		    Var residual As Double = yVals(i) - predicted
		    sumSquaredResiduals = sumSquaredResiduals + residual^2
		    
		    Var totalDeviation As Double = yVals(i) - meanY
		    sumSquaredTotal = sumSquaredTotal + totalDeviation^2
		  Next
		  
		  Return 1 - (sumSquaredResiduals / sumSquaredTotal)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CalculateVariance(values() As Double) As Double
		  // Function CalculateVariance(values() As Double) As Double
		  Var n As Integer = values.Count
		  If n <= 1 Then Return 0
		  
		  Var sum As Double = 0
		  For Each Val As Double In values
		    sum = sum + Val
		  Next
		  Var mean As Double = sum / n
		  
		  Var sumSquares As Double = 0
		  For Each Val As Double In values
		    sumSquares = sumSquares + (Val - mean)^2
		  Next
		  
		  Return sumSquares / (n - 1)
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CloneDoubleArray(sourceArray() As Double) As Double()
		  // Helper method to clone Double arrays - add this to your class
		  // Private Function CloneDoubleArray(sourceArray() As Double) As Double()
		  Var clonedArray() As Double
		  For i As Integer = 0 To sourceArray.LastIndex
		    clonedArray.Add(sourceArray(i))
		  Next
		  Return clonedArray
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateBlandAltmanPlot(method1() As Double, method2() As Double, title As String, width As Integer, height As Integer) As Picture
		  //Function CreateBlandAltmanPlot(method1() As Double, method2() As Double, title As String, width As Integer, height As Integer) As Picture
		  Var pic As New Picture(width, height, 32)
		  Var g As Graphics = pic.Graphics
		  
		  // Calculate differences and means
		  Var differences() As Double
		  Var means() As Double
		  For i As Integer = 0 To method1.LastIndex
		    differences.Add(method1(i) - method2(i))
		    means.Add((method1(i) + method2(i)) / 2)
		  Next
		  
		  // Calculate statistics
		  Var meanDiff As Double = 0
		  For Each diff As Double In differences
		    meanDiff = meanDiff + diff
		  Next
		  meanDiff = meanDiff / differences.Count
		  
		  Var stdDiff As Double = 0
		  For Each diff As Double In differences
		    stdDiff = stdDiff + (diff - meanDiff) ^ 2
		  Next
		  stdDiff = Sqrt(stdDiff / (differences.Count - 1))
		  
		  // Set up plotting area
		  Var margins As Integer = 80
		  Var plotWidth As Integer = width - 2 * margins
		  Var plotHeight As Integer = height - 2 * margins
		  
		  // Find ranges
		  Var minMean As Double = means(0)
		  Var maxMean As Double = means(0)
		  For Each mean As Double In means
		    If mean < minMean Then minMean = mean
		    If mean > maxMean Then maxMean = mean
		  Next
		  
		  Var minDiff As Double = meanDiff - 3 * stdDiff
		  Var maxDiff As Double = meanDiff + 3 * stdDiff
		  
		  // Clear background
		  g.DrawingColor = Color.White
		  g.FillRectangle(0, 0, width, height)
		  
		  // Draw axes
		  g.DrawingColor = Color.Black
		  g.PenSize = 1
		  g.DrawLine(margins, margins, margins, height - margins)  // Y-axis
		  g.DrawLine(margins, height - margins, width - margins, height - margins)  // X-axis
		  
		  // Add   labels and tick marks
		  g.FontName = "Arial"
		  g.FontSize = 12
		  Var numYTicks As Integer = 8
		  For i As Integer = 0 To numYTicks
		    Var yValue As Double = minDiff + (i / numYTicks) * (maxDiff - minDiff)
		    Var yPos As Integer = height - margins - (i / numYTicks) * plotHeight
		    
		    // Draw tick mark
		    g.DrawLine(margins - 5, yPos, margins, yPos)
		    
		    // Format and draw label
		    Var labelText As String = Format(yValue, "0.00")
		    Var labelWidth As Double = g.TextWidth(labelText)
		    g.DrawText(labelText, margins - labelWidth - 10, yPos + 4)
		  Next
		  
		  // Add special labels for key values
		  g.DrawingColor = Color.Red
		  g.FontSize = 10
		  
		  // Zero line label (if zero is within range)
		  If minDiff <= 0 And maxDiff >= 0 Then
		    Var zeroY As Integer = height - margins - ((0 - minDiff) / (maxDiff - minDiff)) * plotHeight
		    g.DrawLine(margins - 3, zeroY, margins, zeroY)
		    g.DrawText("0", margins - 15, zeroY + 4)
		    
		    // Draw a light horizontal line at zero
		    g.DrawingColor = Color.LightGray
		    g.PenSize = 1
		    DrawDashedLine(g, margins, zeroY, width - margins, zeroY, 3)
		  End If
		  
		  // Mean difference label
		  g.DrawingColor = Color.Blue
		  Var meanY As Integer = height - margins - ((meanDiff - minDiff) / (maxDiff - minDiff)) * plotHeight
		  g.DrawLine(margins - 3, meanY, margins, meanY)
		  Var meanLabel As String = "Mean: " + Format(meanDiff, "0.00")
		  g.DrawText(meanLabel, margins + 10, meanY - 5)
		  
		  // Draw mean line (solid)
		  g.DrawingColor = Color.Black
		  g.PenSize = 1
		  g.DrawLine(margins, meanY, width - margins, meanY)
		  
		  // Draw ±1.96 SD lines (dashed)
		  g.DrawingColor = Color.Red
		  Var upper196Y As Integer = height - margins - ((meanDiff + 1.96 * stdDiff - minDiff) / (maxDiff - minDiff)) * plotHeight
		  Var lower196Y As Integer = height - margins - ((meanDiff - 1.96 * stdDiff - minDiff) / (maxDiff - minDiff)) * plotHeight
		  
		  DrawDashedLine(g, margins, upper196Y, width - margins, upper196Y, 5)
		  DrawDashedLine(g, margins, lower196Y, width - margins, lower196Y, 5)
		  
		  // Add labels for ±1.96 SD lines
		  g.FontSize = 10
		  Var upperLabel As String = "+1.96 SD: " + Format(meanDiff + 1.96 * stdDiff, "0.00")
		  Var lowerLabel As String = "-1.96 SD: " + Format(meanDiff - 1.96 * stdDiff, "0.00")
		  g.DrawText(upperLabel, margins + 10, upper196Y - 5)
		  g.DrawText(lowerLabel, margins + 10, lower196Y + 15)
		  
		  // Reset to solid lines for data points
		  g.DrawingColor = Color.Blue
		  g.PenSize = 1
		  
		  // Plot data points
		  For i As Integer = 0 To means.LastIndex
		    Var x As Integer = margins + ((means(i) - minMean) / (maxMean - minMean)) * plotWidth
		    Var y As Integer = height - margins - ((differences(i) - minDiff) / (maxDiff - minDiff)) * plotHeight
		    g.FillOval(x - 2, y - 2, 4, 4)
		  Next
		  
		  // Add axis labels
		  g.DrawingColor = Color.Black
		  g.FontName = "Arial"
		  g.FontSize = 14
		  
		  // Y-axis label (vertical - drawing character by character)
		  Var yAxisLabel As String = "Difference of Values"
		  Var charHeight As Integer = g.TextHeight("A", 100)  // Added width parameter
		  Var startY As Integer = (height - g.TextWidth(yAxisLabel)) / 2
		  For i As Integer = 0 To yAxisLabel.Length - 1
		    Var char As String = yAxisLabel.Middle(i, 1)
		    g.DrawText(char, 15, startY + i * charHeight)
		  Next
		  
		  // X-axis label
		  Var xAxisLabel As String = "Average of Values"
		  Var xLabelWidth As Double = g.TextWidth(xAxisLabel)
		  g.DrawText(xAxisLabel, (width - xLabelWidth) / 2, height - 20)
		  
		  // Add title
		  g.FontSize = 16
		  Var titleWidth As Double = g.TextWidth(title)
		  g.DrawText(title, (width - titleWidth) / 2, 30)
		  
		  Return pic
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateBoxPlot(data() As Double, title As String = "Box Plot", width As Integer = 400, height As Integer = 600) As Picture
		  //Function createboxplot(data() As Double, title As String, width As Integer, height As Integer) As Picture
		  Var pic As New Picture(width, height, 32)
		  Var g As Graphics = pic.Graphics
		  Var outlierValues() As Double
		  
		  // Calculate quartiles and statistics
		  Var stats As Dictionary = DescriptiveStatistics(data)
		  Var sortedData() As Double = CloneDoubleArray(data)  // Fixed line
		  sortedData.Sort
		  Var q1 As Double = Quartile(sortedData, 1)
		  Var median As Double = stats.Value("median")
		  Var q3 As Double = Quartile(sortedData, 3)
		  Var iqr As Double = q3 - q1
		  
		  // Calculate whiskers
		  Var lowerWhisker As Double = q1 - 1.5 * iqr
		  Var upperWhisker As Double = q3 + 1.5 * iqr
		  
		  // Find actual whisker values
		  Var actualLowerWhisker As Double = sortedData(sortedData.Count - 1)
		  Var actualUpperWhisker As Double = sortedData(0)
		  For Each Val As Double In sortedData
		    If Val >= lowerWhisker And Val < actualLowerWhisker Then
		      actualLowerWhisker = Val
		    End If
		    If Val <= upperWhisker And Val > actualUpperWhisker Then
		      actualUpperWhisker = Val
		    End If
		  Next
		  
		  // Identify outliers
		  For Each Val As Double In sortedData
		    If Val < lowerWhisker Or Val > upperWhisker Then
		      outlierValues.Add(Val)
		    End If
		  Next
		  
		  // Set up coordinate system
		  Var margins As Integer = 80
		  Var plotHeight As Integer = height - 2 * margins
		  Var boxWidth As Integer = 100
		  Var boxX As Integer = (width - boxWidth) / 2
		  
		  // Find data range
		  Var minVal As Double = sortedData(0)
		  Var maxVal As Double = sortedData(sortedData.Count - 1)
		  Var range As Double = maxVal - minVal
		  minVal = minVal - 0.1 * range
		  maxVal = maxVal + 0.1 * range
		  
		  // Clear background
		  g.DrawingColor = Color.White
		  g.FillRectangle(0, 0, width, height)
		  
		  // Draw box
		  g.DrawingColor = Color.RGB(200, 200, 255)
		  Var q1Y As Integer = ValueToYCoordinate(q1, minVal, maxVal, margins, plotHeight)
		  Var q3Y As Integer = ValueToYCoordinate(q3, minVal, maxVal, margins, plotHeight)
		  g.FillRectangle(boxX, q3Y, boxWidth, q1Y - q3Y)
		  g.DrawingColor = Color.Black
		  g.PenSize = 2
		  g.DrawRectangle(boxX, q3Y, boxWidth, q1Y - q3Y)
		  
		  // Draw median line
		  Var medianY As Integer = ValueToYCoordinate(median, minVal, maxVal, margins, plotHeight)
		  g.DrawLine(boxX, medianY, boxX + boxWidth, medianY)
		  
		  // Draw whiskers
		  g.PenSize = 1
		  Var centerX As Integer = boxX + boxWidth / 2
		  
		  // Upper whisker
		  Var upperWhiskerY As Integer = ValueToYCoordinate(actualUpperWhisker, minVal, maxVal, margins, plotHeight)
		  g.DrawLine(centerX, q3Y, centerX, upperWhiskerY)
		  g.DrawLine(centerX - 20, upperWhiskerY, centerX + 20, upperWhiskerY)
		  
		  // Lower whisker
		  Var lowerWhiskerY As Integer = ValueToYCoordinate(actualLowerWhisker, minVal, maxVal, margins, plotHeight)
		  g.DrawLine(centerX, q1Y, centerX, lowerWhiskerY)
		  g.DrawLine(centerX - 20, lowerWhiskerY, centerX + 20, lowerWhiskerY)
		  
		  // Draw Outliers
		  g.drawingColor = Color.Red
		  Var idx As Integer = 0
		  While idx < outlierValues.Count
		    Var outVal As Double = outlierValues(idx)
		    Var y As Integer = ValueToYCoordinate(outVal, minVal, maxVal, margins, plotHeight)
		    g.FillOval(centerX - 3, y - 3, 6, 6)
		    idx = idx + 1
		  Wend
		  
		  // Add title and labels
		  g.DrawingColor = Color.Black
		  g.FontName = "Arial"
		  g.FontSize = 16
		  Var titleWidth As Double = g.TextWidth(title)
		  g.DrawText(title, (width - titleWidth) / 2, 30)
		  
		  // Add statistics
		  g.FontSize = 10
		  Var statsText As String = "Min: " + Format(sortedData(0), "0.00") + EndOfLine + _
		  "Q1: " + Format(q1, "0.00") + EndOfLine + _
		  "Median: " + Format(median, "0.00") + EndOfLine + _
		  "Q3: " + Format(q3, "0.00") + EndOfLine + _
		  "Max: " + Format(sortedData(sortedData.Count - 1), "0.00") + EndOfLine + _
		  "Outliers: " + outlierValues.Count.ToString
		  g.DrawText(statsText, 10, margins)
		  
		  Return pic
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateBoxPlotWithScale(data() As Double, title As String, width As Integer, height As Integer, minVal As Double, maxVal As Double) As Picture
		  
		  //Helper function - Modified version of CreateBoxPlot that accepts scale parameters
		  //Function CreateBoxPlotWithScale(data() As Double, title As String, width As Integer, height As Integer, minVal As Double, maxVal As Double) As Picture
		  
		  // Create a new picture object for this individual box plot
		  Var pic As New Picture(width, height, 32)
		  Var g As Graphics = pic.Graphics
		  
		  Var outlierValues() As Double  // Array to store outlier values
		  
		  // Calculate quartiles and statistics
		  // NOTE: This should use the 'data' parameter, not 'data1' (appears to be a typo in original)
		  Var stats As Dictionary = DescriptiveStatistics(data)  // Get statistical summary
		  Var sortedData() As Double = CloneDoubleArray(data)    // Create sorted copy of data
		  sortedData.Sort
		  
		  // Calculate the three quartiles (Q1, Q2/median, Q3)
		  Var q1 As Double = Quartile(sortedData, 1)       // First quartile (25th percentile)
		  Var median As Double = stats.Value("median")      // Second quartile (50th percentile)
		  Var q3 As Double = Quartile(sortedData, 3)       // Third quartile (75th percentile)
		  Var iqr As Double = q3 - q1                      // Interquartile range
		  
		  // Calculate whisker boundaries using the 1.5 * IQR rule
		  // Values beyond these boundaries are considered outliers
		  Var lowerWhisker As Double = q1 - 1.5 * iqr      // Lower outlier boundary
		  Var upperWhisker As Double = q3 + 1.5 * iqr      // Upper outlier boundary
		  
		  // Find actual whisker values (the most extreme non-outlier values)
		  // Initialize with extreme values that will be replaced
		  Var actualLowerWhisker As Double = sortedData(sortedData.Count - 1)  // Start with max value
		  Var actualUpperWhisker As Double = sortedData(0)                     // Start with min value
		  
		  // Find the actual whisker endpoints within the acceptable range
		  For Each Val As Double In sortedData
		    // Find the smallest value that's still >= lower boundary
		    If Val >= lowerWhisker And Val < actualLowerWhisker Then
		      actualLowerWhisker = Val
		    End If
		    // Find the largest value that's still <= upper boundary
		    If Val <= upperWhisker And Val > actualUpperWhisker Then
		      actualUpperWhisker = Val
		    End If
		  Next
		  
		  // Identify outliers (values outside whisker boundaries)
		  For Each Val As Double In sortedData
		    If Val < lowerWhisker Or Val > upperWhisker Then
		      outlierValues.Add(Val)  // Add to outlier array
		    End If
		  Next
		  
		  // Set up coordinate system
		  Var margins As Integer = 80        // Margin space around the plot
		  Var boxWidth As Integer = 100      // Fixed width for the box itself
		  Var plotHeight As Integer = height - 2 * margins  // Available height for plotting
		  Var boxX As Integer = (width - boxWidth) / 2  // Center the box horizontally
		  
		  // Clear background to white
		  g.DrawingColor = Color.White
		  g.FillRectangle(0, 0, width, height)
		  
		  // Draw the main box (interquartile range: Q1 to Q3)
		  g.DrawingColor = Color.RGB(200, 200, 255)  // Light blue fill
		  // Convert quartile values to y-coordinates using the provided scale
		  Var q1Y As Integer = ValueToYCoordinate(q1, minVal, maxVal, margins, plotHeight)
		  Var q3Y As Integer = ValueToYCoordinate(q3, minVal, maxVal, margins, plotHeight)
		  // Fill the box rectangle (note: q3Y is smaller than q1Y because y increases downward)
		  g.FillRectangle(boxX, q3Y, boxWidth, q1Y - q3Y)
		  // Draw the box outline in black
		  g.DrawingColor = Color.Black
		  g.PenSize = 2
		  g.DrawRectangle(boxX, q3Y, boxWidth, q1Y - q3Y)
		  
		  // Draw median line across the box
		  Var medianY As Integer = ValueToYCoordinate(median, minVal, maxVal, margins, plotHeight)
		  g.DrawLine(boxX, medianY, boxX + boxWidth, medianY)
		  
		  // Draw whiskers (lines extending from box to min/max non-outlier values)
		  g.PenSize = 1
		  Var centerX As Integer = boxX + boxWidth / 2  // Center x-coordinate of the box
		  
		  // Upper whisker (from Q3 to maximum non-outlier value)
		  Var upperWhiskerY As Integer = ValueToYCoordinate(actualUpperWhisker, minVal, maxVal, margins, plotHeight)
		  g.DrawLine(centerX, q3Y, centerX, upperWhiskerY)        // Vertical line
		  g.DrawLine(centerX - 20, upperWhiskerY, centerX + 20, upperWhiskerY)  // Horizontal cap
		  
		  // Lower whisker (from Q1 to minimum non-outlier value)
		  Var lowerWhiskerY As Integer = ValueToYCoordinate(actualLowerWhisker, minVal, maxVal, margins, plotHeight)
		  g.DrawLine(centerX, q1Y, centerX, lowerWhiskerY)        // Vertical line
		  g.DrawLine(centerX - 20, lowerWhiskerY, centerX + 20, lowerWhiskerY)  // Horizontal cap
		  
		  // Draw outliers as red circles
		  g.DrawingColor = Color.Red
		  Var idx As Integer = 0
		  While idx < outlierValues.Count
		    Var outVal As Double = outlierValues(idx)
		    // Convert outlier value to y-coordinate
		    Var y As Integer = ValueToYCoordinate(outVal, minVal, maxVal, margins, plotHeight)
		    // Draw a small filled circle (6x6 pixels) centered at the outlier position
		    g.FillOval(centerX - 3, y - 3, 6, 6)
		    idx = idx + 1
		  Wend
		  
		  // Add title centered at the top
		  g.DrawingColor = Color.Black
		  g.FontName = "Arial"
		  g.FontSize = 16
		  Var titleWidth As Double = g.TextWidth(title)
		  g.DrawText(title, (width - titleWidth) / 2, 30)
		  
		  // Add statistical summary text in the left margin
		  g.FontSize = 10
		  Var statsText As String = "Min: " + Format(sortedData(0), "0.00") + EndOfLine + _
		  "Q1: " + Format(q1, "0.00") + EndOfLine + _
		  "Median: " + Format(median, "0.00") + EndOfLine + _
		  "Q3: " + Format(q3, "0.00") + EndOfLine + _
		  "Max: " + Format(sortedData(sortedData.Count - 1), "0.00") + EndOfLine + _
		  "Outliers: " + outlierValues.Count.ToString
		  g.DrawText(statsText, 10, margins)  // Draw at left margin
		  
		  // Return the completed individual box plot picture
		  Return pic
		  
		  // END OF CreateBoxPlotWithScale FUNCTION
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateDistributionPlot(data() As Double, distType As String = "normal", width As Integer, height As Integer) As Picture
		  // Public Function CreateDistributionPlot(data() As Double, distType As String = "normal", width As Integer = 600, height As Integer = 400) As Picture
		  If data.Count = 0 Then Return New Picture(width, height)
		  
		  Var sorted() As Double = CloneDoubleArray(data)
		  sorted.Sort
		  
		  Var n As Integer = sorted.Count
		  Var mean As Double = Average(sorted)
		  Var sd As Double = StandardDeviation(sorted)
		  Var sem As Double = sd / Sqrt(n)
		  Var ciLower As Double = mean - 1.96 * sem
		  Var ciUpper As Double = mean + 1.96 * sem
		  
		  Var minVal As Double = sorted(0)
		  Var maxVal As Double = sorted(sorted.LastIndex)
		  Var range As Double = maxVal - minVal
		  If range = 0 Then range = 1
		  minVal = minVal - 0.1 * range
		  maxVal = maxVal + 0.1 * range
		  range = maxVal - minVal
		  
		  Var pic As New Picture(width, height)
		  Var g As Graphics = pic.Graphics
		  g.ForeColor = Color.White
		  g.FillRectangle(0, 0, width, height)
		  
		  Var leftMargin As Integer = 60
		  Var rightMargin As Integer = 20
		  Var topMargin As Integer = 40
		  Var bottomMargin As Integer = 40
		  Var plotWidth As Integer = width - leftMargin - rightMargin
		  Var plotHeight As Integer = height - topMargin - bottomMargin
		  
		  // Distribution line
		  g.ForeColor = Color.Red
		  Var points() As Point
		  Var peakPDF As Double = 0
		  
		  For px As Integer = 0 To plotWidth
		    Var xVal As Double = minVal + (px / plotWidth) * range
		    Var yVal As Double
		    
		    Select Case distType.Lowercase.Trim
		    Case "poisson"
		      yVal = PoissonPDF(Floor(xVal), mean)
		    Case Else
		      yVal = NormalPDF(xVal, mean, sd)
		    End Select
		    
		    If yVal > peakPDF Then peakPDF = yVal
		  Next
		  If peakPDF = 0 Then peakPDF = 1
		  
		  For px As Integer = 0 To plotWidth
		    Var xVal As Double = minVal + (px / plotWidth) * range
		    Var yVal As Double
		    
		    Select Case distType.Lowercase.Trim
		    Case "poisson"
		      yVal = PoissonPDF(Floor(xVal), mean)
		    Case Else
		      yVal = NormalPDF(xVal, mean, sd)
		    End Select
		    
		    Var normY As Double = yVal / peakPDF
		    Var py As Double = topMargin + plotHeight - normY * (plotHeight * 0.9)
		    points.Add(New Point(leftMargin + px, py))
		  Next
		  
		  g.PenWidth = 2
		  For i As Integer = 1 To points.LastIndex
		    g.DrawLine(points(i - 1).X, points(i - 1).Y, points(i).X, points(i).Y)
		  Next
		  
		  
		  
		  // CI lines
		  g.ForeColor = Color.RGB(0, 100, 0)
		  g.PenWidth = 1
		  Var ciLx As Double = leftMargin + ((ciLower - minVal) / range) * plotWidth
		  Var ciUx As Double = leftMargin + ((ciUpper - minVal) / range) * plotWidth
		  g.DrawLine(ciLx, topMargin, ciLx, topMargin + plotHeight)
		  g.DrawLine(ciUx, topMargin, ciUx, topMargin + plotHeight)
		  
		  // Axes
		  g.ForeColor = Color.Black
		  g.DrawLine(leftMargin, topMargin + plotHeight, leftMargin + plotWidth, topMargin + plotHeight)
		  g.DrawLine(leftMargin, topMargin, leftMargin, topMargin + plotHeight)
		  
		  // X-axis ticks
		  Var tickCount As Integer = 10
		  g.TextSize = 10
		  For i As Integer = 0 To tickCount
		    Var frac As Double = i / tickCount
		    Var xVal As Double = minVal + frac * range
		    Var xPix As Integer = leftMargin + frac * plotWidth
		    g.DrawLine(xPix, topMargin + plotHeight, xPix, topMargin + plotHeight + 5)
		    g.DrawText(Format(xVal, "0.0"), xPix - 10, topMargin + plotHeight + 20)
		  Next
		  
		  // Label
		  g.TextSize = 10
		  g.DrawText("Mean: " + Format(mean, "0.00"), leftMargin + 10, topMargin + 20)
		  g.DrawText("95% CI: [" + Format(ciLower, "0.00") + ", " + Format(ciUpper, "0.00") + "]", leftMargin + 10, topMargin + 35)
		  
		  Return pic
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateDualBoxPlot(data1() As Double, data2() As Double, title As String, label1 As String, label2 As String, width As Integer, height As Integer) As Picture
		  //Function CreateDualBoxPlot(data1() As Double, data2() As Double, title As String, label1 As String, label2 As String, width As Integer, height As Integer) As Picture
		  
		  // Create a new picture object with specified Varensions and 32-bit color depth
		  Var pic As New Picture(width, height, 32)
		  Var g As Graphics = pic.Graphics
		  
		  // Calculate individual box plot widths
		  // Reserve 100px total for spacing and margins, divide remaining space between 2 plots
		  Var boxPlotWidth As Integer = (width - 100) / 2  // Leave 100px for spacing and margins
		  Var spacing As Integer = 50  // Space between the two box plots
		  
		  // Find overall data range for consistent y-axis scaling
		  // Clone and sort both datasets to find min/max values
		  Var sortedData1() As Double = CloneDoubleArray(data1)
		  Var sortedData2() As Double = CloneDoubleArray(data2)
		  sortedData1.Sort
		  sortedData2.Sort
		  
		  // Determine the global min and max values across both datasets
		  Var minVal As Double = Min(sortedData1(0), sortedData2(0))
		  Var maxVal As Double = Max(sortedData1(sortedData1.Count - 1), sortedData2(sortedData2.Count - 1))
		  
		  // Add 10% padding above and below the data range for better visualization
		  Var range As Double = maxVal - minVal
		  minVal = minVal - 0.1 * range
		  maxVal = maxVal + 0.1 * range
		  
		  // Create individual box plots with consistent scaling
		  // Both plots use the same min/max values to ensure comparable y-axes
		  Var boxPlot1 As Picture = CreateBoxPlotWithScale(data1, label1, boxPlotWidth, height - 100, minVal, maxVal)
		  Var boxPlot2 As Picture = CreateBoxPlotWithScale(data2, label2, boxPlotWidth, height - 100, minVal, maxVal)
		  
		  // Calculate medians for connection line
		  // Get descriptive statistics for both datasets
		  Var stats1 As Dictionary = DescriptiveStatistics(data1)
		  Var stats2 As Dictionary = DescriptiveStatistics(data2)
		  Var median1 As Double = stats1.Value("median")
		  Var median2 As Double = stats2.Value("median")
		  
		  // Clear background to white
		  g.DrawingColor = Color.White
		  g.FillRectangle(0, 0, width, height)
		  
		  // Calculate positions for the two box plots side by side
		  Var plot1X As Integer = 25          // Left margin for first plot
		  Var plot2X As Integer = plot1X + boxPlotWidth + spacing  // Position second plot with spacing
		  Var plotY As Integer = 80           // Top margin for both plots
		  
		  // Draw the two box plots at their calculated positions
		  g.DrawPicture(boxPlot1, plot1X, plotY)
		  g.DrawPicture(boxPlot2, plot2X, plotY)
		  
		  // Calculate median positions for the connection line
		  // The individual box plots have their own coordinate system with margins
		  // We need to calculate where the median lines appear on the main canvas
		  Var individualPlotMargins As Integer = 80  // Margin used in individual box plots
		  Var individualPlotHeight As Integer = (height - 100) - 2 * individualPlotMargins  // Height available for plotting in individual plots
		  
		  // Calculate median Y positions relative to the individual plot coordinate system
		  // Then adjust for the position of plots on the main canvas
		  Var medianY1 As Integer = plotY + individualPlotMargins + ValueToYCoordinate(median1, minVal, maxVal, 0, individualPlotHeight)
		  Var medianY2 As Integer = plotY + individualPlotMargins + ValueToYCoordinate(median2, minVal, maxVal, 0, individualPlotHeight)
		  
		  // Calculate connection points at box edges
		  Var boxWidth As Integer = 100  // Should match the boxWidth from CreateBoxPlotWithScale
		  // Find center x-coordinates of both box plots
		  Var box1CenterX As Integer = plot1X + boxPlotWidth / 2
		  Var box2CenterX As Integer = plot2X + boxPlotWidth / 2
		  
		  // Calculate connection points: right edge of first box, left edge of second box
		  // The connection should be at the median level of each respective box
		  Var connectX1 As Integer = box1CenterX + boxWidth / 2  // Right edge of first box
		  Var connectX2 As Integer = box2CenterX - boxWidth / 2  // Left edge of second box
		  
		  // Draw dotted line connecting medians from right edge of box1 to left edge of box2
		  g.DrawingColor = Color.Blue
		  g.PenSize = 2
		  DrawDashedLine(g, connectX1, medianY1, connectX2, medianY2, 8)  // 8px dash pattern
		  
		  // Add main title centered at the top
		  g.DrawingColor = Color.Black
		  g.FontName = "Arial"
		  g.FontSize = 16
		  Var titleWidth As Double = g.TextWidth(title)
		  g.DrawText(title, (width - titleWidth) / 2, 30)  // Center horizontally, 30px from top
		  
		  // Add median difference information at the bottom
		  g.FontSize = 12
		  g.DrawingColor = Color.Blue
		  Var medianDiff As Double = median2 - median1  // Calculate difference between medians
		  Var diffText As String = "Median Difference: " + Format(medianDiff, "0.00")
		  Var diffWidth As Double = g.TextWidth(diffText)
		  g.DrawText(diffText, (width - diffWidth) / 2, height - 30)  // Center horizontally, 30px from bottom
		  
		  // Return the completed dual box plot picture
		  Return pic
		  
		  // END OF CreateDualBoxPlot FUNCTION
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateErrorPlot(errorMessage As String, width As Integer, height As Integer) As Picture
		  
		  // CreateErrorPlot(errorMessage As String, width As Integer, height As Integer) As Picture
		  
		  Var pic As New Picture(width, height, 32)
		  Var g As Graphics = pic.Graphics
		  
		  g.ForeColor = Color.White
		  g.FillRectangle(0, 0, width, height)
		  
		  g.ForeColor = Color.Red
		  g.TextFont = "Arial"
		  g.TextSize = 14
		  
		  Var textWidth As Integer = g.TextWidth(errorMessage)
		  g.DrawText(errorMessage, (width - textWidth) / 2, height / 2)
		  
		  Return pic
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateHistogram(data() As Double, title As String = "Histogram", bins As Integer = 0, width As Integer = 600, height As Integer = 400) As Picture
		  Var pic As New Picture(width, height, 32)
		  Var g As Graphics = pic.Graphics
		  
		  // Auto-calculate bins if not specified
		  If bins = 0 Then
		    bins = Max(5, Min(50, Sqrt(data.Count)))
		  End If
		  
		  // Calculate statistics
		  Var stats As Dictionary = DescriptiveStatistics(data)
		  Var minVal As Double = stats.Value("min")
		  Var maxVal As Double = stats.Value("max")
		  Var mean As Double = stats.Value("mean")
		  Var stdDev As Double = stats.Value("std_dev")
		  
		  // Create histogram bins
		  Var binWidth As Double = (maxVal - minVal) / bins
		  Var binCounts() As Integer
		  Var binCenters() As Double
		  
		  For i As Integer = 0 To bins - 1
		    binCounts.Add(0)
		    binCenters.Add(minVal + (i + 0.5) * binWidth)
		  Next
		  
		  // Count data in bins
		  For Each value As Double In data
		    Var binIndex As Integer = Min(bins - 1, Floor((value - minVal) / binWidth))
		    binCounts(binIndex) = binCounts(binIndex) + 1
		  Next
		  
		  // Find maximum count for scaling
		  Var maxCount As Integer = 0
		  For Each count As Integer In binCounts
		    maxCount = Max(maxCount, count)
		  Next
		  
		  // Set up coordinate system
		  Var margins As Integer = 60
		  Var plotWidth As Integer = width - 2 * margins
		  Var plotHeight As Integer = height - 2 * margins
		  Var originX As Integer = margins
		  Var originY As Integer = height - margins
		  
		  // Clear background
		  g.DrawingColor = Color.White
		  g.FillRectangle(0, 0, width, height)
		  
		  // Draw plot border
		  g.DrawingColor = Color.Black
		  g.DrawRectangle(originX, margins, plotWidth, plotHeight)
		  
		  // Draw histogram bars
		  Var barWidth As Double = plotWidth / bins
		  g.DrawingColor = Color.RGB(200, 200, 255)
		  
		  For i As Integer = 0 To bins - 1
		    Var barHeight As Integer = (binCounts(i) / maxCount) * plotHeight
		    Var x As Integer = originX + i * barWidth
		    Var y As Integer = originY - barHeight
		    
		    g.FillRectangle(x, y, barWidth - 1, barHeight)
		    g.DrawingColor = Color.Black
		    g.DrawRectangle(x, y, barWidth - 1, barHeight)
		    g.DrawingColor = Color.RGB(200, 200, 255)
		  Next
		  
		  // Draw Y-axis ticks and labels
		  g.DrawingColor = Color.Black
		  g.FontSize = 10
		  Var numTicksY As Integer = 5
		  For i As Integer = 0 To numTicksY
		    Var tickVal As Double = (maxCount * i) / numTicksY
		    Var tickY As Integer = originY - (i / numTicksY) * plotHeight
		    g.DrawLine(originX - 5, tickY, originX, tickY)
		    Var tickLabel As String = Format(tickVal, "0.0")
		    g.DrawText(tickLabel, originX - 10 - g.TextWidth(tickLabel), tickY + g.TextHeight / 2)
		  Next
		  
		  // Draw X-axis ticks and labels
		  Var labelStep As Integer = Max(1, bins / 10)
		  For i As Integer = 0 To bins - 1 Step labelStep
		    Var x As Integer = originX + i * barWidth + (barWidth / 2)
		    g.DrawLine(x, originY, x, originY + 5)
		    Var tickLabel As String = Format(binCenters(i), "0.0")
		    g.DrawText(tickLabel, x - g.TextWidth(tickLabel) / 2, originY + g.TextHeight + 2)
		  Next
		  
		  // Draw normal distribution overlay
		  g.DrawingColor = Color.Red
		  g.PenSize = 2
		  
		  Var prevX As Integer = -1
		  Var prevY As Integer = -1
		  
		  For i As Integer = 0 To plotWidth Step 2
		    Var xVal As Double = minVal + (i / plotWidth) * (maxVal - minVal)
		    Var normalY As Double = (1 / (stdDev * Sqrt(2 * Pi))) * Exp(-0.5 * ((xVal - mean) / stdDev) ^ 2)
		    Var scaledY As Double = normalY * binWidth * data.Count
		    Var plotY As Integer = originY - (scaledY / maxCount) * plotHeight
		    
		    If prevX >= 0 Then
		      g.DrawLine(originX + i - 2, prevY, originX + i, plotY)
		    End If
		    
		    prevX = originX + i
		    prevY = plotY
		  Next
		  
		  // Draw title
		  g.DrawingColor = Color.Black
		  g.FontName = "Arial"
		  g.FontSize = 14
		  Var titleWidth As Double = g.TextWidth(title)
		  g.DrawText(title, (width - titleWidth) / 2, 25)
		  
		  // Draw X-axis label
		  g.FontSize = 10
		  g.DrawText("Value", (width - g.TextWidth("Value")) / 2, height - 5)
		  
		  // Draw vertical Y-axis label: "Frequency", top to bottom
		  Var freqLabel As String = "Frequency"
		  Var freqCharHeight As Double = g.TextHeight
		  Var totalLabelHeight As Double = freqCharHeight * freqLabel.Length
		  
		  // Left of Y-axis ticks
		  Var freqX As Double = originX - 10 - g.TextWidth("100") - freqCharHeight  // adjust as needed
		  
		  // Vertically center the full label
		  Var startY As Double = margins + (plotHeight - totalLabelHeight) / 2
		  
		  // Draw one character per line
		  For i As Integer = 0 To freqLabel.Length - 1
		    Var ch As String = freqLabel.Middle(i, 1)
		    g.DrawText(ch, freqX, startY + (i * freqCharHeight))
		  Next
		  
		  
		  Return pic
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateQQPlot(data() As Double, title As String, width As Integer, height As Integer) As Picture
		  Var pic As New Picture(width, height, 32)
		  Var g As Graphics = pic.Graphics
		  
		  // Clone and sort data
		  Var sortedData() As Double = CloneDoubleArray(data)
		  sortedData.Sort
		  
		  Var n As Integer = sortedData.Count
		  Var observedQuantiles() As Double
		  Var theoreticalQuantiles() As Double
		  
		  For i As Integer = 0 To n - 1
		    Var p As Double = (i + 0.5) / n
		    Var z As Double = InverseNormalCDF(p)
		    theoreticalQuantiles.Add(z)
		    observedQuantiles.Add(sortedData(i))
		  Next
		  
		  // Compute regression line
		  Var sumX, sumY, sumXY, sumX2 As Double
		  For i As Integer = 0 To n - 1
		    sumX = sumX + theoreticalQuantiles(i)
		    sumY = sumY + observedQuantiles(i)
		    sumXY = sumXY + theoreticalQuantiles(i) * observedQuantiles(i)
		    sumX2 = sumX2 + theoreticalQuantiles(i)^2
		  Next
		  
		  Var meanX As Double = sumX / n
		  Var meanY As Double = sumY / n
		  Var slope As Double = (sumXY - n * meanX * meanY) / (sumX2 - n * meanX^2)
		  Var intercept As Double = meanY - slope * meanX
		  
		  // Define plotting region
		  Var margins As Integer = 80
		  Var plotWidth As Integer = width - 2 * margins
		  Var plotHeight As Integer = height - 2 * margins
		  Var originX As Integer = margins
		  Var originY As Integer = height - margins
		  
		  Var minVal As Double = Min(theoreticalQuantiles(0), observedQuantiles(0))
		  Var maxVal As Double = Max(theoreticalQuantiles(n-1), observedQuantiles(n-1))
		  Var pad As Double = (maxVal - minVal) * 0.05
		  minVal = minVal - pad
		  maxVal = maxVal + pad
		  
		  // Clear background
		  g.DrawingColor = Color.White
		  g.FillRectangle(0, 0, width, height)
		  
		  // Draw axes
		  g.DrawingColor = Color.Black
		  g.DrawLine(originX, margins, originX, height - margins)
		  g.DrawLine(originX, originY, width - margins, originY)
		  
		  // Axis ticks
		  g.FontSize = 10
		  For i As Integer = 0 To 5
		    Var f As Double = i / 5
		    Var tickVal As Double = minVal + f * (maxVal - minVal)
		    Var xTick As Integer = originX + f * plotWidth
		    Var yTick As Integer = originY - f * plotHeight
		    
		    g.DrawLine(xTick, originY, xTick, originY + 5)
		    g.DrawText(Format(tickVal, "0.00"), xTick - g.TextWidth(Format(tickVal, "0.00")) / 2, originY + 20)
		    
		    g.DrawLine(originX - 5, yTick, originX, yTick)
		    g.DrawText(Format(tickVal, "0.00"), originX - 10 - g.TextWidth(Format(tickVal, "0.00")), yTick + g.TextHeight / 2)
		  Next
		  
		  // Vertical label
		  Var yAxisLabel As String = "Observed Quantiles"
		  For i As Integer = 0 To yAxisLabel.Length - 1
		    Var ch As String = yAxisLabel.Middle(i, 1)
		    Var x As Double = 15
		    Var y As Double = margins + ((plotHeight - (yAxisLabel.Length * g.TextHeight)) / 2) + (i * g.TextHeight)
		    g.DrawText(ch, x, y)
		  Next
		  
		  g.DrawText("Theoretical Quantiles", (width - g.TextWidth("Theoretical Quantiles")) / 2, height - 10)
		  
		  // Estimate error
		  Var se As Double = (maxVal - minVal) * 0.015
		  
		  // Draw regression line
		  g.DrawingColor = Color.Red
		  g.PenSize = 2
		  Var px1 As Integer = originX + ((minVal - minVal) / (maxVal - minVal)) * plotWidth
		  Var py1 As Integer = originY - ((intercept + slope * minVal - minVal) / (maxVal - minVal)) * plotHeight
		  Var px2 As Integer = originX + ((maxVal - minVal) / (maxVal - minVal)) * plotWidth
		  Var py2 As Integer = originY - ((intercept + slope * maxVal - minVal) / (maxVal - minVal)) * plotHeight
		  g.DrawLine(px1, py1, px2, py2)
		  
		  // Draw points and check for outliers
		  Var outlierCount As Integer = 0
		  Var maxDeviation As Double = 0
		  g.PenSize = 1
		  For i As Integer = 0 To n - 1
		    Var xVal As Double = theoreticalQuantiles(i)
		    Var yVal As Double = observedQuantiles(i)
		    Var yHat As Double = intercept + slope * xVal
		    Var residual As Double = Abs(yVal - yHat)
		    Var deviation As Double = residual / se
		    If deviation > 1.96 Then outlierCount = outlierCount + 1
		    If deviation > maxDeviation Then maxDeviation = deviation
		    
		    Var x As Integer = originX + ((xVal - minVal) / (maxVal - minVal)) * plotWidth
		    Var y As Integer = originY - ((yVal - minVal) / (maxVal - minVal)) * plotHeight
		    g.DrawingColor = If(deviation > 1.96, Color.Orange, Color.Blue)
		    g.FillOval(x - 2, y - 2, 4, 4)
		  Next
		  
		  // Display interpretation
		  Var rSquared As Double = CalculateRSquared(theoreticalQuantiles, observedQuantiles, slope, intercept)
		  Var normalityText As String
		  Var interpretationColor As Color
		  If rSquared > 0.95 And outlierCount <= (n * 0.05) And maxDeviation < 3.0 Then
		    normalityText = "NORMAL: Data appears normally distributed"
		    interpretationColor = Color.Green
		  ElseIf rSquared > 0.90 And outlierCount <= (n * 0.10) Then
		    normalityText = "ACCEPTABLE: Minor deviations from normality"
		    interpretationColor = Color.Purple
		  Else
		    normalityText = "NON-NORMAL: Significant deviations detected"
		    interpretationColor = Color.Red
		  End If
		  
		  g.FontSize = 12
		  g.DrawingColor = interpretationColor
		  g.DrawText(normalityText, margins, height - 50)
		  
		  Var statsText As String = "R² = " + Format(rSquared, "0.000") + " | Outliers: " + Str(outlierCount) + "/" + Str(n) + " (" + Format((outlierCount/n)*100, "0.0") + "%)"
		  g.FontSize = 10
		  g.DrawingColor = Color.Black
		  g.DrawText(statsText, margins, height - 30)
		  
		  // Add heteroscedasticity info
		  Var heteroText As String = AssessHeteroscedasticity(theoreticalQuantiles, observedQuantiles, slope, intercept, se)
		  g.DrawText(heteroText, margins, height - 15)
		  
		  // Title
		  g.FontSize = 16
		  Var titleWidth As Double = g.TextWidth(title)
		  g.DrawText(title, (width - titleWidth) / 2, 30)
		  
		  Return pic
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateScatterPlot(xData() as Double, yData() as Double, width as Integer, height as Integer, showRegression as Boolean = True, title as String, xLabel as String, yLabel as String) As Picture
		  'Public Function CreateScatterPlot( _
		  'xData()        As Double,  _
		  'yData()        As Double,  _
		  'width          As Integer, _
		  'height         As Integer, _
		  'showRegression As Boolean, _
		  'title          As String,  _
		  'xLabel         As String,  _
		  'yLabel         As String  _
		  ') As Picture
		  
		  If xData.Count <> yData.Count Then
		    Return CreateErrorPlot("X and Y data must have the same length", width, height)
		  End If
		  
		  Var pic As New Picture(width, height, 32)
		  Var g As Graphics = pic.Graphics
		  
		  Var regression As Dictionary
		  If showRegression Then
		    regression = LinearRegression(xData, yData)
		  End If
		  
		  Var margin As Integer = 60
		  Var plotWidth As Integer = width - 2 * margin
		  Var plotHeight As Integer = height - 2 * margin
		  
		  Var minX As Double = xData(0)
		  Var maxX As Double = xData(0)
		  Var minY As Double = yData(0)
		  Var maxY As Double = yData(0)
		  
		  For i As Integer = 0 To xData.LastIndex
		    minX = Min(minX, xData(i))
		    maxX = Max(maxX, xData(i))
		    minY = Min(minY, yData(i))
		    maxY = Max(maxY, yData(i))
		  Next
		  
		  Var rangeX As Double = maxX - minX
		  Var rangeY As Double = maxY - minY
		  If rangeX = 0 Then rangeX = 1.0
		  If rangeY = 0 Then rangeY = 1.0
		  minX = minX - 0.1 * rangeX
		  maxX = maxX + 0.1 * rangeX
		  minY = minY - 0.1 * rangeY
		  maxY = maxY + 0.1 * rangeY
		  
		  g.ForeColor = &cFFFFFF
		  g.FillRectangle(0, 0, width, height)
		  
		  g.ForeColor = &c000000
		  g.DrawRectangle(margin, margin, plotWidth, plotHeight)
		  
		  ' Draw X and Y axis ticks
		  g.TextFont = "Arial"
		  g.TextSize = 10
		  g.ForeColor = &c000000
		  
		  Const numTicks As Integer = 5
		  
		  ' X axis ticks
		  For i As Integer = 0 To numTicks
		    Var normX As Double = i / numTicks
		    Var x As Integer = margin + normX * plotWidth
		    Var xVal As Double = minX + normX * (maxX - minX)
		    g.DrawLine(x, margin + plotHeight, x, margin + plotHeight + 5)
		    Var label As String = Format(xVal, "0.###")
		    g.DrawText(label, x - g.TextWidth(label) / 2, margin + plotHeight + 20)
		  Next
		  
		  ' Y axis ticks
		  For i As Integer = 0 To numTicks
		    Var normY As Double = i / numTicks
		    Var y As Integer = margin + plotHeight - normY * plotHeight
		    Var yVal As Double = minY + normY * (maxY - minY)
		    g.DrawLine(margin - 5, y, margin, y)
		    Var label As String = Format(yVal, "0.###")
		    g.DrawText(label, margin - g.TextWidth(label) - 8, y + 4)
		  Next
		  
		  ' Grid
		  g.ForeColor = Color.RGB(220, 220, 220)
		  For i As Integer = 1 To 9
		    Var gx As Integer = margin + i * plotWidth / 10
		    Var gy As Integer = margin + i * plotHeight / 10
		    g.DrawLine(gx, margin, gx, margin + plotHeight)
		    g.DrawLine(margin, gy, margin + plotWidth, gy)
		  Next
		  
		  ' Regression line
		  If showRegression And Not regression.HasKey("error") Then
		    g.ForeColor = &cFF0000
		    g.PenWidth = 2
		    
		    Var slope As Double = regression.Value("slope")
		    Var intercept As Double = regression.Value("intercept")
		    
		    Var y1Val As Double = slope * minX + intercept
		    Var y2Val As Double = slope * maxX + intercept
		    
		    Var x1 As Integer = margin
		    Var x2 As Integer = margin + plotWidth
		    Var y1 As Integer = margin + plotHeight - ((y1Val - minY) / (maxY - minY)) * plotHeight
		    Var y2 As Integer = margin + plotHeight - ((y2Val - minY) / (maxY - minY)) * plotHeight
		    
		    g.DrawLine(x1, y1, x2, y2)
		  End If
		  
		  ' Data points
		  g.ForeColor = &c0000FF
		  g.PenWidth = 1
		  
		  For i As Integer = 0 To xData.LastIndex
		    Var px As Integer = margin + ((xData(i) - minX) / (maxX - minX)) * plotWidth
		    Var py As Integer = margin + plotHeight - ((yData(i) - minY) / (maxY - minY)) * plotHeight
		    g.FillOval(px - 3, py - 3, 6, 6)
		  Next
		  
		  ' Titles
		  g.TextFont = "Arial"
		  g.TextSize = 14
		  Var titleWidth As Integer = g.TextWidth(title)
		  g.ForeColor = &c000000
		  g.DrawText(title, (width - titleWidth) / 2, 20)
		  
		  ' Regression equation
		  If showRegression And Not regression.HasKey("error") Then
		    g.TextSize = 12
		    Var slope As Double = regression.Value("slope")
		    Var intercept As Double = regression.Value("intercept")
		    Var equation As String = "y = " + Format(slope, "0.000") + "x + " + Format(intercept, "0.000")
		    Var eqWidth As Integer = g.TextWidth(equation)
		    g.DrawText(equation, (width - eqWidth) / 2, 40)
		  End If
		  
		  ' X label
		  g.TextSize = 10
		  g.DrawText(xLabel, (width - g.TextWidth(xLabel)) / 2, height - 10)
		  
		  ' Draw vertical Y-axis label (character by character, rotated manually)
		  Var labelX As Integer = margin - 40
		  Var labelY As Integer = margin + plotHeight / 2 - (yLabel.Length * g.TextHeight / 2)
		  
		  For i As Integer = 0 To yLabel.Length - 1
		    Var ch As String = yLabel.Mid(i + 1, 1)
		    g.DrawText(ch, labelX, labelY + i * g.TextHeight)
		  Next
		  
		  ' Regression stats block
		  If showRegression And Not regression.HasKey("error") Then
		    g.TextSize = 10
		    Var r As Double = regression.Value("correlation")
		    Var r2 As Double = r * r
		    Var pVal As Double = regression.Value("p_value")
		    Var statsText As String = "R² = " + Format(r2, "0.000") + EndOfLine + _
		    "r  = " + Format(r, "0.000") + EndOfLine + _
		    "p  = " + Format(pVal, "0.000")
		    g.DrawText(statsText, margin + 10, margin + 20)
		  End If
		  
		  Return pic
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DescriptiveStatistics(data() As Double) As Dictionary
		  // Function DescriptiveStatistics(data() As Double) As Dictionary
		  Var result As New Dictionary
		  Var n As Integer = data.Count
		  
		  If n = 0 Then
		    result.Value("error") = "No data provided"
		    Return result
		  End If
		  
		  ' Sort data
		  Var sortedData() As Double = CloneDoubleArray(data)
		  sortedData.Sort
		  
		  ' Basic stats
		  Var sum As Double = 0
		  Var sumSquares As Double = 0
		  For Each value As Double In data
		    sum = sum + value
		    sumSquares = sumSquares + value * value
		  Next
		  
		  Var mean As Double = sum / n
		  Var variance As Double = (sumSquares - n * mean * mean) / (n - 1)
		  Var stdDev As Double = Sqrt(variance)
		  
		  ' Median
		  Var median As Double
		  If n Mod 2 = 0 Then
		    median = (sortedData(n \ 2 - 1) + sortedData(n \ 2)) / 2
		  Else
		    median = sortedData(n \ 2)
		  End If
		  
		  ' Quartiles
		  Var q1 As Double = Quartile(sortedData, 1)
		  Var q3 As Double = Quartile(sortedData, 3)
		  Var iqr As Double = q3 - q1
		  
		  ' Skewness and Kurtosis
		  Var skewness As Double = 0
		  Var kurtosis As Double = 0
		  For Each value As Double In data
		    Var deviation As Double = value - mean
		    skewness = skewness + (deviation / stdDev) ^ 3
		    kurtosis = kurtosis + (deviation / stdDev) ^ 4
		  Next
		  skewness = skewness / n
		  kurtosis = (kurtosis / n) - 3 ' Excess kurtosis
		  
		  ' SEM and t-based CI
		  Var sem As Double = stdDev / Sqrt(n)
		  Var tVal As Double = TValue95(n)
		  Var ciLower As Double = mean - tVal * sem
		  Var ciUpper As Double = mean + tVal * sem
		  Var ciWidth As Double = ciUpper - ciLower
		  
		  ' Bootstrap CIs
		  Var bootMeanCI As Dictionary = BootstrapCI(data)
		  Var bootMedCI As Dictionary = BootstrapMedianCI(data)
		  
		  ' Populate result dictionary
		  result.Value("n") = n
		  result.Value("mean") = FormatToTwoDecimals(mean)
		  result.Value("median") =  FormatToTwoDecimals(median)
		  result.Value("std_dev") =  FormatToTwoDecimals(stdDev)
		  result.Value("variance") =  FormatToTwoDecimals(variance)
		  result.Value("min") =  FormatToTwoDecimals(sortedData(0))
		  result.Value("max") =  FormatToTwoDecimals(sortedData(n - 1))
		  result.Value("range") =  FormatToTwoDecimals(sortedData(n - 1) - sortedData(0))
		  result.Value("q1") =  FormatToTwoDecimals(q1)
		  result.Value("q3") = FormatToTwoDecimals( q3)
		  result.Value("iqr") = FormatToTwoDecimals(iqr)
		  result.Value("skewness") =  FormatToTwoDecimals(skewness)
		  result.Value("kurtosis") =  FormatToTwoDecimals(kurtosis)
		  result.Value("sem") =  FormatToTwoDecimals(sem)
		  result.Value("ci_95_lower") =  FormatToTwoDecimals(ciLower)
		  result.Value("ci_95_upper") =  FormatToTwoDecimals(ciUpper)
		  result.Value("ci_95_width") =  FormatToTwoDecimals(ciWidth)
		  
		  If Not bootMeanCI.HasKey("error") Then
		    Var lower As Double = bootMeanCI.Value("lower")
		    Var upper As Double = bootMeanCI.Value("upper")
		    result.Value("bootstrap_mean_ci_lower") =  FormatToTwoDecimals(lower)
		    result.Value("bootstrap_mean_ci_upper") = FormatToTwoDecimals( upper)
		    result.Value("bootstrap_mean_ci_width") =  FormatToTwoDecimals(upper - lower)
		  End If
		  
		  If Not bootMedCI.HasKey("error") Then
		    Var lower As Double = bootMedCI.Value("lower")
		    Var upper As Double = bootMedCI.Value("upper")
		    result.Value("bootstrap_median_ci_lower") =  FormatToTwoDecimals(lower)
		    result.Value("bootstrap_median_ci_upper") =  FormatToTwoDecimals(upper)
		    result.Value("bootstrap_median_ci_width") =  FormatToTwoDecimals(upper - lower)
		  End If
		  
		  Return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawDashedLine(g as Graphics, x1 as Integer, y1 as Integer, x2 as Integer, y2 as Integer, dashlength as integer)
		  // Helper method to draw dashed lines manually
		  // Private Sub DrawDashedLine(g As Graphics, x1 As Integer, y1 As Integer, x2 As Integer, y2 As Integer, dashLength As Integer)
		  Var dx As Double = x2 - x1
		  Var dy As Double = y2 - y1
		  Var distance As Double = Sqrt(dx * dx + dy * dy)
		  
		  If distance = 0 Then Return  // Prevent division by zero
		  
		  Var currentDistance As Double = 0
		  Var drawDash As Boolean = True
		  
		  While currentDistance < distance
		    Var remainingDistance As Double = distance - currentDistance
		    Var segmentLength As Double = Min(dashLength, remainingDistance)
		    
		    If drawDash Then
		      Var t1 As Double = currentDistance / distance
		      Var t2 As Double = (currentDistance + segmentLength) / distance
		      
		      Var startX As Integer = x1 + dx * t1
		      Var startY As Integer = y1 + dy * t1
		      Var endX As Integer = x1 + dx * t2
		      Var endY As Integer = y1 + dy * t2
		      
		      g.DrawLine(startX, startY, endX, endY)
		    End If
		    
		    currentDistance = currentDistance + segmentLength
		    drawDash = Not drawDash
		  Wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawDashedLine1(g as Graphics, x1 as Integer, y1 as Integer, x2 as Integer, y2 as Integer, dashlength as integer)
		  // Helper method to draw dashed lines manually
		  // Private Sub DrawDashedLine(g As Graphics, x1 As Integer, y1 As Integer, x2 As Integer, y2 As Integer, dashLength As Integer)
		  Var dx As Double = x2 - x1
		  Var dy As Double = y2 - y1
		  Var distance As Double = Sqrt(dx * dx + dy * dy)
		  
		  If distance = 0 Then Return  // Prevent division by zero
		  
		  Var currentDistance As Double = 0
		  Var drawDash As Boolean = True
		  
		  While currentDistance < distance
		    Var remainingDistance As Double = distance - currentDistance
		    Var segmentLength As Double = Min(dashLength, remainingDistance)
		    
		    If drawDash Then
		      Var t1 As Double = currentDistance / distance
		      Var t2 As Double = (currentDistance + segmentLength) / distance
		      
		      Var startX As Integer = x1 + dx * t1
		      Var startY As Integer = y1 + dy * t1
		      Var endX As Integer = x1 + dx * t2
		      Var endY As Integer = y1 + dy * t2
		      
		      g.DrawLine(startX, startY, endX, endY)
		    End If
		    
		    currentDistance = currentDistance + segmentLength
		    drawDash = Not drawDash
		  Wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawDashedRectangle(g As Graphics, x As Integer, y As Integer, width As Integer, height As Integer, dashLength As Integer)
		  //Private Sub DrawDashedRectangle(g As Graphics, x As Integer, y As Integer, width As Integer, height As Integer, dashLength As Integer)
		  // Top line
		  DrawDashedLine(g, x, y, x + width, y, dashLength)
		  // Right line
		  DrawDashedLine(g, x + width, y, x + width, y + height, dashLength)
		  // Bottom line
		  DrawDashedLine(g, x + width, y + height, x, y + height, dashLength)
		  // Left line
		  DrawDashedLine(g, x, y + height, x, y, dashLength)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Factorial(n As Integer) As Double
		  // Public Function Factorial(n As Integer) As Double
		  If n < 0 Then Return 1
		  Var result As Double = 1
		  For i As Integer = 2 To n
		    result = result * i
		  Next
		  Return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FormatToTwoDecimals(value As Double) As String
		  Return Format(value, "##0.00")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InverseNormalCDF(p As Double) As Double
		  //Function InverseNormalCDF(p As Double) As Double
		  If p <= 0 Or p >= 1 Then
		    Return 0 // Avoid domain errors
		  End If
		  
		  // Coefficients for rational approximations
		  Var a() As Double = Array(2.50662823884, -18.61500062529, 41.39119773534, -25.44106049637)
		  Var b() As Double = Array(-8.47351093090, 23.08336743743, -21.06224101826, 3.13082909833)
		  Var c() As Double = Array(0.3374754822726147, 0.9761690190917186, 0.1607979714918209, 0.0276438810333863, _
		  0.0038405729373609, 0.0003951896511919, 0.0000321767881768, 0.0000002888167364, 0.0000003960315187)
		  
		  Var x As Double = p - 0.5
		  Var r As Double
		  
		  If Abs(x) < 0.42 Then
		    r = x * x
		    Return x * (((a(3) * r + a(2)) * r + a(1)) * r + a(0)) / ((((b(3) * r + b(2)) * r + b(1)) * r + b(0)) * r + 1.0)
		  Else
		    If x < 0 Then
		      r = p
		    Else
		      r = 1 - p
		    End If
		    
		    r = Log(-Log(r))
		    Var result As Double = c(0)
		    For i As Integer = 1 To 8
		      result = result + c(i) * r^i
		    Next
		    
		    If x < 0 Then
		      Return -result
		    Else
		      Return result
		    End If
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LinearRegression(xData() As Double, yData() As Double) As Dictionary
		  // Perform linear regression analysis
		  
		  Var result As New Dictionary
		  
		  If xData.Count <> yData.Count Then
		    result.Value("error") = "X and Y data must have the same length"
		    Return result
		  End If
		  
		  Var n As Integer = xData.Count
		  
		  If n < 2 Then
		    result.Value("error") = "Need at least 2 data points for regression"
		    Return result
		  End If
		  
		  // Calculate sums
		  Var sumX As Double = 0
		  Var sumY As Double = 0
		  Var sumXY As Double = 0
		  Var sumX2 As Double = 0
		  Var sumY2 As Double = 0
		  
		  For i As Integer = 0 To n - 1
		    sumX = sumX + xData(i)
		    sumY = sumY + yData(i)
		    sumXY = sumXY + xData(i) * yData(i)
		    sumX2 = sumX2 + xData(i) * xData(i)
		    sumY2 = sumY2 + yData(i) * yData(i)
		  Next
		  
		  // Calculate slope and intercept
		  Var denominator As Double = n * sumX2 - sumX * sumX
		  
		  If Abs(denominator) < 1e-10 Then
		    result.Value("error") = "Cannot perform regression - X values are constant"
		    Return result
		  End If
		  
		  Var slope As Double = (n * sumXY - sumX * sumY) / denominator
		  Var intercept As Double = (sumY - slope * sumX) / n
		  
		  // Calculate correlation coefficient
		  Var numerator As Double = n * sumXY - sumX * sumY
		  Var denomX As Double = Sqrt(n * sumX2 - sumX * sumX)
		  Var denomY As Double = Sqrt(n * sumY2 - sumY * sumY)
		  
		  Var correlation As Double = 0
		  If denomX > 0 And denomY > 0 Then
		    correlation = numerator / (denomX * denomY)
		  End If
		  
		  // Calculate residuals and statistics
		  Var residuals() As Double
		  Var sse As Double = 0 // Sum of squared errors
		  Var meanY As Double = sumY / n
		  Var sst As Double = 0 // Total sum of squares
		  
		  For i As Integer = 0 To n - 1
		    Var predicted As Double = slope * xData(i) + intercept
		    Var residual As Double = yData(i) - predicted
		    residuals.Add(residual)
		    sse = sse + residual * residual
		    sst = sst + (yData(i) - meanY) * (yData(i) - meanY)
		  Next
		  
		  // R-squared
		  Var rSquared As Double = 1 - (sse / sst)
		  
		  // Standard error of regression
		  Var standardError As Double = Sqrt(sse / (n - 2))
		  
		  // T-statistic and p-value for slope
		  Var seSlope As Double = standardError / Sqrt(sumX2 - sumX * sumX / n)
		  Var tStat As Double = slope / seSlope
		  Var pValue As Double = 2 * (1 - TDistributionCDF(Abs(tStat), n - 2))
		  
		  // Populate result
		  result.Value("slope") = slope
		  result.Value("intercept") = intercept
		  result.Value("correlation") = correlation
		  result.Value("r_squared") = rSquared
		  result.Value("standard_error") = standardError
		  result.Value("t_statistic") = tStat
		  result.Value("p_value") = pValue
		  result.Value("degrees_freedom") = n - 2
		  result.Value("residuals") = residuals
		  result.Value("n") = n
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NormalCDF(z As Double) As Double
		  // Approximation of normal cumulative distribution function
		  
		  If z < 0 Then
		    Return 1 - NormalCDF(-z)
		  End If
		  
		  // Abramowitz and Stegun approximation
		  Var a1 As Double = 0.254829592
		  Var a2 As Double = -0.284496736
		  Var a3 As Double = 1.421413741
		  Var a4 As Double = -1.453152027
		  Var a5 As Double = 1.061405429
		  Var p As Double = 0.3275911
		  
		  Var t As Double = 1.0 / (1.0 + p * z)
		  Var y As Double = 1.0 - (((((a5 * t + a4) * t) + a3) * t + a2) * t + a1) * t * Exp(-z * z)
		  
		  Return y
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NormalPDF(x As Double, mean As Double, stddev As Double) As Double
		  // Public Function NormalPDF(x As Double, mean As Double, stddev As Double) As Double
		  If stddev = 0 Then Return 0
		  Var coeff As Double = 1 / (stddev * Sqrt(2 * Pi))
		  Var exponent As Double = -((x - mean)^2) / (2 * stddev^2)
		  Return coeff * Exp(exponent)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OneSampleTTest(data() As Double, mu0 As Double, alpha As Double = 0.05) As Dictionary
		  // One-sample t-test
		  
		  Var result As New Dictionary
		  Var n As Integer = data.Count
		  
		  If n < 2 Then
		    result.Value("error") = "Need at least 2 observations for t-test"
		    Return result
		  End If
		  
		  // Calculate statistics
		  Var stats As Dictionary = DescriptiveStatistics(data)
		  Var mean As Double = stats.Value("mean")
		  Var stdDev As Double = stats.Value("std_dev")
		  Var se As Double = stdDev / Sqrt(n)
		  
		  // Calculate t-statistic
		  Var tStat As Double = (mean - mu0) / se
		  
		  // Degrees of freedom
		  Var df As Integer = n - 1
		  
		  // Calculate p-value (two-tailed)
		  Var pValue As Double = 2 * (1 - TDistributionCDF(Abs(tStat), df))
		  
		  // Confidence interval
		  Var tCritical As Double = TDistributionInverse(1 - alpha/2, df)
		  Var marginError As Double = tCritical * se
		  Var ciLower As Double = mean - marginError
		  Var ciUpper As Double = mean + marginError
		  
		  // Populate result
		  result.Value("sample_mean") = mean
		  result.Value("hypothesized_mean") = mu0
		  result.Value("t_statistic") = tStat
		  result.Value("p_value") = pValue
		  result.Value("degrees_freedom") = df
		  result.Value("standard_error") = se
		  result.Value("confidence_interval_lower") = ciLower
		  result.Value("confidence_interval_upper") = ciUpper
		  result.Value("confidence_level") = (1 - alpha) * 100
		  result.Value("is_significant") = pValue < alpha
		  result.Value("n") = n
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PairedTTest(data1() As Double, data2() As Double, alpha As Double = 0.05) As Dictionary
		  // Paired t-test
		  
		  Var result As New Dictionary
		  
		  If data1.Count <> data2.Count Then
		    result.Value("error") = "Data arrays must have the same length"
		    Return result
		  End If
		  
		  Var n As Integer = data1.Count
		  
		  If n < 2 Then
		    result.Value("error") = "Need at least 2 pairs for paired t-test"
		    Return result
		  End If
		  
		  // Calculate differences
		  Var differences() As Double
		  For i As Integer = 0 To n - 1
		    differences.Add(data1(i) - data2(i))
		  Next
		  
		  // Perform one-sample t-test on differences
		  Var tTestResult As Dictionary = OneSampleTTest(differences, 0, alpha)
		  
		  // Modify result for paired test interpretation
		  result.Value("mean_difference") = tTestResult.Value("sample_mean")
		  result.Value("t_statistic") = tTestResult.Value("t_statistic")
		  result.Value("p_value") = tTestResult.Value("p_value")
		  result.Value("degrees_freedom") = tTestResult.Value("degrees_freedom")
		  result.Value("standard_error") = tTestResult.Value("standard_error")
		  result.Value("confidence_interval_lower") = tTestResult.Value("confidence_interval_lower")
		  result.Value("confidence_interval_upper") = tTestResult.Value("confidence_interval_upper")
		  result.Value("confidence_level") = tTestResult.Value("confidence_level")
		  result.Value("is_significant") = tTestResult.Value("is_significant")
		  result.Value("n") = n
		  result.Value("test_type") = "Paired t-test"
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PoissonPDF(k As Integer, lambda As Double) As Double
		  // Public Function PoissonPDF(k As Integer, lambda As Double) As Double
		  If k < 0 Or lambda <= 0 Then Return 0
		  Return (Exp(-lambda) * lambda^k) / Factorial(k)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Quartile(sortedData() As Double, q As Integer) As Double
		  // Calculate quartile (q = 1, 2, or 3)
		  
		  Var n As Integer = sortedData.Count
		  
		  If q = 2 Then
		    // Median
		    If n Mod 2 = 0 Then
		      Return (sortedData(n / 2 - 1) + sortedData(n / 2)) / 2
		    Else
		      Return sortedData(n / 2)
		    End If
		  End If
		  
		  // First or third quartile
		  Var pos As Double = q * (n + 1) / 4.0
		  Var lower As Integer = Floor(pos) - 1
		  Var upper As Integer = Ceil(pos) - 1
		  
		  If lower < 0 Then lower = 0
		  If upper >= n Then upper = n - 1
		  
		  If lower = upper Then
		    Return sortedData(lower)
		  Else
		    Var fraction As Double = pos - Floor(pos)
		    Return sortedData(lower) + fraction * (sortedData(upper) - sortedData(lower))
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StandardDeviation(data() As Double) As Double
		  // Public Function StandardDeviation(data() As Double) As Double
		  Var avg As Double = Average(data)
		  Var sumSquares As Double
		  For Each d As Double In data
		    sumSquares = sumSquares + (d - avg) ^ 2
		  Next
		  Return Sqrt(sumSquares / (data.Count - 1))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TDistributionCDF(t As Double, df As Integer) As Double
		  // Approximation of t-distribution CDF
		  
		  If df <= 0 Then
		    Return 0.5
		  End If
		  
		  If df = 1 Then
		    // Cauchy distribution
		    Return 0.5 + (1 / Pi) * Atan(t)
		  End If
		  
		  If df = 2 Then
		    Return 0.5 + t / (2 * Sqrt(2 + t * t))
		  End If
		  
		  // For larger df, use normal approximation
		  If df > 30 Then
		    Return NormalCDF(t)
		  End If
		  
		  // Hill's approximation for intermediate df
		  Var a As Double = 4 * df - 1
		  Var b As Double = 4 * df + t * t - 1
		  Var z As Double = t * Sqrt(a / b)
		  
		  Return NormalCDF(z)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TDistributionInverse(p As Double, df As Integer) As Double
		  // Approximation of inverse t-distribution
		  
		  If p <= 0 Or p >= 1 Then
		    Return 0
		  End If
		  
		  If df <= 0 Then
		    Return 0
		  End If
		  
		  If df = 1 Then
		    // Cauchy distribution
		    Return Tan(Pi * (p - 0.5))
		  End If
		  
		  If df = 2 Then
		    Return 2 * (p - 0.5) / Sqrt(2 * p * (1 - p))
		  End If
		  
		  // For larger df, use normal approximation with correction
		  If df > 30 Then
		    Return InverseNormalCDF(p)
		  End If
		  
		  // Hill's approximation
		  Var z As Double = InverseNormalCDF(p)
		  Var correction As Double = z * z * z / (4 * df)
		  
		  Return z + correction
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TValue95(n As Integer) As Double
		  //Function TValue95(n As Integer) As Double
		  If n <= 1 Then Return 0
		  
		  Select Case n
		  Case 2 To 30
		    Var tValues() As Double = Array(12.706, 4.303, 3.182, 2.776, 2.571, 2.447, 2.365, 2.306, 2.262, 2.228, _
		    2.201, 2.179, 2.160, 2.145, 2.131, 2.120, 2.110, 2.101, 2.093, 2.086, _
		    2.080, 2.074, 2.069, 2.064, 2.060, 2.056, 2.052, 2.048, 2.045)
		    Return tValues(n - 2)
		  Else
		    Return 1.96
		  End Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TwoSampleTTest(data1() As Double, data2() As Double, equalVariances As Boolean = True, alpha As Double = 0.05) As Dictionary
		  // Two-sample t-test
		  
		  Var result As New Dictionary
		  Var n1 As Integer = data1.Count
		  Var n2 As Integer = data2.Count
		  
		  If n1 < 2 Or n2 < 2 Then
		    result.Value("error") = "Need at least 2 observations in each group"
		    Return result
		  End If
		  
		  // Calculate statistics for both groups
		  Var stats1 As Dictionary = DescriptiveStatistics(data1)
		  Var stats2 As Dictionary = DescriptiveStatistics(data2)
		  
		  Var mean1 As Double = stats1.Value("mean")
		  Var mean2 As Double = stats2.Value("mean")
		  Var var1 As Double = stats1.Value("variance")
		  Var var2 As Double = stats2.Value("variance")
		  
		  Var tStat As Double
		  Var df As Integer
		  Var se As Double
		  
		  If equalVariances Then
		    // Pooled variance t-test
		    Var pooledVar As Double = ((n1 - 1) * var1 + (n2 - 1) * var2) / (n1 + n2 - 2)
		    se = Sqrt(pooledVar * (1.0/n1 + 1.0/n2))
		    df = n1 + n2 - 2
		  Else
		    // Welch's t-test (unequal variances)
		    se = Sqrt(var1/n1 + var2/n2)
		    Var numerator As Double = (var1/n1 + var2/n2) * (var1/n1 + var2/n2)
		    Var denominator As Double = (var1/n1) * (var1/n1) / (n1 - 1) + (var2/n2) * (var2/n2) / (n2 - 1)
		    df = numerator / denominator
		  End If
		  
		  tStat = (mean1 - mean2) / se
		  
		  // Calculate p-value (two-tailed)
		  Var pValue As Double = 2 * (1 - TDistributionCDF(Abs(tStat), df))
		  
		  // Confidence interval for difference
		  Var tCritical As Double = TDistributionInverse(1 - alpha/2, df)
		  Var marginError As Double = tCritical * se
		  Var diffMean As Double = mean1 - mean2
		  Var ciLower As Double = diffMean - marginError
		  Var ciUpper As Double = diffMean + marginError
		  
		  // Populate result
		  result.Value("mean1") = mean1
		  result.Value("mean2") = mean2
		  result.Value("mean_difference") = diffMean
		  result.Value("t_statistic") = tStat
		  result.Value("p_value") = pValue
		  result.Value("degrees_freedom") = df
		  result.Value("standard_error") = se
		  result.Value("confidence_interval_lower") = ciLower
		  result.Value("confidence_interval_upper") = ciUpper
		  result.Value("confidence_level") = (1 - alpha) * 100
		  result.Value("is_significant") = pValue < alpha
		  result.Value("n1") = n1
		  result.Value("n2") = n2
		  result.Value("equal_variances") = equalVariances
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ValueToYCoordinate(value As Double, minVal As Double, maxVal As Double, margins As Integer, plotHeight As Integer) As Integer
		  // Private Function ValueToYCoordinate(value As Double, minVal As Double, maxVal As Double, margins As Integer, plotHeight As Integer) As Integer
		  Return margins + plotHeight - ((value - minVal) / (maxVal - minVal)) * plotHeight
		  
		End Function
	#tag EndMethod


	#tag Note, Name = Main Function (CreateDualBoxPlot):  Creates side-by-side box plots for comparing two datasets Ensures both plots use the same y-axis scale for fair comparison Draws a connecting line between the medians of both plots Displays the median difference at the bottom  Helper Function (CreateBoxPlotWithScale):  Creates individual box plots with custom scaling Implements the standard box plot components:  Box representing the interquartile range (Q1 to Q3) Median line within the box Whiskers extending to the furthest non-outlier values Outliers plotted as red circles Statistical summary text    Key Features:  Uses the 1.5 × IQR rule for outlier detection Consistent scaling across both plots for meaningful comparison Visual connection between medians to highlight differences Comprehensive statistical information displayed  The code includes proper error handling for edge cases and follows standard statistical visualization practices for box plots.RetryClaude can make mistakes. Please double-check responses.
		CreateDualBoxPlot:
		
		Creates side-by-side box plots for comparing two datasets
		Ensures both plots use the same y-axis scale for fair comparison
		Draws a connecting line between the medians of both plots
		Displays the median difference at the bottom
		
		Helper Function (CreateBoxPlotWithScale):
		
		Creates individual box plots with custom scaling
		Implements the standard box plot components:
		
		Box representing the interquartile range (Q1 to Q3)
		Median line within the box
		Whiskers extending to the furthest non-outlier values
		Outliers plotted as red circles
		Statistical summary text
		
		
		
		Key Features:
		
		Uses the 1.5 × IQR rule for outlier detection
		Consistent scaling across both plots for meaningful comparison
		Visual connection between medians to highlight differences
		Comprehensive statistical information displayed
		
		The code includes proper error handling for edge cases and follows standard statistical visualization practices for box plots.RetryClaude can make mistakes. Please double-check responses.
	#tag EndNote


	#tag Constant, Name = Pi, Type = Double, Dynamic = False, Default = \"3.14159265358979323846", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
