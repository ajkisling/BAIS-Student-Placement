<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AddJob.aspx.vb" Inherits="User_AddJob" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <asp:SqlDataSource ID="SqlDataSource_JobType" runat="server" ConnectionString="<%$ ConnectionStrings:dbo.StudentPlacement %>" SelectCommand="SELECT [JobTypeID], [JobType] FROM [JobType]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource_Company" runat="server" ConnectionString="<%$ ConnectionStrings:dbo.StudentPlacement %>" SelectCommand="SELECT [CompanyID], [CompanyName], [CompanyAddress], [CompanyCity], [CompanyZip], [StateID] FROM [Company]"></asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource_AcademicTerm" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB2ConnectionString %>" SelectCommand="SELECT [TermID], [SHORT_DESCR] FROM [AcademicTerm]"></asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource_Major" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB2ConnectionString %>" SelectCommand="SELECT [ProgramID], [ProgramDesc] FROM [Majors]"></asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource_JobSkills" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB2ConnectionString %>" SelectCommand="SELECT [JobSkillID], [JobSkillDescription] FROM [JobSkills]"></asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource_JobTitle" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB2ConnectionString %>" SelectCommand="SELECT [JobTitleID], [JobTitle] FROM [JobTitle]"></asp:SqlDataSource>

        <asp:Label ID="lbl_CompanyDropDown" runat="server" Text="Company:   " Font-Bold="True"></asp:Label>
        <asp:DropDownList ID="ddl_Company" runat="server" DataSourceID="SqlDataSource_Company" DataTextField="CompanyName" DataValueField="CompanyID" CssClass="dropdown" >
        </asp:DropDownList>
        
        <p>
        <br />
        <asp:Label ID="lbl_JobTitle" runat="server" Text="Title:   " Font-Bold="True"></asp:Label>
        <asp:DropDownList ID="ddl_JobTitle" runat="server" CssClass="dropdown" DataSourceID="SqlDataSource_JobTitle" DataTextField="JobTitle" DataValueField="JobTitleID">
        </asp:DropDownList>
        </p>
    
        <p>
            <asp:Label ID="lbl_JobType" runat="server" Text="Job Type:   " Font-Bold="True"></asp:Label>
            <asp:RadioButtonList ID="rbl_JobType" runat="server" DataSourceID="SqlDataSource_JobType" DataTextField="JobType" DataValueField="JobTypeID" RepeatLayout="Flow" RepeatDirection="Horizontal">
            </asp:RadioButtonList>
        </p>
        <br />
        <p>
            <asp:Label ID="lbl_AddJobSkills" runat="server" Text="Add Job Skills:  " Font-Bold="True"></asp:Label>
        </p>
        <p style="margin-left: 40px">
            <asp:Label ID="lbl_JobSkill1" runat="server" Text="1:   " Font-Bold="True"></asp:Label>
            <asp:DropDownList ID="ddl_JobSkill1" runat="server" CssClass="dropdown" DataSourceID="SqlDataSource_JobSkills" DataTextField="JobSkillDescription" DataValueField="JobSkillID">
            </asp:DropDownList>

        </p>
        <p style="margin-left: 40px">

            <asp:Label ID="lbl_JobSkill2" runat="server" Text="2:   " Font-Bold="True"></asp:Label>
            <asp:DropDownList ID="ddl_JobSkill2" runat="server" CssClass="dropdown" DataSourceID="SqlDataSource_JobSkills" DataTextField="JobSkillDescription" DataValueField="JobSkillID">
            </asp:DropDownList>
        </p>
        <p style="margin-left: 40px">
            <asp:Label ID="lbl_JobSkill3" runat="server" Text="3:   " Font-Bold="True"></asp:Label>
            <asp:DropDownList ID="ddl_JobSkill3" runat="server" CssClass="dropdown" DataSourceID="SqlDataSource_JobSkills" DataTextField="JobSkillDescription" DataValueField="JobSkillID">
            </asp:DropDownList>
        </p>
        <asp:Label ID="lbl_JobDescription" runat="server" Text="Job Description:    " Style="vertical-align: top;" Font-Bold="True"></asp:Label>
        <asp:TextBox ID="tb_JobDescription" runat="server" CssClass="dropdown" Height="125px" Width="350px" TextMode="MultiLine" ></asp:TextBox>

        <p>
        <br />
            <asp:Label ID="lbl_Major" runat="server" Text="Major:   " Font-Bold="True"></asp:Label>
            <asp:DropDownList ID="ddl_Major" runat="server" CssClass="dropdown" DataSourceID="SqlDataSource_Major" DataTextField="ProgramDesc" DataValueField="ProgramID">
            </asp:DropDownList>
        </p>
        <br />
        <p>
            <asp:Label ID="lbl_InternYesNo" runat="server" Text="Internship?  " Font-Bold="True"></asp:Label>            
            <asp:RadioButtonList ID="rbl_InternYesNo" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </asp:RadioButtonList>
        </p>

        <p>
            <asp:Label ID="lbl_PaidInternYesNo" runat="server" Text="Paid?  " Font-Bold="True"></asp:Label>
            <asp:RadioButtonList ID="rbl_PaidInternYesNo" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </asp:RadioButtonList>
        </p>
        <p>            
            <asp:Label ID="lbl_AcademicTerm" runat="server" Text="Semester Employed:   " Font-Bold="True"></asp:Label>
            <asp:DropDownList ID="ddl_AcademicTerm" runat="server" CssClass="dropdown" DataSourceID="SqlDataSource_AcademicTerm" DataTextField="SHORT_DESCR" DataValueField="TermID">
            </asp:DropDownList>
        </p>

</asp:Content>

