<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="DTcms.Web.ygyc.index" %>

<%@ Register Src="~/ygyc/header2.ascx" TagPrefix="uc1" TagName="header2" %>
<%@ Register Src="~/ygyc/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/ygyc/Shenfen.ascx" TagPrefix="uc1" TagName="Shenfen" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>云上学</title>
    <link rel="stylesheet" href="css/jquery.fullPage.css">
    <link rel="stylesheet" href="css/nivo-slider.css">

    <link rel="stylesheet" href="css/style.css">

    <link rel="stylesheet" href="css/index.css">
    <style type="text/css">
        /* float-news */
        .float-news {
            background: #fbfbfb;
            border: 2px solid #e1e1e1;
            border-left: 0 none;
            border-top-right-radius: 4px;
            border-bottom-right-radius: 4px;
            box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
            display: inline-block;
            font-size: 16px;
        }

        .float-news {
            height: 180px;
            left: 0px;
            padding: 10px 15px;
            width: 100%;
            z-index: 100;
            bottom: 0px;
            _margin-top: 117px;
        }

        .float-open {
            height: 125px;
            left: -125px;
            padding: 4px 4px 4px 6px;
            width: 125px;
            z-index: 99;
            bottom: 47px;
            _margin-top: 206px;
            background: url(images/nav-close.png) no-repeat
        }

        .float-news, .float-open {
            position: fixed;
            *zoom: 1;
            _position: absolute;
            _top: expression(eval(document.documentElement.scrollTop));
        }

        .float-close {
            background: url(images/nav-close.png) no-repeat left top;
            overflow: hidden;
            height: 48px;
            opacity: .6;
            filter: alpha(opacity=100);
            position: absolute;
            right: 190px;
            text-indent: 100%;
            top: 20px;
            white-space: nowrap;
            width: 48px;
        }

        .open-btn {
            background: url(images/ml-open-demo.png) no-repeat left top;
            display: block;
            overflow: hidden;
            height: 125px;
            opacity: 1;
            filter: alpha(opacity=100);
            text-indent: 100%;
            white-space: nowrap;
            width: 125px;
        }

            .float-close:hover, .open-btn:hover {
                opacity: 1;
                filter: alpha(opacity=100);
            }

        .float-news {
            background: #051223;
            opacity: .8;
            border: 0;
            overflow: visible;
            height: 140px
        }

        .tiles-nav a {
            float: left;
        }
    </style>
    <link rel="stylesheet" href="ImgSpider/css/jquery.tiles.min.css">
    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="ImgSpider/js/jquery.tiles.js"></script>



    <script type="text/javascript">
        $(function () {
            var defaults = {
                thumbSize: 20,
                onSlideshowEnd: function () {
                    $('.stop, .start').toggle()
                }
            };
            var effects = {
                'default': { x: 6, y: 4, random: true },
                simple: { x: 6, y: 4, effect: 'simple', random: true },
                left: { x: 1, y: 8, effect: 'left' },
                up: { x: 20, y: 1, effect: 'up', rewind: 60, backReverse: true },
                leftright: { x: 1, y: 8, effect: 'leftright' },
                updown: { x: 20, y: 1, effect: 'updown', cssSpeed: 500, backReverse: true },
                switchlr: { x: 20, y: 1, effect: 'switchlr', backReverse: true },
                switchud: { x: 1, y: 8, effect: 'switchud' },
                fliplr: { x: 20, y: 1, effect: 'fliplr', backReverse: true },
                flipud: { x: 20, y: 3, effect: 'flipud', reverse: true, rewind: 75 },
                reduce: { x: 6, y: 4, effect: 'reduce' },
                360: { x: 1, y: 1, effect: '360', fade: true, cssSpeed: 600 }
            };
            $('#slider').tilesSlider($.extend({}, defaults, effects['reduce']));
            $('#slider').tilesSlider('start');
        })
    </script>
    <script type="text/javascript">
        $(document).ready(function () {

            // 更多新闻
            function ml_close_demo() {
                $('.float-news').animate({
                    left: '-105%'
                }, 300, function () {
                    $('.float-open').delay(50).animate({
                        left: '-8px'
                    }, 300);
                });
            }
            function ml_open_demo() {
                $('.float-open').animate({
                    left: '-130px'
                }, 100, function () {
                    $('.float-news').delay(50).animate({
                        left: '0px'
                    }, 500);
                });
            }

            $('.float-close').click(function () {
                ml_close_demo();
                return false;
            });
            $('.open-btn').click(function () {
                ml_open_demo();
                return false;
            });

            setTimeout(function () {
                ml_close_demo()
            }, 1000);

        });
    </script>
    <link rel="stylesheet" href="css/jquery.bigautocomplete.css" type="text/css" />
    <script type="text/javascript" src="js/jquery.bigautocomplete.js"></script>
    <%
        string chooseCity = "";
        string city = "";
        try
        {
            city = DTcms.Web.PublicStatic.HttpGet("http://ip.taobao.com/service/getIpInfo.php?ip=" + DTcms.Web.PublicStatic.GetIP());
            city = DTcms.Web.PublicStatic.Unicode2String(city);
        }
        catch { }
        if (city.Contains("\"city\":\""))
        {
            city = city.Substring(city.IndexOf("\"city\":\"") + "\"city\":\"".Length).Split('"')[0];
        }
        else
        {
            city = "";
        }
    %>
    <%DTcms.BLL.article_category bllArticleCategory = new DTcms.BLL.article_category(); %>
    <%
        System.Data.DataTable dtArticleCategory = bllArticleCategory.GetCitys();
        string cityData = "";
        foreach (System.Data.DataRow dr in dtArticleCategory.Rows)
        {
            if (dr["title"].ToString().Replace("市", "").Equals(city.Replace("市", "")))
            {
                chooseCity = dr["Id"].ToString();
                city = dr["title"].ToString();
            }
            cityData += "," + "{ title: \"" + dr["title"] + "\", result: { ff: \"" + dr["Id"] + "\" } }";
        }
        cityData = cityData.Trim(',');
        if (chooseCity == "")
        {
            city = "";
        }
    %>
    <link rel="stylesheet" href="date/css/asDatepicker.css">

    <script src="date/src/jquery-asDatepicker.js"></script>
    <script src="date/demo/js/language.js"></script>
    <script>
        $(document).ready(function () {
            $("#calendar").asDatepicker({
                mode: 'range', namespace: 'calendar',
                lang: 'zh',
                position: 'bottom'
            });
            $("#calendar").val("");
        });
    </script>
    <script type="text/javascript">
        var ChooseCity = "";
        $(function () {
            var dataArry = [<%=cityData%>];
            $("#city").bigAutocomplete({
                width: 210, data: dataArry, callback: function (data) {
                    ChooseCity = data.result.ff;
                }
            });
            $("#city").val("<%=city%>");
            $("#search").click(function () {
                var date = $("#calendar").val().replace("/", "-").replace("/", "-").replace("/", "-").replace("/", "-").replace("/", "-").replace("/", "-").replace("/", "-").replace("至", "_").replace(" ", "").replace(" ", "");
                var url = "product.aspx?channel=goods&datecount=" + $("#days").val().replace("天", "") + "&date=" + date + "&city=" + ChooseCity + "&key=" + encodeURI($("#ssKey").val());
                location.href = url;
            });
        })
        ChooseCity = "<%=chooseCity%>";
    </script>
