<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ViewMyJobs.aspx.vb" Inherits="User_ViewMyJobs" %>

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
    
    <div class="rnd1">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="JobID" DataSourceID="SqlDataSource_ViewMyJobs" 
        BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" CellSpacing="2" ForeColor="Black" CssClass="gv1" >
        <Columns>
            <asp:BoundField DataField="JobID" HeaderText="Job ID" InsertVisible="False" ReadOnly="True" SortExpression="JobID" ItemStyle-HorizontalAlign="Center" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="CompanyName" HeaderText="Company Name" SortExpression="CompanyName" />
            <asp:BoundField DataField="JobTitle" HeaderText="Job Title" SortExpression="JobTitle" />
            <asp:BoundField DataField="Internship" HeaderText="Internship?" SortExpression="Internship" ItemStyle-HorizontalAlign="Center" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:HyperLinkField DataNavigateUrlFields="JobID" DataNavigateUrlFormatString="JobDetails.aspx?JobID={0}" Text="Select" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" Width="10px" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
   &nbsp;&nbsp;&nbsp;
   </div>
       <br />   
       <br />
  
            <div id="googleMap" style="width:60%;height:30em; border-radius:5px;"></div>
    <%--  <div id="googleMap" style="width:500px;height:380px; border-radius:5px;"></div>--%>
   
    <br /> 
       <br />
    <asp:SqlDataSource ID="SqlDataSource_ViewMyJobs" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB2ConnectionString %>" 
        SelectCommand="SELECT AddJob.JobID, Company.CompanyName, JobTitle.JobTitle, JobType.JobType, AddJob.Internship FROM AddJob LEFT OUTER JOIN JobType ON AddJob.JobTypeID = JobType.JobTypeID LEFT OUTER JOIN JobTitle ON AddJob.JobTitleID = JobTitle.JobTitleID LEFT OUTER JOIN Company ON AddJob.CompanyID = Company.CompanyID">
    </asp:SqlDataSource>
</asp:Content>

