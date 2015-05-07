
Partial Class _Default
    Inherits System.Web.UI.Page


    Protected Sub btn_CompName_Click(sender As Object, e As EventArgs) Handles btn_CompName.Click
        Dim searchcomp As String

        searchcomp = "Select * From dbo.Company where (CompanyName Like '%" + tb_compName.Text.ToString() + "%')"
        sql_CompName.SelectCommand = searchcomp

        gv_CompName.Visible = "true"
    End Sub

    Protected Sub btn_JobTitle_Click(sender As Object, e As EventArgs) Handles btn_JobTitle.Click
        Dim searchtitle As String

        searchtitle = "Select * From dbo.JobTitle where (JobTitle Like '%" + tb_JobTitle.Text.ToString() + "%')"
        sql_JobTitle.SelectCommand = searchtitle

        gv_JobTitle.Visible = "true"
    End Sub

    Protected Sub btn_view_Click(sender As Object, e As EventArgs) Handles btn_view.Click
        Response.Redirect("./User/ViewMyJobs.aspx")
    End Sub
End Class
