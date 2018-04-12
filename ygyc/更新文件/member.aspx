<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="member.aspx.cs" Inherits="DTcms.Web.ygyc.member" %>

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
                location.href = "member.aspx";
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
        <div class="middle member tab-content" style="z-index:0;position:relative;overflow:visible">
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
                    <asp:TextBox ID="nickName" CssClass="input normal" Width="300" runat="server"></asp:TextBox></dd>
            </dl>
            <dl>
                <dt>身份：</dt>
                <dd>
                    <div class="rule-single-select">
                        <uc1:Shenfen runat="server" ID="Shenfen" />
                    </div>
                </dd>
            </dl>
            <dl>
                <dt>所在地地址：</dt>
                <dd>
                    <uc1:City runat="server" ID="City" />
                </dd>
            </dl>
            <dl>
                <dt>&nbsp;</dt>
                <dd>
                    <asp:TextBox ID="address" CssClass="input normal" Width="655" placeholder="请输入详细地址" runat="server"></asp:TextBox>
                    </dd>
            </dl>
            <dl>
                <dt>移动电话：</dt>
                <dd>
                    <asp:TextBox ID="mobile" CssClass="input normal" Width="300" runat="server"></asp:TextBox>
                    </dd>
            </dl>
            <dl>
                <dt>固定电话：</dt>
                <dd>
                    <asp:TextBox ID="phone1" CssClass="input normal" Width="50" runat="server"></asp:TextBox>&nbsp;&nbsp;-&nbsp;&nbsp;<asp:TextBox ID="phone2" CssClass="input normal" Width="150" runat="server"></asp:TextBox></dd>
            </dl>
            <dl>
                <dt>邮箱地址：</dt>
                <dd>
                    <asp:TextBox ID="email" CssClass="input normal" Width="300" runat="server"></asp:TextBox></dd>
            </dl>
            <dl>
                <dt></dt>
                <dd>
                    <asp:Button ID="btnSubmit" runat="server" Text="提交信息" CssClass="btn-member" onclick="btnSubmit_Click" />
                    <input class="btn-member btn-member-1" onclick="javascript: window.location = window.location;" value="重置信息" type="button" /></dd>
            </dl>
        </div>
        <uc1:footer runat="server" ID="footer" />
    </form>
</body>
</html>
