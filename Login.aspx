<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Login ID="Login1" runat="server"></asp:Login>

    <asp:Label ID="Label1" runat="server" Text="Label">Username: admin Password: pAssw0rd!  (0 is a zero)</asp:Label>



</asp:Content>

