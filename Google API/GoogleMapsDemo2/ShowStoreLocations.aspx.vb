Imports System.Collections.Generic
Imports System.Data

Partial Class ShowStoreLocations
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim address = Request.QueryString("Address")
            If String.IsNullOrEmpty(address) Then
                Response.Redirect("FindAStore.aspx")
            End If

            'Get the lat/long info about the address
            Dim results = GoogleMapsAPIHelpers.GetGeocodingSearchResults(address)

            lblAddress.Text = address

            'Set the latitude and longtitude parameters based on the address being searched on
            Dim lat = results.Element("result").Element("geometry").Element("location").Element("lat").Value
            Dim lng = results.Element("result").Element("geometry").Element("location").Element("lng").Value

            dsSearchResults.SelectParameters("Latitude").DefaultValue = lat
            dsSearchResults.SelectParameters("Longitude").DefaultValue = lng

            lvSearchResults.DataBind()


            'Loop through each nearby location and build up the JavaScript to place the markers
            Dim markers As New List(Of String)

            Dim nearbyLocations = CType(dsSearchResults.Select(DataSourceSelectArguments.Empty), DataView)
            For Each location As DataRowView In nearbyLocations
                markers.Add(String.Format("{{ title: ""Store #{0}"", position: new google.maps.LatLng({1}, {2}) }}", location("StoreNumber"), location("Latitude"), location("Longitude")))
            Next

            Dim locationsJson = "[" & String.Join(",", markers.ToArray()) & "]"

            ' Inject the Google Maps script
            ClientScript.RegisterStartupScript(Me.GetType(), "Google Maps Initialization", _
                                               String.Format("init_map('map_canvas', {0}, {1}, 13, {2});", lat, lng, locationsJson), True)
        End If
    End Sub
End Class
