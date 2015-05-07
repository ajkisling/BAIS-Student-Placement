<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="JobDetails.aspx.vb" Inherits="User_JobDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
        <script>
  var myCenter=new google.maps.LatLng(51.508742,-0.120850);

        function initialize()
        {
            var mapProp = {
                center:myCenter,
                zoom:5,
                mapTypeId:google.maps.MapTypeId.ROADMAP
            };

            var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);

            var marker=new google.maps.Marker({
                position:myCenter,
            });

            marker.setMap(map);
        }

        google.maps.event.addDomListener(window, 'load', initialize);

    </script>
    <script type="text/javascript">
        function init_map(map_canvas_id, lat, lng, zoomLevel) {
            var myLatLng = new google.maps.LatLng(41.6611277,-91.5301683);
            var options = {
                zoom: zoomLevel,
                center: myLatLng,
                mapTypeId: google.maps.MapTypeId.ROADMAP};
            var map_canvas = document.getElementById(map_canvas_id);
            var map = new google.maps.Map(map_canvas, options);}
   </script>
    <style type="text/css">
        .auto-style1 {
            height: 27px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource ID="SqlDataSource_JobDetails" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB2ConnectionString %>" 

        DeleteCommand="DELETE FROM [AddJob] WHERE [JobID] = @JobID" 
                
        UpdateCommand="UPDATE AddJob SET CompanyID = @CompanyID, JobTitleID = @JobTitleID, ProgramID = @ProgramID, TermID = @TermID, JobTypeID = @JobTypeID, JobDescription = @JobDescription, JobSkill1 = @JobSkill1, JobSkill2 = @JobSkill2, JobSkill3 = @JobSkill3, Internship = @Internship, PaidIntern = @PaidIntern WHERE (JobID = @JobID)"

        SelectCommand="SELECT AddJob.JobID, 
                            AddJob.CompanyID, Company.CompanyName, Company.CompanyAddress, Company.CompanyCity, Company.CompanyZip, Company.State,
                            AddJob.JobTitleID, JobTitle.JobTitle, 
                            AddJob.JobTypeID, JobType.JobType, 
                            AddJob.JobSkill1, jsd1.JobSkillDescription AS JobSkillDescription1,
                            AddJob.JobSkill2, jsd2.JobSkillDescription AS JobSkillDescription2,
                            AddJob.JobSkill3, jsd3.JobSkillDescription AS JobSkillDescription3,
                            AddJob.JobDescription, 
                            AddJob.ProgramID, Majors.ProgramDesc, 
                            AddJob.Internship, AddJob.PaidIntern, 
                            AddJob.TermID, AcademicTerm.SHORT_DESCR  
                            FROM (Select JobSkills.JobSkillDescription FROM AddJob, JobSkills WHERE AddJob.JobID=@JobID AND AddJob.JobSkill1=JobSkills.JobSkill1) jsd1,
                                (Select JobSkills.JobSkillDescription FROM AddJob, JobSkills WHERE AddJob.JobID=@JobID AND AddJob.JobSkill2=JobSkills.JobSkill1) jsd2,
                                (Select JobSkills.JobSkillDescription FROM AddJob, JobSkills WHERE AddJob.JobID=@JobID AND AddJob.JobSkill3=JobSkills.JobSkill1) jsd3,
                                AddJob LEFT OUTER JOIN JobType ON AddJob.JobTypeID = JobType.JobTypeID 
                                LEFT OUTER JOIN AcademicTerm ON AddJob.TermID = AcademicTerm.TermID 
                                LEFT OUTER JOIN Majors ON AddJob.ProgramID = Majors.ProgramID 
                                LEFT OUTER JOIN Company ON AddJob.CompanyID = Company.CompanyID 
                                LEFT OUTER JOIN JobTitle ON AddJob.JobTitleID = JobTitle.JobTitleID
                            WHERE (AddJob.JobID = @JobID)">

        <SelectParameters>
            <asp:QueryStringParameter Name="JobID" QueryStringField="JobID" Type="Int32" />
        </SelectParameters>
        
        <DeleteParameters>
            <asp:Parameter Name="JobID" Type="Int32" />
        </DeleteParameters>
        
        <UpdateParameters>
            <asp:Parameter Name="CompanyID" Type="Int32" />
            <asp:Parameter Name="JobTitleID" Type="Int32" />
            <asp:Parameter Name="ProgramID" Type="Int32" />
            <asp:Parameter Name="TermID" Type="Int32" />
            <asp:Parameter Name="JobTypeID" Type="Int32" />
            <asp:Parameter Name="JobDescription" Type="String" />
            <asp:Parameter Name="JobSkill1" Type="Int32" />
            <asp:Parameter Name="JobSkill2" Type="Int32" />
            <asp:Parameter Name="JobSkill3" Type="Int32" />
            <asp:Parameter Name="Internship" Type="String" />
            <asp:Parameter Name="PaidIntern" Type="String" />
            <asp:QueryStringParameter Name="JobID" QueryStringField="JobID" Type="Int32" />
        </UpdateParameters>

    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource_CompanyEdit" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB2ConnectionString %>" 
            SelectCommand="SELECT [CompanyID], [CompanyName] FROM [Company]">
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSource_EditJobType" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB2ConnectionString %>" 
        SelectCommand="SELECT [JobTypeID], [JobType] FROM [JobType]">
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSource_EditJobTitle" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB2ConnectionString %>" 
        SelectCommand="SELECT [JobTitleID], [JobTitle] FROM [JobTitle]">
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSource_EditMajor" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB2ConnectionString %>" 
        SelectCommand="SELECT [ProgramID], [ProgramDesc] FROM [Majors]">
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSource_EditJobSkills" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB2ConnectionString %>" 
        SelectCommand="SELECT [JobSkill1], [JobSkill2], [JobSkill3], [JobSkillDescription] FROM [JobSkills]">
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSource_EditAcademicTerm" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB2ConnectionString %>" 
        SelectCommand="SELECT [SHORT_DESCR], [TermID] FROM [AcademicTerm]">
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSource_rblInternship" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB2ConnectionString %>" 
        SelectCommand="SELECT DISTINCT [Internship] FROM [AddJob] WHERE Internship is not null ORDER BY Internship DESC">
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSource_rblPaidIntern" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB2ConnectionString %>" 
        SelectCommand="SELECT DISTINCT [PaidIntern] FROM [AddJob] WHERE ([PaidIntern] IS NOT NULL) ORDER BY PaidIntern DESC">
    </asp:SqlDataSource>
    
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="JobID" DataSourceID="SqlDataSource_JobDetails" Width="746px">

        <EditItemTemplate>

            <table id="jobEdit">
                <tr>
                    <th>Job ID:  </th>
                    <td><asp:Label ID="JobID" runat="server" enabled="false" Text='<%# Bind("JobID")%>' DataValueField="JobID" /></td>
                </tr>

                <tr>
                    <th>Company:  </th>
                    <td>
                        <asp:DropDownList ID="ddl_CompanyEdit" runat="server" DataSourceID="SqlDataSource_CompanyEdit" CssClass="dropdown"
                            DataTextField="CompanyName" DataValueField="CompanyID" SelectedValue='<%# Bind("CompanyID")%>'></asp:DropDownList>
                            <br />
                            <asp:Label ID="lbl_CompanyAddressEdit" runat="server" Text='<%# Bind("CompanyAddress")%>' ></asp:Label>
                            <br />
                            <asp:Label ID="lbl_CompanyCityEdit" runat="server" Text='<%# Bind("CompanyCity")%>' ></asp:Label>, 
                            <asp:Label ID="lbl_StateEdit" runat="server" Text='<%# Bind("State")%>' ></asp:Label>
                            &nbsp<asp:Label ID="lbl_CompanyZipEdit" runat="server" Text='<%# Bind("CompanyZip")%>' ></asp:Label>
                    </td>
                </tr>

                <tr>
                    <th>Title:  </th>
                    <td>
                        <asp:DropDownList ID="ddl_EditJobTitle" runat="server" DataSourceID="SqlDataSource_EditJobTitle" CssClass="dropdown"
                            DataValueField="JobTitleID" DataTextField="JobTitle" SelectedValue='<%# Bind("JobTitleID")%>'>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <th>Type:  </th>
                    <td>
                        <asp:DropDownList ID="ddl_EditJobType" runat="server" DataSourceID="SqlDataSource_EditJobType" CssClass="dropdown"
                            DataValueField="JobTypeID" DataTextField="JobType" SelectedValue='<%# Bind("JobTypeID")%>'>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <th>Skills:  </th>
                    <td>
                        <asp:DropDownList ID="ddl_EditJobSkill1" runat="server" DataSourceID="SqlDataSource_EditJobSkills" CssClass="dropdown"
                            DataValueField="JobSkill1" DataTextField="JobSkillDescription" SelectedValue='<%# Bind("JobSkill1")%>'>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <th></th>
                    <td>
                        <asp:DropDownList ID="ddl_EditJobSkill2" runat="server" DataSourceID="SqlDataSource_EditJobSkills" CssClass="dropdown"
                             DataValueField="JobSkill2" DataTextField="JobSkillDescription" SelectedValue='<%# Bind("JobSkill2")%>'>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <th></th>
                    <td>
                        <asp:DropDownList ID="ddl_EditJobSkill3" runat="server" DataSourceID="SqlDataSource_EditJobSkills" CssClass="dropdown"
                             DataValueField="JobSkill3" DataTextField="JobSkillDescription" SelectedValue='<%# Bind("JobSkill3")%>'>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <th>Description:  </th>
                    <td><asp:TextBox ID="tb_JobDescription" runat="server" rows="5" Width="400px" CssClass="textbox" TextMode="MultiLine" DataValueField="JobDescription"
                        Wrap="true"  Text ='<%# Bind("JobDescription") %>' /></td>
                </tr>
                <tr>
                    <th>Major:  </th>
                    <td>
                        <asp:DropDownList ID="ddl_EditMajor" runat="server" DataSourceID="SqlDataSource_EditMajor" CssClass="dropdown"
                            DataTextField="ProgramDesc" DataValueField="ProgramID" SelectedValue='<%# Bind("ProgramID")%>'>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <th>Internship:  </th>
                    <td>
                        <asp:RadioButtonList ID="rbl_EditInternYesNo" runat="server" DataSourceID="SqlDataSource_rblInternship" RepeatDirection="Horizontal" 
                            SelectedValue='<%# Bind("Internship")%>' RepeatLayout="Flow" DataValueField="Internship" DataTextField="Internship">
                            <asp:listitem id="Yes" runat="server" value="Yes" />
                            <asp:listitem id="No" runat="server" value="No" />
                        </asp:RadioButtonList>
                    </td>
                </tr>

                <tr>
                    <th>Paid:  </th>
                    <td>
                        <asp:RadioButtonList ID="rbl_EditPaidInternYesNo" runat="server" DataSourceID="SqlDataSource_rblPaidIntern" RepeatDirection="Horizontal" 
                            RepeatLayout="Flow" SelectedValue='<%# Bind("PaidIntern")%>' DataValueField="PaidIntern" DataTextField="PaidIntern" >
                            <asp:listitem id="Listitem1" runat="server" value="Yes" />
                            <asp:listitem id="Listitem2" runat="server" value="No" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <th>Semester:  </td>
                    <td><asp:DropDownList ID="ddl_AcademicTerm" runat="server" DataSourceID="SqlDataSource_EditAcademicTerm" CssClass="dropdown"
                            DataTextField="SHORT_DESCR" DataValueField="TermID" SelectedValue='<%# Bind("TermID")%>' >
                        </asp:DropDownList>
                    </td>
                </tr>
            
                <tr>
                    <th colspan="2"><asp:Button ID="btn_UpdateJob" runat="server" CausesValidation="true" CommandName="Update" Text="Update" CssClass="button" />
                    <asp:Button ID="btn_CancelJobUpdate" runat="server" CausesValidation="true" CommandName="Cancel" Text="Cancel" CssClass="button" /></th>
                </tr>

            </table>

            

            

        </EditItemTemplate>

        <InsertItemTemplate>

        </InsertItemTemplate>

        <ItemTemplate>

            <table id="details">
                <tr>
                    <th>Job ID:  </th>
                    <td><asp:Label ID="JobID" runat="server" Text='<%# Bind("JobID")%>' /></td>
                </tr>
                
                <tr>
                    <th>Company:  </th>
                    <td><asp:Label ID="CompanyNameLabel" runat="server" Text='<%# Bind("CompanyName") %>' />
                        <br />
                        <asp:Label ID="lbl_CompanyAddress" runat="server" Text='<%# Bind("CompanyAddress")%>' />
                        <br />
                        <asp:Label ID="lbl_CompanyCity" runat="server" Text='<%# Bind("CompanyCity")%>' />, 
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("State")%>' />&nbsp
                        <asp:Label ID="lbl_CompanyZip" runat="server" Text='<%# Bind("CompanyZip")%>' />
                    </td>
                </tr>

                <tr>
                    <th>Title:  </th>
                    <td><asp:Label ID="JobTitleLabel" runat="server" Text='<%# Bind("JobTitle") %>' /></td>
                </tr>
                <tr>
                    <th>Type:  </th>
                    <td><asp:Label ID="JobTypeLabel" runat="server" Text='<%# Bind("JobType") %>' /></td>
                </tr>
                <tr>
                    <th>Skills:  </th>
                    <td><asp:Label ID="JobSkill1Label" runat="server" Text='<%# Bind("JobSkillDescription1")%>' />    
                    <br />
                    <asp:Label ID="JobSkill2Label" runat="server" Text='<%# Bind("JobSkillDescription2")%>' />  
                    <br />
                    <asp:Label ID="JobSkill3Label" runat="server" Text='<%# Bind("JobSkillDescription3")%>' /></td>   
                </tr>

                <tr>
                    <th>Description:  </th>
                    <td><asp:TextBox ID="tb_JobDescription" runat="server" CssClass="textbox" Width="400px" textmode="MultiLine" Wrap="true" ReadOnly="true" rows="5" Text ='<%# Bind("JobDescription") %>' /></td>
                </tr>
                <tr>
                    <th>Major:  </th>
                    <td><asp:Label ID="ProgramDescLabel" runat="server" Text='<%# Bind("ProgramDesc") %>' /></td>
                </tr>
                <tr>
                    <th>Internship:  </th>
                    <td><asp:Label ID="InternshipLabel" runat="server" Text='<%# Bind("Internship") %>' /></td>
                </tr>
                <tr>
                    <th>Paid:  </th>
                    <td><asp:Label ID="PaidInternLabel" runat="server" Text='<%# Bind("PaidIntern") %>' /></td>
                </tr>
                <tr>
                    <th>Semester:  </th>
                    <td><asp:Label ID="SHORT_DESCRLabel" runat="server" Text='<%# Bind("SHORT_DESCR") %>' /></td>
                </tr>

                <tr>
                    <th colspan="2"><asp:Button ID="Button1" runat="server" Text="Edit" CausesValidation="False" CommandName="Edit" CssClass="button" />
                    <asp:Button ID="btn_DeleteJob" runat="server" Text="Delete" CausesValidation="False" CssClass="button" CommandName="Delete" OnClientClick="return confirm ('Are you sure you want to delete this job?')" /></th>
                </tr>

            </table>            

        </ItemTemplate>

    </asp:FormView>

    <div id="my_map" style="width:50em;height:20em"></div>
   
   <p>
      You are viewing a map of Iowa City!
   </p>
    
 <%--   <script type="text/javascript">
        init_map('my_map', 41.6611277, -91.5301683, 10);

        var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

        var marker = new google.maps.Marker({
            position: myLatlng,
            map: map,
            title: 'Hello World!'});
        </script>--%>

    <iframe width="600" height="450" frameborder="0" style="border:0" 
        src="https://www.google.com/maps/embed/v1/place?q=711%20High%20Street%2C%20Des%20Moines%2C%20IA%2C%20United%20States&key=AIzaSyCSvSuphj2pDdMeBD_K8XWAdD1EMG88hdo"></iframe>
<asp:Label ID="lbl_DeletedJob" runat="server" Text=""></asp:Label>

</asp:Content>

