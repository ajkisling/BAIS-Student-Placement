<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="JobTitleDetails.aspx.vb" Inherits="JobTitleDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="rnd1">
    <asp:FormView ID="FormView1" runat="server" AllowPaging="True" DataKeyNames="CompanyID" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333">
        <EditItemTemplate>
            CompanyName:
            <asp:TextBox ID="CompanyNameTextBox" runat="server" Text='<%# Bind("CompanyName") %>' />
            <br />
            State:
            <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
            <br />
            JobTitle:
            <asp:TextBox ID="JobTitleTextBox" runat="server" Text='<%# Bind("JobTitle") %>' />
            <br />
            JobType:
            <asp:TextBox ID="JobTypeTextBox" runat="server" Text='<%# Bind("JobType") %>' />
            <br />
            JobSkillDescription:
            <asp:TextBox ID="JobSkillDescriptionTextBox" runat="server" Text='<%# Bind("JobSkillDescription") %>' />
            <br />
            CompanyAddress:
            <asp:TextBox ID="CompanyAddressTextBox" runat="server" Text='<%# Bind("CompanyAddress") %>' />
            <br />
            CompanyCity:
            <asp:TextBox ID="CompanyCityTextBox" runat="server" Text='<%# Bind("CompanyCity") %>' />
            <br />
            CompanyZip:
            <asp:TextBox ID="CompanyZipTextBox" runat="server" Text='<%# Bind("CompanyZip") %>' />
            <br />
            CompanyID:
            <asp:Label ID="CompanyIDLabel1" runat="server" Text='<%# Eval("CompanyID") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
            CompanyName:
            <asp:TextBox ID="CompanyNameTextBox" runat="server" Text='<%# Bind("CompanyName") %>' />
            <br />
            State:
            <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
            <br />
            JobTitle:
            <asp:TextBox ID="JobTitleTextBox" runat="server" Text='<%# Bind("JobTitle") %>' />
            <br />
            JobType:
            <asp:TextBox ID="JobTypeTextBox" runat="server" Text='<%# Bind("JobType") %>' />
            <br />
            JobSkillDescription:
            <asp:TextBox ID="JobSkillDescriptionTextBox" runat="server" Text='<%# Bind("JobSkillDescription") %>' />
            <br />
            CompanyAddress:
            <asp:TextBox ID="CompanyAddressTextBox" runat="server" Text='<%# Bind("CompanyAddress") %>' />
            <br />
            CompanyCity:
            <asp:TextBox ID="CompanyCityTextBox" runat="server" Text='<%# Bind("CompanyCity") %>' />
            <br />
            CompanyZip:
            <asp:TextBox ID="CompanyZipTextBox" runat="server" Text='<%# Bind("CompanyZip") %>' />
            <br />

            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            CompanyName:
            <asp:Label ID="CompanyNameLabel" runat="server" Text='<%# Bind("CompanyName") %>' />
            <br />
            State:
            <asp:Label ID="StateLabel" runat="server" Text='<%# Bind("State") %>' />
            <br />
            JobTitle:
            <asp:Label ID="JobTitleLabel" runat="server" Text='<%# Bind("JobTitle") %>' />
            <br />
            JobType:
            <asp:Label ID="JobTypeLabel" runat="server" Text='<%# Bind("JobType") %>' />
            <br />
            JobSkillDescription:
            <asp:Label ID="JobSkillDescriptionLabel" runat="server" Text='<%# Bind("JobSkillDescription") %>' />
            <br />
            CompanyAddress:
            <asp:Label ID="CompanyAddressLabel" runat="server" Text='<%# Bind("CompanyAddress") %>' />
            <br />
            CompanyCity:
            <asp:Label ID="CompanyCityLabel" runat="server" Text='<%# Bind("CompanyCity") %>' />
            <br />
            CompanyZip:
            <asp:Label ID="CompanyZipLabel" runat="server" Text='<%# Bind("CompanyZip") %>' />
            <br />
            CompanyID:
            <asp:Label ID="CompanyIDLabel" runat="server" Text='<%# Eval("CompanyID") %>' />
            <br />

        </ItemTemplate>
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
    </asp:FormView>
    <br />
    <asp:Button Class="button" ID="btn_return" runat="server" Text="Return" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbo.StudentPlacement %>" SelectCommand="SELECT Company.CompanyName, Company.State, JobTitle.JobTitle, JobType.JobType, JobSkills.JobSkillDescription, Company.CompanyAddress, Company.CompanyCity, Company.CompanyZip, Company.CompanyID FROM AddJob INNER JOIN Company ON AddJob.CompanyID = Company.CompanyID INNER JOIN JobSkills ON AddJob.JobSkill1 = JobSkills.JobSkill1 INNER JOIN JobTitle ON AddJob.JobTitleID = JobTitle.JobTitleID INNER JOIN JobType ON AddJob.JobTypeID = JobType.JobTypeID WHERE (JobTitle.JobTitleID = JobTitle.JobTitleID)"></asp:SqlDataSource>

    </div>
</asp:Content>

