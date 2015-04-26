<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ViewMyJobs.aspx.vb" Inherits="User_ViewMyJobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource_ViewMyJobs" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB2ConnectionString %>" SelectCommand="SELECT AddJob.JobID, AddJob.UserID, Company.CompanyName, JobTitle.JobTitle, JobType.JobType, Majors.ProgramDesc, AcademicTerm.SHORT_DESCR, AddJob.Internship, AddJob.PaidIntern, AddJob.JobSkill1, AddJob.JobSkill2, AddJob.JobSkill3, AddJob.JobDescription FROM AddJob INNER JOIN Company ON AddJob.CompanyID = Company.CompanyID INNER JOIN JobTitle ON AddJob.JobTitleID = JobTitle.JobTitleID INNER JOIN JobType ON AddJob.JobTypeID = JobType.JobTypeID INNER JOIN Majors ON AddJob.ProgramID = Majors.ProgramID INNER JOIN AcademicTerm ON AddJob.TermID = AcademicTerm.TermID"></asp:SqlDataSource>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="JobID" DataSourceID="SqlDataSource_ViewMyJobs">
    <Columns>
        <asp:BoundField DataField="CompanyName" HeaderText="Company Name" SortExpression="CompanyName" />
        <asp:BoundField DataField="JobTitle" HeaderText="Job Title" SortExpression="JobTitle" />
        <asp:BoundField DataField="JobType" HeaderText="Job Type" SortExpression="JobType" />
        <asp:BoundField DataField="ProgramDesc" HeaderText="Major" SortExpression="ProgramDesc" />
        <asp:BoundField DataField="SHORT_DESCR" HeaderText="Semester" SortExpression="SHORT_DESCR" />
        <asp:BoundField DataField="Internship" HeaderText="Internship?" SortExpression="Internship" />
        <asp:BoundField DataField="PaidIntern" HeaderText="Paid Internship?" SortExpression="PaidIntern" />
        <asp:CommandField ShowSelectButton="True" />
    </Columns>
</asp:GridView>
</asp:Content>

