<%@ Page Language="VB" AutoEventWireup="false" CodeFile="default.aspx.vb" Inherits="_default" %>

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
            <li class="currentPage"><asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="./default.aspx">Home</asp:HyperLink></li>
	        <li><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="./roles.aspx">Role Manager</asp:HyperLink></li>
	        <li><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="./users.aspx">View & Edit Users</asp:HyperLink></li>
	        <li><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="./add_user.aspx">Add New User</asp:HyperLink></li>
	        <li><asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="./users_by_role.aspx">View Users By Role</asp:HyperLink></li>
            <li><asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="../default.aspx">Return to Website</asp:HyperLink></li>
        </ul>
            <div style="clear:both;"></div>
        <div class="homeDiv">
       
           <p>To work around the jQuery error, put this immediately inside of the &lt;configuration&gt; tag in the root web.config file:</p>

            <asp:Image ID="Image1" runat="server" ImageUrl="./graphics/jquery_error.PNG" /><br /><br />

            <p>Enable role based security inside of the &lt;system.web&gt; tag:</p>

             <asp:Image ID="Image2" runat="server" ImageUrl="./graphics/enable_role_manager.PNG" /><br /><br />

            <p>Configure your connection string outside of the &lt;system.web&gt; tag:</p>

             <asp:Image ID="Image3" runat="server" ImageUrl="./graphics/connection_string.PNG" /><br /><br />

            

        </div>

        </div>
    </form>
</body>
</html>
