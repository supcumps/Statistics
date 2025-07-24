#tag DesktopWindow
Begin DesktopWindow DualHeaderWindow
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF
   Composite       =   False
   DefaultLocation =   2
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   HasTitleBar     =   True
   Height          =   688
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   ""
   MenuBarVisible  =   False
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   True
   Title           =   "Statistical Analysis Demonstration"
   Type            =   0
   Visible         =   True
   Width           =   816
   Begin DesktopBevelButton TwoBoxplotsBevelButton
      Active          =   False
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowTabStop    =   True
      BackgroundColor =   &c00000000
      BevelStyle      =   0
      Bold            =   False
      ButtonStyle     =   0
      Caption         =   "Compare two boxplots"
      CaptionAlignment=   3
      CaptionDelta    =   0
      CaptionPosition =   1
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      HasBackgroundColor=   False
      Height          =   22
      Icon            =   0
      IconAlignment   =   0
      IconDeltaX      =   0
      IconDeltaY      =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   7
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuStyle       =   0
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   258
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   160
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
   Begin DesktopBevelButton BA_BevelButton
      Active          =   False
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowTabStop    =   True
      BackgroundColor =   &c00000000
      BevelStyle      =   0
      Bold            =   False
      ButtonStyle     =   0
      Caption         =   "Bland-Altman"
      CaptionAlignment=   3
      CaptionDelta    =   0
      CaptionPosition =   1
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      HasBackgroundColor=   False
      Height          =   22
      Icon            =   0
      IconAlignment   =   0
      IconDeltaX      =   0
      IconDeltaY      =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   65
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuStyle       =   0
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   292
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   101
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
   Begin DesktopBevelButton HistogramBevelButton
      Active          =   False
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowTabStop    =   True
      BackgroundColor =   &c00000000
      BevelStyle      =   0
      Bold            =   False
      ButtonStyle     =   0
      Caption         =   "Histogram"
      CaptionAlignment=   3
      CaptionDelta    =   0
      CaptionPosition =   1
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      HasBackgroundColor=   False
      Height          =   22
      Icon            =   0
      IconAlignment   =   0
      IconDeltaX      =   0
      IconDeltaY      =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   66
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuStyle       =   0
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   190
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   101
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
   Begin DesktopImageViewer ImageViewer1
      Active          =   False
      AllowAutoDeactivate=   True
      AllowTabStop    =   True
      Enabled         =   True
      Height          =   422
      Image           =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   419
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Visible         =   True
      Width           =   345
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
   Begin DesktopListBox ResultsListBox
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   2
      ColumnWidths    =   "50%,50%"
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLineStyle   =   0
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   422
      Index           =   -2147483648
      InitialValue    =   ""
      Italic          =   False
      Left            =   190
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   2
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   207
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Opening()
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub DrawRobustBAPlot(a() As Double, b() As Double, z As Double = 1.96, methAlab As String = "Method A", methBlab As String = "Method B", g As Graphics)
		  
		  // Calculate x and y
		  Var x(), y() As Double
		  For i As Integer = 0 To Min(a.LastIndex, b.LastIndex)
		    x.AddRow((a(i) + b(i)) / 2.0)
		    y.AddRow(a(i) - b(i))
		  Next
		  
		  // Compute robust metrics
		  Var median_diff As Double = Median(y)
		  Var mad As Double = MedianAbsoluteDeviation(y, median_diff)
		  Var lower_l As Double = median_diff - z * (mad / 0.6745)
		  Var upper_l As Double = median_diff + z * (mad / 0.6745)
		  
		  // Regression
		  Var slope, intercept, rSquared, sdResidual As Double
		  LinearRegression(x, y, slope, intercept, rSquared, sdResidual)
		  
		  // Canvas dimensions
		  Var w As Double = g.Width
		  Var h As Double = g.Height
		  
		  // Plot margins
		  Var leftMargin As Double = 80
		  Var bottomMargin As Double = 60
		  Var topMargin As Double = 100
		  Var rightMargin As Double = 40
		  
		  Var plotWidth As Double = w - leftMargin - rightMargin
		  Var plotHeight As Double = h - topMargin - bottomMargin
		  
		  // Determine scaling
		  Var minX As Double = MinValue(x)
		  Var maxX As Double = MaxValue(x)
		  Var minY As Double = Min(MinValue(y), lower_l) - 5
		  Var maxY As Double = Max(MaxValue(y), upper_l) + 5
		  
		  // Helper: map data to canvas
		  Var MapX As Double = plotWidth / (maxX - minX)
		  Var MapY As Double = plotHeight / (maxY - minY)
		  
		  // Draw axes
		  g.DrawLine(leftMargin, h - bottomMargin, w - rightMargin, h - bottomMargin)
		  g.DrawLine(leftMargin, topMargin, leftMargin, h - bottomMargin)
		  
		  // Draw data points
		  For i As Integer = 0 To x.LastIndex
		    Var px As Double = leftMargin + (x(i) - minX) * MapX
		    Var py As Double = h - bottomMargin - (y(i) - minY) * MapY
		    g.FillOval(px - 3, py - 3, 6, 6)
		  Next
		  
		  // Draw robust bias and limits
		  Var medianY As Double = h - bottomMargin - (median_diff - minY) * MapY
		  Var lowerY As Double = h - bottomMargin - (lower_l - minY) * MapY
		  Var upperY As Double = h - bottomMargin - (upper_l - minY) * MapY
		  
		  g.DrawLine(leftMargin, medianY, w - rightMargin, medianY) // bias
		  g.PenSize = 1
		  g.DrawLine(leftMargin, lowerY, w - rightMargin, lowerY)
		  g.DrawLine(leftMargin, upperY, w - rightMargin, upperY)
		  
		  // Regression line
		  For xVal As Double = minX To maxX Step (maxX - minX) / 50
		    Var yVal As Double = slope * xVal + intercept
		    Var px As Double = leftMargin + (xVal - minX) * MapX
		    Var py As Double = h - bottomMargin - (yVal - minY) * MapY
		    If xVal = minX Then
		      g.PenSize = 2
		      g.DrawingColor = Color.Blue
		    End If
		    If xVal = maxX Then
		      g.DrawLine(leftMargin + (minX - minX) * MapX, h - bottomMargin - ((slope * minX + intercept) - minY) * MapY, px, py)
		    End If
		  Next
		  
		  // Parallel ±2SD lines
		  For offset As Double = -2 * sdResidual To 2 * sdResidual Step 4 * sdResidual
		    Var shiftedIntercept As Double = intercept + offset
		    Var yStart As Double = slope * minX + shiftedIntercept
		    Var yEnd As Double = slope * maxX + shiftedIntercept
		    Var py1 As Double = h - bottomMargin - (yStart - minY) * MapY
		    Var py2 As Double = h - bottomMargin - (yEnd - minY) * MapY
		    g.DrawingColor = Color.Blueg.DrawLine(leftMargin, py1, w - rightMargin, py2)
		  Next
		  
		  // Stats and title
		  Var label As String = "y = " + Str(intercept, "0.00") + " + " + Str(slope, "0.00") + "x, R² = " + Str(rSquared, "0.000")
		  g.DrawString(label, leftMargin, topMargin - 10)
		  
		  g.DrawString("Robust Bland-Altman Plot", leftMargin, 30)
		  g.DrawString("Bias = " + Str(median_diff, "0.00") + ", MAD = " + Str(mad, "0.00"), leftMargin, 50)
		  g.DrawString("Limits: " + Str(lower_l, "0.00") + " to " + Str(upper_l, "0.00") + " (±" + Str(z) + " × MAD / 0.6745)", leftMargin, 70)
		  g.DrawString("Median of " + methAlab + " and " + methBlab, leftMargin, h - 20)
		  g.DrawString(methAlab + " - " + methBlab, 10, topMargin + plotHeight / 2)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GenerateBlandAltmanImage(a() As Double, b() As Double, z As Double = 1.96, methAlab As String = "Method A", methBlab As String = "Method B") As Picture
		  Var img As New Picture(800, 600)
		  DrawRobustBAPlot(a, b, z, methAlab, methBlab, img.Graphics)
		  Return img
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LinearRegression(x() As Double, y() As Double, ByRef slope As Double, ByRef intercept As Double, ByRef rSquared As Double, ByRef sdResidual As Double)
		  
		  Var n As Double = Min(x.Count, y.Count)
		  If n = 0 Then Return
		  
		  Var sumX, sumY, sumXY, sumX2, sumY2 As Double
		  For i As Integer = 0 To n - 1
		    sumX = sumX + x(i)
		    sumY = sumY + y(i)
		    sumXY = sumXY + x(i) * y(i)
		    sumX2 = sumX2 + x(i) * x(i)
		    sumY2 = sumY2 + y(i) * y(i)
		  Next
		  
		  slope = (n * sumXY - sumX * sumY) / (n * sumX2 - sumX * sumX)
		  intercept = (sumY - slope * sumX) / n
		  
		  // Compute residuals for SD
		  Var residuals() As Double
		  For i As Integer = 0 To n - 1
		    Var predicted As Double = slope * x(i) + intercept
		    residuals.AddRow(y(i) - predicted)
		  Next
		  
		  // SD of residuals
		  Var meanResidual As Double = residuals.Average
		  Var sumSq As Double
		  For Each r As Double In residuals
		    sumSq = sumSq + (r - meanResidual) ^ 2
		  Next
		  sdResidual = Sqrt(sumSq / (residuals.Count - 1))
		  
		  // R²
		  rSquared = ((n * sumXY - sumX * sumY) ^ 2) / ((n * sumX2 - sumX ^ 2) * (n * sumY2 - sumY ^ 2))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MaxValue(values() As Double) As Double
		  // Public Function MaxValue(values() As Double) As Double
		  If values.Count = 0 Then Return 0
		  Var result As Double = values(0)
		  For Each v As Double In values
		    If v > result Then result = v
		  Next
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Median(values() As Double) As Double
		  If values.Count = 0 Then Return 0
		  
		  Var sorted() As Double = values.Sort
		  Var Mid As Integer = sorted.Count \ 2
		  
		  If sorted.Count Mod 2 = 0 Then
		    Return (sorted(Mid - 1) + sorted(Mid)) / 2.0
		  Else
		    Return sorted(Mid)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MedianAbsoluteDeviation(values() As Double, center As Double) As Double
		  Var deviations() As Double
		  For Each v As Double In values
		    deviations.AddRow(Abs(v - center))
		  Next
		  Return Median(deviations)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MinValue(values() As Double) As Double
		  If values.Count = 0 Then Return 0
		  Var result As Double = values(0)
		  For Each v As Double In values
		    If v < result Then result = v
		  Next
		  Return result
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RefreshResults()
		  ResultsListBox.RemoveAllRows
		  ResultsListBox.HasHeader = True
		  ResultsListBox.ColumnCount = 3
		  
		  ResultsListBox.HeaderAt(0) = header1
		  ResultsListBox.HeaderAt(1) = header2
		  ResultsListBox.HeaderAt(2) = "ΔACT"
		  System.DebugLog("Header 0: " + ResultsListBox.HeaderAt(0))
		  System.DebugLog("Header 1: " + ResultsListBox.HeaderAt(1))
		  System.DebugLog("Header 1: " + ResultsListBox.HeaderAt(2))
		  Var rowCount As Integer = Min(data1Doubles.Count, data2Doubles.Count)
		  
		  For i As Integer = 0 To rowCount - 1
		    Var v1 As Double = data1Doubles(i)
		    Var v2 As Double = data2Doubles(i)
		    Var delta As Double = v1 - v2
		    
		    ResultsListBox.AddRow("")
		    ResultsListBox.CellTextAt(i, 0) = Format(v1, "#,###")
		    ResultsListBox.CellTextAt(i, 1) = Format(v2, "#,###")
		    ResultsListBox.CellTextAt(i, 2) = Format(delta, "#,###")
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetData(header1 As String, rawData1() As String, header2 As String, rawData2() As String)
		  
		  Self.header1 = header1
		  Self.header2 = header2
		  
		  Var filteredStrings1(), filteredStrings2() As String
		  Var numericData1(), numericData2() As Double
		  
		  // Only include valid paired values
		  For i As Integer = 0 To Min(rawData1.LastIndex, rawData2.LastIndex)
		    Var s1 As String = rawData1(i)
		    Var s2 As String = rawData2(i)
		    
		    Var v1 As Double = Val(s1)
		    Var v2 As Double = Val(s2)
		    
		    If s1.Trim <> "" And s2.Trim <> "" And v1 <> 0 And v2 <> 0 Then
		      filteredStrings1.AddRow(s1)
		      filteredStrings2.AddRow(s2)
		      numericData1.AddRow(v1)
		      numericData2.AddRow(v2)
		    End If
		  Next
		  
		  Self.data1Strings = filteredStrings1
		  Self.data2Strings = filteredStrings2
		  Self.data1Doubles = numericData1
		  Self.data2Doubles = numericData2
		  
		  RefreshResults()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Untitled()
		  Var total As Double
		  For Each v As Double In residuals
		    total = total + v
		  Next
		  
		  Var meanResidual As Double = total / residuals.Count
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Description
		A comprehensive StatisticalAnalyzer class for Xojo 2025 that includes:Description
		Statistical Methods:
		
		Descriptive Statistics: Mean, median, standard deviation, quartiles, skewness, kurtosis
		Normality Testing: Anderson-Darling test with p-values
		T-Tests: One-sample, two-sample (pooled and Welch's), and paired t-tests
		Linear Regression: With correlation, R², significance testing
		
		Example Usage:
		Var analyzer As New StatisticalAnalyzer
		Var data() As Double = Array(1.2, 2.3, 1.8, 2.1, 1.9, 2.4, 1.7, 2.2)
		
		// Descriptive statistics
		Var stats As Dictionary = analyzer.DescriptiveStatistics(data)
		
		// Test for normality
		Var normalityTest As Dictionary = analyzer.AndersonDarlingTest(data)
		
		// Create visualizations
		Var boxPlot As Picture = analyzer.CreateBoxPlot(data, "Sample Data")
		Var histogram As Picture = analyzer.CreateHistogram(data, "Distribution", 10)
		Var qqPlot As Picture = analyzer.CreateQQPlot(data, "Normality Check")
		The class uses native Xojo graphics and provides publication-quality output with proper statistical rigor. Would you like me to add any specific features or create example usage code for particular analyses?RetryClaude does not have the ability to run the code it generates yet.Claude can make mistakes. Please double-check responses. Sonnet 4
		
	#tag EndNote


	#tag Property, Flags = &h0
		data1Doubles() As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		data1Strings() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		data2Doubles() As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		data2Strings() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		header1 As String
	#tag EndProperty

	#tag Property, Flags = &h0
		header2 As String
	#tag EndProperty


#tag EndWindowCode

#tag Events TwoBoxplotsBevelButton
	#tag Event
		Sub Pressed()
		  Var analyzer As New StatisticalAnalyzer
		  
		  
		  Var dualBoxPlot  As picture = analyzer.CreateDualBoxPlot(data1Doubles , data2Doubles, "2 Box Plots", "Plot 1","Plot 2", width, height)
		  ImageViewer1.Image = dualBoxPlot
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BA_BevelButton
	#tag Event
		Sub Pressed()
		  'Var analyzer As New StatisticalAnalyzer
		  '
		  '
		  ''// Descriptive statistics
		  ''Var stats As Dictionary = analyzer.DescriptiveStatistics(data)
		  ''
		  ''// Test for normality
		  ''Var normalityTest As Dictionary = analyzer.AndersonDarlingTest(data)
		  ''
		  ''// Create visualizations
		  '
		  '
		  '
		  '
		  '
		  '
		  ''Var qqPlot As Picture = analyzer.CreateQQPlot(data2, "Normality Check",width,height)
		  ''ImageViewer1.Image = qqPlot
		  '
		  'Var Bland_AltmanPlot As Picture = analyzer.CreateBlandAltmanPlot(data1Doubles,data2Doubles,"Bland-Altman Plot",width,height)
		  'imageviewer1.image =  Bland_AltmanPlot
		  Var plotImage As Picture = GenerateBlandAltmanImage(data1Doubles, data2Doubles, 1.96, "Method 1", "Method2")
		  ImageViewer1.Image = plotImage
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events HistogramBevelButton
	#tag Event
		Sub Pressed()
		  Var analyzer As New StatisticalAnalyzer
		  Var data1() As Double = Array(1.2, 2.3, 1.8, 2.1, 1.9, 2.4, 1.7, 2.2)
		  Var data2() As Double = Array(1.4, 1.3, 1.9, 3.1, 1.5, 2.0, 1.0, 2.20)
		  
		  
		  
		  
		  Var histogram As Picture = analyzer.CreateHistogram(data1, "Frequency Distribution", 10)
		  ImageViewer1.Image = histogram
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
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
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
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
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasTitleBar"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Window Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&cFFFFFF"
		Type="ColorGroup"
		EditorType="ColorGroup"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="DesktopMenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
