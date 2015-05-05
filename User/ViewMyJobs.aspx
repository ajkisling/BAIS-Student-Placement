<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ViewMyJobs.aspx.vb" Inherits="User_ViewMyJobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
      
    
    <script type="text/javascript">
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
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="JobID" DataSourceID="SqlDataSource_ViewMyJobs">
        <Columns>
            <asp:BoundField DataField="JobID" HeaderText="Job ID" InsertVisible="False" ReadOnly="True" SortExpression="JobID" />
            <asp:BoundField DataField="CompanyName" HeaderText="Company Name" SortExpression="CompanyName" />
            <asp:BoundField DataField="JobTitle" HeaderText="Job Title" SortExpression="JobTitle" />
            <asp:BoundField DataField="Internship" HeaderText="Internship" SortExpression="Internship" />
            <asp:HyperLinkField DataNavigateUrlFields="JobID" DataNavigateUrlFormatString="JobDetails.aspx?JobID={0}" Text="Select" />
        </Columns>
    </asp:GridView>
     <h2>Iowa City, Iowa</h2>
   
   <div id="my_map" style="width:50em;height:20em"></div>
   
   <p>
      You are viewing a map of Iowa City!
   </p>
    <script type="text/javascript">
        init_map('my_map', 41.6611277, -91.5301683, 10);

        var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

        var marker = new google.maps.Marker({
            position: myLatlng,
            map: map,
            title: 'Hello World!'
        });
    
        
        
        
        </script>

  
    
    
    
    
    
    
    
    
    <asp:SqlDataSource ID="SqlDataSource_ViewMyJobs" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB2ConnectionString %>" 
        SelectCommand="SELECT AddJob.JobID, Company.CompanyName, JobTitle.JobTitle, JobType.JobType, AddJob.Internship FROM AddJob INNER JOIN Company ON AddJob.CompanyID = Company.CompanyID INNER JOIN JobTitle ON AddJob.JobTitleID = JobTitle.JobTitleID INNER JOIN JobType ON AddJob.JobTypeID = JobType.JobTypeID">
    </asp:SqlDataSource>
</asp:Content>

