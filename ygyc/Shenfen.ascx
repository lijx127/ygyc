<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Shenfen.ascx.cs" Inherits="DTcms.Web.ygyc.Shenfen" %>
<asp:DropDownList ID="ddlShenfen" CssClass="select" runat="server">
    <asp:ListItem Text="" Value="0"></asp:ListItem>
    <asp:ListItem Text="校级领导" Value="2"></asp:ListItem>
    <asp:ListItem Text="科任老师" Value="1"></asp:ListItem>
    <asp:ListItem Text="中层干部" Value="3"></asp:ListItem>
</asp:DropDownList>