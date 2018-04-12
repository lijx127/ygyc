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
<style type="text/css">
.span-s{margin-left:30px}
body{font-family:"微软雅黑"}
</style>
</head>
<body style="margin: 0; min-width: 1200px;font-family:'微软雅黑'">
    <form id="form1" runat="server">
        <%DTcms.Model.article model = ViewState["Model"] as DTcms.Model.article;%>
        <uc1:header1 runat="server" id="header1" />
        <div class="middle">
<div class="location">当前位置 > <a href="http://www.910class.com/ygyc/index.aspx">首页</a> > 关于我们</div> 
            <div class="content-1 clear" style="display:none">

                <h1 style="text-align: center"><%=model.title %></h1>
                <p style="color: #666666; font-size: 14px; text-align: center">编辑：<%=model.fields["author"] %> &nbsp;&nbsp;来源：<%=model.fields["source"] %> &nbsp;&nbsp;时间：<%=model.add_time.ToString("yyyy年MM月dd日") %> &nbsp;&nbsp;访问次数 : <script type="text/javascript" src="../tools/submit_ajax.ashx?action=view_article_click&id=<%=model.id %>&click=1"></script></p>
                <p style="text-align: center">
                 <%=model.content %></p>
            </div>
              <div class="content-1 clear" style="line-height:36px; width:960px; margin:60px auto; position: relative;padding-bottom:100px">

	    <h1 style="text-align:center">910教室</h1>
	  <p><span class="span-s"></span>910教室隶属于四川云谷云创教育科技有限公司旗下，专注教师培训课程展示的专业网络服务平台，是云谷云创核心组成部分，肩负着资源统合的重要作用。</p>
	   <p><span class="span-s"></span>910教室平台是教师继续教育行业的智能化网络展示平台，旨在整合全国优秀培训机构，经过对各机构培训项目的筛选、整理、再展示，给教育工作者展示优秀的培训项目，为全国中小幼教师的专业发展提供开阔的视野及更多的选择。</p>
	    <p><span class="span-s"></span>四川云谷云创教育科技有限公司成立于2017年4月10日，秉承“服务决定品质，专业造就成功”的价值理念，立足教育，着眼未来！ </p>
		 <p><span class="span-s"></span>在新时代教育形势下，云谷云创统合现有教育资源，谋求在教师教育、未来教育、国际教育、学校服务等领域长足发展，希望以更丰富的形式，给教育工作者提供更好的服务！</p>
		 <p style="line-height:60px">联系我们：<br>
<span style="float:left;">电话：龙老师     18911025973<br>
邮箱：2467378445@qq.com<br>
地址：成都市科华北路99号四川大学科技园713室</span>
<span style="float:left;lin-height:24px;margin:-60px 0 0 100px;">云谷云创官微二维码：<br><img  style="width:200px; margin:-20px 0 0 -10px" src="images/ma.png"></span></p>
  </div>
        </div>
        <uc1:footer runat="server" ID="footer" />
    </form>
</body>
</html>
