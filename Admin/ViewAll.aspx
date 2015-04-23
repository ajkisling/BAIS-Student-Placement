<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ViewAll.aspx.vb" Inherits="Admin_ViewAll" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>View All Users</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbo.StudentPlacement %>" SelectCommand="SELECT [FirstName], [LastName], [State], [City] FROM [UserProfile]"></asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:HyperLinkField DataNavigateUrlFields="UserID" DataNavigateUrlFormatString="UserDetails.aspx?UserID={0}" Text="Select" />
        </Columns>
    </asp:GridView>



</asp:Content>

