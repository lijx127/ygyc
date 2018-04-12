<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="header3.ascx.cs" Inherits="DTcms.Web.ygyc.header3" %>
<div class="top" style="background:url(images/02.jpg) center">
    <div class="header">
        <div class="header-logo">
            <img width="180" src="images/logo-in.png">
        </div>
        <div class="header-menu">
            <a href="index.aspx">首页</a><a href="product.aspx?channel=goods">培训课程</a><a href="product.aspx?channel=wangqi">往期回顾</a><a href="member1.aspx">会员中心</a><a href="points.aspx">积分商城</a>
        </div>
        <div class="header-login">
            <%DTcms.Web.UI.BasePage basePage = new DTcms.Web.UI.BasePage();
            if (!basePage.IsUserLogin())
            {%>
        <a href="Login.aspx">注册</a><a href="Login.aspx">登录</a>
        <%}
    else
    { %>
        <img style="margin-bottom:-5px" src="images/in-people.png"> <span style="font-size:12px; color:#ffffff"><a href="member1.aspx"><%=basePage.GetUserInfo().user_name %></a> &nbsp; &nbsp;[<a href="loginaout.aspx">退出</a>]</span>
        <%} %>
            <a class="message-a" href="/admin/login.aspx" target="_blank">免费发布培训信息</a>
        </div>
    </div>
    <div class="top-in" style="width:600px;padding-left:100px">
        <div class="top-search" style="width:600px;background: url(images/search-bg-1.png);">
            <script>
                function zongKeySearch() {
                    location.href = "points.aspx?key=" + encodeURI($("#zongKey").val());
                }
            </script>
            <input class="input-1" style="width:435px" type="text" placeholder="请输入您要搜索的关键字" value="<%=Request.QueryString["key"] %>" id="zongKey" /><input class="btn-search" onclick="zongKeySearch()" type="button" /><br>
            <span class="hot-key">热搜词汇：
         <%DTcms.BLL.article articleBll = new DTcms.BLL.article(); %>
                <%System.Data.DataTable goodsList = articleBll.GetList(100, "status=0 and channel_id = 16", "sort_id,add_time desc").Tables[0];%><!--取得一个分页DataTable-->
                <%
                    if (goodsList != null)
                    {
                        foreach (System.Data.DataRow dr in goodsList.Rows)
                        {
                %>
                <a href="product.aspx?channel=goods&key=<%=System.Web.HttpUtility.UrlEncode(dr["title"].ToString()) %>"><%=dr["title"] %></a>
                <%}
                    } %>
            </span>
        </div>
    </div>
</div>
