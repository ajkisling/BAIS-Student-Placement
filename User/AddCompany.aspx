<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AddCompany.aspx.vb" Inherits="User_AddCompany" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 165px;
        }
        .auto-style2 {
            width: 204px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource_AddCompany" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB2ConnectionString %>" 
        
        DeleteCommand="DELETE FROM [Company] WHERE [CompanyID] = @CompanyID" 
        
        InsertCommand="INSERT INTO [Company] ([CompanyName], [CompanyAddress], [CompanyCity], [CompanyZip], [State]) VALUES (@CompanyName, @CompanyAddress, @CompanyCity, @CompanyZip, @State)" 
        
        SelectCommand="SELECT [CompanyID], [CompanyName], [CompanyAddress], [CompanyCity], [CompanyZip], [State] FROM [Company]" UpdateCommand="UPDATE [Company] SET [CompanyName] = @CompanyName, [CompanyAddress] = @CompanyAddress, [CompanyCity] = @CompanyCity, [CompanyZip] = @CompanyZip, [State] = @State WHERE [CompanyID] = @CompanyID">
        
        <DeleteParameters>
            <asp:Parameter Name="CompanyID" Type="Int32" />
        </DeleteParameters>
        
        <InsertParameters>
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="CompanyAddress" Type="String" />
            <asp:Parameter Name="CompanyCity" Type="String" />
            <asp:Parameter Name="CompanyZip" Type="Double" />
            <asp:Parameter Name="State" Type="String" />
        </InsertParameters>
        
        <UpdateParameters>
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="CompanyAddress" Type="String" />
            <asp:Parameter Name="CompanyCity" Type="String" />
            <asp:Parameter Name="CompanyZip" Type="Double" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="CompanyID" Type="Int32" />
        </UpdateParameters>

    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSource_StateDDL" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB2ConnectionString %>" 
        SelectCommand="SELECT [State], [StateName] FROM [State]">
    </asp:SqlDataSource>
    
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="CompanyID" DataSourceID="SqlDataSource_AddCompany" DefaultMode="Insert" Width="430px">
        
        <EditItemTemplate>

        </EditItemTemplate>

        <InsertItemTemplate>
            
            <table id="AddCompany">

                <tr>
                    <th class="auto-style2"><asp:Label ID="lbl_AddCompanyName" runat="server" Text="Company Name:  " Width="150px"></asp:Label></th>
                    <td><asp:TextBox ID="tb_CompanyName" runat="server" Text='<%# Bind("CompanyName") %>' Width="250px" /></td>
                </tr>

                <tr>
                    <th class="auto-style2"><asp:Label ID="lbl_AddCompanyAddress" runat="server" Text="Street Address:  "></asp:Label></th>
                    <td><asp:TextBox ID="tb_CompanyAddress" runat="server" Text='<%# Bind("CompanyAddress") %>' Width="300px" /></td>
                </tr>

                <tr>
                    <th class="auto-style2"><asp:Label ID="lbl_AddCompanyCity" runat="server" Text="City:  "></asp:Label></th>
                    <td><asp:TextBox ID="tb_CompanyCity" runat="server" Text='<%# Bind("CompanyCity") %>' Width="250px" /></td>
                </tr>

               <tr>
                    <th class="auto-style2"><asp:Label ID="lbl_AddCompanyState" runat="server" Text="State:  "></asp:Label></th>
                    <td><asp:DropDownList ID="ddl_AddCompanyState" runat="server" CssClass="dropdown" DataSourceID="SqlDataSource_StateDDL" 
                        DataTextField="StateName" DataValueField="State" SelectedValue='<%# Bind("State")%>' ></asp:DropDownList></td>
                </tr>

                <tr>
                    <th class="auto-style2"><asp:Label ID="lbl_AddCompanyZip" runat="server" Text="Zip Code:  "></asp:Label></th>
                    <td><asp:TextBox ID="tb_CompanyZip" runat="server" Text='<%# Bind("CompanyZip")%>' /></td>
                </tr>

                <tr>
                    <th colspan="2"><asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="button" />
                    <asp:HyperLink ID="hplk_CancelAddCompany" runat="server" CssClass="linkbutton" Font-Underline="false" NavigateUrl="~/User/AddJob.aspx">Cancel</asp:HyperLink></th>
                </tr>

            </table>

        </InsertItemTemplate>
        
        <ItemTemplate>

        </ItemTemplate>
    
    </asp:FormView>

</asp:Content>

