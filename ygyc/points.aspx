<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="points.aspx.cs" Inherits="DTcms.Web.ygyc.points" %>

<%@ Register Src="~/ygyc/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/ygyc/PageControl.ascx" TagPrefix="uc1" TagName="PageControl" %>
<%@ Register Src="~/ygyc/header3.ascx" TagPrefix="uc1" TagName="header3" %>






<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>910教室-积分商城</title>
    <link rel="stylesheet" href="css/jquery.fullPage.css">
    <link rel="stylesheet" href="css/index.css">
    <script src="js/jquery-1.8.3.min.js"></script>
</head>
<body style="margin: 0; min-width: 1200px">
    <form id="form1" runat="server">
        <script type="text/javascript">
            function duihuan(id) {
                if (!confirm("请问是否确认兑换该产品？")) {
                    return;
                }
                $.ajax({
                    type: "POST",
                    url: "/tools/submit_ajax.ashx?action=order_save1&id=" + id,
                    dataType: "json",
                    timeout: 20000,
                    success: function (data, textStatus) {
                        if (data.status == 1) {
                            alert("兑换成功，请等待管理员审核！");
                        } else {
                            alert(data.msg);
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("状态：" + textStatus + "；出错提示：" + errorThrown);
                    }
                });
            }
        </script>
        <%int page = PageControl.PageIndex; int totalcount; string pagelist;//分页页码%>
        <%string proName = string.IsNullOrEmpty(Request.QueryString["channel"]) ? "goods" : Request.QueryString["channel"]; %>
        <%string proUrl = string.IsNullOrEmpty(Request.QueryString["channel"]) ? "content.aspx" : "content-1.aspx"; %>
        <%System.Data.DataTable goodsList = get_article_list("jifen", 0, 8, page, "status=0", out totalcount, out pagelist, "goods_list", 0, "__id__");%><!--取得一个分页DataTable-->
        <%PageControl.DataCount = totalcount; %>
        <%PageControl.PageSize = 8; %>
        <uc1:header3 runat="server" ID="header3" />
        <div class="middle">
            <%--<div class="list-top" style="margin-top: 30px">
                <div class="list-title"><span>2080</span>个产品满足条件</div>
                <div class="right-search">
                    <input class="input-1" value="请在结果里继续搜索" type="text" /><input class="btn-1" type="button" />
                </div>
                <div class="list-top-in">
                    <a href="#">综合</a><a href="#">销量</a><div class="list-toppage"><a href="#">首页</a> <a href="#">上一页</a> 1/5 <a href="#">下一页</a> <a href="#">尾页</a></div>
                </div>
            </div>--%>
            <ul class="clear product-ul points">
                <%
                    foreach (System.Data.DataRow dr in goodsList.Rows)
                    {
                        DTcms.Model.article model = GetArticle(dr["id"]);
                %>
                <li>
                    <p>
                        <img width="265" src="<%=model.img_url %>">
                    </p>
                    <span class="points-title"><%=model.title %></span><br>
                    <span class="points-span"><%=Math.Abs(Convert.ToDecimal(model.fields["point"])) %>积分</span>
                    <%if (Convert.ToInt32(model.fields["stock_quantity"]) == 0)
                        {%>
                    <a href="#" class="points-btn points-btnover">已兑完</a>
                    <%}
                        else
                        {%>
                    <a href="javascript:duihuan(<%=model.id %>)" class="points-btn">马上兑换</a>
                    <%} %>
                    <br>
                    <span class="points-number">¥<%=model.fields["market_price"] %></span></li>
                <%} %>
            </ul>
            <uc1:PageControl runat="server" ID="PageControl" />
        </div>
        <uc1:footer runat="server" ID="footer" />
    </form>
</body>
</html>
