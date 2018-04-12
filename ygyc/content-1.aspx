<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="content-1.aspx.cs" Inherits="DTcms.Web.ygyc.content_1" %>

<%@ Register Src="~/ygyc/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/ygyc/header1.ascx" TagPrefix="uc1" TagName="header1" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>910教室-课程详细</title>
    <link rel="stylesheet" href="css/jquery.fullPage.css">
    <link rel="stylesheet" href="css/index.css">
    <script src="js/jquery-1.8.3.min.js"></script>

</head>
<body style="margin: 0; min-width: 1200px">
    <form id="form1" runat="server">
        <%DTcms.Model.article model = ViewState["Model"] as DTcms.Model.article;%>
        <uc1:header1 runat="server" id="header1" />
        <div class="middle">
<div class="location">当前位置 > <a href="http://www.910class.com/ygyc/index.aspx">首页</a> > <a href="http://www.910class.com/ygyc/product.aspx?channel=wangqi">往期回顾</a> > <%=model.title %></div> 
            <div class="content-1 clear">
                <h1 style="text-align: center"><%=model.title %></h1>
                <p style="color: #666666; font-size: 14px; text-align: center">编辑：<%=model.fields["author"] %> &nbsp;&nbsp;来源：<%=model.fields["source"] %> &nbsp;&nbsp;时间：<%=model.add_time.ToString("yyyy年MM月dd日") %> &nbsp;&nbsp;访问次数 : <script type="text/javascript" src="../tools/submit_ajax.ashx?action=view_article_click&id=<%=model.id %>&click=1"></script></p>
                <p style="text-align: center">
                 <%=model.content %></p>
            </div>

        </div>
        <uc1:footer runat="server" ID="footer" />
    </form>
</body>
</html>
