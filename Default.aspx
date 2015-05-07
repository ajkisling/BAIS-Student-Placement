<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <p id="Lorem">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc non aliquet risus. Quisque congue velit hendrerit magna auctor finibus. Ut efficitur ligula in nulla volutpat interdum. Nulla faucibus lacus ex, et ultrices nisi varius facilisis. Ut massa odio, aliquam non iaculis et, eleifend eu arcu. Maecenas viverra cursus leo consectetur fermentum. Nullam eleifend nec turpis vitae elementum. Cras sit amet velit et tortor fringilla semper.

Vestibulum placerat turpis nec tellus euismod, eu finibus magna auctor. Sed vitae arcu ac nulla venenatis porttitor ac sed sem. Sed eget magna vel dui rhoncus ullamcorper. Sed quis odio feugiat, consectetur metus sagittis, iaculis ex. Vivamus id blandit diam. Morbi ac orci metus. Morbi odio velit, facilisis sed sodales sit amet, elementum eu ante. In hac habitasse platea dictumst. Nulla facilisi. Etiam sed arcu ac purus euismod cursus eu eget odio. Vivamus pretium mattis ipsum et blandit. Maecenas semper nulla vitae cursus congue. Praesent et lobortis lorem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean nisi quam, pretium ut nisi at, condimentum dignissim lectus.

In porttitor ante velit, nec tempor leo malesuada sed. Kyle Robinson Donec nec tincidunt velit, at vulputate risus. Donec vitae mauris sed purus consectetur dapibus et non risus. Nulla magna est, mattis laoreet maximus ac, posuere vitae enim. Quisque tempor ex sed tincidunt molestie. Maecenas quis purus lectus. Nulla euismod venenatis velit, a semper tortor fermentum sit amet. Nam porttitor sit amet est eu tristique. Pellentesque congue in risus vitae aliquet. Etiam imperdiet sapien eget felis mollis vulputate. Maecenas ac risus nec nisl blandit sagittis.

Donec rhoncus, sem semper facilisis aliquet, erat massa interdum urna, vehicula lobortis magna augue ut ante. Ut a Kellen Roberts semper ligula. Aliquam sit amet imperdiet risus. Vivamus et mollis ante, sed egestas risus. Cras vitae dapibus nisl, gravida vestibulum lorem. Vestibulum varius nulla dui, vel tempor ante pulvinar vel. Donec et sapien non leo efficitur pharetra. Aenean vehicula venenatis porttitor. Nullam mattis fermentum porttitor. Sed gravida massa nibh, in mollis est malesuada eget. Quisque at sagittis leo.

Sed volutpat mollis nisi, sed lobortis massa pulvinar id. Morbi velit est, gravida nec nulla ut, pharetra dictum ex. Curabitur at erat volutpat, facilisis ex id, mollis sapien. In felis lacus, pulvinar at facilisis a, aliquet a odio. Donec aliquam leo eleifend ex placerat, condimentum convallis purus gravida. Integer iaculis tempus lorem, non convallis diam condimentum in. Aliquam sed ligula nec sapien commodo sodales. Proin tristique quis ante eget interdum. Praesent eu luctus nisl, sit amet sagittis sapien.</p>
     
     <asp:SqlDataSource ID="sql_CompName" runat="server" ConnectionString="<%$ ConnectionStrings:dbo.StudentPlacement %>" SelectCommand="SELECT Company.CompanyName, Company.CompanyAddress, Company.CompanyCity, Company.CompanyZip, Company.State, AddJob.CompanyID FROM Company INNER JOIN AddJob ON Company.CompanyID = AddJob.CompanyID"></asp:SqlDataSource>
     <asp:SqlDataSource ID="sql_JobTitle" runat="server" ConnectionString="<%$ ConnectionStrings:dbo.StudentPlacement %>" SelectCommand="SELECT * FROM [JobTitle]"></asp:SqlDataSource>
     <br />
    <div class="rnd1">
     <table>
         <tr>
            <td><asp:Label ID="lbl_Name" runat="server" Text="Search by Company Name:"></asp:Label></td>
            <td><asp:TextBox ID="tb_compName" runat="server"></asp:TextBox></td>
            <td><asp:Button Class="button" ID="btn_CompName" runat="server" Text="Search" /></td>
         </tr>
         <tr>
            <td><asp:Label ID="lbl_Title" runat="server" Text="Search by Job Title:"></asp:Label></td>
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


