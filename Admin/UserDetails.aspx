﻿<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="UserDetails.aspx.vb" Inherits="Admin_UserDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>View, Edit and Delete Users</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">




    <asp:SqlDataSource ID="sql_UserProfile" runat="server" ConnectionString="<%$ ConnectionStrings:dbo.StudentPlacement %>" 
        
        DeleteCommand="DELETE FROM [aspnet_Users] WHERE [UserID] = @UserID"

        SelectCommand="SELECT UserProfile.FirstName, UserProfile.LastName, UserProfile.City, UserProfile.State, aspnet_Users.UserName, aspnet_Roles.RoleName, UserProfile.UserID FROM UserProfile INNER JOIN aspnet_Users ON UserProfile.UserID = aspnet_Users.UserId INNER JOIN aspnet_Roles ON aspnet_Users.ApplicationId = aspnet_Roles.ApplicationId"
    
        UpdateCommand="UPDATE [TR_UserProfile] SET [FirstName] = @FirstName, [LastName] = @LastName, [City] = @City, [State] = @State WHERE [UserID] = @UserID">

                <DeleteParameters>
            <asp:Parameter Name="UserID" Type="Object" />
        </DeleteParameters>
                
        <SelectParameters>
            <asp:QueryStringParameter Name="UserID" QueryStringField="UserID" />
        </SelectParameters>

        <UpdateParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" />
            <asp:Parameter Name="UserId" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="sql_State" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB2ConnectionString %>" SelectCommand="SELECT [StateAbbreviation] FROM [State]"></asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="UserID" DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            FirstName:
            <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' />
            <br />
            LastName:
            <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' />
            <br />
            City:
            <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
            <br />
            <asp:DropDownList ID="ddl_State" runat="server" DataSourceID="sql_State" DataTextField="State" DataValueField="State" SelectedValue='<%# Bind("State") %>'>
                </asp:DropDownList>
            <br />
            UserName:
            <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
            <br />
            RoleName:
            <asp:TextBox ID="RoleNameTextBox" runat="server" Text='<%# Bind("RoleName") %>' />
            <br />
            UserID:
            <asp:Label ID="UserIDLabel1" runat="server" Text='<%# Eval("UserID") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            FirstName:
            <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' />
            <br />
            LastName:
            <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' />
            <br />
            City:
            <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
            <br />
            State:
            <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
            <br />
            UserName:
            <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
            <br />
            RoleName:
            <asp:TextBox ID="RoleNameTextBox" runat="server" Text='<%# Bind("RoleName") %>' />
            <br />
            UserID:
            <asp:TextBox ID="UserIDTextBox" runat="server" Text='<%# Bind("UserID") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            FirstName:
            <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Bind("FirstName") %>' />
            <br />
            LastName:
            <asp:Label ID="LastNameLabel" runat="server" Text='<%# Bind("LastName") %>' />
            <br />
            City:
            <asp:Label ID="CityLabel" runat="server" Text='<%# Bind("City") %>' />
            <br />
            State:
            <asp:Label ID="StateLabel" runat="server" Text='<%# Bind("State") %>' />
            <br />
            UserName:
            <asp:Label ID="UserNameLabel" runat="server" Text='<%# Bind("UserName") %>' />
            <br />
            RoleName:
            <asp:Label ID="RoleNameLabel" runat="server" Text='<%# Bind("RoleName") %>' />
            <br />
            UserID:
            <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
            <br />

            <asp:Button ID="EditButton" runat="server" CausesValidation="false" CommandName="Edit" Text="Edit" />
            &nbsp;
            <asp:Button ID="DeleteButton" runat="server" CausesValidation="false" CommandName="Delete" Text="Delete" OnClientClick="return confirm ('Are you sure you want to delete this user record?')" /> 

        </ItemTemplate>
    </asp:FormView>

    <asp:Label ID="lbl_DeletedUser" runat="server" Text=""></asp:Label>




</asp:Content>

