<%@ Page  Title="" Language="VB" MasterPageFile="~/Site.master" %>

<script runat="server">

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim strLN As String
        Dim objParam As New Parameter
        If String.IsNullOrEmpty(Trim(tbSearch.Text)) Then
            SqlDataSource1.SelectCommand = "SELECT [LastName], [FirstName], [UserID], [ID] FROM [Customer]"
        Else
            strLN = CStr((tbSearch.Text).Trim)
            SqlDataSource1.SelectCommand = "SELECT [LastName], [FirstName], [UserID], [ID] FROM [Customer] Where LastName Like '%" & strLN & "%'"
        End If
        GridView1.DataBind()
        GridView1.SelectedIndex = -1
        lblMessage.Text = ""
        Session("CustGUID") = ""
        DetailsView1.Caption = ""
        DetailsView1.Visible = False
        
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim strLastName As String
        Dim row As GridViewRow
        row = GridView1.SelectedRow
        strLastName = row.Cells(1).Text
        Session("CustGUID") = row.Cells(4).Text.Trim
        
        DetailsView1.Caption = "Boats for: " & strLastName
        DetailsView1.Visible = True
        lblMessage.Text = ""
         
    End Sub

    Protected Sub SqlDataSource2_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs)
        Dim strCustGuid = Session("CustGuid")
   
        ' Assign the selected customer's UserId to the @UserId parameter for the insert
        e.Command.Parameters("@UserId").Value = strCustGuid
    End Sub

    Protected Sub DetailsView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs)
        'Test for an error during processing
        If e.Exception IsNot Nothing Then
            'Test for an exception during row insertion
            lblMessage.Text = "An exception occurred durring the insert. " & e.Exception.Message
            'This suppresses the exception and keeps the
            'row in EditMode
            e.ExceptionHandled = True
            e.KeepInInsertMode = True
        Else

            lblMessage.Text = "Insert succeeded."

        End If
    End Sub

    Protected Sub DetailsView1_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs)
        'Test for an error during processing
        If e.Exception IsNot Nothing Then
            'Test for an exception during row insertion
            lblMessage.Text = "An exception occurred durring the edit. " & e.Exception.Message
            'This suppresses the exception and keeps the
            'row in EditMode
            e.ExceptionHandled = True
            e.KeepInEditMode = True
        Else

            lblMessage.Text = "Edit succeeded."

        End If
    End Sub


    Protected Sub SqlDataSource2_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs)
        If Not e.AffectedRows > 0 Then
            DetailsView1.Visible=False
        Else
            DetailsView1.DefaultMode = DetailsViewMode.ReadOnly
        End If
    End Sub
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        <asp:TextBox ID="tbSearch" runat="server"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" onclick="btnSearch_Click" 
            Text="Find Customer" />
    </p>
    <p>
        
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="UserID" 
            DataSourceID="SqlDataSource1" 
            EmptyDataText="No Customers to Display" 
            onselectedindexchanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" 
                    SortExpression="LastName" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                    SortExpression="FirstName" />
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="UserID" HeaderText="UserID" ReadOnly="FALSE" 
                    SortExpression="UserID" Visible="TRUE" />
            </Columns>
            <SelectedRowStyle BackColor="#CCCCCC" BorderStyle="Dotted" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:fk185_ClassConnectionString %>" 
            
            
            SelectCommand="SELECT [LastName], [FirstName], [UserID], [ID] FROM [Customer]">
        </asp:SqlDataSource>
    </p>
    <p>
        
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
            AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="SqlDataSource2" 
            EmptyDataText="No Boats to Display" Height="50px" Width="125px" 
            oniteminserted="DetailsView1_ItemInserted" 
            onitemupdated="DetailsView1_ItemUpdated" >
            <Fields>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Description" HeaderText="Description" 
                    SortExpression="Description" />
                <asp:BoundField DataField="LicenseNumber" HeaderText="LicenseNumber" 
                    SortExpression="LicenseNumber" />
               <asp:TemplateField HeaderText="BoatType" SortExpression="BoatType">
                <EditItemTemplate>
                    <asp:DropDownList ID="EditBoatTypeList" runat="server" SelectedValue='<%# Bind("BoatType") %>' 
                        DataSourceID="SqlDataSourceBoatType" DataTextField="Name" DataValueField="ID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceBoatType" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:fk185_ClassConnectionString %>" 
                        SelectCommand="SELECT [ID], [Name] FROM [BoatType]"></asp:SqlDataSource>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="InsertBoatTypeList" runat="server" SelectedValue='<%# Bind("BoatType") %>' 
                        DataSourceID="SqlDataSourceBoatType" DataTextField="Name" DataValueField="ID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceBoatType" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:fk185_ClassConnectionString %>" 
                        SelectCommand="SELECT [ID], [Name] FROM [BoatType]"></asp:SqlDataSource>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("BoatType") %>'></asp:Label>
                </ItemTemplate>   
            </asp:TemplateField>
                <asp:BoundField DataField="UserID" HeaderText="UserID" 
                    SortExpression="UserID" InsertVisible="False"/>
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:fk185_ClassConnectionString %>" 
            SelectCommand="SELECT * FROM [CustomerBoat] WHERE ([UserID] = @UserID)"
             UpdateCommand="UPDATE CustomerBoat SET
                            Description = @Description,
                            LicenseNumber = @LicenseNumber,
                            BoatType = @BoatType
                            WHERE Id = @ID "
            InsertCommand="INSERT INTO CustomerBoat Values
                            (@Description,@LicenseNumber,@BoatType,@UserID)" 
            oninserting="SqlDataSource2_Inserting" 
            onselected="SqlDataSource2_Selected"
            >
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="UserID" 
                    PropertyName="SelectedValue" Type="Object" />
            </SelectParameters>
            <UpdateParameters>
                        <asp:Parameter Name="Description" />
                        <asp:Parameter Name="LicenseNumber" />
                        <asp:Parameter Name="BoatType" />
                        <asp:Parameter Name="ID" />
         </UpdateParameters>
         <InsertParameters>
                        <asp:Parameter Name="Description" />
                        <asp:Parameter Name="LicenseNumber" />
                        <asp:Parameter Name="BoatType" />
                        <asp:Parameter Name="UserID" />
         </InsertParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>

