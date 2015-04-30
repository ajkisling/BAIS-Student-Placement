using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Linq;

public partial class FindAStoreCS : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtSearch.Focus();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        var results = GoogleMapsAPIHelpersCS.GetGeocodingSearchResults(txtSearch.Text.Trim());

        var resultCount = results.Elements("result").Count();

        lvDidYouMean.Visible = false;
        lblNoResults.Visible = false;

        // How many results did we get back?
        if (resultCount == 0)
            //Eep, no results!
            lblNoResults.Visible = true;

        else if (resultCount == 1)
            //Got back just one result, show the stores that match the address search
            ShowResults(results);

        else
        {
            //Got back multiple results - We need to ask the user which address they mean to use...
            var matches = from result in results.Elements("result")
                          let formatted_address = result.Element("formatted_address").Value
                          select formatted_address;

            lvDidYouMean.DataSource = matches;
            lvDidYouMean.DataBind();
            lvDidYouMean.Visible = true;
        }
    }

    protected void ShowResults(XElement results)
    {
        Response.Redirect("ShowStoreLocationsCS.aspx?Address=" + 
                            Server.UrlEncode(results.Element("result").Element("formatted_address").Value));
    }
}