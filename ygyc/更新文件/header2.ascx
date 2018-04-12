<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="header2.ascx.cs" Inherits="DTcms.Web.ygyc.header2" %>
<div class="header">
    <div class="header-logo">
        <img width="180" src="images/logo-in.png">
    </div>
    <div class="header-menu">
        <a href="index.aspx">首页</a><a href="product.aspx?channel=goods">培训课程</a><a href="product.aspx?channel=wangqi">往期回顾</a><a href="member.aspx">会员中心</a><a style="display:none" href="points.aspx">积分商城</a>
    </div>
    <div class="header-login">
        <%DTcms.Web.UI.BasePage basePage = new DTcms.Web.UI.BasePage();
            if (!basePage.IsUserLogin())
            {%>
        <a href="Login.aspx">注册</a><a href="Login.aspx">登录</a>
        <%}
    else
    { %>
        <img style="margin-bottom:-5px" src="images/in-people.png"> <span style="font-size:12px; color:#ffffff"><a href="member.aspx"><%=basePage.GetUserInfo().user_name %></a>[<a href="loginaout.aspx">退出</a>]</span>
        <%} %>
        <a class="message-a" href="/admin/login.aspx" target="_blank">免费发布培训信息</a>
    </div>
</div>
