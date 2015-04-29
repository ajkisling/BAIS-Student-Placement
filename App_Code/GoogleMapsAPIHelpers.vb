Imports Microsoft.VisualBasic
Imports System.Xml.Linq

Public Class GoogleMapsAPIHelpers
    Public Shared Function GetGeocodingSearchResults(ByVal address As String) As XElement
        'Use the Google Geocoding service to get information about the user-entered address
        'See http://code.google.com/apis/maps/documentation/geocoding/index.html for more info...
        Dim url = String.Format("http://maps.google.com/maps/api/geocode/xml?address={0}&sensor=false", HttpContext.Current.Server.UrlEncode(address))

        'Load the XML into an XElement object (whee, LINQ to XML!)
        Dim results = XElement.Load(url)

        'Check the status
        Dim status = results.Element("status").Value
        If status <> "OK" AndAlso status <> "ZERO_RESULTS" Then
            'Whoops, something else was wrong with the request...
            Throw New ApplicationException("There was an error with Google's Geocoding Service: " & status)
        End If

        Return results
    End Function
End Class
