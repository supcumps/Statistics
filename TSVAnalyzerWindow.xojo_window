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
   Title           =   "Untitled"
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
      Left            =   432
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
      Top             =   362
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
      Left            =   570
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
      Top             =   362
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
      Left            =   503
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
      Top             =   429
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   135
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub Constructor()
		  ReDim mHeaders(-1)
		  ReDim mRawData(-1)
		  mColumnData = New Dictionary
		  mSelectedColumns = New Dictionary
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataProcessed(columnCount As Integer, rowCount As Integer)
		  // Event definition only - no implementation
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ErrorOccurred(message As String)
		  // Event definition only - no implementation
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExportToSQLite(dbFile As FolderItem) As Boolean
		  // [Existing implementation unchanged]
		  Try
		    Dim db As New SQLiteDatabase
		    db.DatabaseFile = dbFile
		    // ... (rest of the method remains the same)
		  Catch err As RuntimeException
		    RaiseEvent ErrorOccurred("Error creating SQLite database: " + err.Message)
		    Return False
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAllColumnData() As Dictionary
		  Return mColumnData
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetColumnData(columnName As String) As String()
		  If mColumnData.HasKey(columnName) Then
		    Return mColumnData.Value(columnName)
		  Else
		    Dim emptyArray() As String
		    Return emptyArray
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetColumnStatistics(columnName As String) As Dictionary
		  // [Existing implementation unchanged]
		  Dim stats As New Dictionary
		  Dim numericData() As Double = GetNumericColumnData(columnName)
		  // ... (rest of the method remains the same)
		  Return stats
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetNumericColumnData(columnName As String) As Double()
		  Dim stringData() As String = GetColumnData(columnName)
		  Dim numericData() As Double
		  For Each value As String In stringData
		    If IsNumeric(value) Then
		      numericData.Append(Val(value))
		    End If
		  Next
		  Return numericData
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSelectedHeaders(listBox As DesktopListBox) As String()
		  Dim selectedHeaders() As String
		  For i As Integer = 0 To listBox.RowCount - 1
		    If listBox.Selected(i) Then
		      selectedHeaders.Append(listBox.CellValueAt(i, 0))
		    End If
		  Next
		  Return selectedHeaders
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HeadersLoaded(headers() As String)
		  // Event definition only - no implementation
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LoadTSVFile(file As FolderItem) As Boolean
		  If file = Nil Or Not file.Exists Then
		    RaiseEvent ErrorOccurred("TSV file does not exist")
		    Return False
		  End If
		  Try
		    Dim input As TextInputStream = TextInputStream.Open(file)
		    input.Encoding = Encodings.UTF8
		    Dim allText As String = input.ReadAll
		    input.Close
		    Dim lines() As String = allText.Split(EndOfLine)
		    If lines.Ubound < 1 Then
		      RaiseEvent ErrorOccurred("File appears to be empty or has no data rows")
		      Return False
		    End If
		    mHeaders = lines(0).Split(Chr(9))
		    For i As Integer = 0 To mHeaders.Ubound
		      mHeaders(i) = mHeaders(i).Trim
		    Next
		    ReDim mRawData(lines.Ubound - 1)
		    For i As Integer = 1 To lines.Ubound
		      mRawData(i - 1) = lines(i)
		    Next
		    mSelectedColumns.RemoveAll
		    mColumnData.RemoveAll
		    RaiseEvent HeadersLoaded(mHeaders)
		    Return True
		  Catch err As RuntimeException
		    RaiseEvent ErrorOccurred("Error reading TSV file: " + err.Message)
		    Return False
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LoadTSVFromFolder(folder As FolderItem) As Boolean
		  If folder = Nil Or Not folder.Exists Or Not folder.IsFolder Then
		    RaiseEvent ErrorOccurred("Invalid folder specified")
		    Return False
		  End If
		  Dim tsvFiles() As FolderItem
		  For i As Integer = 1 To folder.Count
		    Dim item As FolderItem = folder.Item(i)
		    If item <> Nil And Not item.IsFolder Then
		      Dim extension As String = item.Name
		      If extension.Right(4).Uppercase = ".TSV" Then
		        tsvFiles.Append(item)
		      End If
		    End If
		  Next
		  If tsvFiles.Ubound = -1 Then
		    RaiseEvent ErrorOccurred("No TSV files found in the specified folder")
		    Return False
		  End If
		  mTSVFile = tsvFiles(0)
		  Return LoadTSVFile(mTSVFile)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PopulateHeaderListBox(listBox As DesktopListBox)
		  listBox.RemoveAllRows
		  For i As Integer = 0 To mHeaders.Ubound
		    listBox.AddRow(mHeaders(i))
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ProcessSelectedColumns(selectedHeaders() As String) As Boolean
		  If selectedHeaders.Ubound = -1 Then
		    RaiseEvent ErrorOccurred("No columns selected")
		    Return False
		  End If
		  mSelectedColumns.RemoveAll
		  mColumnData.RemoveAll
		  Dim columnIndices() As Integer
		  For Each header As String In selectedHeaders
		    For i As Integer = 0 To mHeaders.Ubound
		      If mHeaders(i) = header Then
		        columnIndices.Append(i)
		        mSelectedColumns.Value(header) = i
		        Exit For i
		      End If
		    Next
		  Next
		  For Each header As String In selectedHeaders
		    If mSelectedColumns.HasKey(header) Then
		      Dim columnIndex As Integer = mSelectedColumns.Value(header)
		      Dim columnValues() As String
		      For Each dataRow As String In mRawData
		        If dataRow.Trim <> "" Then
		          Dim rowValues() As String = dataRow.Split(Chr(9))
		          If columnIndex <= rowValues.Ubound Then
		            columnValues.Append(rowValues(columnIndex).Trim)
		          Else
		            columnValues.Append("")
		          End If
		        End If
		      Next
		      mColumnData.Value(header) = columnValues
		    End If
		  Next
		  RaiseEvent DataProcessed(selectedHeaders.Ubound + 1, mRawData.Ubound + 1)
		  Return True
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mColumnData As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHeaders() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRawData() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelectedColumns As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTSVFile As FolderItem
	#tag EndProperty


