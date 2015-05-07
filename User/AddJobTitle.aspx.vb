
Partial Class User_Default
    Inherits System.Web.UI.Page

    Protected Sub FormView1_ItemInserted(sender As Object, e As FormViewInsertedEventArgs) Handles FormView1.ItemInserted

        Response.Redirect("AddJob.aspx")

    End Sub
End Class
