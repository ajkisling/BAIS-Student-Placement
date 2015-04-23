Imports System.Data.SqlClient
Partial Class Admin_AddNewUser
    Inherits System.Web.UI.Page

    Protected Sub CreateUserWizard1_ActiveStepChanged(ByVal Sender As Object, ByVal e As System.EventArgs) Handles CreateUserWizard1.ActiveStepChanged

        If CreateUserWizard1.ActiveStep.Title = "Complete" Then

            Dim UserSettings As WizardStep = CType(CreateUserWizard1.FindControl("UserProfile"), WizardStep)

            Dim FirstName As TextBox = CType(UserSettings.FindControl("tb_FirstName"), TextBox)
            Dim LastName As TextBox = CType(UserSettings.FindControl("tb_LastName"), TextBox)
            Dim city As TextBox = CType(UserSettings.FindControl("tb_City"), TextBox)
            Dim strStateAbbreviation As String = ddl_state.SelectedItem.Text

            Dim NewUser As MembershipUser = Membership.GetUser(CreateUserWizard1.UserName)
            Dim NewUserID As Guid = CType(NewUser.ProviderUserKey, Guid)

            Roles.AddUserToRole(NewUser.UserName, "Customer")

            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("dbo.StudentPlacementDB2").ConnectionString
            Dim UpdateSQL As String = "INSERT INTO [UserProfile] ([UserID], [FirstName], [LastName], [City], [State]) VALUES (@UserID, @FirstName, @LastName, @City, @State)"

            Using MyConnection As New SqlConnection(ConnectionString)
                MyConnection.Open()
                Dim MyCommand As New SqlCommand(UpdateSQL, MyConnection)
                MyCommand.Parameters.Add(New SqlParameter("@PostalCode", strStateAbbreviation))
                MyCommand.Parameters.AddWithValue("@FirstName", FirstName.Text.Trim())
                MyCommand.Parameters.AddWithValue("@LastName", LastName.Text.Trim())
                MyCommand.Parameters.AddWithValue("@City", city.Text.Trim())
                MyCommand.Parameters.AddWithValue("@UserID", NewUserID)
                MyCommand.ExecuteNonQuery()
                MyConnection.Close()
            End Using

        End If
    End Sub
    Protected Sub ContinueButton_Click(sender As Object, e As EventArgs)
        Response.Redirect("ViewAllUsers.aspx")
    End Sub

End Class
