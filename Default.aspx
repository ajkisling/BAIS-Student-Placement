<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <p id="Lorem">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc non aliquet risus. Quisque congue velit hendrerit magna auctor finibus. Ut efficitur ligula in nulla volutpat interdum. Nulla faucibus lacus ex, et ultrices nisi varius facilisis. Ut massa odio, aliquam non iaculis et, eleifend eu arcu. Maecenas viverra cursus leo consectetur fermentum. Nullam eleifend nec turpis vitae elementum. Cras sit amet velit et tortor fringilla semper.

Vestibulum placerat turpis nec tellus euismod, eu finibus magna auctor. Sed vitae arcu ac nulla venenatis porttitor ac sed sem. Sed eget magna vel dui rhoncus ullamcorper. Sed quis odio feugiat, consectetur metus sagittis, iaculis ex. Vivamus id blandit diam. Morbi ac orci metus. Morbi odio velit, facilisis sed sodales sit amet, elementum eu ante. In hac habitasse platea dictumst. Nulla facilisi. Etiam sed arcu ac purus euismod cursus eu eget odio. Vivamus pretium mattis ipsum et blandit. Maecenas semper nulla vitae cursus congue. Praesent et lobortis lorem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean nisi quam, pretium ut nisi at, condimentum dignissim lectus.

In porttitor ante velit, nec tempor leo malesuada sed. Donec nec tincidunt velit, at vulputate risus. Donec vitae mauris sed purus consectetur dapibus et non risus. Nulla magna est, mattis laoreet maximus ac, posuere vitae enim. Quisque tempor ex sed tincidunt molestie. Maecenas quis purus lectus. Nulla euismod venenatis velit, a semper tortor fermentum sit amet. Nam porttitor sit amet est eu tristique. Pellentesque congue in risus vitae aliquet. Etiam imperdiet sapien eget felis mollis vulputate. Maecenas ac risus nec nisl blandit sagittis.

Donec rhoncus, sem semper facilisis aliquet, erat massa interdum urna, vehicula lobortis magna augue ut ante. Ut a semper ligula. Aliquam sit amet imperdiet risus. Vivamus et mollis ante, sed egestas risus. Cras vitae dapibus nisl, gravida vestibulum lorem. Vestibulum varius nulla dui, vel tempor ante pulvinar vel. Donec et sapien non leo efficitur pharetra. Aenean vehicula venenatis porttitor. Nullam mattis fermentum porttitor. Sed gravida massa nibh, in mollis est malesuada eget. Quisque at sagittis leo.

Sed volutpat mollis nisi, sed lobortis massa pulvinar id. Morbi velit est, gravida nec nulla ut, pharetra dictum ex. Curabitur at erat volutpat, facilisis ex id, mollis sapien. In felis lacus, pulvinar at facilisis a, aliquet a odio. Donec aliquam leo eleifend ex placerat, condimentum convallis purus gravida. Integer iaculis tempus lorem, non convallis diam condimentum in. Aliquam sed ligula nec sapien commodo sodales. Proin tristique quis ante eget interdum. Praesent eu luctus nisl, sit amet sagittis sapien.</p></panel>
     <asp:SqlDataSource ID="sql_Company" runat="server" ConnectionString="<%$ ConnectionStrings:dbo.StudentPlacement %>" SelectCommand="SELECT * FROM [Company]"></asp:SqlDataSource>
     <asp:SqlDataSource ID="sql_JobTitle" runat="server" ConnectionString="<%$ ConnectionStrings:dbo.StudentPlacement %>" SelectCommand="SELECT * FROM [JobTitle]"></asp:SqlDataSource>
     <asp:SqlDataSource ID="sql_JobType" runat="server" ConnectionString="<%$ ConnectionStrings:dbo.StudentPlacement %>" SelectCommand="SELECT * FROM [JobType]"></asp:SqlDataSource>
     <asp:SqlDataSource ID="sql_State" runat="server" ConnectionString="<%$ ConnectionStrings:dbo.StudentPlacement %>" SelectCommand="SELECT * FROM [State]"></asp:SqlDataSource>
     <asp:SqlDataSource ID="sql_Jobskills" runat="server" ConnectionString="<%$ ConnectionStrings:dbo.StudentPlacement %>" SelectCommand="SELECT * FROM [JobSkills]"></asp:SqlDataSource>
     <asp:Label ID="lbl_CompName" runat="server" Text="Company Name:"></asp:Label>
&nbsp;&nbsp;&nbsp;
     <asp:TextBox ID="tb_compName" runat="server"></asp:TextBox>
     <br />
     <asp:Label ID="lbl_JobTitle" runat="server" Text="Job Title:"></asp:Label>
&nbsp;&nbsp;&nbsp;
     <asp:TextBox ID="tb_jobTitle" runat="server"></asp:TextBox>
     <br />
     <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="sql_JobType" DataTextField="JobType" DataValueField="JobType">
         <asp:ListItem>Full-Time</asp:ListItem>
         <asp:ListItem>Internship</asp:ListItem>
     </asp:RadioButtonList>
     <asp:Label ID="lbl_state" runat="server" Text="State:"></asp:Label>
&nbsp;&nbsp;&nbsp;
     <asp:DropDownList ID="ddl_state" runat="server" DataSourceID="sql_State" DataTextField="StateName" DataValueField="StateName">
     </asp:DropDownList>
     <br />
     <asp:Label ID="lbl_skills" runat="server" Text="Skills:"></asp:Label>
&nbsp;&nbsp;&nbsp;
     <asp:TextBox ID="tb_skills" runat="server"></asp:TextBox>
     <br />
     &nbsp;&nbsp;
     <br />
     <asp:Button ID="btn_search" runat="server" Text="Search" />
&nbsp;<br />
&nbsp;



</asp:Content>


