<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="FindAJob.aspx.vb" Inherits="FindAJob" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="http://maps.googleapis.com/maps/api/js"></script>
<script>
    var IowaCity = new google.maps.LatLng(41.6611277, -91.5301683);

    function initialize() {
        var mapProp = {
            center: IowaCity,
            zoom: 4,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
        
        var marker1 = new google.maps.Marker({
            position: IowaCity,
            map: map,
            title: 'Iowa City'});
        marker1.setMap(map);
        google.maps.event.addListener(marker1, 'click', function () {
            map.setZoom(12);
            map.setCenter(marker1.getPosition());
        });
    
        var Disney = new google.maps.LatLng(34.1562013, -118.3252152);
        var marker2 = new google.maps.Marker({
            position: Disney,
            map: map,
            title: 'Disney'
        });
        marker2.setMap(map);
        google.maps.event.addListener(marker2, 'click', function () {
            map.setZoom(12);
            map.setCenter(marker2.getPosition());
        });
    
        var Exxon = new google.maps.LatLng(32.8900057, -96.9499086);
        var marker3 = new google.maps.Marker({
            position: Exxon,
            map: map,
            title: 'Exxon Mobile'
        });
        marker3.setMap(map);
        google.maps.event.addListener(marker3, 'click', function () {
            map.setZoom(12);
            map.setCenter(marker3.getPosition());
        });
    
        var LVSands = new google.maps.LatLng(36.1214517, -115.1696112);
        var marker4 = new google.maps.Marker({
            position: LVSands,
            map: map,
            title: 'Las Vegas Sands'
        });
        marker4.setMap(map);
        google.maps.event.addListener(marker4, 'click', function () {
            map.setZoom(12);
            map.setCenter(marker4.getPosition());
        });
    
        var ACT = new google.maps.LatLng(41.6611277, -91.5301683);
        var marker5 = new google.maps.Marker({
            position: ACT,
            map: map,
            title: 'ACT, Inc.'
        });
        marker5.setMap(map);
        google.maps.event.addListener(marker5, 'click', function () {
            map.setZoom(12);
            map.setCenter(marker5.getPosition());
        });
    
        var JohnDeere = new google.maps.LatLng(41.4768314, -90.4243728);
        var marker6 = new google.maps.Marker({
            position: JohnDeere,
            map: map,
            title: 'John Deere'
        });
        marker6.setMap(map);
        google.maps.event.addListener(marker6, 'click', function () {
            map.setZoom(12);
            map.setCenter(marker6.getPosition());
        });
    

        var mcgladrey = new google.maps.LatLng(41.8816467, -87.6362882);
        var marker7 = new google.maps.Marker({
            position: mcgladrey,
            map: map,
            title: 'McGladrey'
        });
        marker7.setMap(map);

        // Zoom to 12 when clicking on marker
        google.maps.event.addListener(marker7, 'click', function () {
            map.setZoom(12);
            map.setCenter(marker7.getPosition());
        });
    }

    google.maps.event.addDomListener(window, 'load', initialize);
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Find a Job Near You!</h2>
    <p>
        Enter your address, city, or postal code to find jobs near you!</p>
    
    <asp:UpdatePanel ID="upSearchUI" runat="server">
        <ContentTemplate>
            <asp:Panel runat="server" DefaultButton="btnSearch">
                <b>Your Address:</b> <asp:TextBox ID="txtSearch" Width="55%" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqSearch" ControlToValidate="txtSearch" runat="server" ErrorMessage="[Required]" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:Button ID="btnSearch" runat="server" Text="Search!" /><br />
                <i>Example: San Diego, CA</i> or <i>90505</i> or <i>600 Ash St., San Diego</i>
            </asp:Panel>

            <asp:Label runat="server" ID="lblNoResults" Visible="false" ForeColor="Red" Font-Italic="true">The address you entered is not known or understood. Try simplifying the address, or enter just a city, region, or postal code...</asp:Label>

            <asp:ListView ID="lvDidYouMean" runat="server">
                <LayoutTemplate>
                    <div style="padding-left: 25px; margin-top: 10px;">
                        <b>Did you mean...</b>
                        <ol>
                            <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
                        </ol>
                    </div>
                </LayoutTemplate>

                <ItemTemplate>
                    <li>
                        <asp:HyperLink ID="lnkSelectDYM" runat="server"
                                       NavigateUrl='<%# String.Format("ShowJobLocations.aspx?Address={0}", Server.UrlEncode(Container.DataItem.ToString()))%>'
                                        Text='<%# Container.DataItem %>' />
                    </li>
                </ItemTemplate>
            </asp:ListView>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div id="googleMap" style="width:60%;height:30em; border-radius:5px;"></div>
</asp:Content>

