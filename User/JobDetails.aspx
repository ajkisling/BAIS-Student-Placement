<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="JobDetails.aspx.vb" Inherits="User_JobDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource ID="SqlDataSource_JobDetails" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB2ConnectionString %>" 

        DeleteCommand="DELETE FROM [AddJob] WHERE [JobID] = @JobID" 
                
        UpdateCommand="UPDATE [AddJob] 
                        SET [CompanyID] = @CompanyID, 
                            [JobTitleID] = @JobTitleID, 
                            [ProgramID] = @ProgramID, 
                            [TermID] = @TermID, 
                            [JobTypeID] = @JobTypeID, 
                            [JobDescription] = @JobDescription, 
                            [JobSkill1] = @JobSkill1, 
                            [JobSkill2] = @JobSkill2, 
                            [JobSkill3] = @JobSkill3, 
                            [Internship] = @Internship, 
                            [PaidIntern] = @PaidIntern 
                            WHERE [JobID] = @JobID"

        SelectCommand="SELECT Company.CompanyName, 
                        JobTitle.JobTitle, 
                        JobType.JobType,  
                        AddJob.JobSkill1, 
                        AddJob.JobSkill2, 
                        AddJob.JobSkill3, 
                        JobSkills.JobSkillDescription,  
                        AddJob.JobDescription, 
                        Majors.ProgramDesc, 
                        AddJob.Internship, 
                        AddJob.PaidIntern, 
                        AcademicTerm.SHORT_DESCR, 
                        AddJob.JobID, 
                        AddJob.CompanyID, 
                        AddJob.JobTitleID, 
                        AddJob.ProgramID, 
                        AddJob.TermID, 
                        AddJob.JobTypeID, 
                        JobTitle.JobTitleID AS Expr1, 
                        Company.CompanyID AS Expr2, 
                        Majors.ProgramID AS Expr3, 
                        AcademicTerm.TermID AS Expr4, 
                        JobType.JobTypeID AS Expr5, 
                        JobSkills.JobSkill3 AS Expr6, 
                        JobSkills.JobSkill2 AS Expr7, 
                        JobSkills.JobSkill1 AS Expr8 
                    FROM AddJob LEFT OUTER JOIN JobSkills ON AddJob.JobSkill1 = JobSkills.JobSkill1 
                        LEFT OUTER JOIN JobType ON AddJob.JobTypeID = JobType.JobTypeID 
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
            <asp:Parameter Name="JobID" Type="Int32" />
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
    
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="JobID" DataSourceID="SqlDataSource_JobDetails">

        <EditItemTemplate>

            <table>
                <tr>
                    <td align="right">Job ID:  </td>
                    <td align="left"><asp:Label ID="JobID" runat="server" enabled="false" Text='<%# Bind("JobID")%>' /></td>
                </tr>

                <tr>
                    <td align="right">Company:  </td>
                    <td align="left">
                        <asp:DropDownList ID="ddl_CompanyEdit" runat="server" DataSourceID="SqlDataSource_CompanyEdit" 
                            DataTextField="CompanyName" DataValueField="CompanyID" SelectedValue='<%# Bind("CompanyID")%>'>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td align="right">Title:  </td>
                    <td align="left">
                        <asp:DropDownList ID="ddl_EditJobTitle" runat="server" DataSourceID="SqlDataSource_EditJobTitle"
                            DataValueField="JobTitleID" DataTextField="JobTitle" SelectedValue='<%# Bind("JobTitleID")%>'>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td align="right">Type:  </td>
                    <td align="left">
                        <asp:DropDownList ID="ddl_EditJobType" runat="server" DataSourceID="SqlDataSource_EditJobType"
                            DataValueField="JobTypeID" DataTextField="JobType" SelectedValue='<%# Bind("JobTypeID")%>'>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td align="right">Skill 1:  </td>
                    <td align="left">
                        <asp:DropDownList ID="ddl_EditJobSkill1" runat="server" DataSourceID="SqlDataSource_EditJobSkills"
                            DataValueField="JobSkill1" DataTextField="JobSkillDescription" SelectedValue='<%# Bind("JobSkill1")%>'>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td align="right">Skill 2:  </td>
                    <td align="left">
                        <asp:DropDownList ID="ddl_EditJobSkill2" runat="server" DataSourceID="SqlDataSource_EditJobSkills"
                             DataValueField="JobSkill2" DataTextField="JobSkillDescription" SelectedValue='<%# Bind("JobSkill2")%>'>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td align="right">Skill 3:  </td>
                    <td align="left">
                        <asp:DropDownList ID="ddl_EditJobSkill3" runat="server" DataSourceID="SqlDataSource_EditJobSkills"
                             DataValueField="JobSkill3" DataTextField="JobSkillDescription" SelectedValue='<%# Bind("JobSkill3")%>'>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td align="right">Description:  </td>
                    <td align="left"><asp:TextBox ID="tb_JobDescription" runat="server" Height="125px" Width="350px" TextMode="MultiLine" Text='<%# Bind("JobDescription") %>' /></td>
                </tr>
                <tr>
                    <td align="right">Major:  </td>
                    <td align="left">
                        <asp:DropDownList ID="ddl_EditMajor" runat="server" DataSourceID="SqlDataSource_EditMajor"
                            DataTextField="ProgramDesc" DataValueField="ProgramID" SelectedValue='<%# Bind("ProgramID")%>'>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td align="right">Internship:  </td>
                    <td align="left">
                        <asp:RadioButtonList ID="rbl_EditInternYesNo" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" DataValueField="Internship">
                            <asp:ListItem>Yes</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>

                <tr>
                    <td align="right">Paid:  </td>
                    <td align="left">
                        <asp:RadioButtonList ID="rbl_EditPaidInternYesNo" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" DataValueField="PaidIntern">
                            <asp:ListItem>Yes</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td align="right">Semester:  </td>
                    <td align="left"><asp:DropDownList ID="ddl_AcademicTerm" runat="server" DataSourceID="SqlDataSource_EditAcademicTerm"
                            DataTextField="SHORT_DESCR" DataValueField="TermID" SelectedValue='<%# Bind("TermID")%>'>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>

            <asp:Button ID="btn_UpdateJob" runat="server" CausesValidation="true" CommandName="Update" Text="Update" />

            <asp:Button ID="btn_CancelJobUpdate" runat="server" CausesValidation="true" CommandName="Cancel" Text="Cancel" />

        </EditItemTemplate>

        <InsertItemTemplate>

        </InsertItemTemplate>

        <ItemTemplate>
            
            <table>
                <tr>
                    <td align="right">Job ID:  </td>
                    <td align="left"><asp:Label ID="JobID" runat="server" Text='<%# Bind("JobID")%>' /></td>
                </tr>
                <tr>
                    <td align="right">Company:  </td>
                    <td align="left"><asp:Label ID="CompanyNameLabel" runat="server" Text='<%# Bind("CompanyName") %>' /></td>
                </tr>
                <tr>
                    <td align="right">Title:  </td>
                    <td align="left"><asp:Label ID="JobTitleLabel" runat="server" Text='<%# Bind("JobTitle") %>' /></td>
                </tr>
                <tr>
                    <td align="right">Type:  </td>
                    <td align="left"><asp:Label ID="JobTypeLabel" runat="server" Text='<%# Bind("JobType") %>' /></td>
                </tr>
                <tr>
                    <td align="right">Skill 1:  </td>
                    <td align="left"><asp:Label ID="JobSkill1Label" runat="server" Text='<%# Bind("JobSkill1")%>' /></td>                
                </tr>
                <tr>
                    <td align="right">Skill 2:  </td>
                    <td align="left"><asp:Label ID="JobSkill2Label" runat="server" Text='<%# Bind("JobSkill2")%>' /></td>
                </tr>
                <tr>
                    <td align="right">Skill 3:  </td>
                    <td align="left"><asp:Label ID="JobSkill3Label" runat="server" Text='<%# Bind("JobSkill3")%>' /></td>
                </tr>
                <tr>
                    <td align="right">Description:  </td>
                    <td align="left"><asp:Label ID="JobDescriptionLabel" runat="server" Text='<%# Bind("JobDescription") %>' /></td>
                </tr>
                <tr>
                    <td align="right">Major:  </td>
                    <td align="left"><asp:Label ID="ProgramDescLabel" runat="server" Text='<%# Bind("ProgramDesc") %>' /></td>
                </tr>
                <tr>
                    <td align="right">Internship:  </td>
                    <td align="left"><asp:Label ID="InternshipLabel" runat="server" Text='<%# Bind("Internship") %>' /></td>
                </tr>
                <tr>
                    <td align="right">Paid:  </td>
                    <td align="left"><asp:Label ID="PaidInternLabel" runat="server" Text='<%# Bind("PaidIntern") %>' /></td>
                </tr>
                <tr>
                    <td align="right">Semester:  </td>
                    <td align="left"><asp:Label ID="SHORT_DESCRLabel" runat="server" Text='<%# Bind("SHORT_DESCR") %>' /></td>
                </tr>
            </table>

            <asp:Button ID="btn_EditJobDetails" runat="server" Text="Edit" CausesValidation="False" CommandName="Edit" CssClass="dropdown" />
            &nbsp;
            <asp:Button ID="btn_DeleteJob" runat="server" Text="Delete" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm ('Are you sure you want to delete this job?')" CssClass="dropdown" />

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

