#tag Module
Protected Module GLobalModule
	#tag Method, Flags = &h0
		Function Average(residuals() As Double) As Double
		  Var total As Double = 0
		  For Each v As Double In residuals
		    total = total + v
		  Next
		  Return total / residuals.Count
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FormatToTwoDecimals(value As Double) As String
		  Return Format(value, "##0.00")
		End Function
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
		Function MinValue(values() As Double) As Double
		  If values.Count = 0 Then Return 0
		  Var result As Double = values(0)
		  For Each v As Double In values
		    If v < result Then result = v
		  Next
		  Return result
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PearsonCorrelation(x() As Double, y() As Double) As Double
		  If x.Count <> y.Count Or x.Count = 0 Then Return 0
		  
		  Var n As Integer = x.Count
		  Var sumX, sumY, sumXY, sumX2, sumY2 As Double
		  
		  For i As Integer = 0 To n - 1
		    sumX = sumX + x(i)
		    sumY = sumY + y(i)
		    sumXY = sumXY + x(i) * y(i)
		    sumX2 = sumX2 + x(i)^2
		    sumY2 = sumY2 + y(i)^2
		  Next
		  
		  Var numerator As Double = n * sumXY - sumX * sumY
		  Var denominator As Double = Sqrt((n * sumX2 - sumX^2) * (n * sumY2 - sumY^2))
		  If denominator = 0 Then Return 0
		  
		  Return numerator / denominator
		End Function
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


	#tag Constant, Name = Pi, Type = Double, Dynamic = False, Default = \"3.14159265358979", Scope = Public
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
End Module
#tag EndModule
