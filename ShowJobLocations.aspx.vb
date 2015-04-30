Imports System.Collections.Generic
Imports System.Data
Partial Class ShowJobLocations
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim address = Request.QueryString("Address")
            If String.IsNullOrEmpty(address) Then
                Response.Redirect("FindAJob.aspx")
            End If

            'Get the lat/long info about the address
            Dim results = GoogleMapsAPIHelpers.GetGeocodingSearchResults(address)

            lblAddress.Text = address

            'Set the latitude and longtitude parameters based on the address being searched on
            Dim lat = results.Element("result").Element("geometry").Element("location").Element("lat").Value
            Dim lng = results.Element("result").Element("geometry").Element("location").Element("lng").Value

            dsSearchResults.SelectParameters("Latitude").DefaultValue = results.Element("result").Element("geometry").Element("location").Element("lat").Value
            dsSearchResults.SelectParameters("Longitude").DefaultValue = results.Element("result").Element("geometry").Element("location").Element("lng").Value

            lvSearchResults.DataBind()

            'Loop through each nearby location and build up the JavaScript to place the markers
            Dim locations As New List(Of String)
            Dim overlayContents As New List(Of String)

            Dim nearbyLocations = CType(dsSearchResults.Select(DataSourceSelectArguments.Empty), DataView)
            Dim count = 1

            For Each location As DataRowView In nearbyLocations
                locations.Add(String.Format("{{ title: ""Store #{0}"", position: new google.maps.LatLng({1}, {2}), icon: ""Images/NumberToImageHandler.ashx?number={3}"" }}", location("StoreNumber"), location("Latitude"), location("Longitude"), count))

                overlayContents.Add(String.Format("{{ content: ""<div class=\""infoWindow\""><b>Store #{0}</b><br />{1}<br />{2}, {3} {4}</div>"" }}", location("StoreNumber"), location("Address"), location("City"), location("Region"), location("PostalCode")))

                count += 1
            Next

            Dim locationsJson = "[" & String.Join(",", locations.ToArray()) & "]"
            Dim overlayContentsJson = "[" & String.Join(",", overlayContents.ToArray()) & "]"

            ' Inject the Google Maps script
            ClientScript.RegisterStartupScript(Me.GetType(), "Google Maps Initialization", _
                                               String.Format("init_map('map_canvas', {0}, {1}, 13, {2}, {3});", lat, lng, locationsJson, overlayContentsJson), True)
        End If
    End Sub
End Class

