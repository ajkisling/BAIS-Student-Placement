Imports System.Data
Imports System.Data.SqlClient


Partial Class admin_site_mgr_roleManager
    Inherits System.Web.UI.Page

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender

        BindAllRoles()

        lbl_roleMgr.Text = String.Empty

        tb_newRole.Text = String.Empty

    End Sub

    Public Sub BindAllRoles()

        Dim RoleList As DataTable = New DataTable()

        RoleList.Columns.Add("Role Name")
        RoleList.Columns.Add("User Count")

        ' Get the list of roles in the system and how many users belong to each role
        Dim allRoles As String() = Roles.GetAllRoles()

        For Each roleName As String In allRoles
            Dim numberOfUsersInRole As Integer = Roles.GetUsersInRole(roleName).Length
            Dim roleRow As String() = {roleName, numberOfUsersInRole.ToString()}
            RoleList.Rows.Add(roleRow)
        Next

        ' Bind the DataTable to the GridView
        gv_userRoles.DataSource = RoleList
        gv_userRoles.DataBind()

        lbl_roleMgr.Text = String.Empty

    End Sub


    Protected Sub btn_newRole_Click(sender As Object, e As EventArgs) Handles btn_newRole.Click

        Try
            Dim newRole As String
            newRole = tb_newRole.Text
            Roles.CreateRole(newRole)
            
        Catch ex As Exception

            lbl_roleMgr.Text = ex.Message

        End Try

        BindAllRoles()

    End Sub

    Protected Sub DeleteRole(sender As Object, e As CommandEventArgs)
        Try
            Roles.DeleteRole(e.CommandArgument.ToString())

        Catch ex As Exception

            lbl_roleMgr.Text = ex.Message

        End Try

        BindAllRoles()

    End Sub

    
End Class
