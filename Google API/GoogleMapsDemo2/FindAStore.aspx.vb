Imports System.Linq
Imports System.Xml.Linq

Partial Class FindAStore
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        txtSearch.Focus()
    End Sub

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        Dim results = GoogleMapsAPIHelpers.GetGeocodingSearchResults(txtSearch.Text.Trim())

        Dim resultCount = results.Elements("result").Count()

        lvDidYouMean.Visible = False
        lblNoResults.Visible = False

        'How many results did we get back?
        If resultCount = 0 Then
            'Eep, no results!
            lblNoResults.Visible = True

        ElseIf resultCount = 1 Then
            'Got back just one result, show the stores that match the address search
            ShowResults(results)

        Else
            'Got back multiple results - We need to ask the user which address they mean to use...
            Dim matches = From result In results.Elements("result") _
                          Let formatted_address = result.Element("formatted_address").Value _
                          Select formatted_address

            lvDidYouMean.DataSource = matches
            lvDidYouMean.DataBind()
            lvDidYouMean.Visible = True
        End If
    End Sub

    Protected Sub ShowResults(ByVal results As XElement)
        Response.Redirect("ShowStoreLocations.aspx?Address=" & Server.UrlEncode(results.Element("result").Element("formatted_address").Value))
    End Sub
End Class
