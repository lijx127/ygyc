<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="member1.aspx.cs" Inherits="DTcms.Web.ygyc.member1" %>

<%@ Register Src="~/ygyc/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/ygyc/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/ygyc/Shenfen.ascx" TagPrefix="uc1" TagName="Shenfen" %>
<%@ Register Src="~/ygyc/City.ascx" TagPrefix="uc1" TagName="City" %>





<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>910教室-会员</title>
    <link rel="stylesheet" href="css/jquery.fullPage.css">
    <link rel="stylesheet" href="css/index.css">
    <script src="js/jquery-1.8.3.min.js"></script>

    <link href="../scripts/arddialog/ui-dialog.css" rel="stylesheet" type="text/css" />
    <link href="../admin/skin/default/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../scripts/jquery/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="../scripts/jquery/Validform_v5.3.2_min.js"></script>
    <script type="text/javascript" src="../scripts/arddialog/dialog-plus-min.js"></script>
    <script type="text/javascript" charset="utf-8" src="../admin/js/laymain.js"></script>
    <script type="text/javascript" charset="utf-8" src="../admin/js/common.js"></script>
    <script type="text/javascript" charset="utf-8" src="../scripts/webuploader/webuploader.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="../admin/js/uploader.js"></script>
    <script type="text/javascript">
        function uploadbackMain(txtObj) {
            $.post(location.href + "?reqtype=2", $("#uploadbackForm").serialize(), function (result) {
                location.href = "member1.aspx";
            });
        }
        //初始化表单验证
        $(function () {
            $("#chooseimg").InitUploader({ filesize: "<%=siteConfig.imgsize %>", sendurl: "../tools/upload_ajax.ashx", swf: "../scripts/webuploader/uploader.swf", thumbnail: true, filetypes: "<%=siteConfig.fileextension %>", back: uploadbackMain });
            //上传预览
            $("#headUpload").on("click", function () {
                var filecontrol = $("#chooseimg").find("input[type=file]");
                filecontrol.click();
            });
        })
    </script>
</head>
<body style="margin: 0; min-width: 1200px">
    
    <form id="uploadbackForm" style="display:none">
        <input name="avatar" type="text" class="input normal upload-path" />
        <div id="chooseimg"></div>
    </form>
    <form id="form1" runat="server">
        <%string avatar = "images/people.png";
            if(userModel.avatar != "")
            {
                avatar = userModel.avatar;
            }
            %>
        <uc1:header runat="server" ID="header" />
        
        <div class="middle member tab-content" style="z-index:0;position:relative;overflow:visible;">
<div class="location" style="margin:-50px 0 40px 0">当前位置 > <a href="http://www.910class.com/ygyc/index.aspx">首页</a> > 会员中心</div> 
            <p class="p1 clear">
                <span>
                    <img width="104" height="96" src="<%=avatar %>" id="headUpload"></span>登录名：<strong><%=userModel.user_name %></strong><br>
                <img align="absmiddle" src="images/icon-11.png">
                <%=groupModel.title %><br>
                会员积分：<%=userModel.point %>分<span style="font-size: 12px; color: #ff0000; margin-left: 10px; float: right">(注意完善以下会员信息可获得1000会员积分的奖励)</span>
            </p>
            <dl>
                <dt>姓名/机构名称：</dt>
                <dd>
                    <asp:Label ID="nickName" Width="300" runat="server"></asp:Label>

                    <a style="float:right; margin-right:100px" href="member.aspx"><img align="absmiddle" style="margin-right:5px" width="26" src="images/edit.png">编辑信息</a> 
                </dd>
            </dl>
            <dl>
                <dt>身份：</dt>
                <dd>
                        <uc1:Shenfen runat="server" Visible="false" ID="Shenfen" />
                    <%KeyValuePair<int, string> shenfenValue = Shenfen.GetPxdx().FirstOrDefault(t => t.Key == Shenfen.SelectValue); %>
                    <%=shenfenValue.Value %>
                </dd>
            </dl>
            <dl>
                <dt>所在地地址：</dt>
                <dd>
                    <uc1:City runat="server" Visible="false" ID="City" />
                    <%=City.SelectText %>
                </dd>
            </dl>
            <dl>
                <dt>&nbsp;</dt>
                <dd>
                    <asp:Label ID="address" Width="655" runat="server"></asp:Label>
                    </dd>
            </dl>
            <dl>
                <dt>移动电话：</dt>
                <dd>
                    <asp:Label ID="mobile" Width="300" runat="server"></asp:Label>
                    </dd>
            </dl>
            <dl>
                <dt>固定电话：</dt>
                <dd>
                    <asp:Label ID="phone1" Width="50" runat="server"></asp:Label>&nbsp;&nbsp;-&nbsp;&nbsp;<asp:Label ID="phone2" Width="150" runat="server"></asp:Label></dd>
            </dl>
            <dl>
                <dt>邮箱地址：</dt>
                <dd>
                    <asp:Label ID="email" Width="300" runat="server"></asp:Label></dd>
            </dl>
        </div>
        <uc1:footer runat="server" ID="footer" />
    </form>
</body>
</html>
