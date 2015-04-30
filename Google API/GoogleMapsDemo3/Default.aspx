<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content runat="server" ID="myHeadContent" ContentPlaceHolderID="head">
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript">
        function init_map(map_canvas_id, lat, lng, zoom) {
            var myLatLng = new google.maps.LatLng(lat, lng);

            var options = {
                zoom: zoom,
                center: myLatLng,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };

            var map_canvas = document.getElementById(map_canvas_id);

            var map = new google.maps.Map(map_canvas, options);
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Welcome!</h2>
    <p>
        This demo shows how to use the <a href="http://code.google.com/apis/maps/">Google Maps API</a> to build a simple store locator
        web application.
    </p>
    <p>
        This demo site is powered by the <code>StoreLocations.mdf</code> database in the <code>App_Data</code> folder, which contains a single
        table, <code>Stores</code>. This table has one record for each store, specifying the address, city, region, country code, 
        postal code, and latitude and longitude coordinates. From the <a href="FindAStore.aspx">Find a Store</a> page you can search this
        database by entering the name of an address, a city, a region, a country or a ZIP code. It's pretty intuitive, if I do say so myself.
        <a href="FindAStore.aspx">Give it a try!</a>
    </p>
    <p>
        While you're here, why not explore a map of Mexico City, Mexico? Alternatively, you may view
        <a target="_blank" href="MexicoCitySimple.aspx">a hybrid 400x300 pixel map of Mexico City</a>
        or <a target="_blank" href="MexicoCityMarkers.aspx">a map showing some of Mexico City's museums</a>.
    </p>
    <div id="my_map" style="width:500px;height:400px;border:solid 1px #333"></div>
    <p>
        Happy Programming!
    </p>
    <blockquote>
        Scott Mitchell<br />
        <a href="mailto:mitchell@4guysfromrolla.com">mitchell@4guysfromrolla.com</a><br />
        <a href="http://scottonwriting.net/sowBlog/">My Blog</a>
    </blockquote>
    
    <script type="text/javascript">
        init_map('my_map', 19.4270499, -99.1275711, 13);
    </script>
</asp:Content>

