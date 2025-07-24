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
      Top             =   241
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
      Left            =   66
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
   Begin DesktopImageViewer ImageViewer1
      Active          =   False
      AllowAutoDeactivate=   True
      AllowTabStop    =   True
      Enabled         =   True
      Height          =   538
      Image           =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   197
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
      Top             =   142
      Transparent     =   False
      Visible         =   True
      Width           =   587
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
      Height          =   103
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
      Width           =   594
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin DesktopBevelButton PB_BevelButton
      Active          =   False
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowTabStop    =   True
      BackgroundColor =   &c00000000
      BevelStyle      =   0
      Bold            =   False
      ButtonStyle     =   0
      Caption         =   "Passing–Bablok plot"
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
      Left            =   29
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuStyle       =   0
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   342
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   138
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
   Begin DesktopBevelButton JD_BevelButton1
      Active          =   False
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowTabStop    =   True
      BackgroundColor =   &c00000000
      BevelStyle      =   0
      Bold            =   False
      ButtonStyle     =   0
      Caption         =   "Joint Density plot"
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
      Left            =   40
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuStyle       =   0
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   392
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   138
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Opening()
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function Average(residuals() As Double) As Double
		  Var total As Double = 0
		  For Each v As Double In residuals
		    total = total + v
		  Next
		  Return total / residuals.Count
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ComputePassingBablokRegression(x() As Double, y() As Double, ByRef slope As Double, ByRef intercept As Double)
		  Var n As Integer = Min(x.Count, y.Count)
		  If n < 2 Then
		    slope = 0
		    intercept = 0
		    Return
		  End If
		  
		  Var slopes() As Double
		  For i As Integer = 0 To n - 2
		    For j As Integer = i + 1 To n - 1
		      Var dx As Double = x(j) - x(i)
		      If dx <> 0 Then
		        Var s As Double = (y(j) - y(i)) / dx
		        slopes.AddRow(s)
		      End If
		    Next
		  Next
		  
		  // Median slope
		  slope = Median(slopes)
		  
		  // Intercept: median of yᵢ − slope × xᵢ
		  Var intercepts() As Double
		  For i As Integer = 0 To n - 1
		    intercepts.AddRow(y(i) - slope * x(i))
		  Next
		  intercept = Median(intercepts)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawPassingBablokPlot(x() As Double, y() As Double, methAlab As String, methBlab As String, g As Graphics)
		  
		  // Dimensions and margins
		  Var w As Double = g.Width
		  Var h As Double = g.Height
		  Var leftMargin As Double = 80
		  Var rightMargin As Double = 40
		  Var topMargin As Double = 60
		  Var bottomMargin As Double = 60
		  
		  Var plotWidth As Double = w - leftMargin - rightMargin
		  Var plotHeight As Double = h - topMargin - bottomMargin
		  
		  // Compute bounds
		  Var minX As Double = MinValue(x)
		  Var maxX As Double = MaxValue(x)
		  Var minY As Double = MinValue(y)
		  Var maxY As Double = MaxValue(y)
		  
		  Var MapX As Double = plotWidth / (maxX - minX)
		  Var MapY As Double = plotHeight / (maxY - minY)
		  
		  // Compute regression
		  Var slope, intercept As Double
		  ComputePassingBablokRegression(x, y, slope, intercept)
		  
		  // Draw axes
		  g.DrawingColor = Color.Black
		  g.DrawLine(leftMargin, h - bottomMargin, w - rightMargin, h - bottomMargin) // X axis
		  g.DrawLine(leftMargin, topMargin, leftMargin, h - bottomMargin) // Y axis
		  
		  // Draw data points
		  For i As Integer = 0 To Min(x.LastIndex, y.LastIndex)
		    Var px As Double = leftMargin + (x(i) - minX) * MapX
		    Var py As Double = h - bottomMargin - (y(i) - minY) * MapY
		    g.FillOval(px - 3, py - 3, 6, 6)
		  Next
		  
		  // Identity line: y = x
		  Var startX As Double = minX
		  Var endX As Double = maxX
		  Var startY As Double = startX
		  Var endY As Double = endX
		  g.DrawingColor = Color.Gray
		  g.DrawLine( _
		  leftMargin + (startX - minX) * MapX, h - bottomMargin - (startY - minY) * MapY, _
		  leftMargin + (endX - minX) * MapX, h - bottomMargin - (endY - minY) * MapY)
		  
		  // Regression line
		  g.DrawingColor = Color.Blue
		  Var y1 As Double = slope * startX + intercept
		  Var y2 As Double = slope * endX + intercept
		  g.DrawLine( _
		  leftMargin + (startX - minX) * MapX, h - bottomMargin - (y1 - minY) * MapY, _
		  leftMargin + (endX - minX) * MapX, h - bottomMargin - (y2 - minY) * MapY)
		  
		  // Annotation
		  Var label As String = "y = " + Str(intercept, "0.00") + " + " + Str(slope, "0.00") + "x"
		  g.DrawingColor = Color.Blue
		  g.DrawString(label, leftMargin, topMargin - 10)
		  
		  g.DrawingColor = Color.Black
		  g.DrawString("Passing–Bablok Regression", leftMargin, 30)
		  g.DrawString(methBlab + " vs " + methAlab, leftMargin, h - 20)
		  g.DrawString("Identity line: y = x", w - rightMargin - 160, topMargin + 10)
		End Sub
	#tag EndMethod

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
		    g.DrawingColor = Color.Blue
		    g.DrawLine(leftMargin, py1, w - rightMargin, py2)
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
		Function GenerateJointDensityImage(x() As Double, y() As Double, methAlab As String, methBlab As String) As Picture
		  Var w As Integer = 800
		  Var h As Integer = 600
		  Var leftMargin As Integer = 80
		  Var rightMargin As Integer = 80
		  Var topMargin As Integer = 80
		  Var bottomMargin As Integer = 80
		  
		  Var img As New Picture(w, h)
		  Var g As Graphics = img.Graphics
		  
		  Var plotWidth As Double = w - leftMargin - rightMargin
		  Var plotHeight As Double = h - topMargin - bottomMargin
		  
		  Var minX As Double = MinValue(x)
		  Var maxX As Double = MaxValue(x)
		  Var minY As Double = MinValue(y)
		  Var maxY As Double = MaxValue(y)
		  
		  Var MapX As Double = plotWidth / (maxX - minX)
		  Var MapY As Double = plotHeight / (maxY - minY)
		  
		  // 🔵 Step 1: Compute local density
		  Var radius As Double = (maxX - minX) * 0.03
		  Var densities() As Integer
		  
		  For i As Integer = 0 To x.LastIndex
		    Var count As Integer = 0
		    For j As Integer = 0 To x.LastIndex
		      Var dx As Double = x(j) - x(i)
		      Var dy As Double = y(j) - y(i)
		      If Sqrt(dx^2 + dy^2) < radius Then count = count + 1
		    Next
		    densities.AddRow(count)
		  Next
		  
		  Var maxDensity As Integer = MaxValueInt(densities)
		  If maxDensity = 0 Then maxDensity = 1
		  
		  // 🔵 Step 2: Draw shaded scatter
		  For i As Integer = 0 To x.LastIndex
		    Var px As Double = leftMargin + (x(i) - minX) * MapX
		    Var py As Double = h - bottomMargin - (y(i) - minY) * MapY
		    
		    Var alpha As Double = densities(i) / maxDensity
		    Var col As Color = Color.RGB(0, 0, 255, alpha) // Blue glow by density
		    g.DrawingColor = col
		    g.FillOval(px - 4, py - 4, 8, 8)
		  Next
		  
		  // 🔲 Step 3: Axes
		  g.DrawingColor = Color.Black
		  g.DrawLine(leftMargin, h - bottomMargin, w - rightMargin, h - bottomMargin) // X axis
		  g.DrawLine(leftMargin, topMargin, leftMargin, h - bottomMargin) // Y axis
		  
		  // 📊 Step 4: Marginal Histograms
		  Var binCount As Integer = 20
		  
		  Var xBins() As Integer
		  Var yBins() As Integer
		  xBins.ResizeTo(binCount - 1)
		  yBins.ResizeTo(binCount - 1)
		  
		  For Each v As Double In x
		    Var i As Integer = Floor((v - minX) / (maxX - minX) * binCount)
		    If i >= 0 And i < binCount Then xBins(i) = xBins(i) + 1
		  Next
		  For Each v As Double In y
		    Var i As Integer = Floor((v - minY) / (maxY - minY) * binCount)
		    If i >= 0 And i < binCount Then yBins(i) = yBins(i) + 1
		  Next
		  
		  Var xMaxCount As Integer = MaxValueInt(xBins)
		  Var yMaxCount As Integer = MaxValueInt(yBins)
		  
		  // Top histogram (Method A)
		  For i As Integer = 0 To binCount - 1
		    Var binXStart As Double = leftMargin + (i / binCount) * plotWidth
		    Var binWidth As Double = plotWidth / binCount
		    Var binHeight As Double = 50.0 * xBins(i) / xMaxCount
		    
		    g.DrawingColor = Color.RGB(160, 200, 255)
		    g.FillRectangle(binXStart, topMargin - binHeight - 10, binWidth, binHeight)
		  Next
		  
		  // Right histogram (Method B)
		  For i As Integer = 0 To binCount - 1
		    Var binYStart As Double = h - bottomMargin - (i / binCount) * plotHeight
		    Var binHeight As Double = plotHeight / binCount
		    Var binWidth As Double = 50.0 * yBins(i) / yMaxCount
		    
		    g.DrawingColor = Color.RGB(255, 180, 180)
		    g.FillRectangle(w - rightMargin + 10, binYStart, binWidth, binHeight)
		  Next
		  
		  // 🏷️ Step 5: Labels
		  g.DrawingColor = Color.Black
		  g.DrawString("Joint Density: " + methAlab + " vs " + methBlab, leftMargin, 30)
		  g.DrawString(methAlab + " Distribution ↑", leftMargin + plotWidth / 2 - 50, topMargin - 60)
		  'g.DrawString(methBlab + " Distribution →", w - rightMargin + 20, topMargin + plotHeight / 2)
		  g.DrawString(methBlab + " Distribution →", w - rightMargin - 50, topMargin - 20)
		  
		  g.DrawString(methAlab, leftMargin + plotWidth / 2 - 30, h - 20)
		  g.DrawString(methBlab, 10, topMargin + plotHeight / 2)
		  
		  Var meanX As Double = Average(x)
		  Var meanY As Double = Average(y)
		  Var medianX As Double = Median(x)
		  Var medianY As Double = Median(y)
		  Var sdX As Double = StandardDeviation(x)
		  Var sdY As Double = StandardDeviation(y)
		  
		  // Display in lower-left corner
		  g.DrawingColor = Color.Black
		  g.DrawString("Summary – " + methAlab + ": Mean = " + Str(meanX, "0.00") + ", Median = " + Str(medianX, "0.00") + ", SD = " + Str(sdX, "0.00"), leftMargin, h - bottomMargin + 30)
		  g.DrawString("Summary – " + methBlab + ": Mean = " + Str(meanY, "0.00") + ", Median = " + Str(medianY, "0.00") + ", SD = " + Str(sdY, "0.00"), leftMargin, h - bottomMargin + 50)
		  
		  Return img
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GeneratePassingBablokImage(x() As Double, y() As Double, methAlab As String, methBlab As String) As Picture
		  Var w As Integer = 800
		  Var h As Integer = 600
		  Var leftMargin As Double = 80
		  Var rightMargin As Double = 40
		  Var topMargin As Double = 60
		  Var bottomMargin As Double = 60
		  
		  Var plotPic As New Picture(w, h)
		  Var g As Graphics = plotPic.Graphics
		  
		  // Plot region
		  Var plotWidth As Double = w - leftMargin - rightMargin
		  Var plotHeight As Double = h - topMargin - bottomMargin
		  
		  Var minX As Double = MinValue(x)
		  Var maxX As Double = MaxValue(x)
		  Var minY As Double = MinValue(y)
		  Var maxY As Double = MaxValue(y)
		  
		  Var MapX As Double = plotWidth / (maxX - minX)
		  Var MapY As Double = plotHeight / (maxY - minY)
		  
		  // Compute regression
		  Var n As Integer = Min(x.Count, y.Count)
		  Var slopes(), intercepts() As Double
		  
		  For i As Integer = 0 To n - 2
		    For j As Integer = i + 1 To n - 1
		      Var dx As Double = x(j) - x(i)
		      If dx <> 0 Then
		        slopes.AddRow((y(j) - y(i)) / dx)
		      End If
		    Next
		  Next
		  
		  slopes.Sort
		  Var slope As Double = Median(slopes)
		  
		  For i As Integer = 0 To n - 1
		    intercepts.AddRow(y(i) - slope * x(i))
		  Next
		  intercepts.Sort
		  Var intercept As Double = Median(intercepts)
		  
		  // CI: 95% empirical
		  Var lowerSlope As Double = slopes(Round(slopes.Count * 0.025))
		  Var upperSlope As Double = slopes(Round(slopes.Count * 0.975))
		  Var lowerIntercept As Double = intercepts(Round(intercepts.Count * 0.025))
		  Var upperIntercept As Double = intercepts(Round(intercepts.Count * 0.975))
		  
		  // Draw scatter
		  g.DrawingColor = Color.Black
		  For i As Integer = 0 To n - 1
		    Var px As Double = leftMargin + (x(i) - minX) * MapX
		    Var py As Double = h - bottomMargin - (y(i) - minY) * MapY
		    g.FillOval(px - 3, py - 3, 6, 6)
		  Next
		  
		  // Axes
		  g.DrawLine(leftMargin, h - bottomMargin, w - rightMargin, h - bottomMargin)
		  g.DrawLine(leftMargin, topMargin, leftMargin, h - bottomMargin)
		  
		  // Identity line (gray)
		  g.DrawingColor = Color.Gray
		  g.DrawLine( _
		  leftMargin + (minX - minX) * MapX, h - bottomMargin - (minX - minY) * MapY, _
		  leftMargin + (maxX - minX) * MapX, h - bottomMargin - (maxX - minY) * MapY)
		  
		  // Regression line
		  g.DrawingColor = Color.Blue
		  Var y1 As Double = slope * minX + intercept
		  Var y2 As Double = slope * maxX + intercept
		  g.DrawLine( _
		  leftMargin + (minX - minX) * MapX, h - bottomMargin - (y1 - minY) * MapY, _
		  leftMargin + (maxX - minX) * MapX, h - bottomMargin - (y2 - minY) * MapY)
		  
		  // Confidence lines
		  g.DrawingColor = color.Blue
		  Var yLow1 As Double = lowerSlope * minX + lowerIntercept
		  Var yLow2 As Double = lowerSlope * maxX + lowerIntercept
		  Var yUp1 As Double = upperSlope * minX + upperIntercept
		  Var yUp2 As Double = upperSlope * maxX + upperIntercept
		  
		  g.DrawLine( _
		  leftMargin + (minX - minX) * MapX, h - bottomMargin - (yLow1 - minY) * MapY, _
		  leftMargin + (maxX - minX) * MapX, h - bottomMargin - (yLow2 - minY) * MapY)
		  
		  g.DrawLine( _
		  leftMargin + (minX - minX) * MapX, h - bottomMargin - (yUp1 - minY) * MapY, _
		  leftMargin + (maxX - minX) * MapX, h - bottomMargin - (yUp2 - minY) * MapY)
		  
		  // Labels
		  g.DrawingColor = Color.Blue
		  g.DrawString("Passing–Bablok Regression", leftMargin, 30)
		  g.DrawString("Equation: y = " + Str(intercept, "0.00") + " + " + Str(slope, "0.00") + "x", leftMargin, 50)
		  g.DrawString("95% CI slope: [" + Str(lowerSlope, "0.00") + ", " + Str(upperSlope, "0.00") + "]", leftMargin, 70)
		  g.DrawString("95% CI intercept: [" + Str(lowerIntercept, "0.00") + ", " + Str(upperIntercept, "0.00") + "]", leftMargin, 90)
		  
		  // Interpretation
		  Var interpretation As String = ""
		  If Abs(slope - 1.0) < 0.1 And Abs(intercept) < 5.0 Then
		    interpretation = "Interpretation: Good agreement — slope ≈ 1, intercept ≈ 0"
		  ElseIf Abs(slope - 1.0) > 0.2 Then
		    interpretation = "Interpretation: Systematic bias — slope differs significantly from 1"
		  ElseIf Abs(intercept) > 10 Then
		    interpretation = "Interpretation: Constant bias — intercept differs significantly from 0"
		  Else
		    interpretation = "Interpretation: Partial agreement with mild bias"
		  End If
		  g.DrawingColor = Color.Black
		  g.DrawString(interpretation, leftMargin, 110)
		  
		  Return plotPic
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
		  Var meanResidual As Double = 0
		  For Each r As Double In residuals
		    meanResidual = meanResidual + r
		  Next
		  meanResidual = meanResidual / residuals.Count
		  
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
		Function MaxValueInt(values() As Integer) As Integer
		  If values.Count = 0 Then Return 0
		  Var result As Integer = values(0)
		  For Each v As Integer In values
		    If v > result Then result = v
		  Next
		  Return result
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Median(values() As Double) As Double
		  If values.Count = 0 Then Return 0
		  
		  Var sorted() As Double = values
		  sorted.Sort
		  
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
		Function StandardDeviation(values() As Double) As Double
		  //Public Function StandardDeviation(values() As Double) As Double
		  Var m As Double = Average(values)
		  Var sumSq As Double = 0
		  For Each v As Double In values
		    sumSq = sumSq + (v - m)^2
		  Next
		  Return Sqrt(sumSq / (values.Count - 1))
		  
		End Function
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
		  
		  
		  Var dualBoxPlot  As picture = analyzer.CreateDualBoxPlot(data1Doubles , data2Doubles, "2 Box Plots", header1,header2, width, height)
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
		  Var plotImage As Picture = GenerateBlandAltmanImage(data1Doubles, data2Doubles, 1.96, header1, header2)
		  ImageViewer1.Image = plotImage
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PB_BevelButton
	#tag Event
		Sub Pressed()
		  Var plotImage As Picture = GeneratePassingBablokImage(data1Doubles, data2Doubles, header1, header2)
		  ImageViewer1.Image = plotImage
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events JD_BevelButton1
	#tag Event
		Sub Pressed()
		  Var densityPlot As Picture = GenerateJointDensityImage(data1Doubles, data2Doubles,header1, header2)
		  ImageViewer1.Image = densityPlot
		  
		  
		  
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
	#tag ViewProperty
		Name="header1"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="header2"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
#tag EndViewBehavior
