
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
            dsSearchResults.SelectParameters("Latitude").DefaultValue = results.Element("result").Element("geometry").Element("location").Element("lat").Value
            dsSearchResults.SelectParameters("Longitude").DefaultValue = results.Element("result").Element("geometry").Element("location").Element("lng").Value

            lvSearchResults.DataBind()
        End If
    End Sub
End Class
