<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="content.aspx.cs" Inherits="DTcms.Web.ygyc.content" %>

<%@ Register Src="~/ygyc/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/ygyc/header1.ascx" TagPrefix="uc1" TagName="header1" %>
<%@ Register Src="~/ygyc/Shenfen.ascx" TagPrefix="uc1" TagName="Shenfen" %>
<%@ Register Src="~/ygyc/PageControl.ascx" TagPrefix="uc1" TagName="PageControl" %>
<%@ Register Src="~/ygyc/City.ascx" TagPrefix="uc1" TagName="City" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>910教室-产品详细</title>
    <link rel="stylesheet" href="css/jquery.fullPage.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/pic.css">
    <script src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">


        $(document).ready(function () {
            $("#a1").click(function () {
                $(".div-1").show();
                $(".div-2").hide();
                $(".div-3").hide();
                $(".div-4").hide();
                $("#a2").css("background-color", "#ffffff");
                $("#a3").css("background-color", "#ffffff");
                $("#a4").css("background-color", "#ffffff");
                $("#a1").css("background-color", "#088ae8");
                $("#a1").css("color", "#ffffff");
                $("#a2").css("color", "#000000");
                $("#a3").css("color", "#000000");
                $("#a4").css("color", "#000000");
            });
            $("#a2").click(function () {
                $(".div-2").show();
                $(".div-1").hide();
                $(".div-3").hide();
                $(".div-4").hide();
                $("#a1").css("background-color", "#ffffff");
                $("#a3").css("background-color", "#ffffff");
                $("#a4").css("background-color", "#ffffff");
                $("#a2").css("background-color", "#088ae8");
                $("#a2").css("color", "#ffffff");
                $("#a1").css("color", "#000000");
                $("#a3").css("color", "#000000");
                $("#a4").css("color", "#000000");
            });
            $("#a3").click(function () {
                $(".div-3").show();
                $(".div-1").hide();
                $(".div-2").hide();
                $(".div-4").hide();
                $("#a1").css("background-color", "#ffffff");
                $("#a2").css("background-color", "#ffffff");
                $("#a4").css("background-color", "#ffffff");
                $("#a3").css("background-color", "#088ae8");
                $("#a3").css("color", "#ffffff");
                $("#a1").css("color", "#000000");
                $("#a2").css("color", "#000000");
                $("#a4").css("color", "#000000");
            });
            $("#a4").click(function () {
                $(".div-4").show();
                $(".div-1").hide();
                $(".div-2").hide();
                $(".div-3").hide();
                $("#a1").css("background-color", "#ffffff");
                $("#a2").css("background-color", "#ffffff");
                $("#a3").css("background-color", "#ffffff");
                $("#a4").css("background-color", "#088ae8");
                $("#a4").css("color", "#ffffff");
                $("#a1").css("color", "#000000");
                $("#a2").css("color", "#000000");
                $("#a3").css("color", "#000000");
            });
        });

        $(function () {
            $("#GMBUTTOM").click(function () {
                if (!confirm("请问是否确认购买该产品？")) {
                    return;
                }
                $.ajax({
                    type: "POST",
                    url: "/tools/submit_ajax.ashx?action=order_save1&id=" +<%=Request.QueryString["id"]%>,
                    dataType: "json",
                    timeout: 20000,
                    beforeSend: function (XMLHttpRequest) {
                        $("#GMBUTTOM").attr("disabled", true);
                    },
                    success: function (data, textStatus) {
                        if (data.status == 1) {
                            alert("购买成功，请等待管理员审核！");
                            document.location.href = "order.aspx";
                        } else {
                            $("#GMBUTTOM").attr("disabled", false);
                            alert(data.msg);
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("状态：" + textStatus + "；出错提示：" + errorThrown);
                        $("#GMBUTTOM").attr("disabled", false);
                    }
                });
            });
            <%if(!string.IsNullOrEmpty(Request.QueryString["PageIndex"])){%>
            $("#a4").click();
            <%}%>
        });
    </script>
</head>
<body style="margin: 0; min-width: 1200px">
    <form id="form1" runat="server">
        <%DTcms.Model.article model = ViewState["Model"] as DTcms.Model.article;%>
        <uc1:header1 runat="server" ID="header1" />

        <div class="middle">
            <div class="content-1 clear">
                <div class="preview">
                    <script>
                        function showView(obj) {
                            $("#midimg").attr("src", $(obj).attr("src").replace("thumb_", ""));
                        }
                    </script>
                    <div id="vertical" class="bigImg">
                        <img src="<%=model.albums.Count > 0 ? model.albums[0].original_path : model.img_url %>" alt="" id="midimg" />
                    </div>
                    <!--bigImg end-->
                    <div class="smallImg">
                        <div class="scrollbutton smallImgUp"></div>
                        <div class="scrollbutton smallImgDown"></div>
                        <div id="imageMenu" style="width: 485px; margin: auto; padding-top: 6px; overflow: hidden">
                            <ul style="border: 0px #000 solid; margin: 0; padding: 0" class="clear">
                                <%
    if (model.albums.Count > 0) { 
    model.albums.ForEach(t =>
    {
                                %>
                                <li>
                                    <img src="<%=t.thumb_path %>" onclick="showView(this)" /></li>
                                <%
});
    }else{
                                %>
                                  <li><img src="<%=model.img_url %>" onclick="showView(this)" /></li>
                                <%} %>
                            </ul>
                        </div>
                    </div>
                    <!--smallImg end-->

                    <div id="bigView" style="display: none;">
                        <img alt="" src="" />
                    </div>

                </div>
                <div class="right-content">
                    <h1><%=model.title %></h1>
                    <p><%=model.zhaiyao %></p>
                    <p>
                        <uc1:City runat="server" ID="City" Visible="false"  />
                         <p style="height:100px;font-size:15px; line-height:34px; ">
                         <% int city = 0;
                            int.TryParse(model.link_url, out city); %>
                        <strong style="color: #333333">培训地点：</strong><%=GetCityStr(city) %><br>
                        <strong style="color: #333333">培训时间：</strong><%=model.seo_keywords + "至" + model.seo_description %><br>
                        <strong style="color: #333333">主办方：</strong><%=model.fields["sponsor"] %><%--<script type="text/javascript" src="../tools/submit_ajax.ashx?action=view_article_click&id=<%=model.id %>&click=1"></script>--%>
                    </p>

                    <p class="price">￥<%=model.fields["sell_price"] %>/<%=GetDays(model.seo_keywords,model.seo_description ) %>天</p>

                      <%DateTime beginTime = DateTime.Now.AddDays(-1);
            DateTime endTime = DateTime.Now.AddDays(-1);
            DateTime.TryParse(model.seo_keywords, out beginTime);%>
        <%if (beginTime > DateTime.Now)
            {  %>
              <input style="display:none" class="input-1" value="立即购买" id="GMBUTTOM" type="button" />
        <%}  %>
              
                </div>
            </div>

        </div>
        <div class="content-2" style="width: 1200px; margin: auto">
            <h1 class="clear">
                <a id="a1" class="check" href="javascript:">课程详情</a><a id="a2" href="javascript:">资料下载</a><a id="a3" href="javascript:">机构介绍</a><a id="a4" href="javascript:" style="display:none">课程评价</a>
            </h1>
            <div class="div-1">
                <h2 class="title">主办单位</h2>
                <p class="p-1"><%=model.fields["sponsor"] %></p>
                <h2 class="title">课程介绍</h2>
                <p class="p-1">
                    <%=model.fields["curriculumremark"] %>
                </p>
                <h2 class="title">课程安排</h2>
                <p class="p-1">
                    <%=model.fields["curriculumanpai"] %>
                </p>
                <h2 class="title">培训对象</h2>
                <uc1:Shenfen Visible="false" runat="server" ID="Shenfen" />
                <%string shenfen = "";
                    foreach (KeyValuePair<int, string> item in Shenfen.GetPxdx())
                    {
                        if (("," + model.call_index + ",").Contains(item.Key.ToString()))
                        {
                            shenfen += item.Value + "、";
                        }
                    }
                    shenfen = shenfen.Trim('、');
                %>
                <p class="p-1"><%=shenfen %></p>
                <h2 class="title">收费标准</h2>
                <p class="p-1"><%=model.fields["salePrice"] %></p>
                <h2 class="title">联系方式</h2>
                <p class="p-1"><%=model.fields["contactinfo"] %></p>
                <h2 class="title">备注</h2>
                <p class="p-1"><%=model.fields["remark"] %></p>
            </div>
            <div class="div-2" style="display: none">
                <ul>
                    <% model.attach.ForEach(t =>
                        {
                    %>
                    <a href="<%=t.file_path %>" target="_blank">
                        <li>✲ <%=t.file_name %> <span><%=t.add_time.ToString("yyyy-MM-dd") %></span></li>
                    </a>
                    <%
                       });  %>
                </ul>
            </div>
            <div class="div-3">
                <h2 class="title">培训机构名称</h2>
                <p class="p-1"><%=model.fields["mechanismname"] %></p>
                <h2 class="title">培训机构介绍</h2>
                <p class="p-1">
                    <%=model.fields["mechanismremark"] %>
                </p>
            </div>
            <%
                int page_size = 10;
                int page_index = PageControl.PageIndex;
                string article_id = Request.QueryString["Id"];
                int totalcount = 0;
                DTcms.BLL.article_comment bll = new DTcms.BLL.article_comment();
                System.Data.DataSet ds = bll.GetList(page_size, page_index, string.Format("is_lock=0 and article_id={0}", article_id), "add_time desc", out totalcount);
            %>
            <%PageControl.DataCount = totalcount; %>
            <%PageControl.PageSize = page_size; %>
            <div class="div-4" style="display: none">
                <%if (ds.Tables[0].Rows.Count > 0)
                    { %>
                <div class="evaluate clear">
                    <div style="float: left; margin-right: 20px">
                        <span style="font-size: 60px; color: #088ae8"><%=GetFF() %></span><br>
                        <span style="color: #666666; padding-left: 7px">综合评分</span>
                    </div>
                    <ul>
                        <%foreach (System.Data.DataRow dr in ds.Tables[0].Rows)
                            { %>
                        <li>
                            <h3><%=dr["user_name"] %><span><%=Convert.ToDateTime(dr["add_time"]).ToString("yyyy-MM-dd") %></span></h3>
                            <p class="clear">
                                <img class="img-eva" src="images/userAvatar.png">
                                <%=dr["content"] %>
                            </p>
                            <div class="div-eva">
                                商家回复：<br>
                                <%=dr["reply_content"] %>
                            </div>
                        </li>
                        <%} %>
                    </ul>
                    <uc1:PageControl runat="server" ID="PageControl" />
                </div>
                <%} %>
            </div>
        </div>

        <ul class="collection clear">
            <h1>
                <p class="title"><span>类似 </h1>
            <%System.Data.DataTable goodsList = get_article_list("goods", 4, "status=0 and id<>" + Convert.ToInt32(Request.QueryString["id"]));%><!--取得一个分页DataTable-->
            <%
                if (goodsList != null)
                {
                    foreach (System.Data.DataRow dr in goodsList.Rows)
                    {
            %>
            <li>
                <p>
                    <a href="content.aspx?id=<%=dr["id"] %>">
                        <img src="<%=dr["img_url"] %>"></a>
                </p>
                <%=dr["title"].ToString().Length > 10 ? dr["title"].ToString().Substring(0,10) + "..." : dr["title"].ToString() %></li>
            <%}
                } %>
        </ul>

        <div class="open-floatingLayer" style="display: block;">
            <div class="floatingLayer-cont" id="appd_wrap_open_cnt" style="background: rgba(0, 0, 0, 0) url(&quot;https://pic.tujia.com/upload/uicommon/day_160929/201609291732514951.png&quot;) no-repeat scroll 0% 0%; left: 0%;">
            </div>
        </div>
        <script type="text/javascript">

                        $(document).ready(function () {

                            // 图片上下滚动

                            var count = $("#imageMenu li").length - 7; /* 显示 8 个 li标签内容 */

                            var interval = $("#imageMenu li:first").width();

                            var curIndex = 0;



                            $('.scrollbutton').click(function () {

                                if ($(this).hasClass('disabled')) return false;



                                if ($(this).hasClass('smallImgUp'))--curIndex;

                                else ++curIndex;



                                $('.scrollbutton').removeClass('disabled');

                                if (curIndex == 0) $('.smallImgUp').addClass('disabled');

                                if (curIndex == count - 1) $('.smallImgDown').addClass('disabled');



                                $("#imageMenu ul").stop(false, true).animate({ "marginLeft": -curIndex * interval + "px" }, 600);

                            });

                            // 解决 ie6 select框 问题

                            $.fn.decorateIframe = function (options) {

                                if ($.browser.msie && $.browser.version < 7) {

                                    var opts = $.extend({}, $.fn.decorateIframe.defaults, options);

                                    $(this).each(function () {

                                        var $myThis = $(this);

                                        //创建一个IFRAME

                                        var divIframe = $("<iframe />");

                                        divIframe.attr("id", opts.iframeId);

                                        divIframe.css("position", "absolute");

                                        divIframe.css("display", "none");

                                        divIframe.css("display", "block");

                                        divIframe.css("z-index", opts.iframeZIndex);

                                        divIframe.css("border");

                                        divIframe.css("top", "0");

                                        divIframe.css("left", "0");

                                        if (opts.width == 0) {

                                            divIframe.css("width", $myThis.width() + parseInt($myThis.css("padding")) * 2 + "px");

                                        }

                                        if (opts.height == 0) {

                                            divIframe.css("height", $myThis.height() + parseInt($myThis.css("padding")) * 2 + "px");

                                        }

                                        divIframe.css("filter", "mask(color=#fff)");

                                        $myThis.append(divIframe);

                                    });

                                }

                            }

                            $.fn.decorateIframe.defaults = {

                                iframeId: "decorateIframe1",

                                iframeZIndex: -1,

                                width: 0,

                                height: 0

                            }

                            //放大镜视窗

                            $("#bigView").decorateIframe();

                            //点击到中图

                            var midChangeHandler = null;



                            $("#imageMenu li img").bind("click", function () {

                                if ($(this).attr("id") != "onlickImg") {

                                    midChange($(this).attr("src").replace("small", "mid"));

                                    $("#imageMenu li").removeAttr("id");

                                    $(this).parent().attr("id", "onlickImg");

                                }

                            }).bind("mouseover", function () {

                                if ($(this).attr("id") != "onlickImg") {

                                    window.clearTimeout(midChangeHandler);

                                    midChange($(this).attr("src").replace("small", "mid"));

                                    $(this).css({ "border": "3px solid #959595" });

                                }

                            }).bind("mouseout", function () {

                                if ($(this).attr("id") != "onlickImg") {

                                    $(this).removeAttr("style");

                                    midChangeHandler = window.setTimeout(function () {

                                        midChange($("#onlickImg img").attr("src").replace("small", "mid"));

                                    }, 1000);

                                }

                            });

                            function midChange(src) {

                                $("#midimg").attr("src", src).load(function () {

                                    changeViewImg();

                                });

                            }

                            //大视窗看图

                            function mouseover(e) {

                                if ($("#winSelector").css("display") == "none") {

                                    $("#winSelector,#bigView").show();

                                }

                                $("#winSelector").css(fixedPosition(e));

                                e.stopPropagation();

                            }

                            function mouseOut(e) {

                                if ($("#winSelector").css("display") != "none") {

                                    $("#winSelector,#bigView").hide();

                                }

                                e.stopPropagation();

                            }

                            $("#midimg").mouseover(mouseover); //中图事件

                            $("#midimg,#winSelector").mousemove(mouseover).mouseout(mouseOut); //选择器事件



                            var $divWidth = $("#winSelector").width(); //选择器宽度

                            var $divHeight = $("#winSelector").height(); //选择器高度

                            var $imgWidth = $("#midimg").width(); //中图宽度

                            var $imgHeight = $("#midimg").height(); //中图高度

                            var $viewImgWidth = $viewImgHeight = $height = null; //IE加载后才能得到 大图宽度 大图高度 大图视窗高度



                            function changeViewImg() {

                                $("#bigView img").attr("src", $("#midimg").attr("src").replace("mid", "big"));

                            }

                            changeViewImg();

                            $("#bigView").scrollLeft(0).scrollTop(0);

                            function fixedPosition(e) {

                                if (e == null) {

                                    return;

                                }

                                var $imgLeft = $("#midimg").offset().left; //中图左边距

                                var $imgTop = $("#midimg").offset().top; //中图上边距

                                X = e.pageX - $imgLeft - $divWidth / 2; //selector顶点坐标 X

                                Y = e.pageY - $imgTop - $divHeight / 2; //selector顶点坐标 Y

                                X = X < 0 ? 0 : X;

                                Y = Y < 0 ? 0 : Y;

                                X = X + $divWidth > $imgWidth ? $imgWidth - $divWidth : X;

                                Y = Y + $divHeight > $imgHeight ? $imgHeight - $divHeight : Y;



                                if ($viewImgWidth == null) {

                                    $viewImgWidth = $("#bigView img").outerWidth();

                                    $viewImgHeight = $("#bigView img").height();

                                    if ($viewImgWidth < 200 || $viewImgHeight < 200) {

                                        $viewImgWidth = $viewImgHeight = 800;

                                    }

                                    $height = $divHeight * $viewImgHeight / $imgHeight;

                                    $("#bigView").width($divWidth * $viewImgWidth / $imgWidth);

                                    $("#bigView").height($height);

                                }

                                var scrollX = X * $viewImgWidth / $imgWidth;

                                var scrollY = Y * $viewImgHeight / $imgHeight;

                                $("#bigView img").css({ "left": scrollX * -1, "top": scrollY * -1, });

                                $("#bigView").css({ "top": 259, "left": $(".preview").offset().left + $(".preview").width() + 15 });



                                return { left: X, top: Y };

                            }

                        });

        </script>

        <uc1:footer runat="server" ID="footer" />
    </form>
</body>
</html>
