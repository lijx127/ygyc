<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="order.aspx.cs" Inherits="DTcms.Web.ygyc.order" %>

<%@ Register Src="~/ygyc/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/ygyc/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/ygyc/PageControl.ascx" TagPrefix="uc1" TagName="PageControl" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>910教室-订单</title>
    <link rel="stylesheet" href="css/jquery.fullPage.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/index.css">
    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="js/alertPopShow.js"></script>
</head>
<body style="margin: 0; min-width: 1200px">
    <form id="form1" runat="server">
        <script type="text/javascript">
            function xjmousemove(obj) {
                var id = $(obj).attr("id");
                if (id == "xj5") {
                    $("#xj1").attr("src", "images/l.png");
                    $("#xj2").attr("src", "images/l.png");
                    $("#xj3").attr("src", "images/l.png");
                    $("#xj4").attr("src", "images/l.png");
                    $("#xj5").attr("src", "images/l.png");
                }
                else if (id == "xj4") {
                    $("#xj1").attr("src", "images/l.png");
                    $("#xj2").attr("src", "images/l.png");
                    $("#xj3").attr("src", "images/l.png");
                    $("#xj4").attr("src", "images/l.png");
                    $("#xj5").attr("src", "images/h.png");
                }
                else if (id == "xj3") {
                    $("#xj1").attr("src", "images/l.png");
                    $("#xj2").attr("src", "images/l.png");
                    $("#xj3").attr("src", "images/l.png");
                    $("#xj4").attr("src", "images/h.png");
                    $("#xj5").attr("src", "images/h.png");
                }
                else if (id == "xj2") {
                    $("#xj1").attr("src", "images/l.png");
                    $("#xj2").attr("src", "images/l.png");
                    $("#xj3").attr("src", "images/h.png");
                    $("#xj4").attr("src", "images/h.png");
                    $("#xj5").attr("src", "images/h.png");
                }
                else if (id == "xj1") {
                    $("#xj1").attr("src", "images/l.png");
                    $("#xj2").attr("src", "images/h.png");
                    $("#xj3").attr("src", "images/h.png");
                    $("#xj4").attr("src", "images/h.png");
                    $("#xj5").attr("src", "images/h.png");
                }
            }

            function xjmousemove1(obj) {
                $("#xj1").attr("src", "images/h.png");
                $("#xj2").attr("src", "images/h.png");
                $("#xj3").attr("src", "images/h.png");
                $("#xj4").attr("src", "images/h.png");
                $("#xj5").attr("src", "images/h.png");
                if (nowXj > 0) {
                    for (var i = 1; i <= nowXj; i++) {
                        $("#xj" + i).attr("src", "images/l.png");
                    }
                }
            }

            var nowXj = 0;

            function xjclick(obj) {
                var id = $(obj).attr("id");
                nowXj = parseInt(id.replace("xj", ""));
            }

            $(function () {
                nowXj = 0;
                $('.demo4').on('click', function () {
                    var article_id = $(this).attr("title").split('_')[0];
                    var orderid = $(this).attr("title").split('_')[1];
                    var html = "<img src='images/h.png' id='xj1' onmouseover='xjmousemove(this)' onmouseout='xjmousemove1(this)' onclick='xjclick(this)' style='margin:0px 0 10px 85px'><img src='images/h.png' id='xj2' onmouseover='xjmousemove(this)' onmouseout='xjmousemove1(this)' onclick='xjclick(this)' style='margin:0px 0 10px 4px'><img src='images/h.png' id='xj3' onmouseover='xjmousemove(this)' onmouseout='xjmousemove1(this)' onclick='xjclick(this)' style='margin:0px 0 10px 4px'><img src='images/h.png' id='xj4' onmouseover='xjmousemove(this)' onmouseout='xjmousemove1(this)' onclick='xjclick(this)' style='margin:0px 0 10px 4px'><img src='images/h.png' onmouseover='xjmousemove(this)' onmouseout='xjmousemove1(this)' onclick='xjclick(this)' id='xj5' style='margin:0px 0 10px 4px'><textarea class='confirm_input' placeholder='请在这里输入您对我们产品的评价，帮助我们改进服务，谢谢！'></textarea>";
                    popTipShow.confirm('用户评价', html, ['提交评价', '取 消'],
                        function (e) {
                            //callback 处理按钮事件
                            var button = $(e.target).attr('class');
                            if (button == 'ok') {
                                if (null == $(".confirm_input").val() || "" == $(".confirm_input").val()) {
                                    webToast("评价不能为空！", "bottom", 3000);
                                    return;
                                }
                                if (nowXj == 0) {
                                    webToast("请选择评论星级！", "bottom", 3000);
                                    return;
                                }
                                this.hide();
                                setTimeout(function () {
                                    webToast($(".confirm_input").val(), "bottom", 3000);
                                }, 300);

                                var txtContent = $(".confirm_input").val();
                                var xx = nowXj;

                                //按下确定按钮执行的操作
                                //todo ....	
                                $.ajax({
                                    type: "POST",
                                    url: "/tools/submit_ajax.ashx?action=comment_add&article_id=" + article_id,
                                    dataType: "json",
                                    data: {
                                        "article_id": article_id,
                                        "txtContent": txtContent,
                                        "fen": xx,
                                        "orderid": orderid
                                    },
                                    timeout: 20000,
                                    success: function (data, textStatus) {
                                        if (data.status == 1) {
                                            alert("评价成功！");
                                            location.reload();
                                        } else {
                                            alert(data.msg);
                                        }
                                    }
                                });
                            }

                            if (button == 'cancel') {
                                //按下取消按钮执行的操作
                                //todo ....
                                this.hide();

                            }
                        }
                    );
                });
            });

            //单击执行AJAX请求操作
            function clickSubmit(sendUrl) {
                if (!confirm("请问是否确认取消订单？")) {
                    return;
                }
                $.ajax({
                    type: "POST",
                    url: sendUrl,
                    dataType: "json",
                    timeout: 20000,
                    success: function (data, textStatus) {
                        if (data.status == 1) {
                            location.reload();
                        } else {
                            alert(data.msg);
                        }
                    }
                });
            }
        </script>
        <uc1:header runat="server" ID="header" />
        <div class="middle member">
            <script>
                $(function () {
                    $("#orderstatus").change(function () {
                        var url = "<%=PageControl.GetPageUrl(1, "status")%>";
                        url += "&status=" + $(this).val();
                        location.href = url;
                    });
                })
            </script>
            <p>
                <select id="orderstatus" class="select select-1">
                    <option value="0" <%=GetCheck("status", "") %>>全部订单</option>
                    <option value="1" <%=GetCheck("status", "1") %>>已完成</option>
                    <option value="2" <%=GetCheck("status", "2") %>>待评价</option>
                    <option value="3" <%=GetCheck("status", "3") %>>审核中</option>
                </select>
            </p>
            <div>
                <%int page = PageControl.PageIndex; int totalcount;%>
                <%System.Data.DataTable list = get_order_list(8, page, "user_id=" + userModel.id + " and status<=3", out totalcount);%>
                <!--取得一个DataTable-->
                <%PageControl.DataCount = totalcount; %>
                <%PageControl.PageSize = 8; %>
                <%
                    foreach (System.Data.DataRow dr in list.Rows)
                    {
                        DTcms.Model.article model = GetArticle(dr["id"]);
                        if (model == null)
                        {
                            continue;
                        }
                %>
                <%
                    int fen = 0;
                    string status = GetOrderStatus(model.id, Convert.ToInt32(dr["id"]), ref fen); %>
                <table width="980px" border="0" cellspacing="0" cellpadding="0" align="center" class="order">
                    <tr>
                        <td  colspan="6" class="td-1"><%=Convert.ToDateTime(dr["add_time"]).ToString("yyyy-MM-dd HH:mm:ss") %>   <span>订单编号：</span><%=dr["order_no"] %>
                            <%if (status == "待审核")
                                { %>
                            <a class="order-del" href="javascript:clickSubmit('/tools/submit_ajax.ashx?action=order_cancel&order_no=<%=dr["order_no"] %>');">
                                <%} %>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td width="114" valign="middle">
                            <img src="<%=model.img_url %>" width="104" height="75"></td>
                        <%if (model.channel_id == 14)
                            { %>
                        <td width="300"><%=model.title %></td>
                        <%}
                            else
                            { %>
                        <td width="300"><%=model.zhaiyao %></td>
                        <%} %>
                        <td width="109" align="center"><span style="color: #333"><%=userModel.nick_name %></span></td>
                        <%if (model.channel_id == 14)
                            { %>
                        <td width="95" align="center">兑换<%=model.fields["point"] %>积分</td>
                        <%}
                            else
                            { %>
                        <td width="95" align="center">总额￥<%=dr["payable_amount"] %></td>
                        <%} %>
                        <td width="79" align="center"><%=status %></td>
                        <td width="110" align="center" class="star-td">
                            <%if (status == "已完成")
    {
        for (int i = 0; i < fen; i++)
        {
                                    %>
                            <img src='images/l.png'>
                            <%}
    }
    else if (status == "待评价")
    {%>
                            <a href="javascript:void(0)" title="<%=model.id %>_<%=dr["id"] %>" class="demo4">评价</a>
                            <%}%>
                        </td>
                    </tr>
                </table>
                <%} %>
            </div>
            <uc1:PageControl runat="server" ID="PageControl" />
            <%--<div class="page-number clear"><a href="#">1</a><a href="#">2</a><a href="#">3</a><a href="#">4</a><a href="#">5</a><span style="float: left; font-size: 11px; letter-spacing: 1px; display: block; line-height: 39px; height: 32px; width: 18px; text-align: center">...</span><a href="#">24</a><a href="#" style="width: 60px">下一页</a></div>--%>
        </div>
        <uc1:footer runat="server" ID="footer" />
    </form>
</body>
</html>
