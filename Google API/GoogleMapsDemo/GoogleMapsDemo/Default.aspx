<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Welcome!</h2>
    <p>
        This demo shows how to use the <a href="http://code.google.com/apis/maps/">Google Maps API</a> to build a simple store locator
        web application.
    </p>
    <p>
        This demo site is powered by the <code>StoreLocations.mdf</code> database in the <code>App_Data</code> folder, which contains a single
        table, <code>Stores</code>. This table has one record for each store, specifying the address, city, region, country code, 
        postal code, and latitude and longitude coordinates. From the <a href="FindAStore.aspx">Find a Store</a> page you can search this
        database by entering the name of an address, a city, a region, a country or a ZIP code. It's pretty intuitive, if I do say so myself.
        <a href="FindAStore.aspx">Give it a try!</a>
    </p>
    <p>
        Happy Programming!
    </p>
    <blockquote>
        Scott Mitchell<br />
        <a href="mailto:mitchell@4guysfromrolla.com">mitchell@4guysfromrolla.com</a><br />
        <a href="http://scottonwriting.net/sowBlog/">My Blog</a>
    </blockquote>
</asp:Content>

