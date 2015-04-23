<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Test.aspx.vb" Inherits="Test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div>
        <asp:SqlDataSource ID="sql_AddJob" runat="server" ConnectionString="<%$ ConnectionStrings:dbo.StudentPlacement %>" SelectCommand="SELECT * FROM [AddJob]" DeleteCommand="DELETE FROM [AddJob] WHERE [JobID] = @JobID" InsertCommand="INSERT INTO [AddJob] ([Major], [Semester], [Position Type], [Position Title], [Position Description], [Position Skills], [Company Name], [Company Address], [Company State], [Company Zip]) VALUES (@Major, @Semester, @Position_Type, @Position_Title, @Position_Description, @Position_Skills, @Company_Name, @Company_Address, @Company_State, @Company_Zip)" UpdateCommand="UPDATE [AddJob] SET [Major] = @Major, [Semester] = @Semester, [Position Type] = @Position_Type, [Position Title] = @Position_Title, [Position Description] = @Position_Description, [Position Skills] = @Position_Skills, [Company Name] = @Company_Name, [Company Address] = @Company_Address, [Company State] = @Company_State, [Company Zip] = @Company_Zip WHERE [JobID] = @JobID">
            <DeleteParameters>
                <asp:Parameter Name="JobID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Major" Type="String" />
                <asp:Parameter Name="Semester" Type="String" />
                <asp:Parameter Name="Position_Type" Type="String" />
                <asp:Parameter Name="Position_Title" Type="String" />
                <asp:Parameter Name="Position_Description" Type="String" />
                <asp:Parameter Name="Position_Skills" Type="String" />
                <asp:Parameter Name="Company_Name" Type="String" />
                <asp:Parameter Name="Company_Address" Type="String" />
                <asp:Parameter Name="Company_State" Type="String" />
                <asp:Parameter Name="Company_Zip" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Major" Type="String" />
                <asp:Parameter Name="Semester" Type="String" />
                <asp:Parameter Name="Position_Type" Type="String" />
                <asp:Parameter Name="Position_Title" Type="String" />
                <asp:Parameter Name="Position_Description" Type="String" />
                <asp:Parameter Name="Position_Skills" Type="String" />
                <asp:Parameter Name="Company_Name" Type="String" />
                <asp:Parameter Name="Company_Address" Type="String" />
                <asp:Parameter Name="Company_State" Type="String" />
                <asp:Parameter Name="Company_Zip" Type="String" />
                <asp:Parameter Name="JobID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sql_PositionType" runat="server" ConnectionString="<%$ ConnectionStrings:dbo.StudentPlacement %>" SelectCommand="SELECT [PositionType] FROM [PositionType]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sql_State" runat="server" ConnectionString="<%$ ConnectionStrings:dbo.StudentPlacement %>" SelectCommand="SELECT [StateAbbreviation] FROM [State]"></asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="JobID" DataSourceID="sql_AddJob">
            <EditItemTemplate>
                JobID:
                <asp:Label ID="JobIDLabel1" runat="server" Text='<%# Eval("JobID") %>' />
                <br />
                Major:
                <asp:TextBox ID="MajorTextBox" runat="server" Text='<%# Bind("Major") %>' />
                <br />
                Semester:
                <asp:TextBox ID="SemesterTextBox" runat="server" Text='<%# Bind("Semester") %>' />
                <br />
                Position Type:
                <asp:DropDownList ID="ddl_PositionType" runat="server" DataValueField='PositionType' DataSourceID="sql_PositionType" DataTextField='PositionType'
                     SelectedValue='<%# Bind("[Position Type]")%>'>
                </asp:DropDownList>
                <br />
                Position Title:
                <asp:TextBox ID="Position_TitleTextBox" runat="server" Text='<%# Bind("[Position Title]") %>' />
                <br />
                Position Description:
                <asp:TextBox ID="Position_DescriptionTextBox" runat="server" Text='<%# Bind("[Position Description]") %>' />
                <br />
                Position Skills:
                <asp:TextBox ID="Position_SkillsTextBox" runat="server" Text='<%# Bind("[Position Skills]") %>' />
                <br />
                Company Name:
                <asp:TextBox ID="Company_NameTextBox" runat="server" Text='<%# Bind("[Company Name]") %>' />
                <br />
                Company Address:
                <asp:TextBox ID="Company_AddressTextBox" runat="server" Text='<%# Bind("[Company Address]") %>' />
                <br />
                Company State:
                <asp:DropDownList ID="ddl_State" runat="server" DataValueField='StateAbbreviation' DataSourceID="sql_State" DataTextField='State Abbreviation'
                     SelectedValue='<%# Bind("[State Abbreviation]")%>'>
                </asp:DropDownList>
                <br />
                Company Zip:
                <asp:TextBox ID="Company_ZipTextBox" runat="server" Text='<%# Bind("[Company Zip]") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
&nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                Major:
                <asp:TextBox ID="MajorTextBox" runat="server" Text='<%# Bind("Major") %>' />
                <br />
                Semester:
                <asp:TextBox ID="SemesterTextBox" runat="server" Text='<%# Bind("Semester") %>' />
                <br />
                Position Type:
                <asp:TextBox ID="Position_TypeTextBox" runat="server" Text='<%# Bind("[Position Type]") %>' />
                <br />
                Position Title:
                <asp:TextBox ID="Position_TitleTextBox" runat="server" Text='<%# Bind("[Position Title]") %>' />
                <br />
                Position Description:
                <asp:TextBox ID="Position_DescriptionTextBox" runat="server" Text='<%# Bind("[Position Description]") %>' />
                <br />
                Position Skills:
                <asp:TextBox ID="Position_SkillsTextBox" runat="server" Text='<%# Bind("[Position Skills]") %>' />
                <br />
                Company Name:
                <asp:TextBox ID="Company_NameTextBox" runat="server" Text='<%# Bind("[Company Name]") %>' />
                <br />
                Company Address:
                <asp:TextBox ID="Company_AddressTextBox" runat="server" Text='<%# Bind("[Company Address]") %>' />
                <br />
                Company State:
                <asp:TextBox ID="Company_StateTextBox" runat="server" Text='<%# Bind("[Company State]") %>' />
                <br />
                Company Zip:
                <asp:TextBox ID="Company_ZipTextBox" runat="server" Text='<%# Bind("[Company Zip]") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                JobID:
                <asp:Label ID="JobIDLabel" runat="server" Text='<%# Eval("JobID") %>' />
                <br />
                Major:
                <asp:Label ID="MajorLabel" runat="server" Text='<%# Bind("Major") %>' />
                <br />
                Semester:
                <asp:Label ID="SemesterLabel" runat="server" Text='<%# Bind("Semester") %>' />
                <br />
                Position Type:
                <asp:Label ID="Position_TypeLabel" runat="server" Text='<%# Bind("[Position Type]") %>' />
                <br />
                Position Title:
                <asp:Label ID="Position_TitleLabel" runat="server" Text='<%# Bind("[Position Title]") %>' />
                <br />
                Position Description:
                <asp:Label ID="Position_DescriptionLabel" runat="server" Text='<%# Bind("[Position Description]") %>' />
                <br />
                Position Skills:
                <asp:Label ID="Position_SkillsLabel" runat="server" Text='<%# Bind("[Position Skills]") %>' />
                <br />
                Company Name:
                <asp:Label ID="Company_NameLabel" runat="server" Text='<%# Bind("[Company Name]") %>' />
                <br />
                Company Address:
                <asp:Label ID="Company_AddressLabel" runat="server" Text='<%# Bind("[Company Address]") %>' />
                <br />
                Company State:
                <asp:Label ID="Company_StateLabel" runat="server" Text='<%# Bind("[Company State]") %>' />
                <br />
                Company Zip:
                <asp:Label ID="Company_ZipLabel" runat="server" Text='<%# Bind("[Company Zip]") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
        <br />
    </div>

</asp:Content>

