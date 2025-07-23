#tag Class
Class TSVAnalyzer
	#tag Event
		Sub DataProcessed(columnCount As Integer, rowCount As Integer)
		  // Event definition only - no implementation
		End Sub
	#tag EndEvent

	#tag Event
		Sub ErrorOccurred(message As String)
		  // Event definition only - no implementation
		End Sub
	#tag EndEvent

	#tag Event
		Sub HeadersLoaded(headers() As String)
		  // Event definition only - no implementation
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor()
		  ReDim mHeaders(-1)
		  ReDim mRawData(-1)
		  mColumnData = New Dictionary
		  mSelectedColumns = New Dictionary
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
