
Partial Class User_JobDetails
    Inherits System.Web.UI.Page

    Protected Sub FormView1_ItemDeleted(sender As Object, e As FormViewDeletedEventArgs) Handles FormView1.ItemDeleted

        Dim DeletedJob As String = e.Values("JobTitle").ToString()

        lbl_DeletedJob.Text = "The job " & DeletedJob & " has been deleted."

        Response.AddHeader("REFRESH", "3;URL=ViewMyJobs.aspx")

    End Sub

    Protected Sub FormView1_ItemUpdated(sender As Object, e As FormViewUpdatedEventArgs) Handles FormView1.ItemUpdated

        Response.Redirect("ViewMyJobs.aspx")

    End Sub

End Class
