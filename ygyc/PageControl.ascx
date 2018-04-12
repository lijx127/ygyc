<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PageControl.ascx.cs" Inherits="DTcms.Web.ygyc.PageControl" %>
<div class="page-number clear" style="width:450px">
    <%Paging paging = new Paging();
        paging.NowPage = PageIndex;
        paging.PageSize = PageSize;
        paging.Totalcount = DataCount;
        paging.PageNumber = 5;
        List<PageInfo> pages = paging.GetPaging();
    %>
    <%
        StringBuilder stringBuilder = new StringBuilder();
        pages.ForEach(t =>
        {
            switch (t.PageType)
            {
                case PageType.上一页:
                    stringBuilder.Append("<a href=\"" + GetPageUrl(t.PageIndex) + "\">" + "上翻" + "</a>");
                    break;
                case PageType.下一页:
                    stringBuilder.Append("<a href=\"" + GetPageUrl(t.PageIndex) + "\">" + "下翻" + "</a>");
                    break;
                case PageType.当前页:
                    stringBuilder.Append("<a href=\"" + GetPageUrl(t.PageIndex) + "\" class=\"choose-a\">" + t.PageIndex + "</a>");
                    break;
                case PageType.末页:
                    stringBuilder.Append("<a href=\"" + GetPageUrl(t.PageIndex) + "\">" + t.PageType + "</a>");
                    break;
                case PageType.省略号:
                    stringBuilder.Append("<a href=\"" + "" + "\">" + "..." + "</a>");
                    break;
                case PageType.首页:
                    stringBuilder.Append("<a href=\"" + GetPageUrl(t.PageIndex) + "\">" + t.PageType + "</a>");
                    break;
                case PageType.默认:
                    stringBuilder.Append("<a href=\"" + GetPageUrl(t.PageIndex) + "\">" + t.PageIndex + "</a>");
                    break;
            }
        });%>
    <%=stringBuilder %>
</div>
<asp:TextBox ID="txtPageSize" Visible="false" runat="server"></asp:TextBox>
<asp:TextBox ID="txtPageIndex" Visible="false" runat="server"></asp:TextBox>
<asp:TextBox ID="txtDataCount" Visible="false" runat="server"></asp:TextBox>