#tag EndWindowCode

#tag Events LoadButton
	#tag Event
		Sub Pressed()
		  Dim dlg As New OpenFileDialog
		  dlg.Filter = "TSV Files|*.tsv"
		  Dim file As FolderItem = dlg.ShowModal
		  If file <> Nil Then
		    If Not analyzer.LoadTSVFile(file) Then
		      // Error handled by ErrorHandler
		    End If
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ProcessButton
	#tag Event
		Sub Pressed()
		  Dim selectedHeaders() As String = analyzer.GetSelectedHeaders(HeaderListBox)
		  If Not analyzer.ProcessSelectedColumns(selectedHeaders) Then
		    // Error handled by ErrorHandler
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ExportButton
	#tag Event
		Sub Pressed()
		  Dim saveDialog As New SaveAsDialog
		  saveDialog.SuggestedFileName = "tsv_data.sqlite"
		  saveDialog.Filter = "SQLite Database (*.sqlite)|*.sqlite"
		  
		  Dim dbFile As FolderItem = saveDialog.ShowModal()
		  If dbFile <> Nil Then
		    If StatusLabel <> Nil Then
		      StatusLabel.Text = "Exporting to SQLite database..."
		    End If
		    
		    If analyzer.ExportToSQLite(dbFile) Then
		      If StatusLabel <> Nil Then
		        StatusLabel.Text = "Successfully exported to SQLite database."
		      End If
		      
		      Dim dialog As New MessageDialog
		      dialog.Icon = MessageDialog.GraphicNote
		      dialog.ActionButton.Caption = "OK"
		      dialog.Message = "Export Complete"
		      dialog.Explanation = "Data has been successfully exported to: " + dbFile.NativePath
		      dialog.ShowModal()
		    End If
		    // Error will be handled by ErrorHandler event if export fails
		  End If
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
