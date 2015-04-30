<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="FindAStore.aspx.vb" Inherits="FindAStore" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Find a Store Near You!</h2>
    <p>
        Enter your address, city, or postal code to find stores near you!
    </p>

    <asp:UpdatePanel ID="upSearchUI" runat="server">
        <ContentTemplate>
            <asp:Panel runat="server" DefaultButton="btnSearch">
                <b>Your Address:</b> <asp:TextBox ID="txtSearch" Width="55%" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqSearch" ControlToValidate="txtSearch" runat="server" ErrorMessage="[Required]" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:Button ID="btnSearch" runat="server" Text="Search!" /><br />
                <i>Example: San Diego, CA</i> or <i>90505</i> or <i>600 Ash St., San Diego</i>
            </asp:Panel>

            <asp:Label runat="server" ID="lblNoResults" Visible="false" ForeColor="Red" Font-Italic="true">The address you entered is not known or understood. Try simplifying the address, or enter just a city, region, or postal code...</asp:Label>

            <asp:ListView ID="lvDidYouMean" runat="server">
                <LayoutTemplate>
                    <div style="padding-left: 25px; margin-top: 10px;">
                        <b>Did you mean...</b>
                        <ol>
                            <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
                        </ol>
                    </div>
                </LayoutTemplate>

                <ItemTemplate>
                    <li>
                        <asp:HyperLink ID="lnkSelectDYM" runat="server"
                                       NavigateUrl='<%# string.Format("ShowStoreLocations.aspx?Address={0}", Server.UrlEncode(Container.DataItem.ToString())) %>'
                                        Text='<%# Container.DataItem %>' />
                    </li>
                </ItemTemplate>
            </asp:ListView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

