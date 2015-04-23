<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AddUser.aspx.vb" Inherits="admin_site_mgr_addUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="stylesheet.css" />
    <style type="text/css">
        .auto-style1 {
            text-align: right;
            height: 26px;
        }
        .auto-style2 {
            text-align: left;
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="container">

        <ul id="nav">
            <li><asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="./default.aspx">Home</asp:HyperLink></li>
	        <li><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="./roles.aspx">Role Manager</asp:HyperLink></li>
	        <li><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="./users.aspx">View & Edit Users</asp:HyperLink></li>
	        <li class="currentPage"><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="./add_user.aspx">Add New User</asp:HyperLink></li>
	        <li><asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="./users_by_role.aspx">View Users By Role</asp:HyperLink></li>
            <li><asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="../default.aspx">Return to Website</asp:HyperLink></li>
        </ul>
        <div style="clear:both;"><h2>Add A New User</h2></div>
        <div class="roleDiv">
        <h3>Choose Role(s):</h3>
        <asp:CheckBoxList ID="cbList_userRoles" runat="server"></asp:CheckBoxList>
        </div>
       
        <div class="roleDiv">
             <h3>User Info:</h3>

        <table>
            
            <tr>
	            <td class="auto-style1">* User Name:</td>
	            <td class="auto-style2">
		            <asp:TextBox ID="tb_username" runat="server"></asp:TextBox>
	            </td>
            </tr>

            <tr>
	            <td class="detailheader">* Password:</td>
	            <td class="detailuser">
		            <asp:TextBox ID="tb_password" runat="server"></asp:TextBox>
	            </td>
            </tr>

            <tr>
	            <td class="detailheader">* Email:</td>
	            <td class="detailuser">
		            <asp:TextBox ID="tb_email" runat="server"></asp:TextBox>
	            </td>
            </tr>
            <tr>
	            <td class="detailheader">* Password Reset Question:</td>
	            <td class="detailuser">
		            <asp:DropDownList ID="ddl_pwdQuestion" runat="server">
                           <asp:ListItem Value="-1">Select Question</asp:ListItem>
                           <asp:ListItem>What is your favorite color?</asp:ListItem>
                           <asp:ListItem>What is your favorite tree?</asp:ListItem>
                           <asp:ListItem>Are you happy today?</asp:ListItem>
                    </asp:DropDownList>
	            </td>
            </tr>

            <tr>
	            <td class="detailheader">* Password Reset Answer:</td>
	            <td class="detailuser">
		            <asp:TextBox ID="tb_answer" runat="server"></asp:TextBox>
	            </td>
            </tr>
            
            <tr>
	            <td class="detailheader">Comment:</td>
	            <td class="detailuser">
		            <asp:TextBox ID="tb_comment" runat="server"></asp:TextBox>
	            </td>
            </tr>

            <tr>
                <td class="detailheader">&nbsp;</td>
	            <td class="detailuser"><br /><asp:Button ID="btn_newUser" runat="server" Text="Create New User" /> &nbsp; <input type="reset" /></td>
             </tr>

            <tr>
	            <td colspan="2">
                    <asp:Label ID="lbl_addUser" runat="server" Text=""></asp:Label>
	            </td>
            </tr>
        
        </table>


            
            

        </div>
    </div>
    </form>
</body>
</html>
