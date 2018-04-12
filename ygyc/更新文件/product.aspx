<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="DTcms.Web.ygyc.product" %>

<%@ Register Src="~/ygyc/header1.ascx" TagPrefix="uc1" TagName="header1" %>
<%@ Register Src="~/ygyc/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/ygyc/PageControl.ascx" TagPrefix="uc1" TagName="PageControl" %>

<%@ Register Src="~/ygyc/Shenfen.ascx" TagPrefix="uc1" TagName="Shenfen" %>
<%@ Register Src="~/ygyc/City.ascx" TagPrefix="uc1" TagName="City" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>910教室-产品列表</title>
    <link rel="stylesheet" href="css/jquery.fullPage.css">
    <link rel="stylesheet" href="css/index.css">
    <script src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="../scripts/datepicker/WdatePicker.js"></script>
</head>
<body style="margin: 0; min-width: 1200px">
    <form id="form1" runat="server">
           <uc1:City runat="server" ID="City" Visible="false"  />
        <%int page = PageControl.PageIndex; int totalcount; string pagelist;//分页页码%>
        <%string proName = string.IsNullOrEmpty(Request.QueryString["channel"]) ? "goods" : (Request.QueryString["channel"]).ToLower().Trim(); %>
        <%string proUrl = proName == "goods" ? "content.aspx" : "content-1.aspx"; %>
        <%System.Data.DataTable goodsList = get_article_list(proName, 0, 8, page, "status=0", out totalcount, out pagelist, "goods_list", 0, "__id__");%><!--取得一个分页DataTable-->
        <%PageControl.DataCount = totalcount; %>
        <%PageControl.PageSize = 8; %>
        <uc1:header1 runat="server" ID="header1" />
        <div class="middle">
            <script>
                function chooseDate() {
                    var date1 = $("#date1").val();
                    var date2 = $("#date2").val();
                    var url = "<%=PageControl.GetPageUrl(1, "date")%>";
                    if (date1 != "" || date2 != "") {
                        url += "&date=";
                    }
                    if (date1 != "") {
                        url += date1;
                    }
                    if (date2 != "") {
                        url += "_" + date2;
                    }
                    location.href = url;
                }
            </script>
            <%
                var date = Request.QueryString["date"];
                var date1 = "";
                var date2 = "";
                if (!string.IsNullOrEmpty(date))
                {
                    date1 = date.Split('_')[0];
                    if (date.Split('_').Length == 2)
                    {
                        date2 = date.Split('_')[1];
                    }
                }
            %>
            <ul class="middle-search">
                <%DTcms.BLL.article_category bllArticleCategory = new DTcms.BLL.article_category(); %>
                <li class="clear"><span>培训科目：</span><a href="<%=PageControl.GetPageUrl(1, "kemu") %>" <%=GetCheck("kemu","") %>>不限</a>
                    <%
                        System.Data.DataTable dtArticleCategory = bllArticleCategory.GetChildList(0, 15);
                        foreach (System.Data.DataRow dr in dtArticleCategory.Rows)
                        {
                    %>
                    <a<%=GetCheck("kemu",dr["id"]) %> href="<%=PageControl.GetPageUrl(1, "kemu") + "&kemu=" + dr["id"] %>"><%=dr["title"] %></a>
                    <%} %>
                </li>
                <li class="clear"><span>培训时间：</span><a<%=GetCheck("date","") %> href="<%=PageControl.GetPageUrl(1, "date") %>" class="check">不限</a>
                    <input value="<%=date1 %>" id="date1" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',onpicked:function(dp){chooseDate(); },oncleared:chooseDate})" style="color: #666; border: 1px #ddd solid; padding: 4px; background: url(images/icon-12.png) 5px 2px no-repeat; padding-left: 30px; width: 80px" type="text" />
                    至
                    <input value="<%=date2 %>" id="date2" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',onpicked:function(dp){chooseDate(); },oncleared:chooseDate})" style="color: #666; border: 1px #ddd solid; padding: 4px; background: url(images/icon-12.png) 5px 2px no-repeat; padding-left: 30px; width: 80px" type="text" />
                </li>
                <li class="clear"><span>培训天数：</span>
                    <a<%=GetCheck("datecount","") %> href="<%=PageControl.GetPageUrl(1, "datecount") %>">不限</a>
                    <%
                        dtArticleCategory = bllArticleCategory.GetChildList(0, 17);
                        foreach (System.Data.DataRow dr in dtArticleCategory.Rows)
                        {
                    %>
                    <a<%=GetCheck("datecount",dr["Title"].ToString()) %> href="<%=PageControl.GetPageUrl(1, "datecount") + "&datecount=" + dr["Title"] %>"><%=dr["Title"] %>天</a>
                    <%} %>
                </li>
                <li class="clear"><span>培训地点：</span><a href="<%=PageControl.GetPageUrl(1, "city") %>" <%=GetCheck("city","") %>>不限</a>
                    <%
                        System.Data.DataTable dataTableCitys = bllArticleCategory.GetCitys();
                        dataTableCitys.DefaultView.RowFilter = "seo_title='1'";
                        foreach (System.Data.DataRowView dr in dataTableCitys.DefaultView)
                        {
                    %>
                    <a<%=GetCheck("city",dr["id"]) %> href="<%=PageControl.GetPageUrl(1, "city") + "&city=" + dr["id"] %>"><%=dr["title"] %></a>
                    <%} %>
                </li>
                <li class="clear">
                     <uc1:Shenfen runat="server" ID="Shenfen" Visible="false" />
                    <span>培训人员：</span><a href="<%=PageControl.GetPageUrl(1, "callindex") %>" <%=GetCheck("callindex","") %>>不限</a>
                     <%foreach (KeyValuePair<int, string> kp in Shenfen.GetPxdx())
                                {%>
                     <a href="<%=PageControl.GetPageUrl(1, "callindex") + "&callindex=" + kp.Key %>" <%=GetCheck("callindex", kp.Key.ToString()) %>><%=kp.Value %></a>
                            <%} %>
                </li>
            </ul>
            <div class="list-top">
                <div class="list-title"><span><%=totalcount %></span>个产品满足条件</div>
                <div class="right-search">
                    <script>
                        function SearchByKey() {
                            var url = "<%=PageControl.GetPageUrl(1, "key")%>";
                            url += "&key=" + encodeURI($("#ssKey").val());
                            location.href = url;
                        }
                    </script>
                    <input class="input-1" id="ssKey" value="<%=System.Web.HttpUtility.UrlDecode(Request.QueryString["key"]) %>" placeholder="请在结果里继续搜索" type="text" /><input onclick="SearchByKey()" class="btn-1" type="button" />
                    <div class="liebiao"><a href="<%=PageControl.GetPageUrl(1, "show") + "&show=" + 0 %>" class="lie-1"></a><a class="lie-2" href="<%=PageControl.GetPageUrl(1, "show") + "&show=" + 1 %>"></a></div>
                </div>
                <div class="list-top-in">
                    <%if (proName == "goods")
                        { %>
                    <a href="<%=PageControl.GetPageUrl(1, "sort") + "&sort=0" %>">综合</a><a href="<%=PageControl.GetPageUrl(1, "sort") + "&sort=4&sorttype=" + (Request.QueryString["sorttype"] == "0" ? 1 : 0) %>">培训时间</a><a style="display:none" href="<%=PageControl.GetPageUrl(1, "sort") + "&sort=1&sorttype=" + (Request.QueryString["sorttype"] == "0" ? 1 : 0) %>">销量</a><a href="<%=PageControl.GetPageUrl(1, "sort") + "&sort=2&sorttype=" + (Request.QueryString["sorttype"] == "0" ? 1 : 0) %>">价格</a><a style="display:none" href="<%=PageControl.GetPageUrl(1, "sort") + "&sort=3&sorttype=" + (Request.QueryString["sorttype"] == "0" ? 1 : 0) %>">评价</a>
                    <%} %>
                </div>
            </div>
            <%int show = 0;
                int.TryParse(Request.QueryString["show"], out show);
                %>
               <%if (show == 0)
                   { %>
            <ul class="clear product-ul">
                <%
    if (goodsList != null)
    {
        foreach (System.Data.DataRow dr in goodsList.Rows)
        {
                %>
                <a href="<%=proUrl + "?id=" + dr["id"]%>">
                    <li>
                        <%DateTime beginTime = DateTime.Now.AddDays(-1);
            DateTime endTime = DateTime.Now.AddDays(-1);
            DateTime.TryParse(dr["Seo_Keywords"].ToString(), out beginTime);
            DateTime.TryParse(dr["Seo_Description"].ToString(), out endTime);%>
        <%if (endTime < DateTime.Now)
                     {  if (Request.QueryString["channel"] != "wangqi")
                         {%>
        <div class="div-over-1">已结束</div>
        <%}
                     } else if(beginTime < DateTime.Now && endTime > DateTime.Now){ %>
        <div class="div-over-2">进行中...</div>
        <%} %>
                        <p>
                            <img src="<%=dr["img_url"] %>">
                        </p>
                        <%=dr["title"].ToString().Length > 10 ? dr["title"].ToString().Substring(0, 10) + "..." : dr["title"].ToString() %>

                    </li>
                </a>
                <%}
    }
    else
    {%>
                请不再注入我们的系统，否则我们将使用法律手段保护自己！
                <%
    }%>
            </ul>
         <%}
    else
    {

        if (goodsList != null)
        {
            %>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="product-tab" align="center">
  <tr class="th">
    <td width="40%">标题</td>
    <td width="17%">培训时间</td>
    <td width="14%">地点</td>
    <td width="15%">培训对象</td>
    <td width="8%">价格</td>
    <td width="6%">状态</td>
  </tr>
  <%foreach (System.Data.DataRow dr in goodsList.Rows)
            { %>
  <tr>
    <td><a href="<%=proUrl + "?id=" + dr["id"]%>"><%=dr["title"].ToString()%></a></td>
    <td align="center"><%=dr["Seo_Keywords"] %>至<%=dr["Seo_Description"] %></td>
        <% int city = 0;
                        int.TryParse(dr["link_url"].ToString(), out city); %>
    <td><%=GetCityStr(city) %></td>
      <%string shenfen = "";
                    foreach (KeyValuePair<int, string> item in Shenfen.GetPxdx())
                    {
                        if (("," + dr["call_index"].ToString() + ",").Contains(item.Key.ToString()))
                        {
                            shenfen += item.Value + "、";
                        }
                    }
                    shenfen = shenfen.Trim('、');
                %>
    <td align="center"><%=shenfen %></td>
    <td align="center"><%=GetPrice(dr["id"].ToString()) %>/<%=GetDays(dr["seo_keywords"].ToString(),dr["seo_description"].ToString() ) %>天</td>
    <td align="center">
        <%DateTime beginTime = DateTime.Now.AddDays(-1);
            DateTime endTime = DateTime.Now.AddDays(-1);
            DateTime.TryParse(dr["Seo_Keywords"].ToString(), out beginTime);
            DateTime.TryParse(dr["Seo_Description"].ToString(), out endTime);%>
        <%if (endTime < DateTime.Now)
            {  %>
        已结束
        <%} else if(beginTime < DateTime.Now && endTime > DateTime.Now){ %>
        <span>进行中</span>
        <%}  else { %>
        未开始
        <%} %>
    </td>
  </tr>
 
                <%} %>
</table>
            <%
        }
    } %>
            <uc1:PageControl runat="server" ID="PageControl" />
        </div>
        <uc1:footer runat="server" ID="footer" />
    </form>
</body>
</html>
