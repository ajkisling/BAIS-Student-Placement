<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="JobTitleDetails.aspx.vb" Inherits="JobTitleDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="Expr1" DataSourceID="SqlDataSource1" Height="50px" Width="125px">
        <Fields>
            <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" SortExpression="CompanyName" />
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
            <asp:BoundField DataField="JobTitle" HeaderText="JobTitle" SortExpression="JobTitle" />
            <asp:BoundField DataField="JobType" HeaderText="JobType" SortExpression="JobType" />
            <asp:BoundField DataField="JobSkillDescription" HeaderText="JobSkillDescription" SortExpression="JobSkillDescription" />
            <asp:BoundField DataField="CompanyAddress" HeaderText="CompanyAddress" SortExpression="CompanyAddress" />
            <asp:BoundField DataField="CompanyCity" HeaderText="CompanyCity" SortExpression="CompanyCity" />
            <asp:BoundField DataField="CompanyZip" HeaderText="CompanyZip" SortExpression="CompanyZip" />
        </Fields>
    </asp:DetailsView>
    <asp:Button ID="btn_return" runat="server" Text="Return" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbo.StudentPlacement %>" SelectCommand="SELECT Company.CompanyName, Company.State, JobTitle.JobTitle, JobType.JobType, JobSkills.JobSkillDescription, Company.CompanyAddress, Company.CompanyCity, Company.CompanyZip, Company.CompanyID AS Expr1 FROM AddJob INNER JOIN Company ON AddJob.CompanyID = Company.CompanyID INNER JOIN JobSkills ON AddJob.JobSkill1 = JobSkills.JobSkill1 INNER JOIN JobTitle ON AddJob.JobTitleID = JobTitle.JobTitleID INNER JOIN JobType ON AddJob.JobTypeID = JobType.JobTypeID WHERE (JobTitle.JobTitleID = JobTitle.JobTitleID)"></asp:SqlDataSource>


</asp:Content>

