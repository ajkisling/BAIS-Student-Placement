<%@ Page Language="VB" AutoEventWireup="false" CodeFile="EditUser.aspx.vb" Inherits="edit_user" %>

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
	        <li class="currentPage"><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="./users.aspx">View & Edit Users</asp:HyperLink></li>
	        <li><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="./add_user.aspx">Add New User</asp:HyperLink></li>
	        <li><asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="./users_by_role.aspx">View Users By Role</asp:HyperLink></li>
            <li><asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="../default.aspx">Return to Website</asp:HyperLink></li>
        </ul>
        <div style="clear:both;"></div>
        <div class="roleDiv">
    <h3>Roles:</h3><h4>Click the "Edit User and Role Info" button below to change role membership.</h4>
<asp:CheckBoxList ID="UserRoles" runat="server" />
</div>
        <div class="roleDiv">
        <h3>Main Info:</h3>
<asp:DetailsView AutoGenerateRows="False" DataSourceID="MemberData"
  ID="UserInfo" runat="server" OnItemUpdating="UserInfo_ItemUpdating"
    
  >
  
<Fields>
	<asp:BoundField DataField="UserName" HeaderText="User Name" ReadOnly="True" HeaderStyle-Cssclass="label" ItemStyle-CssClass="detailitem">
	</asp:BoundField>
	<asp:BoundField DataField="Email" HeaderText="Email" HeaderStyle-Cssclass="label" ItemStyle-CssClass="detailitem"></asp:BoundField>
	<asp:BoundField DataField="Comment" HeaderText="Comment" HeaderStyle-Cssclass="label" ItemStyle-CssClass="detailitem"></asp:BoundField>
	<asp:CheckBoxField DataField="IsApproved" HeaderText="Active User" HeaderStyle-Cssclass="label" ItemStyle-CssClass="detailitem" />
	<asp:CheckBoxField DataField="IsLockedOut" HeaderText="Is Locked Out" ReadOnly="true" HeaderStyle-Cssclass="label" ItemStyle-CssClass="detailitem" />
	
	<asp:CheckBoxField DataField="IsOnline" HeaderText="Is Online" ReadOnly="True" HeaderStyle-Cssclass="label" ItemStyle-CssClass="detailitem" />
	<asp:BoundField DataField="CreationDate" HeaderText="CreationDate" ReadOnly="True"
	 HeaderStyle-Cssclass="label" ItemStyle-CssClass="detailitem"></asp:BoundField>
	<asp:BoundField DataField="LastActivityDate" HeaderText="LastActivityDate" ReadOnly="True" HeaderStyle-Cssclass="label" ItemStyle-CssClass="detailitem">
	</asp:BoundField>
	<asp:BoundField DataField="LastLoginDate" HeaderText="LastLoginDate" ReadOnly="True" HeaderStyle-Cssclass="label" ItemStyle-CssClass="detailitem">
	</asp:BoundField>
	<asp:BoundField DataField="LastLockoutDate" HeaderText="LastLockoutDate" ReadOnly="True" HeaderStyle-Cssclass="label" ItemStyle-CssClass="detailitem"></asp:BoundField>
	<asp:BoundField DataField="LastPasswordChangedDate" HeaderText="LastPasswordChangedDate"
	ReadOnly="True" HeaderStyle-Cssclass="label" ItemStyle-CssClass="detailitem"></asp:BoundField>
	
   <asp:CommandField ButtonType="button" ShowEditButton="true" EditText="Edit User and Role Info" />
</Fields>
</asp:DetailsView>
<div class="alert" style="padding: 5px;">
<asp:Literal ID="UserUpdateMessage" runat="server">&nbsp;</asp:Literal>
</div>
            <asp:Button ID="Button1" runat="server" Text="Unlock User" OnClick="UnlockUser" OnClientClick="return confirm('Click OK to unlock this user.')" />
&nbsp;&nbsp;&nbsp;
<asp:Button ID="Button2" runat="server" Text="Delete User" OnClick="DeleteUser" OnClientClick="return confirm('Are you sure you want to delete this user?')" />

        </div>

        
<asp:ObjectDataSource ID="MemberData" runat="server" DataObjectTypeName="System.Web.Security.MembershipUser" SelectMethod="GetUser" UpdateMethod="UpdateUser" TypeName="System.Web.Security.Membership">
	<SelectParameters>
		<asp:QueryStringParameter Name="username" QueryStringField="username" />
	</SelectParameters>
</asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
