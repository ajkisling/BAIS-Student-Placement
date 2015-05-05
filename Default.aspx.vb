
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub btn_search_Click(sender As Object, e As EventArgs) Handles btn_search.Click
        Dim searchcomp As String
        Dim searchtitle As String
        Dim searchtype As String
        Dim searchstate As String
        Dim searchskills As String



        searchcomp = "Select * From dbo.Company where (CompanyName Like '%" + tb_compName.Text.ToString() + "%')"
        sql_combo.SelectCommand = searchcomp

        searchtitle = "Select * From dbo.JobTitle where (JobTitle Like '%" + tb_jobTitle.Text.ToString() + "%')"
        sql_combo.SelectCommand = searchtitle

        searchtype = "Select * From dbo.JobType where (JobType Like '%" + rbl_jobtype.ToString() + "%')"
        sql_combo.SelectCommand = searchtype

        searchstate = "Select * From dbo.Company where (StateName Like '%" + ddl_state.Text.ToString() + "%')"
        sql_combo.SelectCommand = searchstate

        searchskills = "Select * From dbo.JobSkills where (JobSkillDescription Like '%" + tb_skills.Text.ToString() + "%')"
        sql_combo.SelectCommand = searchskills
    End Sub

End Class
