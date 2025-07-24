#tag DesktopWindow
Begin DesktopWindow TSVAnalyzerWindow
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
   Height          =   656
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   ""
   MenuBarVisible  =   False
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   True
   Title           =   "Statistis from .TSV"
   Type            =   0
   Visible         =   True
   Width           =   788
   Begin DesktopButton LoadButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Load TSV"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   78
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   2
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   602
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin DesktopButton ProcessButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Process TSV"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   295
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   2
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   602
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   98
   End
   Begin DesktopButton ExportButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Export to SQLlite"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   530
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   2
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   602
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   135
   End
   Begin DesktopListBox HeaderListBox
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   1
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
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   490
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
      RowSelectionType=   1
      Scope           =   2
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   748
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin DesktopLabel StatusLabel
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   17
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Untitled"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   530
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   388
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Function DictionaryValue(v As Variant) As String
		  '// Helper method to safely convert Variant to String array
		  '//Private Function DictionaryValue(v As Variant) As String()
		  'If v IsA String() Then
		  'Return String()(v)
		  'Else
		  'Return New String()
		  'End IfLoadTSVFile
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ExtractValuesForHeaders(headersToExtract() As String, records() As Dictionary) As Dictionary
		  Var result As New Dictionary
		  
		  For Each header As String In headersToExtract
		    Var values() As String
		    For Each row As Dictionary In records
		      values.AddRow(row.Lookup(header, "")) // safely returns a String
		    Next
		    result.Value(header) = values // ✅ values is a String() array
		  Next
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadTSVFile()
		  '
		  '
		  '//Sub LoadTSVFile()
		  'Var file As FolderItem = GetOpenFolderItem("")
		  'If file = Nil Then Return
		  '
		  'Var textInput As TextInputStream = TextInputStream.Open(file)
		  'textInput.Encoding = Encodings.UTF8
		  '
		  'headers = textInput.ReadLine.Split(Chr(9)) // Read header line
		  '
		  'records.RemoveAll
		  'While Not textInput.EOF
		  'Var line As String = textInput.ReadLine.Trim
		  'If line = "" Then Continue
		  '
		  'Var columns() As String = line.Split(Chr(9))
		  'Var row As New Dictionary
		  '
		  'For i As Integer = 0 To headers.LastIndex
		  'If i < columns.Count Then
		  'row.Value(headers(i)) = columns(i)
		  'End If
		  'Next
		  '
		  'records.AddRow(row)
		  'Wend
		  '
		  'textInput.Close
		  '
		  'HeaderListBox.RemoveAllRows
		  'For Each header As String In headers
		  'HeaderListBox.AddRow(header)
		  'Next
		  'LoadTSVFile
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RouteAnalysisWindow(selectedHeaders() As String, selectedRecords() As Dictionary)
		  Var headerData As Dictionary = ExtractValuesForHeaders(selectedHeaders, selectedRecords)
		  
		  Select Case selectedHeaders.Count
		  Case 1
		    Var header As String = selectedHeaders(0)
		    Var values() As String = headerData.Value(header)
		    SingleHeaderWindow.SetData(header, values)
		    SingleHeaderWindow.Show
		    
		  Case 2
		    Var h1 As String = selectedHeaders(0)
		    Var h2 As String = selectedHeaders(1)
		    Var d1() As String = headerData.Value(h1)
		    Var d2() As String = headerData.Value(h2)
		    
		    DualHeaderWindow.SetData(h1, d1, h2, d2)
		    DualHeaderWindow.Show
		    
		  Case Is >= 3
		    MultiHeaderWindow.SetData(headerData)
		    MultiHeaderWindow.Show
		  End Select
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		dataLInes() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Headers() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mAllTSVData() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mColumnData As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRawData() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelectedColumns As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		mTSVData As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTSVFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		mTSVHeaders() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Records As Dictionary
	#tag EndProperty


#tag EndWindowCode

#tag Events LoadButton
	#tag Event
		Sub Pressed()
		  Var textInput As TextInputStream
		  Var file As FolderItem = GetOpenFolderItem("")
		  'Var headers() As String
		  'Var dataLines() As String
		  
		  
		  If file <> Nil Then
		    textInput = TextInputStream.Open(file)
		    textInput.Encoding = Encodings.UTF8
		    
		    // Read headers
		    headers = textInput.ReadLine.Split(Chr(9))
		    
		    // Read remaining lines
		    While Not textInput.EOF
		      Var line As String = textInput.ReadLine.Trim
		      If line <> "" Then
		        dataLines.AddRow(line)
		      End If
		    Wend
		    
		    textInput.Close
		  End If
		  
		  // Populate headers in the listbox
		  HeaderListBox.RemoveAllRows
		  For Each header As String In headers
		    HeaderListBox.AddRow(header)
		  Next
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ProcessButton
	#tag Event
		Sub Pressed()
		  
		  // Validate that headers and data exist
		  If headers.Count = 0 Then
		    MessageBox("No headers found. Please load a valid TSV file first.")
		    Return
		  End If
		  
		  If dataLines.Count = 0 Then
		    MessageBox("No data rows available for processing.")
		    Return
		  End If
		  
		  System.DebugLog("Selected Headers:")
		  
		  
		  // Identify selected headers
		  Var selectedHeaders() As String
		  For i As Integer = 0 To HeaderListBox.LastRowIndex
		    If HeaderListBox.RowSelectedAt(i) Then
		      selectedHeaders.AddRow(HeaderListBox.CellTextAt(i, 0))
		      System.DebugLog("Selected Headers:")
		      For Each h As String In selectedHeaders
		        System.DebugLog(h)
		      Next
		      
		    End If
		  Next
		  
		  
		  If selectedHeaders.Count = 0 Then
		    MessageBox("Please select at least one header to analyze.")
		    Return
		  End If
		  
		  // Build selectedRecords() from dataLines and headers
		  Var selectedRecords() As Dictionary
		  For Each line As String In dataLines
		    Var rowData() As String = line.Split(Chr(9)) // Split by tab
		    
		    Var rowDict As New Dictionary
		    For j As Integer = 0 To headers.LastIndex
		      If j <= rowData.LastIndex Then
		        rowDict.Value(headers(j)) = rowData(j)
		      Else
		        rowDict.Value(headers(j)) = "" // Fill missing with blank
		      End If
		    Next
		    
		    selectedRecords.AddRow(rowDict)
		  Next
		  
		  // Call dispatcher to handle window routing
		  RouteAnalysisWindow(selectedHeaders, selectedRecords)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ExportButton
	#tag Event
		Sub Pressed()
		  
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
