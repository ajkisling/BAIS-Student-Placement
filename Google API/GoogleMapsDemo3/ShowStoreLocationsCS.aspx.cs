using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShowStoreLocationsCS : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            var address = Request.QueryString["Address"];
            if (string.IsNullOrEmpty(address))
                Response.Redirect("FindAStore.aspx");


            // Get the lat/long info about the address
            var results = GoogleMapsAPIHelpersCS.GetGeocodingSearchResults(address);

            lblAddress.Text = address;

            // Set the latitude and longtitude parameters based on the address being searched on
            var lat = results.Element("result").Element("geometry").Element("location").Element("lat").Value;
            var lng = results.Element("result").Element("geometry").Element("location").Element("lng").Value;

            dsSearchResults.SelectParameters["Latitude"].DefaultValue = lat;
            dsSearchResults.SelectParameters["Longitude"].DefaultValue = lng;

            lvSearchResults.DataBind();



            // Loop through each nearby location and build up the JavaScript to place the markers
            var locations = new List<string>();
            var infoWindowContents = new List<string>();

            var nearbyLocations = dsSearchResults.Select(DataSourceSelectArguments.Empty) as DataView;
            var count = 1;

            foreach (DataRowView location in nearbyLocations)
            {
                locations.Add(string.Format(
                                @"{{ 
                                    title: ""Store #{0}"", 
                                    position: new google.maps.LatLng({1}, {2}),
                                    icon: ""Images/NumberToImageHandler.ashx?number={3}""
                                }}", 
                                   location["StoreNumber"], 
                                   location["Latitude"], 
                                   location["Longitude"],
                                   count
                                )
                              );

                infoWindowContents.Add(string.Format(
                                @"{{ 
                                    content: ""<div class=\""infoWindow\""><b>Store #{0}</b><br />{1}<br />{2}, {3} {4}</div>""
                                }}", 
                                   location["StoreNumber"], 
                                   location["Address"], 
                                   location["City"], 
                                   location["Region"], 
                                   location["PostalCode"]
                                )
                           );

                count++;
            }

            var locationsJson = "[" + string.Join(",", locations.ToArray()) + "]";
            var overlayContentsJson = "[" + string.Join(",", infoWindowContents.ToArray()) + "]";

            // Inject the Google Maps script
            ClientScript.RegisterStartupScript(this.GetType(), "Google Maps Initialization",
                                               string.Format("init_map('map_canvas', {0}, {1}, 13, {2}, {3});", lat, lng, locationsJson, overlayContentsJson), true);
        }
    }
}