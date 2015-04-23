<%@ Page Language="VB" AutoEventWireup="false" CodeFile="users_by_role.aspx.vb" Inherits="users_by_role" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" type="text/css" href="stylesheet.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="container">

        <ul id="nav">
            <li><asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="./default.aspx">Home</asp:HyperLink></li>
	        <li><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="./roles.aspx">Role Manager</asp:HyperLink></li>
	        <li><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="./users.aspx">View & Edit Users</asp:HyperLink></li>
	        <li><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="./add_user.aspx">Add New User</asp:HyperLink></li>
	        <li class="currentPage"><asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="./users_by_role.aspx">View Users By Role</asp:HyperLink></li>
            <li><asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="../default.aspx">Return to Website</asp:HyperLink></li>
        </ul>
        <br /><br /><br />
<div class="roleDiv">
    Role filter:

<asp:DropDownList ID="UserRoles" runat="server" AppendDataBoundItems="true" AutoPostBack="true">
<asp:ListItem>Show All</asp:ListItem>
</asp:DropDownList>

</div>


<asp:GridView runat="server" ID="Users" AutoGenerateColumns="false"
	 CssClass="cssGridView" AlternatingRowStyle-CssClass="odd" GridLines="none" 
	AllowSorting="true"
	>
<Columns>
	<asp:TemplateField>
		<HeaderTemplate>User Name</HeaderTemplate>
		<ItemTemplate>
		<a href="edit_user.aspx?username=<%# Eval("UserName") %>"><%# Eval("UserName") %></a>
		</ItemTemplate>
	</asp:TemplateField>
	<asp:BoundField DataField="email" HeaderText="Email" />
	<asp:BoundField DataField="comment" HeaderText="Comments" />
	<asp:BoundField DataField="creationdate" HeaderText="Creation Date" />
	<asp:BoundField DataField="lastlogindate" HeaderText="Last Login Date" />
	<asp:BoundField DataField="lastactivitydate" HeaderText="Last Activity Date" />
	<asp:BoundField DataField="isapproved" HeaderText="Is Active" />
	<asp:BoundField DataField="isonline" HeaderText="Is Online" />
	<asp:BoundField DataField="islockedout" HeaderText="Is Locked Out" />
</Columns>
</asp:GridView>
    </div>
    </form>
</body>
</html>
