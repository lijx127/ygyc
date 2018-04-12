<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="City.ascx.cs" Inherits="DTcms.Web.ygyc.City" %>
<div class="rule-single-select">
    <asp:DropDownList ID="ddlInternational" AutoPostBack="True" runat="server" OnSelectedIndexChanged="ddlProvince_SelectedIndexChanged"></asp:DropDownList>
</div>
<div class="rule-single-select">
    <asp:DropDownList ID="ddlProvince" AutoPostBack="True" runat="server" OnSelectedIndexChanged="ddlProvince_SelectedIndexChanged"></asp:DropDownList>
</div>
<div class="rule-single-select">
    <asp:DropDownList ID="ddlCity" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProvince_SelectedIndexChanged"></asp:DropDownList>
</div>
<div class="rule-single-select">
    <asp:DropDownList ID="ddlCounty" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProvince_SelectedIndexChanged"></asp:DropDownList>
</div>
<div class="rule-single-select">
    <asp:DropDownList ID="ddlCountry" runat="server"></asp:DropDownList>
</div>