<%@ Page Language="VB" AutoEventWireup="false" CodeFile="roles.aspx.vb" Inherits="admin_site_mgr_roleManager" %>

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
	        <li class="currentPage"><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="./roles.aspx">Role Manager</asp:HyperLink></li>
	        <li><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="./users.aspx">View & Edit Users</asp:HyperLink></li>
	        <li><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="./add_user.aspx">Add New User</asp:HyperLink></li>
	        <li><asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="./users_by_role.aspx">View Users By Role</asp:HyperLink></li>
            <li><asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="../default.aspx">Return to Website</asp:HyperLink></li>
        </ul>

       
        <asp:GridView runat="server" ID="gv_userRoles" AutoGenerateColumns="false" 
            CssClass="cssGridView" AlternatingRowStyle-CssClass="odd" GridLines="none" >
	<Columns>
		<asp:TemplateField>
			<HeaderTemplate>Role Name</HeaderTemplate>
			<ItemTemplate>
				<%# Eval("Role Name") %>
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField>
			<HeaderTemplate>User Count</HeaderTemplate>
			<ItemTemplate>
				<%# Eval("User Count") %>
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField>
			<HeaderTemplate>Delete Role</HeaderTemplate>
			<ItemTemplate>
				<asp:Button ID="Button1" runat="server" OnCommand="DeleteRole" CommandName="DeleteRole" CommandArgument='<%# Eval("Role Name") %>' Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this role?')" />
            </ItemTemplate>
		</asp:TemplateField>
	</Columns>
</asp:GridView>


        <br />
        <asp:Label ID="lbl_roleMgr" runat="server" Text=""></asp:Label>
        <br />

        <div class="roleDiv">
        <asp:TextBox ID="tb_newRole" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btn_newRole" runat="server" Text="Add A New Role" />
        </div>
    </div>
    </form>
</body>
</html>
