
Partial Class edit_user
    Inherits System.Web.UI.Page

    Private username As String
    Private user As MembershipUser

    Protected Sub Page_PreRender1(sender As Object, e As EventArgs) Handles Me.PreRender
        ' Load the User Roles into checkboxes.
        UserRoles.DataSource = Roles.GetAllRoles()
        UserRoles.DataBind()

        ' Disable checkboxes if appropriate:
        If UserInfo.CurrentMode <> DetailsViewMode.Edit Then
            For Each checkbox As ListItem In UserRoles.Items
                checkbox.Enabled = False
            Next
        End If

        ' Bind these checkboxes to the User's own set of roles.
        Dim userRoles__1 As String() = Roles.GetRolesForUser(username)
        For Each role As String In userRoles__1
            Dim checkbox As ListItem = UserRoles.Items.FindByValue(role)
            checkbox.Selected = True
        Next
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        username = Request.QueryString("username")
        If username Is Nothing OrElse username = "" Then
            Response.Redirect("users.aspx")
        End If
        user = Membership.GetUser(username)
        UserUpdateMessage.Text = ""
    End Sub


    Protected Sub UserInfo_ItemUpdating(sender As Object, e As DetailsViewUpdateEventArgs)
        'Need to handle the update manually because MembershipUser does not have a
        'parameterless constructor  

        user.Email = DirectCast(e.NewValues(0), String)
        user.Comment = DirectCast(e.NewValues(1), String)
        user.IsApproved = CBool(e.NewValues(2))

        Try
            ' Update user info:
            Membership.UpdateUser(user)

            ' Update user roles:
            UpdateUserRoles()

            UserUpdateMessage.Text = "Update Successful."

            e.Cancel = True
            UserInfo.ChangeMode(DetailsViewMode.[ReadOnly])
        Catch ex As Exception
            UserUpdateMessage.Text = "Update Failed: " + ex.Message

            e.Cancel = True
            UserInfo.ChangeMode(DetailsViewMode.[ReadOnly])
        End Try
    End Sub

   

    Protected Sub UpdateUserRoles()
        For Each rolebox As ListItem In UserRoles.Items
            If rolebox.Selected Then
                If Not Roles.IsUserInRole(username, rolebox.Text) Then
                    Roles.AddUserToRole(username, rolebox.Text)
                End If
            Else
                If Roles.IsUserInRole(username, rolebox.Text) Then
                    Roles.RemoveUserFromRole(username, rolebox.Text)
                End If
            End If
        Next
    End Sub

    Protected Sub DeleteUser(sender As Object, e As EventArgs)
        'Membership.DeleteUser(username, false); // DC: My apps will NEVER delete the related data.
        Membership.DeleteUser(username, True)
        ' DC: except during testing, of course!
        Response.Redirect("users.aspx")
    End Sub

    Protected Sub UnlockUser(sender As Object, e As EventArgs)
        ' Dan Clem, added 5/30/2007 post-live upgrade.

        ' Unlock the user.
        user.UnlockUser()

        ' DataBind the GridView to reflect same.
        UserInfo.DataBind()
    End Sub


   
End Class
