#tag Module
Protected Module ViolinStatsUtils
	#tag Method, Flags = &h21
		Private Sub AddDouble(ByRef result() As Double, value As Variant)
		  If value.Type = Variant.TypeDouble Or value.Type = Variant.TypeInteger Then
		    result.Add(value.DoubleValue)
		  ElseIf value.Type = Variant.TypeString Then
		    Try
		      result.Add(value.StringValue.Trim.ToDouble)
		    Catch
		      // Ignore malformed string
		    End Try
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ComputeBandwidth(data() As Double) As Double
		  //Public Function ComputeBandwidth(data() As Double) As Double
		  If data.Count = 0 Then Return 1.0
		  Var mean As Double = 0
		  For Each v As Double In data
		    mean = mean + v
		  Next
		  mean = mean / data.Count
		  
		  Var sumSq As Double = 0
		  For Each v As Double In data
		    sumSq = sumSq + (v - mean)^2
		  Next
		  Var stdDev As Double = Sqrt(sumSq / data.Count)
		  Return 1.06 * stdDev * (data.Count ^ (-1.0 / 5.0))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EstimateDensity(data() As Double) As Pair()
		  //Public Shared Function EstimateDensity(data() As Double) As Pair()
		  Var result() As Pair
		  
		  If data.Count = 0 Then Return result
		  
		  // Find min and max values
		  Var minVal As Double = data(0)
		  Var maxVal As Double = data(0)
		  For Each value As Double In data
		    If value < minVal Then minVal = value
		    If value > maxVal Then maxVal = value
		  Next
		  
		  // If all values are the same, create a simple spike
		  If minVal = maxVal Then
		    result.Add(New Pair(minVal, 1.0))
		    Return result
		  End If
		  
		  // Calculate bandwidth (simple rule of thumb)
		  Var range As Double = maxVal - minVal
		  Var bandwidth As Double = range / 10 // Simple bandwidth estimation
		  
		  // Create evaluation points
		  Var numPoints As Integer = 50
		  Var stepSize As Double = range / (numPoints - 1)
		  
		  For i As Integer = 0 To numPoints - 1
		    Var xValue As Double = minVal + i * stepSize
		    Var density As Double = 0
		    
		    // Gaussian kernel density estimation
		    For Each dataPoint As Double In data
		      Var uValue As Double = (xValue - dataPoint) / bandwidth
		      Var kernelValue As Double = Exp(-0.5 * uValue * uValue) / Sqrt(2 * 3.14159265359)
		      density = density + kernelValue
		    Next
		    
		    // Normalize by sample size and bandwidth
		    density = density / (data.Count * bandwidth)
		    
		    result.Add(New Pair(xValue, density))
		  Next
		  
		  Return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExtractDoubles(rawdata As Variant) As Double()
		  Var result() As Double
		  
		  // Case 1: Try Variant() array
		  Try
		    Var arr() As Variant = rawData
		    For Each v As Variant In arr
		      AddDouble(result, v)
		    Next
		    Return result
		  Catch
		    // Not Variant() array
		  End Try
		  
		  // Case 2: Comma-separated string
		  If rawData.Type = Variant.TypeString Then
		    Var strVal As String = rawData.StringValue
		    Var parts() As String = strVal.Split(",")
		    For Each s As String In parts
		      AddDouble(result, s.Trim)
		    Next
		    Return result
		  End If
		  
		  
		  
		  
		  // Case 4: Single scalar value
		  AddDouble(result, rawData)
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExtractDoublesFromVariant(data As Variant) As Double()
		  // Public Shared Function ExtractDoublesFromVariant(data As Variant) As Double()
		  Var result() As Double
		  
		  If data = Nil Then
		    Return result
		  End If
		  
		  // Debug: Log what type we're actually dealing with
		  System.DebugLog("ExtractDoubles: data.Type = " + data.Type.ToString)
		  
		  Select Case data.Type
		  Case Variant.TypeDouble
		    result.Add(data.DoubleValue)
		    System.DebugLog("ExtractDoubles: Added single Double")
		    
		  Case Variant.TypeInteger
		    result.Add(CType(data.IntegerValue, Double))
		    System.DebugLog("ExtractDoubles: Added single Integer as Double")
		    
		  Case Variant.TypeInt64
		    result.Add(CType(data.Int64Value, Double))
		    System.DebugLog("ExtractDoubles: Added single Int64 as Double")
		    
		  Case Variant.TypeSingle
		    result.Add(CType(data.SingleValue, Double))
		    System.DebugLog("ExtractDoubles: Added single Single as Double")
		    
		  Case Variant.TypeString
		    // Single string - try to parse as number
		    Try
		      Var value As Double = Double.FromString(data.StringValue)
		      result.Add(value)
		      System.DebugLog("ExtractDoubles: Parsed single string: " + value.ToString)
		    Catch ex As RuntimeException
		      System.DebugLog("ExtractDoubles: Failed to parse string: " + data.StringValue)
		    End Try
		    
		  Case Variant.TypeObject
		    System.DebugLog("ExtractDoubles: TypeObject detected - treating as collection")
		    
		    // Instead of casting, let's try to access it as a generic collection
		    // This approach works better with Xojo 2025's variant handling
		    
		    // Convert to string representation and parse that
		    Var objectString As String = data.StringValue
		    System.DebugLog("ExtractDoubles: Object as string: " + objectString)
		    
		    // If it looks like an array representation, try to parse it
		    If objectString.Contains(",") Then
		      Var parts() As String = objectString.Split(",")
		      System.DebugLog("ExtractDoubles: Found " + parts.Count.ToString + " comma-separated parts")
		      
		      For Each part As String In parts
		        part = part.Trim
		        If part.Length > 0 Then
		          Try
		            Var value As Double = Double.FromString(part)
		            result.Add(value)
		          Catch ex As RuntimeException
		            System.DebugLog("ExtractDoubles: Could not parse part: " + part)
		          End Try
		        End If
		      Next
		    Else
		      // Try to parse the whole thing as a single number
		      Try
		        Var value As Double = Double.FromString(objectString)
		        result.Add(value)
		        System.DebugLog("ExtractDoubles: Parsed entire object string as number: " + value.ToString)
		      Catch ex As RuntimeException
		        System.DebugLog("ExtractDoubles: Could not parse object string as number: " + objectString)
		      End Try
		    End If
		    
		  Case Else
		    System.DebugLog("ExtractDoubles: Unknown type: " + data.Type.ToString)
		    Try
		      Var stringArr() As String = data
		      For Each s As String In stringArr
		        Try
		          result.Add(s.Trim.ToDouble)
		        Catch
		          System.DebugLog("ExtractDoubles: Skipped non-numeric string: " + s)
		        End Try
		      Next
		      System.DebugLog("ExtractDoubles: Parsed boxed String() array successfully")
		      Return result
		    Catch e As RuntimeException
		      System.DebugLog("ExtractDoubles: Unable to cast Variant to String(): " + e.Message)
		    End Try
		  End Select
		  
		  System.DebugLog("ExtractDoubles: Returning " + result.Count.ToString + " values")
		  Return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MaxValue(data() As Double) As Double
		  //Public Function MaxValue(data() As Double) As Double
		  If data.Count = 0 Then Return 0
		  Var maxVal As Double = data(0)
		  For Each v As Double In data
		    If v > maxVal Then maxVal = v
		  Next
		  Return maxVal
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MinValue(data() As Double) As Double
		  //Public Function MinValue(data() As Double) As Double
		  If data.Count = 0 Then Return 0
		  Var minVal As Double = data(0)
		  For Each v As Double In data
		    If v < minVal Then minVal = v
		  Next
		  Return minVal
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Percentile(data() As Double, p As Double) As Double
		  // Public Function Percentile(data() As Double, p As Double) As Double
		  If data.Count = 0 Then Return 0
		  data.Sort
		  Var index As Double = p * (data.Count - 1)
		  Var lower As Integer = Floor(index)
		  Var upper As Integer = Ceil(index)
		  If lower = upper Then
		    Return data(lower)
		  Else
		    Return data(lower) + (index - lower) * (data(upper) - data(lower))
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScaleY(value As Double, canvasHeight As Double, minY As Double, maxY As Double) As Double
		  // Public Function ScaleY(value As Double, canvasHeight As Double, minY As Double, maxY As Double) As Double
		  If maxY = minY Then Return canvasHeight / 2
		  Return canvasHeight - ((value - minY) / (maxY - minY)) * canvasHeight
		  
		End Function
	#tag EndMethod


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
End Module
#tag EndModule
