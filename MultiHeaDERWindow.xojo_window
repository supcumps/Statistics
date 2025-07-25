#tag DesktopWindow
Begin DesktopWindow MultiHeaderWindow
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
   Begin DesktopBevelButton PieBevelButton
      Active          =   False
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowTabStop    =   True
      BackgroundColor =   &c00000000
      BevelStyle      =   0
      Bold            =   False
      ButtonStyle     =   0
      Caption         =   "Pie Chart"
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
      ColumnCount     =   0
      ColumnWidths    =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLineStyle   =   0
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   True
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   103
      Index           =   -2147483648
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
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
      Width           =   776
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
		Function CreatePieChartImage(headers() As String, valuesDict As Dictionary, radius As Double) As Picture
		  Var picSize As Integer = radius * 2
		  Var chartPic As New Picture(picSize, picSize)
		  Var g As Graphics = chartPic.Graphics
		  
		  Var cx As Integer = radius
		  Var cy As Integer = radius
		  
		  // Sum total from dictionary using Variant.TypeDouble
		  Var total As Double = 0.0
		  For Each key As Variant In valuesDict.Keys
		    total = total + valuesDict.Value(key).TypeDouble
		  Next
		  
		  Var startAngle As Double = 0.0
		  Var stepAngle As Double = 5.0
		  
		  For i As Integer = 0 To headers.LastIndex
		    Var header As String = headers(i)
		    Var value As Double = valuesDict.Lookup(header, 0.0).TypeDouble
		    If value = 0 Then Continue
		    
		    Var sweep As Double = value / total * 360.0
		    
		    // Create graphics path for pie slice
		    Var path As New GraphicsPath
		    path.MoveToPoint(cx, cy)
		    
		    For a As Double = startAngle To startAngle + sweep Step stepAngle
		      Var rad As Double = a * Pi / 180.0
		      Var x As Integer = Round(cx + Cos(rad) * radius)
		      Var y As Integer = Round(cy + Sin(rad) * radius)
		      path.AddLineToPoint(x, y)
		    Next
		    
		    // Final arc endpoint
		    Var endRad As Double = (startAngle + sweep) * Pi / 180.0
		    Var ex As Integer = Round(cx + Cos(endRad) * radius)
		    Var ey As Integer = Round(cy + Sin(endRad) * radius)
		    path.AddLineToPoint(ex, ey)
		    path.AddLineToPoint(cx, cy) // Explicitly close path
		    
		    // Set drawing color and fill the slice
		    Var hue As Double = i / headers.Count
		     Var baseColor As Color = Color.HSV(hue, 0.7, 0.9)
		    Var fadedColor As Color = Color.RGBA(baseColor.Red, baseColor.Green, baseColor.Blue, 128) // semi-transparent
		    
		    g.DrawingColor = fadedColor
		    g.FillPath(path, True)
		    
		    // Compute slice label with total and percentage
		    Var percent As Double = value / total * 100.0
		    Var label As String = header + " (" + Format(value, "#.##") + ", " + Format(percent, "#.0") + "%)"
		    
		    // Label position
		    Var midAngle As Double = startAngle + sweep / 2.0
		    Var lx As Integer = Round(cx + Cos(midAngle * Pi / 180.0) * radius * 0.6)
		    Var ly As Integer = Round(cy + Sin(midAngle * Pi / 180.0) * radius * 0.6)
		    g.DrawingColor = Color.Black
		    g.DrawText(label, lx - 15, ly, 100) // Extend width if needed
		    
		    
		    startAngle = startAngle + sweep
		  Next
		  
		  Return chartPic
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsStrictNumeric(s As String) As Boolean
		  Try
		    Var d As Double = s.ToDouble
		    Return True
		  Catch
		    Return False
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetData(headerNames() As String, Data As Dictionary)
		  resultsListBox.RemoveAllRows
		  resultsListBox.ColumnCount = headerNames.Count
		  
		  // Set column titles
		  For col As Integer = 0 To headerNames.LastIndex
		    resultsListBox.HeaderAt(col) = headerNames(col)
		  Next
		  // Find the max number of rows to display
		  Var maxRows As Integer = 0
		  For Each header As String In headerNames
		    Var values() As String = Data.Value(header)
		    If values.Count > maxRows Then maxRows = values.Count
		  Next
		  
		  // Add rows of numeric data only
		  For row As Integer = 0 To maxRows - 1
		    resultsListBox.AddRow("")
		    For col As Integer = 0 To headerNames.LastIndex
		      Var header As String = headerNames(col)
		      Var values() As String = Data.Value(header)
		      If row < values.Count Then
		        Var value As String = values(row)
		        If IsStrictNumeric(value) Then
		          resultsListBox.CellTextAt(row, col) = value
		        Else
		          resultsListBox.CellTextAt(row, col) = ""
		        End If
		      End If
		    Next
		  Next
		  
		  headerData = Data
		  headers =  headerNames
		  ' messagebox("listbox completed")
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
		headerData As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		Headers() As String
	#tag EndProperty


	#tag Structure, Name = PointF, Flags = &h0
		x as Double
		y as Double
	#tag EndStructure


#tag EndWindowCode

#tag Events PieBevelButton
	#tag Event
		Sub Pressed()
		  
		  ImageViewer1.Image = CreatePieChartImage(headers, headerData, 100)
		  
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
