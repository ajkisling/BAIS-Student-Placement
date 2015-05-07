
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub btn_CompName_Click(sender As Object, e As EventArgs) Handles btn_CompName.Click
        Dim searchcomp As String

        searchcomp = "Select * From dbo.Company where (CompanyName Like '%" + tb_compName.Text.ToString() + "%')"
        sql_search.SelectCommand = searchcomp
    End Sub

    Protected Sub btn_jobTitle_Click(sender As Object, e As EventArgs) Handles btn_jobTitle.Click
        Dim searchtitle As String

        searchtitle = "Select * From dbo.JobTitle where (JobTitle Like '%" + tb_jobTitle.Text.ToString() + "%')"
        sql_search.SelectCommand = searchtitle
    End Sub

    Protected Sub btn_JobType_Click(sender As Object, e As EventArgs) Handles btn_JobType.Click
        Dim searchtype As String

        searchtype = "Select * From dbo.JobType where (JobType Like '%" + ddl_jobtype.Text.ToString() + "%')"
        sql_search.SelectCommand = searchtype
    End Sub

    Protected Sub btn_state_Click(sender As Object, e As EventArgs) Handles btn_state.Click
        Dim searchstate As String

        searchstate = "Select * From dbo.Company where (State Like '%" + ddl_state.Text.ToString() + "%')"
        sql_search.SelectCommand = searchstate
    End Sub

    Protected Sub btn_JobSkills_Click(sender As Object, e As EventArgs) Handles btn_JobSkills.Click
        Dim searchskills As String

        searchskills = "Select * From dbo.JobSkills where (JobSkillDescription Like '%" + tb_skills.Text.ToString() + "%')"
        sql_search.SelectCommand = searchskills
    End Sub
End Class
