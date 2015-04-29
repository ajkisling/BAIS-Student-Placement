<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ShowJobLocations.aspx.vb" Inherits="ShowJobLocations" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Store Locations Near <asp:Label ID="lblAddress" runat="server"></asp:Label></h2>
    <p>
        <a href="FindAStore.aspx">&lt;&lt; Enter a new search...</a>
    </p>

    <asp:UpdatePanel ID="upSearchResults" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <asp:ListView ID="lvSearchResults" runat="server" DataSourceID="dsSearchResults" DataKeyNames="StoreNumber">
                <AlternatingItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="StoreNumberLabel" runat="server" Text='<%# Eval("StoreNumber") %>' />
                        </td>
                        <td>
                            <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                        </td>
                        <td>
                            <asp:Label ID="RegionLabel" runat="server" Text='<%# Eval("Region") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CountryCodeLabel" runat="server" Text='<%# Eval("CountryCode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Postal_CodeLabel" runat="server" Text='<%# Eval("[Postal Code]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="LatitudeLabel" runat="server" Text='<%# Eval("Latitude") %>' />
                        </td>
                        <td>
                            <asp:Label ID="LongitudeLabel" runat="server" Text='<%# Eval("Longitude") %>' />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="StoreNumberLabel1" runat="server" Text='<%# Eval("StoreNumber") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="RegionTextBox" runat="server" Text='<%# Bind("Region") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CountryCodeTextBox" runat="server" Text='<%# Bind("CountryCode") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Postal_CodeTextBox" runat="server" Text='<%# Bind("[Postal Code]") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="LatitudeTextBox" runat="server" Text='<%# Bind("Latitude") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="LongitudeTextBox" runat="server" Text='<%# Bind("Longitude") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>

                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr runat="server" style="">
                                        <th runat="server">StoreNumber</th>
                                        <th runat="server">Address</th>
                                        <th runat="server">City</th>
                                        <th runat="server">Region</th>
                                        <th runat="server">CountryCode</th>
                                        <th runat="server">Postal Code</th>
                                        <th runat="server">Latitude</th>
                                        <th runat="server">Longitude</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style=""></td>
                        </tr>
                    </table>
                </LayoutTemplate>

                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="RegionTextBox" runat="server" Text='<%# Bind("Region") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CountryCodeTextBox" runat="server" Text='<%# Bind("CountryCode") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Postal_CodeTextBox" runat="server" Text='<%# Bind("[Postal Code]") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="LatitudeTextBox" runat="server" Text='<%# Bind("Latitude") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="LongitudeTextBox" runat="server" Text='<%# Bind("Longitude") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>

                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="StoreNumberLabel" runat="server" Text='<%# Eval("StoreNumber") %>' />
                        </td>
                        <td>
                            <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                        </td>
                        <td>
                            <asp:Label ID="RegionLabel" runat="server" Text='<%# Eval("Region") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CountryCodeLabel" runat="server" Text='<%# Eval("CountryCode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Postal_CodeLabel" runat="server" Text='<%# Eval("[Postal Code]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="LatitudeLabel" runat="server" Text='<%# Eval("Latitude") %>' />
                        </td>
                        <td>
                            <asp:Label ID="LongitudeLabel" runat="server" Text='<%# Eval("Longitude") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="StoreNumberLabel" runat="server" Text='<%# Eval("StoreNumber") %>' />
                        </td>
                        <td>
                            <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                        </td>
                        <td>
                            <asp:Label ID="RegionLabel" runat="server" Text='<%# Eval("Region") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CountryCodeLabel" runat="server" Text='<%# Eval("CountryCode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Postal_CodeLabel" runat="server" Text='<%# Eval("[Postal Code]") %>' />
                        </td>
                        <td>
                            <asp:Label ID="LatitudeLabel" runat="server" Text='<%# Eval("Latitude") %>' />
                        </td>
                        <td>
                            <asp:Label ID="LongitudeLabel" runat="server" Text='<%# Eval("Longitude") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>

            <asp:SqlDataSource ID="dsSearchResults" runat="server" 
                ConnectionString="<%$ ConnectionStrings:dbo.StudentPlacement %>" 
                
                SelectCommand="SELECT * FROM [Stores]">
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

