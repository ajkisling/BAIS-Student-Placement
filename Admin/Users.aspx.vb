
Partial Class admin_site_mgr_users
    Inherits System.Web.UI.Page

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender


        Users.DataSource = Membership.GetAllUsers()
        Users.DataBind()

    End Sub
End Class
