<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ViewMyJobs.aspx.vb" Inherits="User_ViewMyJobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
      
    <script type="text/javascript">
        
        var markers =
            [
                {
                    title: "National Art Museum",
                    position: new google.maps.LatLng(19.4351262, -99.1334024)
                },
                {
                    title: "Viceroyal Painting Gallery",
                    position: new google.maps.LatLng(19.4331008, -99.1492114)
                },
                {
                    title: "Carmelitan Museum",
                    position: new google.maps.LatLng(19.3028860, -99.2352628)
                },
                {
                    title: "San Carlos Museum",
                    position: new google.maps.LatLng(19.3201515, -99.2265153)
                }
            ];

        function init_map(map_canvas_id, lat, lng, zoomLevel) {
            var myLatLng = new google.maps.LatLng(41.6611277,-91.5301683);
            var options = {
                zoom: zoomLevel,
                center: myLatLng,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var map_canvas = document.getElementById(map_canvas_id);
            var map = new google.maps.Map(map_canvas, options);
        }    
   </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="rnd1">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="JobID" DataSourceID="SqlDataSource_ViewMyJobs" 
        BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" CellSpacing="2" ForeColor="Black" CssClass="gv1" >
        <Columns>
            <asp:BoundField DataField="JobID" HeaderText="Job ID" InsertVisible="False" ReadOnly="True" SortExpression="JobID" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="CompanyName" HeaderText="Company Name" SortExpression="CompanyName" />
            <asp:BoundField DataField="JobTitle" HeaderText="Job Title" SortExpression="JobTitle" />
            <asp:BoundField DataField="Internship" HeaderText="Internship?" SortExpression="Internship" ItemStyle-HorizontalAlign="Center" />
            <asp:HyperLinkField DataNavigateUrlFields="JobID" DataNavigateUrlFormatString="JobDetails.aspx?JobID={0}" Text="Select" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
   </div>
     
   <h2>Iowa City, Iowa</h2>
   <div id="my_map" style="width:50em;height:20em"></div>
   
   <p>
      You are viewing a map of Iowa City!
   </p>
    <%--<script type="text/javascript">
        init_map('my_map', 41.6611277, -91.5301683, 10);

        var map = new google.maps.Map(document.getElementById('map-canvas'), Options);

        var marker = new google.maps.Marker({
            position: myLatlng,
            map: map,
            title: 'Hello World!'
        });
        </script>--%>

    <iframe src="https://www.google.com/maps/d/embed?mid=zmsRBQI0f6Io.kwRFYCutOcbE" width="640" height="480"></iframe>

    <asp:SqlDataSource ID="SqlDataSource_ViewMyJobs" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB2ConnectionString %>" 
        SelectCommand="SELECT AddJob.JobID, Company.CompanyName, JobTitle.JobTitle, JobType.JobType, AddJob.Internship FROM AddJob LEFT OUTER JOIN JobType ON AddJob.JobTypeID = JobType.JobTypeID LEFT OUTER JOIN JobTitle ON AddJob.JobTitleID = JobTitle.JobTitleID LEFT OUTER JOIN Company ON AddJob.CompanyID = Company.CompanyID">
    </asp:SqlDataSource>
</asp:Content>

