<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AddJob.aspx.vb" Inherits="User_AddJob" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <asp:SqlDataSource ID="SqlDataSource_JobType" runat="server" ConnectionString="<%$ ConnectionStrings:dbo.StudentPlacement %>" SelectCommand="SELECT [JobTypeID], [JobType] FROM [JobType]"></asp:SqlDataSource>
    </p>
    <p>
        <asp:RadioButtonList ID="rbl_JobType" runat="server" DataSourceID="SqlDataSource_JobType" DataTextField="JobType" DataValueField="JobTypeID">
        </asp:RadioButtonList>
        <asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
    </p>
    <p>
    </p>
</asp:Content>

