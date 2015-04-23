<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SQLClient" %>
<%@ Import Namespace="System.Web" %>

<script runat="server">
    Protected Sub ddlSlipType_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim lb As Label = fvSlip.FindControl("UpdateRentalLabel")
        lb.Text = GetSlipTypeRentalFee()
    End Sub

    Protected Sub ddlSlipType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim lb As Label = fvSlip.FindControl("UpdateRentalLabel")
        lb.Text = GetSlipTypeRentalFee()
    End Sub
    
    Protected Function GetSlipTypeRentalFee() As String
        Dim strRentalFee As String = ""
        Dim ddl As DropDownList = fvSlip.FindControl("ddlSlipType")
        Dim dr As SqlDataReader
        Dim strSql As String
        Dim objCommand As SqlCommand
        
        Dim strConnectionString As String
        strConnectionString = ConfigurationManager.ConnectionStrings("fk185_ClassConnectionString").ConnectionString
        Dim sqlConn As New SqlConnection(strConnectionString)
       
        strSql = "Select * from SlipType Where ID = @SlipID"
        
        sqlConn.Open()
            
        objCommand = New SqlCommand(strSql, sqlConn)
         
        objCommand.Parameters.AddWithValue("@SlipID", Int16.Parse(ddl.SelectedValue.Trim()))
        dr = objCommand.ExecuteReader()
            
        While dr.Read
            strRentalFee = String.Format("{0:c}", dr("RentalFee"))
        End While
        dr.Close()
        sqlConn.Close()
        
        Return strRentalFee
    End Function
    
    Protected Sub fvSlip_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs)
        If Not e.Exception Is Nothing Then
            If TypeOf (e.Exception) Is ArgumentException Then
                ErrorMessage.Text = CType(e.Exception, ArgumentException).Message
            Else
                ErrorMessage.Text = "An error occured while trying to update the Rental"
            End If
            e.ExceptionHandled = True
            e.KeepInEditMode = True
        Else
            ErrorMessage.Text = "Rental Updated"
        End If
    End Sub
    
    Protected Sub fvSlip_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles fvSlip.ItemInserted

        If e.Exception IsNot Nothing Or e.AffectedRows = 0 Then

            ErrorMessage.Text = "Error: Slip not inserted."

            e.ExceptionHandled = True
            e.KeepInInsertMode = True

        Else

            ErrorMessage.Text = "New Slip added successfully.  "

        End If

    End Sub
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Label ID="ErrorMessage" runat="server" EnableViewState="False" ></asp:Label>
    
    <br />
    
    
    <asp:FormView ID="fvSlip" runat="server" DataKeyNames="ID" 
        AllowPaging="True" DataSourceID="SqlDataSourceFV" 
        onitemupdated="fvSlip_ItemUpdated" 
        onItemInserted="fvSlip_ItemInserted">
        <EditItemTemplate>
            <table>    
            <tr>
            <td>
            ID:
            <asp:Label ID="UpdateIDLabel" runat="server" Text='<%# Eval("ID") %>' />
            </td>
            </tr>
            <tr>
            <td>
            Location:
            </td>
            <td>
            <asp:TextBox ID="UpdateLocationTextBox" runat="server" 
                Text='<%# Bind("Location") %>'  ReadOnly="False" />
            </td>
            </tr>
            <tr>
            <td>
            Slip Type:
            </td>
            <td>
            <asp:DropDownList ID="ddlSlipType"  SelectedValue = '<%# Bind("SlipTypeID") %>' 
                runat="server" ondatabound="ddlSlipType_DataBound"
                DataTextField="Size" DataValueField="ID" 
                AutoPostBack="True" DataSourceID="SqlDataSourceSlipTypes" 
                onselectedindexchanged="ddlSlipType_SelectedIndexChanged" >
            </asp:DropDownList>
            </td>
            </tr>
            <asp:SqlDataSource ID="SqlDataSourceSlipTypes" runat="server" 
                ConnectionString="<%$ ConnectionStrings:fk185_ClassConnectionString %>" 
                SelectCommand="SELECT * FROM [SlipType]"></asp:SqlDataSource>
            <tr>
            <td>
            Slip Rental Fee:
            </td>
            <td>
            <asp:Label ID="UpdateRentalLabel" runat="server" />
            </td>
            </tr>
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
             &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
              CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </table>
        </EditItemTemplate>
        <InsertItemTemplate>
        <table>    
            <tr>
            <td>
            ID:
            <asp:Label ID="lblInsertID" runat="server" Text="Autogenerated" />
            </td>
            </tr>
            <tr>
            <td>
            Location:
            </td>
            <td>
            <asp:TextBox ID="InsertLocationTextBox" runat="server" 
                Text='<%# Bind("Location") %>'  ReadOnly="False" />
            </td>
            </tr>
            <tr>
            <td>
            Slip Type:
            </td>
            <td>
            <asp:DropDownList ID="ddlSlipType"  SelectedValue = '<%# Bind("SlipTypeID") %>' 
                runat="server" ondatabound="ddlSlipType_DataBound"
                DataTextField="Size" DataValueField="ID" 
                AutoPostBack="True" DataSourceID="SqlDataSourceSlipTypes" 
                onselectedindexchanged="ddlSlipType_SelectedIndexChanged" >
            </asp:DropDownList>
            </td>
            </tr>
            <asp:SqlDataSource ID="SqlDataSourceSlipTypes" runat="server" 
                ConnectionString="<%$ ConnectionStrings:fk185_ClassConnectionString %>" 
                SelectCommand="SELECT * FROM [SlipType]"></asp:SqlDataSource>
            <tr>
            <td>
            Slip Rental Fee:
            </td>
            <td>
            <asp:Label ID="UpdateRentalLabel" runat="server" />
            </td>
            </tr>
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            <asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            <tr>
                <td>
                    <asp:RequiredFieldValidator ID="InsertLocationRFV" runat="server" 
                        ControlToValidate="InsertLocationTextBox" 
                        ErrorMessage="Location data required."></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            <table>    
            <tr>
            <td>
            ID:
            <asp:Label ID="ItemIDLabel" runat="server" Text='<%# Eval("ID") %>' />
            </td>
            </tr>
            <tr>
            <td>
            Location:
            </td>
            <td>
            <asp:Label ID="ItemLocationTextBox" runat="server" 
                Text='<%# Bind("Location") %>' />
            </td>
            </tr>
            <tr>
            <td>
            Slip Type:
            </td>
            <td>
            <asp:DropDownList ID="ddlSlipType"  SelectedValue = '<%# Bind("SlipTypeID") %>' 
                runat="server" ondatabound="ddlSlipType_DataBound"
                DataTextField="Size" DataValueField="ID" 
                DataSourceID="SqlDataSourceSlipTypes" 
             Enabled="False">
            </asp:DropDownList>
            </td>
            </tr>
            <asp:SqlDataSource ID="SqlDataSourceSlipTypes" runat="server" 
                ConnectionString="<%$ ConnectionStrings:fk185_ClassConnectionString %>" 
                SelectCommand="SELECT * FROM [SlipType]"></asp:SqlDataSource>
            <tr>
            <td>
            Slip Rental Fee:
            </td>
            <td>
            <asp:Label ID="UpdateRentalLabel" runat="server" />
            </td>
            </tr>
            </table>
            <asp:LinkButton ID="LinkButton1" CommandName="Edit" Text="Edit" runat="server"></asp:LinkButton>&nbsp; <asp:LinkButton ID="LinkButton2" CommandName="New" Text="New" runat="server"></asp:LinkButton><br />
        </ItemTemplate>
    </asp:FormView>
    
    
                <asp:SqlDataSource ID="SqlDataSourceFV" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:fk185_ClassConnectionString %>" 
                    SelectCommand="Select * from Slip"
                    InsertCommand = "Insert Into Slip Values (@Location, @SlipTypeID)" 
                    UpdateCommand="UPDATE [Slip] SET [Location] = @Location, SlipTypeID = @SlipTypeID
                    WHERE [ID] = @ID ">
                    <InsertParameters>
                        <asp:Parameter Name="Location" />
                        <asp:Parameter Name="SlipTypeID" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Location" />
                        <asp:Parameter Name="SlipTypeID" />
                        <asp:Parameter Name="ID" />
                    </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

