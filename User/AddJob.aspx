<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AddJob.aspx.vb" Inherits="User_AddJob" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <asp:SqlDataSource ID="SqlDataSource_AddJob" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB2ConnectionString %>" 
            
            InsertCommand="INSERT INTO [AddJob] 
                           ([CompanyID], 
                            [JobTitleID], 
                            [ProgramID], 
                            [TermID], 
                            [JobTypeID], 
                            [JobDescription], 
                            [JobSkill1], 
                            [JobSkill2], 
                            [JobSkill3], 
                            [Internship], 
                            [PaidIntern]) 
                            VALUES (@CompanyID, @JobTitleID, @ProgramID, @TermID, @JobTypeID, @JobDescription, @JobSkill1, @JobSkill2, @JobSkill3, @Internship, @PaidIntern)" 
            
            SelectCommand="SELECT [JobID], [CompanyID], [JobTitleID], [ProgramID], [TermID], [JobTypeID], [JobDescription], [JobSkill1], [JobSkill2], [JobSkill3], [Internship], [PaidIntern] FROM [AddJob]"> 
                        
            <DeleteParameters>

            </DeleteParameters>
            
            <InsertParameters>
                <asp:Parameter Name="CompanyID" Type="Int32" />
                <asp:Parameter Name="JobTitleID" Type="Int32" />
                <asp:Parameter Name="ProgramID" Type="Int32" />
                <asp:Parameter Name="TermID" Type="Int32" />
                <asp:Parameter Name="JobTypeID" Type="Int32" />
                <asp:Parameter Name="JobDescription" Type="String" />
                <asp:Parameter Name="JobSkill1" Type="Int32" />
                <asp:Parameter Name="JobSkill2" Type="Int32" />
                <asp:Parameter Name="JobSkill3" Type="Int32" />
                <asp:Parameter Name="Internship" Type="Int32" />
                <asp:Parameter Name="PaidIntern" Type="Int32" />
            </InsertParameters>
           
             <UpdateParameters>

            </UpdateParameters>
        
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource_JobType" runat="server" ConnectionString="<%$ ConnectionStrings:dbo.StudentPlacement %>" 
            SelectCommand="SELECT [JobTypeID], [JobType] FROM [JobType]">
        </asp:SqlDataSource>
        
        <asp:SqlDataSource ID="SqlDataSource_Company" runat="server" ConnectionString="<%$ ConnectionStrings:dbo.StudentPlacement %>" 
            SelectCommand="SELECT [CompanyID], [CompanyName], [CompanyAddress], [CompanyCity], [CompanyZip], [StateID] FROM [Company]">
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource_AcademicTerm" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB2ConnectionString %>" 
            SelectCommand="SELECT [TermID], [SHORT_DESCR] FROM [AcademicTerm]">
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource_Major" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB2ConnectionString %>" 
            SelectCommand="SELECT [ProgramID], [ProgramDesc] FROM [Majors]">
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource_JobSkills" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB2ConnectionString %>" 
            SelectCommand="SELECT [JobSkill1], [JobSkill2], [JobSkill3], [JobSkillDescription] FROM [JobSkills]">
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource_JobTitle" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB2ConnectionString %>" 
            SelectCommand="SELECT [JobTitleID], [JobTitle] FROM [JobTitle]">
        </asp:SqlDataSource>

        <asp:FormView ID="FormView1" runat="server" DataKeyNames="JobID" DataSourceID="SqlDataSource_AddJob" DefaultMode="Insert">

            <EditItemTemplate>

            </EditItemTemplate>

            <InsertItemTemplate>

            <table id="jobAdd">

                <tr>
                    <th><asp:Label ID="lbl_CompanyDropDown" runat="server" Text="Company:   " Font-Bold="True"></asp:Label></th>
                    <td><asp:DropDownList ID="ddl_Company" runat="server" DataSourceID="SqlDataSource_Company" DataTextField="CompanyName" 
                        DataValueField="CompanyID" CssClass="dropdown" ></asp:DropDownList></td>                
                </tr>

                <tr>
                    <th><asp:Label ID="lbl_JobTitle" runat="server" Text="Title:   " Font-Bold="True"></asp:Label></th>
                    <td><asp:DropDownList ID="ddl_JobTitle" runat="server" CssClass="dropdown" DataSourceID="SqlDataSource_JobTitle" 
                        DataTextField="JobTitle" DataValueField="JobTitleID" ></asp:DropDownList></td>
                </tr>
                
                <tr>
                    <th><asp:Label ID="lbl_JobType" runat="server" Text="Job Type:   " Font-Bold="True"></asp:Label></th>
                    <td><asp:RadioButtonList ID="rbl_JobType" runat="server" DataSourceID="SqlDataSource_JobType" DataTextField="JobType" 
                        DataValueField="JobTypeID" RepeatLayout="Flow" RepeatDirection="Horizontal"></asp:RadioButtonList></td>
                </tr>

                <tr>
                    <th><asp:Label ID="lbl_AddJobSkills" runat="server" Text="Skills:  "></asp:Label></th>
                    <td><asp:DropDownList ID="ddl_JobSkill1" runat="server" CssClass="dropdown" DataSourceID="SqlDataSource_JobSkills" 
                        DataTextField="JobSkillDescription" DataValueField="JobSkill1" ></asp:DropDownList></td>                
                </tr>

                <tr>
                    <th></th>
                    <td><asp:DropDownList ID="ddl_JobSkill2" runat="server" CssClass="dropdown" DataSourceID="SqlDataSource_JobSkills" 
                        DataTextField="JobSkillDescription" DataValueField="JobSkill2" ></asp:DropDownList></td>
                </tr>

                <tr>
                    <th></th>
                    <td><asp:DropDownList ID="ddl_JobSkill3" runat="server" CssClass="dropdown" DataSourceID="SqlDataSource_JobSkills" 
                        DataTextField="JobSkillDescription" DataValueField="JobSkill3" ></asp:DropDownList></td>
                </tr>

                <tr>
                    <th><asp:Label ID="lbl_JobDescription" runat="server" Text="Job Description:    " Style="vertical-align: top;" Font-Bold="True"></asp:Label></th>
                    <td><asp:TextBox ID="tb_JobDescription" runat="server" CssClass="dropdown" Height="125px" Width="350px" TextMode="MultiLine" ></asp:TextBox></td>
                </tr>

                <tr>
                    <th><asp:Label ID="lbl_Major" runat="server" Text="Major:   " Font-Bold="True"></asp:Label></th>
                    <td><asp:DropDownList ID="ddl_Major" runat="server" CssClass="dropdown" DataSourceID="SqlDataSource_Major" DataTextField="ProgramDesc" 
                        DataValueField="ProgramID"></asp:DropDownList></td>
                </tr>

                <tr>
                    <th><asp:Label ID="lbl_InternYesNo" runat="server" Text="Internship?  " Font-Bold="True"></asp:Label></th>          
                    <td><asp:RadioButtonList ID="rbl_InternYesNo" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:RadioButtonList></td>
                </tr>

                <tr>
                    <th><asp:Label ID="lbl_PaidInternYesNo" runat="server" Text="Paid?  " Font-Bold="True"></asp:Label></th>
                    <td><asp:RadioButtonList ID="rbl_PaidInternYesNo" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:RadioButtonList></td>
                </tr>

                <tr>
                    <th><asp:Label ID="lbl_AcademicTerm" runat="server" Text="Semester:   " Font-Bold="True"></asp:Label></th>
                    <td><asp:DropDownList ID="ddl_AcademicTerm" runat="server" CssClass="dropdown" DataSourceID="SqlDataSource_AcademicTerm" 
                        DataTextField="SHORT_DESCR" DataValueField="TermID"></asp:DropDownList></td>
                 </tr>

                <tr>
                    <th colspan="2"><asp:Button ID="btn_InsertJob" runat="server" CausesValidation="true" CommandName="Insert" Text="Add Job" CssClass="button" />
                    <asp:Button ID="btn_CancelJobAdd" runat="server" CausesValidation="true" CommandName="Cancel" Text="Cancel" CssClass="button"  /></th>
                </tr>

            </table>

            </InsertItemTemplate>

            <ItemTemplate>

            </ItemTemplate>

        </asp:FormView>

</asp:Content>

