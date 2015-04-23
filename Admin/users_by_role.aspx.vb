
Partial Class users_by_role
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        UserRoles.DataSource = Roles.GetAllRoles()
        UserRoles.DataBind()
    End Sub


    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        '
        '		 * Dan Clem, 3/7/2007 and 4/27/2007.
        '		 * The logic here is necessitated by the limitations of the built-in object model.
        '		 * The Membership class does not provide a method to get users by role.
        '		 * The Roles class DOES provide a GetUsersInRole method, but it returns an array of UserName strings
        '		 * rather than a proper collection of MembershipUser objects.
        '		 * 
        '		 * This is my workaround.
        '		 * 
        '		 * Note to self: the two-collection approach is necessitated because you can't remove items from a collection
        '		 * while iterating through it: "Collection was modified; enumeration operation may not execute."
        '		 


        Dim allUsers As MembershipUserCollection = Membership.GetAllUsers()
        Dim filteredUsers As New MembershipUserCollection()

        If UserRoles.SelectedIndex > 0 Then
            Dim usersInRole As String() = Roles.GetUsersInRole(UserRoles.SelectedValue)
            For Each user As MembershipUser In allUsers
                For Each userInRole As String In usersInRole
                    If userInRole = user.UserName Then
                        filteredUsers.Add(user)
                        ' Breaks out of the inner foreach loop to avoid unneeded checking.
                        Exit For
                    End If
                Next
            Next
        Else
            filteredUsers = allUsers
        End If
        Users.DataSource = filteredUsers
        Users.DataBind()
    End Sub

End Class
