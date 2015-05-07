<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
    <div>
        <h1> Welcome to the BAIS Student Placement Website</h1>
        <h3> Click "view all jobs" to view current postings or search for an specific position</h3>
    </div>
    
     
     <asp:SqlDataSource ID="sql_CompName" runat="server" ConnectionString="<%$ ConnectionStrings:dbo.StudentPlacement %>" SelectCommand="SELECT Company.CompanyName, Company.CompanyAddress, Company.CompanyCity, Company.CompanyZip, Company.State, AddJob.CompanyID FROM Company INNER JOIN AddJob ON Company.CompanyID = AddJob.CompanyID"></asp:SqlDataSource>
     <asp:SqlDataSource ID="sql_JobTitle" runat="server" ConnectionString="<%$ ConnectionStrings:dbo.StudentPlacement %>" SelectCommand="SELECT * FROM [JobTitle]"></asp:SqlDataSource>
     <br />
    <div class="rnd12" >
     <table>
         <tr>
            <td><asp:Label ID="lbl_Name" runat="server" Text="Search by Company Name:" Font-Bold="True" ForeColor="Black"></asp:Label></td>
            <td><asp:TextBox ID="tb_compName" runat="server"></asp:TextBox></td>
            <td><asp:Button Class="button" ID="btn_CompName" runat="server" Text="Search" /></td>
         </tr>
         <tr>
            <td><asp:Label ID="lbl_Title" runat="server" Text="Search by Job Title:" Font-Bold="True" ForeColor="Black"></asp:Label></td>
            <td><asp:TextBox ID="tb_JobTitle" runat="server"></asp:TextBox></td>
            <td><asp:Button Class="button" ID="btn_JobTitle" runat="server" Text="Search" /></td>
         </tr>
    </table>
     <br />
     
    <table>
        <tr> 
            <td><asp:GridView ID="gv_CompName" runat="server" Visible="False" AutoGenerateColumns="False" DataSourceID="sql_CompName"
                 BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" CellSpacing="2" ForeColor="Black" CssClass="gv1">
             <Columns>
             <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" SortExpression="CompanyName" />
             <asp:BoundField DataField="CompanyAddress" HeaderText="CompanyAddress" SortExpression="CompanyAddress" />
             <asp:BoundField DataField="CompanyCity" HeaderText="CompanyCity" SortExpression="CompanyCity" />
             <asp:BoundField DataField="CompanyZip" HeaderText="CompanyZip" SortExpression="CompanyZip" />
             <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
             <asp:BoundField DataField="CompanyID" HeaderText="CompanyID" SortExpression="CompanyID" />
                 <asp:HyperLinkField DataNavigateUrlFields="CompanyName" DataNavigateUrlFormatString="CompNameDetails.aspx?CompanyName={0}" Text="View" />
             </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" Width="10px" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
             </asp:GridView></td>
            <td><asp:GridView ID="gv_JobTitle" runat="server" Visible="False" AutoGenerateColumns="False" DataKeyNames="JobTitleID" DataSourceID="sql_JobTitle"
                 BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" CellSpacing="2" ForeColor="Black" CssClass="gv1">
         <Columns>
             <asp:BoundField DataField="JobTitleID" HeaderText="JobTitleID" InsertVisible="False" ReadOnly="True" SortExpression="JobTitleID" />
             <asp:BoundField DataField="JobTitle" HeaderText="JobTitle" SortExpression="JobTitle" />
             <asp:HyperLinkField DataNavigateUrlFields="JobTitleID" DataNavigateUrlFormatString="JobTitleDetails.aspx?JobTitleID={0}" Text="View" />
             </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" Width="10px" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
             </asp:GridView></td>
        </tr>
    </table>
        <asp:Button  Class="button" ID="btn_view" runat="server" Text="View All My Jobs" />
     <br />
    </div>


</asp:Content>


