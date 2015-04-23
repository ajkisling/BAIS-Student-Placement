
Partial Class MasterPage
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Roles.IsUserInRole("r_admin") Then
            Dim menuItems As MenuItemCollection = NavMenu.Items
            Dim adminItem As New MenuItem()
            For Each menuItem As MenuItem In menuItems
                If menuItem.Text = "Admin" Then
                    adminItem = menuItem
                End If
            Next
            menuItems.Remove(adminItem)
        End If
    End Sub
End Class