</head>
<body style="margin:0; min-width:1200px">
    <form id="form1" runat="server">
        <div class="banner">
            <uc1:header2 runat="server" ID="header2" />
            <div class="index-search">
                <input style="float: left" class="input-2" id="city" type="text" value="成都" /><input style="float: left" class="input-3" id="calendar" type="text" value="" /><select id="days" style="float: left; z-index: 999; width: 160px; line-height: 50px" class="input-4"><option></option>
                    <%DTcms.BLL.article_category bllArticleCategory = new DTcms.BLL.article_category(); %>
                    <%
                        System.Data.DataTable dtArticleCategory = bllArticleCategory.GetChildList(0, 17);
                        foreach (System.Data.DataRow dr in dtArticleCategory.Rows)
                        {
                    %>
                    <option><%=dr["title"] %>天</option>
                    <%} %>
                </select>
                <%--<input class="input-4" type="text" value="不限" />--%><%--<label class="row"></label>--%><input class="input-1" id="ssKey" style="float: left;" type="text" placeholder="请输入您要搜索的培训产品" /><input class="btn-search" id="search" style="float: left;" type="button" value="搜索" />
            </div>
            <div id="slider" class="nivoSlider">

                <img src="images/1.jpg" alt="" />

                <img src="images/2.jpg" alt="" />

                <img src="images/3.jpg" alt="" />

                <img src="images/4.jpg" alt="" />

            </div>

        </div>
        <div class="index-content-1">
            <h1>培训分类</h1>
            <ul class="clear">
                <a href="product.aspx">
                    <li>
                        <img src="images/5.jpg"><p>
                            <span>培训科目</span><br>
                            <%
                                dtArticleCategory = bllArticleCategory.GetChildList(0, 15);
                                foreach (System.Data.DataRow dr in dtArticleCategory.Rows)
                                {
                            %>
                            <%=dr["title"] %>
                            <%} %>
                        </p>
                    </li>
                </a>
                <a href="product.aspx">
                    <li>
                        <img src="images/6.jpg"><p class="p-yellow">
                            <span>培训地点</span><br>
                            <%
                                dtArticleCategory = bllArticleCategory.GetCitys();
                                dtArticleCategory.DefaultView.RowFilter = "seo_title='1'";
                                foreach (System.Data.DataRowView dr in dtArticleCategory.DefaultView)
                                {
                            %>
                            <%=dr["title"] %>
                            <%} %>
                        </p>
                    </li>
                </a>
                <a href="product.aspx">
                    <li>
                        <img src="images/7.jpg"><p class="p-blue">
                            <span>培训人员</span><br>
                            <uc1:Shenfen runat="server" ID="Shenfen" Visible="false" />
                            <%foreach (KeyValuePair<int, string> kp in Shenfen.GetPxdx())
                                {%>
                            <%=kp.Value %>
                            <%} %>
                        </p>
                    </li>
                </a>
            </ul>
        </div>
        <div class="index-content-2">
            <h1>热门课程</h1>
            <ul class="clear">
                <%int totalcount; string pagelist;//分页页码%>
                <%System.Data.DataTable goodsList = get_article_list("goods", 52, 4, 1, "status=0", out totalcount, out pagelist, "goods_list", 0, "__id__");%>
                <%
                    foreach (System.Data.DataRow dr in goodsList.Rows)
                    {
                %>
                <a href="content.aspx?Id=<%=dr["id"] %>">
                    <li>
                        <img src="<%=dr["img_url"] %>"><p><%=dr["title"] %></p>
                    </li>
                </a>
                <%} %>
            </ul>
            <a class="more-case" href="product.aspx?channel=goods">查看更多案例 ></a>
        </div>
        <div class="index-content-2">
            <h1>往期回顾</h1>
            <ul class="clear">
                <%goodsList = get_article_list("wangqi", 0, 4, 1, "status=0", out totalcount, out pagelist, "goods_list", 0, "__id__");%>
                <%
                    foreach (System.Data.DataRow dr in goodsList.Rows)
                    {
                %>
                <a href="content-1.aspx?Id=<%=dr["id"] %>">
                    <li>
                        <img src="<%=dr["img_url"] %>"><p><%=dr["title"] %></p>
                    </li>
                </a>
                <%} %>
            </ul>
            <a class="more-case" href="product.aspx?channel=wangqi">查看更多案例 ></a>
        </div>
        <div class="index-content-3">
            <h1>友情链接</h1>
            <ul class="logo-ul clear">
                <%System.Data.DataTable contentlist = new DTcms.Web.Plugin.Link.link().get_link_list(0, "is_image=1");%>
                <%foreach (System.Data.DataRow dr in contentlist.Rows)
                    {%>
                <a href="<%=dr["site_url"] %>" target="_blank">
                    <li>
                        <img src="<%=dr["img_url"] %>"></li>
                </a>
                <%}%>
            </ul>
        </div>
        <uc1:footer runat="server" ID="footer" />
        <div class="float-open" id="float-open" style="left: -6px;"><a class="open-btn" href="javascript:void(0);">&gt;</a></div>

        <div class="float-news" id="float-news" style="left: -105%;">
            <a class="float-close" href="javascript:void(0);">X</a>
            <div class="newslist">

                <span style="position: absolute; top: -20px; left: 100px">
                    <img src="images/201706021931123912.png" /></span>
                <span style="position: absolute; left: 800px; top: 25px; color: #FFFFFF; line-height: 36px">
                    <img style="float: left; margin-right: 20px" src="images/index.png" /><span style="padding-top: 20px; float: left; display: block;">关注官方微信公众号<br />
                        获取更多资讯</span></span>
            </div>
        </div>
    </form>
</body>
</html>
