<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="JobDetails.aspx.vb" Inherits="User_JobDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource_JobDetails" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB2ConnectionString %>" 
        SelectCommand="SELECT [Company].[CompanyName], 
                            [JobTitle].[JobTitle], 
                            [JobType].[JobType], 
                            [AddJob].[JobSkill1], 
                            [AddJob].[JobSkill2], 
                            [AddJob].[JobSkill3],
                            [AddJob].[JobDescription],  
                            [Majors].[ProgramDesc],
                            [AddJob].[Internship], 
                            [AddJob].[PaidIntern],
                            [AcademicTerm].[SHORT_DESCR],
                            [AddJob].[JobID], 
                            [AddJob].[CompanyID], 
                            [AddJob].[JobTitleID], 
                            [AddJob].[ProgramID], 
                            [AddJob].[TermID],
                            [AddJob].[JobTypeID], 
                            [AddJob].[UserID]
                    FROM [AddJob], [Majors], [Company], [JobTitle], [JobType], [AcademicTerm]
                    WHERE ([AddJob].[JobID] = @JobID) 
                        and [AddJob].[CompanyID]=[Company].[CompanyID]
                        and [AddJob].[JobTitleID]=[JobTitle].[JobTitleID]
                        and [AddJob].[JobTypeID]=[JobType].[JobTypeID]
                        and [AddJob].[ProgramID]=[Majors].[ProgramID]
                        and [AddJob].[TermID]=[AcademicTerm].[TermID]">
        <SelectParameters>
            <asp:QueryStringParameter Name="JobID" QueryStringField="JobID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_EditJobDetails" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB2ConnectionString %>" 
       
        DeleteCommand="DELETE FROM [AddJob] WHERE [JobID] = @JobID" 
        InsertCommand="INSERT INTO [AddJob] ([CompanyID], [JobTitleID], [ProgramID], [TermID], [JobTypeID], [JobDescription], [JobSkill1], [JobSkill2], [JobSkill3], [UserID], [Internship], [PaidIntern]) VALUES (@CompanyID, @JobTitleID, @ProgramID, @TermID, @JobTypeID, @JobDescription, @JobSkill1, @JobSkill2, @JobSkill3, @UserID, @Internship, @PaidIntern)" 
        SelectCommand="SELECT [JobID], [CompanyID], [JobTitleID], [ProgramID], [TermID], [JobTypeID], [JobDescription], [JobSkill1], [JobSkill2], [JobSkill3], [UserID], [Internship], [PaidIntern] FROM [AddJob] WHERE ([JobID] = @JobID)" 
        UpdateCommand="UPDATE [AddJob] SET [CompanyID] = @CompanyID, [JobTitleID] = @JobTitleID, [ProgramID] = @ProgramID, [TermID] = @TermID, [JobTypeID] = @JobTypeID, [JobDescription] = @JobDescription, [JobSkill1] = @JobSkill1, [JobSkill2] = @JobSkill2, [JobSkill3] = @JobSkill3, [UserID] = @UserID, [Internship] = @Internship, [PaidIntern] = @PaidIntern WHERE [JobID] = @JobID">
        
        <DeleteParameters>
            <asp:Parameter Name="JobID" Type="Int32" />
        </DeleteParameters>
        
        <InsertParameters>
            <asp:Parameter Name="CompanyID" Type="Int32" />
            <asp:Parameter Name="JobTitleID" Type="Int32" />
            <asp:Parameter Name="ProgramID" Type="Int32" />
            <asp:Parameter Name="TermID" Type="Int32" />
            <asp:Parameter Name="JobTypeID" Type="Int32" />
            <asp:Parameter Name="JobDescription" Type="String" />
            <asp:Parameter Name="JobSkill1" Type="String" />
            <asp:Parameter Name="JobSkill2" Type="String" />
            <asp:Parameter Name="JobSkill3" Type="String" />
            <asp:Parameter Name="UserID" Type="Object" />
            <asp:Parameter Name="Internship" Type="String" />
            <asp:Parameter Name="PaidIntern" Type="String" />
        </InsertParameters>
        
        <SelectParameters>
            <asp:QueryStringParameter Name="JobID" QueryStringField="JobID" Type="Int32" />
        </SelectParameters>
        
        <UpdateParameters>
            <asp:Parameter Name="CompanyID" Type="Int32" />
            <asp:Parameter Name="JobTitleID" Type="Int32" />
            <asp:Parameter Name="ProgramID" Type="Int32" />
            <asp:Parameter Name="TermID" Type="Int32" />
            <asp:Parameter Name="JobTypeID" Type="Int32" />
            <asp:Parameter Name="JobDescription" Type="String" />
            <asp:Parameter Name="JobSkill1" Type="String" />
            <asp:Parameter Name="JobSkill2" Type="String" />
            <asp:Parameter Name="JobSkill3" Type="String" />
            <asp:Parameter Name="UserID" Type="Object" />
            <asp:Parameter Name="Internship" Type="String" />
            <asp:Parameter Name="PaidIntern" Type="String" />
            <asp:Parameter Name="JobID" Type="Int32" />
        </UpdateParameters>
    
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_CompanyEdit" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB2ConnectionString %>" 
            SelectCommand="SELECT [CompanyID], [CompanyName] FROM [Company]">
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
                </tr>
                <tr>
                    <td align="right">Title:  </td>
                    <td align="left"><asp:TextBox ID="tb_JobTitle" runat="server" Text='<%# Bind("JobTitle") %>' /></td>
                </tr>
                <tr>
                    <td align="right">Type:  </td>
                    <td align="left"><asp:TextBox ID="tb_JobType" runat="server" Text='<%# Bind("JobType") %>' /></td>
                </tr>
                <tr>
                    <td align="right">Skill 1:  </td>
                    <td align="left"><asp:TextBox ID="tb_JobSkill1" runat="server" Text='<%# Bind("JobSkill1") %>' /></td>
                </tr>
                <tr>
                    <td align="right">Skill 2:  </td>
                    <td align="left"><asp:TextBox ID="tb_JobSkill2" runat="server" Text='<%# Bind("JobSkill2") %>' /></td>
                </tr>
                <tr>
                    <td align="right">Skill 3:  </td>
                    <td align="left"><asp:TextBox ID="tb_JobSkill3" runat="server" Text='<%# Bind("JobSkill3") %>' /></td>
                </tr>
                <tr>
                    <td align="right">Description:  </td>
                    <td align="left"><asp:TextBox ID="tb_JobDescription" runat="server" Text='<%# Bind("JobDescription") %>' /></td>
                </tr>
                <tr>
                    <td align="right">Major:  </td>
                    <td align="left"><asp:TextBox ID="tb_ProgramDesc" runat="server" Text='<%# Bind("ProgramDesc") %>' /></td>
                </tr>
                <tr>
                    <td align="right">Internship:  </td>
                    <td align="left"><asp:TextBox ID="tb_Internship" runat="server" Text='<%# Bind("Internship") %>' /></td>
                </tr>
                <tr>
                    <td align="right">Paid:  </td>
                    <td align="left"><asp:TextBox ID="tb_PaidIntern" runat="server" Text='<%# Bind("PaidIntern") %>' /></td>
                </tr>
                <tr>
                    <td align="right">Semester:  </td>
                    <td align="left"><asp:TextBox ID="tb_SHORT_DESCR" runat="server" Text='<%# Bind("SHORT_DESCR") %>' /></td>
                </tr>
            </table>

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
                    <td align="left"><asp:Label ID="JobSkill1Label" runat="server" Text='<%# Bind("JobSkill1") %>' /></td>
                </tr>
                <tr>
                    <td align="right">Skill 2:  </td>
                    <td align="left"><asp:Label ID="JobSkill2Label" runat="server" Text='<%# Bind("JobSkill2") %>' /></td>
                </tr>
                <tr>
                    <td align="right">Skill 3:  </td>
                    <td align="left"><asp:Label ID="JobSkill3Label" runat="server" Text='<%# Bind("JobSkill3") %>' /></td>
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

        </ItemTemplate>

    </asp:FormView>

        <asp:Button ID="btn_EditJobDetails" runat="server" Text="Edit" CausesValidation="False" CommandName="Edit" CssClass="dropdown" />
        &nbsp;
        <asp:Button ID="btn_DeleteJob" runat="server" Text="Delete" CausesValidation="False" CommandName="Delete" OnClientClick="('Are you sure you want to delete this job?')" CssClass="dropdown" />

</asp:Content>

