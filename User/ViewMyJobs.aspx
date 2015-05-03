<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ViewMyJobs.aspx.vb" Inherits="User_ViewMyJobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
    <asp:SqlDataSource ID="SqlDataSource_ViewMyJobs" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB2ConnectionString %>" 
        SelectCommand="SELECT AddJob.JobID, Company.CompanyName, JobTitle.JobTitle, JobType.JobType, AddJob.Internship FROM AddJob INNER JOIN Company ON AddJob.CompanyID = Company.CompanyID INNER JOIN JobTitle ON AddJob.JobTitleID = JobTitle.JobTitleID INNER JOIN JobType ON AddJob.JobTypeID = JobType.JobTypeID">
    </asp:SqlDataSource>
</asp:Content>

