<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="header.ascx.cs" Inherits="DTcms.Web.ygyc.header" %>
<div class="top" style="height: 80px; background: #3a52a8">
    <div class="member-top">
        <a href="index.aspx"><span class="member-logo">
            <img width="200" src="images/logo-in.png"></span></a>
        <%if (!Request.Url.ToString().ToLower().Contains("houtai.aspx"))
            {%>
        <div class="member-menu">
            <a href="index.aspx" class="a1" style="color: white">回首页</a><a href="member1.aspx" class="a2" style="color: white">基本信息</a><a href="order.aspx" class="a3" style="color: white;display:none">我的订单</a>

           
            <%--<div class="line"></div>--%>
        </div>
         <a style="float:right;color:white; margin-top:20px;font-size:15px" href="loginaout.aspx">退出登录</a>
        <%} %>
    </div>
</div>