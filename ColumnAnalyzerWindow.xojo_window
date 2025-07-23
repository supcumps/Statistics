#tag DeskTopWindow
	#tag Event
		Sub Closing()
		  CleanupTSVAnalyzer()
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
		  SetupTSVAnalyzer()
		End Sub
	#tag EndEvent

	#tag Method, Flags = &h21
		Private Sub CleanupTSVAnalyzer()
		  // Remove event handlers to prevent memory leaks
		  RemoveHandler analyzer.HeadersLoaded, AddressOf HeadersLoadedHandler
		  RemoveHandler analyzer.DataProcessed, AddressOf DataProcessedHandler
		  RemoveHandler analyzer.ErrorOccurred, AddressOf ErrorHandler
		  
		  // Clean up the analyzer instance
		  analyzer = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetupTSVAnalyzer()
		  // Create the analyzer instance
		  analyzer = New TSVAnalyzer
		  
		  // Connect the event handlers
		  AddHandler analyzer.HeadersLoaded, AddressOf HeadersLoadedHandler
		  AddHandler analyzer.DataProcessed, AddressOf DataProcessedHandler
		  AddHandler analyzer.ErrorOccurred, AddressOf ErrorHandler
		  
		  // Initialize UI state
		  LoadButton.Enabled = True
		  ProcessButton.Enabled = False
		  ExportButton.Enabled = False
		  StatusLabel.Text = "Ready to load TSV file..."
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HeadersLoadedHandler(headers() As String)
		  If StatusLabel <> Nil Then
		    StatusLabel.Text = "TSV file loaded successfully. Found " + Str(headers.Ubound + 1) + " columns."
		  End If
		  If HeaderListBox <> Nil Then
		    analyzer.PopulateHeaderListBox(HeaderListBox)
		    ProcessButton.Enabled = True
		  End If
		  System.DebugLog("Headers loaded: " + Join(headers, ", "))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DataProcessedHandler(columnCount As Integer, rowCount As Integer)
		  If StatusLabel <> Nil Then
		    StatusLabel.Text = "Data processed: " + Str(columnCount) + " columns, " + Str(rowCount) + " rows ready for analysis."
		  End If
		  If ExportButton <> Nil Then
		    ExportButton.Enabled = True
		  End If
		  If DataListBox <> Nil Then
		    PopulateDataListBox()
		  End If
		  If DataInfoTextArea <> Nil Then
		    DisplayProcessedDataInfo()
		  End If
		  System.DebugLog("Data processing complete: " + Str(columnCount) + " columns, " + Str(rowCount) + " rows")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ErrorHandler(message As String)
		  If StatusLabel <> Nil Then
		    StatusLabel.Text = "Error: " + message
		  End If
		  Dim dialog As New MessageDialog
		  dialog.Icon = MessageDialog.GraphicCaution
		  dialog.ActionButton.Caption = "OK"
		  dialog.Message = "TSV Processing Error"
		  dialog.Explanation = message
		  dialog.ShowModal
		  System.DebugLog("TSV Analyzer Error: " + message)
		  If ProcessButton <> Nil Then
		    ProcessButton.Enabled = False
		  End If
		  If ExportButton <> Nil Then
		    ExportButton.Enabled = False
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PopulateDataListBox()
		  If DataListBox <> Nil Then
		    // Clear existing rows and columns
		    DataListBox.RemoveAllRows
		    DataListBox.ColumnCount = analyzer.GetAllColumnData.Count
		    
		    // Set column headers
		    Dim colIndex As Integer = 0
		    For Each entry As DictionaryEntry In analyzer.GetAllColumnData
		      DataListBox.HeaderAt(colIndex) = entry.Key
		      colIndex = colIndex + 1
		    Next
		    
		    // Determine the number of rows (use the longest column)
		    Dim rowCount As Integer = 0
		    For Each entry As DictionaryEntry In analyzer.GetAllColumnData
		      Dim columnData() As String = entry.Value
		      If columnData.Ubound + 1 > rowCount Then
		        rowCount = columnData.Ubound + 1
		      End If
		    Next
		    
		    // Populate rows
		    For rowIndex As Integer = 0 To rowCount - 1
		      DataListBox.AddRow("")
		      colIndex = 0
		      For Each entry As DictionaryEntry In analyzer.GetAllColumnData
		        Dim columnData() As String = entry.Value
		        If rowIndex <= columnData.Ubound Then
		          DataListBox.CellValueAt(rowIndex, colIndex) = columnData(rowIndex)
		        Else
		          DataListBox.CellValueAt(rowIndex, colIndex) = ""
		        End If
		        colIndex = colIndex + 1
		      Next
		    Next
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DisplayProcessedDataInfo()
		  If DataInfoTextArea <> Nil Then
		    Dim info As String = "Processed Data Summary:" + EndOfLine + EndOfLine
		    Dim allData As Dictionary = analyzer.GetAllColumnData
		    For Each entry As DictionaryEntry In allData
		      Dim columnName As String = entry.Key
		      Dim columnData() As String = entry.Value
		      info = info + "Column: " + columnName + EndOfLine
		      info = info + "  Rows: " + Str(columnData.Ubound + 1) + EndOfLine
		      Dim stats As Dictionary = analyzer.GetColumnStatistics(columnName)
		      If Not stats.HasKey("error") Then
		        info = info + "  Mean: " + Format(stats.Value("mean"), "#.##") + EndOfLine
		        info = info + "  Min: " + Format(stats.Value("min"), "#.##") + EndOfLine
		        info = info + "  Max: " + Format(stats.Value("max"), "#.##") + EndOfLine
		        info = info + "  Std Dev: " + Format(stats.Value("std_dev"), "#.##") + EndOfLine
		      Else
		        info = info + "  Type: Text data" + EndOfLine
		      End If
		      info = info + EndOfLine
		    Next
		    DataInfoTextArea.Text = info
		  End If
		End Sub
	#tag EndMethod

	#tag Property, Flags = &h21
		Private analyzer As TSVAnalyzer
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