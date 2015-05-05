
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub btn_search_Click(sender As Object, e As EventArgs) Handles btn_search.Click
        Dim searchcomp As String
        Dim searchtitle As String
        Dim searchtype As String
        Dim searchstate As String
        Dim searchskills As String



        searchcomp = "Select * From dbo.PlacementDB2 where (CompanyName Like '%" + tb_compName.Text.ToString() + "%')"
        sql_Company.SelectCommand = searchcomp

        searchtitle = "Select * From dbo.PlacementDB2 where (JobTitle Like '%" + tb_jobTitle.Text.ToString() + "%')"
        sql_Company.SelectCommand = searchtitle

        searchtype = "Select * From dbo.PlacementDB2 where (JobType Like '%" + rbl_jobtype.ToString() + "%')"
        sql_Company.SelectCommand = searchtype

        searchstate = "Select * From dbo.PlacementDB2 where (StateName Like '%" + ddl_state.Text.ToString() + "%')"
        sql_Company.SelectCommand = searchstate

        searchskills = "Select * From dbo.PlacementDB2 where (JobSkillDescription Like '%" + tb_skills.Text.ToString() + "%')"
        sql_Company.SelectCommand = searchskills
    End Sub

End Class
