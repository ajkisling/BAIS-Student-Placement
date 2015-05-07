<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AddJobTitle.aspx.vb" Inherits="User_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource_AddJobTitle" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB2ConnectionString %>" 
        
        DeleteCommand="DELETE FROM [JobTitle] WHERE [JobTitleID] = @JobTitleID" InsertCommand="INSERT INTO [JobTitle] ([JobTitle]) VALUES (@JobTitle)" 
        
        SelectCommand="SELECT [JobTitleID], [JobTitle] FROM [JobTitle]" UpdateCommand="UPDATE [JobTitle] SET [JobTitle] = @JobTitle WHERE [JobTitleID] = @JobTitleID">

        <DeleteParameters>
            <asp:Parameter Name="JobTitleID" Type="Int32" />
        </DeleteParameters>
        
        <InsertParameters>
            <asp:Parameter Name="JobTitle" Type="String" />
        </InsertParameters>
        
        <UpdateParameters>
            <asp:Parameter Name="JobTitle" Type="String" />
            <asp:Parameter Name="JobTitleID" Type="Int32" />
        </UpdateParameters>

    </asp:SqlDataSource>
    
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="JobTitleID" DataSourceID="SqlDataSource_AddJobTitle" DefaultMode="Insert">

        <EditItemTemplate>


        </EditItemTemplate>

        <InsertItemTemplate>

            <table id="AddJobTitle">

                <tr>
                    <th>JobTitle:  </th>
                    <td><asp:TextBox ID="JobTitleTextBox" runat="server" Text='<%# Bind("JobTitle") %>' /></td>
                </tr>

                <tr>
                    <th colspan="2"><asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="linkbutton" Font-Underline="false" />
                    <asp:HyperLink ID="hplk_CancelAddJobTitle" runat="server" CssClass="linkbutton" Font-Underline="false" NavigateUrl="~/User/AddJob.aspx">Cancel</asp:HyperLink></th>
                </tr>

            </table>

        </InsertItemTemplate>

        <ItemTemplate>

        </ItemTemplate>

    </asp:FormView>

</asp:Content>

