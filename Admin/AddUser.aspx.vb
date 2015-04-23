Imports System.Data
Imports System.Data.SqlClient

Partial Class admin_site_mgr_addUser
    Inherits System.Web.UI.Page

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender

        cbList_userRoles.DataSource = Roles.GetAllRoles()
        cbList_userRoles.DataBind()

        tb_username.Text = String.Empty
        tb_password.Text = String.Empty
        tb_email.Text = String.Empty
        ddl_pwdQuestion.SelectedValue = -1
        tb_answer.Text = String.Empty
        tb_comment.Text = String.Empty


    End Sub

   
    Protected Sub btn_newUser_Click(sender As Object, e As EventArgs) Handles btn_newUser.Click

        ' Create new user and retrieve create status result.
        Dim status As MembershipCreateStatus
        Dim passwordQuestion As String = ""
        Dim passwordAnswer As String = ""

        If Membership.RequiresQuestionAndAnswer Then
            passwordQuestion = ddl_pwdQuestion.SelectedValue
            passwordAnswer = tb_answer.Text
        End If

        Dim newUser As MembershipUser = Membership.CreateUser(tb_username.Text, tb_password.Text, _
                                                           tb_email.Text, passwordQuestion, _
                                                           passwordAnswer, True, status)
        Try

            If newUser Is Nothing Then
                lbl_addUser.Text = GetErrorMessage(status)
            Else

                ' Add Roles.
                For Each rolebox As ListItem In cbList_userRoles.Items
                    If rolebox.Selected Then
                        Roles.AddUserToRole(tb_username.Text, rolebox.Text)
                    End If
                Next

                
                Response.Redirect("add_user.aspx")

            End If

        Catch

            lbl_addUser.Text = "An exception occurred creating the user."

        End Try

    End Sub

     
    Public Function GetErrorMessage(status As MembershipCreateStatus) As String

        Select Case status

            Case MembershipCreateStatus.DuplicateUserName
                Return "Username already exists. Please enter a different user name."

            Case MembershipCreateStatus.DuplicateEmail
                Return "A username for that e-mail address already exists. Please enter a different e-mail address."

            Case MembershipCreateStatus.InvalidPassword
                Return "The password provided is invalid. Please enter a valid password value."

            Case MembershipCreateStatus.InvalidEmail
                Return "The e-mail address provided is invalid. Please check the value and try again."

            Case MembershipCreateStatus.InvalidAnswer
                Return "The password retrieval answer provided is invalid. Please check the value and try again."

            Case MembershipCreateStatus.InvalidQuestion
                Return "The password retrieval question provided is invalid. Please check the value and try again."

            Case MembershipCreateStatus.InvalidUserName
                Return "The user name provided is invalid. Please check the value and try again."

            Case MembershipCreateStatus.ProviderError
                Return "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator."

            Case MembershipCreateStatus.UserRejected
                Return "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator."

            Case Else
                Return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator."
        End Select

    End Function

End Class
