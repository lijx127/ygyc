<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DTcms.Web.ygyc.Login" %>

<%@ Register Src="~/ygyc/header2.ascx" TagPrefix="uc1" TagName="header2" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8">
    <title>910教室-会员</title>
    <link rel="stylesheet" href="css/jquery.fullPage.css">
    <link rel="stylesheet" href="css/index.css">
    <script src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".a1").hover(function () {
                $("#yzm1").click();
                $(".div-login-1").css("display", "block");
                $(".div-login-2").css("display", "none");
                $(".a2").css("background-color", "#edf5fa");
                $(".a2").css("color", "#808080");
                $(".a1").css("background-color", "#007fd4");
                $(".a1").css("color", "#ffffff");
            });
            $(".a2").hover(function () {
                $("#yzm2").click();
                $(".div-login-1").css("display", "none");
                $(".div-login-2").css("display", "block");
                $(".a1").css("background-color", "#edf5fa");
                $(".a1").css("color", "#808080");
                $(".a2").css("background-color", "#007fd4");
                $(".a2").css("color", "#ffffff");
            });
        });
    </script>
    <style>
        #msgtips {
            margin: 0;
            padding: 0;
            text-align: center;
            font-size: 12px;
            color: #f00;
            line-height: 20px;
        }
    </style>
    <script type="text/javascript" charset="utf-8" src="/scripts/jquery/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="/scripts/artdialog/dialog-plus-min.js"></script>
    <script type="text/javascript" charset="utf-8" src="/templates/main/js/common.js"></script>
    <script type="text/javascript" charset="utf-8" src="/templates/main/js/login-validate.js"></script>
</head>
<body style="margin: 0; min-width: 1200px;font-family:'微软雅黑'">

    <input id="chkRemember" name="chkRemember" style="display: none" type="checkbox" />
    <div class="login-div">
        <uc1:header2 runat="server" ID="header2" />
        <div class="login-in">
            <h1>
                <a class="a-hover a1" href="#">账号登录<span></span></a><a class="a2" href="#">用户注册</a>
            </h1>
            <div class="clear div-login-1">
                <input type="hidden" id="turl" value="/ygyc/member1.aspx" />
                <h2>登录用户中心</h2>
                <input id="txtUserName" class="input-1" name="txtUserName" type="text" placeholder="用户名" />
                <input id="txtPassword" class="input-1 input-2" name="txtPassword" type="password" placeholder="密码" />
                <input type="text" class="input-1 input-3" id="txtValiCode" placeholder="验证码">
                <a class="send" id="yzm1" title="点击切换验证码" href="javascript:;" onclick="ToggleCode(this, '/tools/verify_code.ashx');return false;">
                    <img src="/tools/verify_code.ashx" width="80" height="22" style="margin: 20px 0 0 10px" />
                </a>
                <input id="btnSubmit" name="btnSubmit" class="btn btn-primary" type="submit" value="登 录">
                <div id="msgtips"></div>
                <a class="weixin-a" href="#" style="float: left; padding-top: 10px">
                    <!--<img align="absmiddle" src="images/weixin.png">
                    微信账号直接登录--></a>
            </div>
            <div class="clear div-login-2">
                <h2>用户注册</h2>
                <script src="register-validate.js"></script>
                <form id="regform" name="regform">
                    <input type="text" class="input-1" id="regUserName" placeholder="用户名">
                    <input type="password" class="input-1 input-2" id="regPassWord" placeholder="设置密码">
                    <input type="password" class="input-1 input-2" id="regPassWordOk" placeholder="确认密码">
                    <input type="text" class="input-1 input-3" id="regtxtCode" placeholder="验证码">
                    <a class="send" id="yzm2" title="点击切换验证码" href="javascript:;" onclick="ToggleCode(this, '/tools/verify_code.ashx');return false;">
                        <img width="80" height="22" style="margin: 20px 0 0 10px" />
                    </a>
                    <span class="member-item">
                        <input type="checkbox" id="regtiaokuan">
                        我已阅读并接受<a href="#">《会员条款》</a></span>
                    <button type="button" id="regbuutom" class="btn btn-primary " style="margin-top: 0">
                        注 册
                    </button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
