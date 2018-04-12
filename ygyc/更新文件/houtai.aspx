<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="houtai.aspx.cs" Inherits="DTcms.Web.houtai" %>

<%@ Register Src="~/ygyc/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/ygyc/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/ygyc/City.ascx" TagPrefix="uc1" TagName="City" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>机构注册</title>
    <link rel="stylesheet" href="css/jquery.fullPage.css">
    <link rel="stylesheet" href="css/index.css">
    <script src="js/jquery-1.8.3.min.js"></script>

    <link href="../scripts/artdialog/ui-dialog.css" rel="stylesheet" type="text/css" />
    <link href="../admin/skin/default/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../scripts/jquery/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="../scripts/jquery/Validform_v5.3.2_min.js"></script>
    <script type="text/javascript" src="../scripts/artdialog/dialog-plus-min.js"></script>
    <script type="text/javascript" charset="utf-8" src="../admin/js/laymain.js"></script>
    <script type="text/javascript" charset="utf-8" src="../admin/js/common.js"></script>
    <script type="text/javascript" charset="utf-8" src="../scripts/webuploader/webuploader.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="../admin/js/uploader.js"></script>

    <script type="text/javascript">
        $(function () {
            //初始化表单验证
            $("#form1").initValidform();
            function uploadbackMain(txtObj) {
                if (txtObj.parent().html().indexOf("<%=txtLegalPersonCardId1.ClientID%>") > 0) {
                    //身份证
                    $("#preLegalPersonCardId1").html("<img width=\"100\" src=\"" + $("#<%=txtLegalPersonCardId1.ClientID%>").val() + "\">");
                }
                if (txtObj.parent().html().indexOf("<%=txtLegalPersonCardId2.ClientID%>") > 0) {
                    //身份证
                    $("#preLegalPersonCardId2").html("<img width=\"100\" src=\"" + $("#<%=txtLegalPersonCardId2.ClientID%>").val() + "\">");
                }
                else if (txtObj.parent().html().indexOf("<%=txtLicense.ClientID%>") > 0) {
                    //营业执照
                    $("#preLicense").html("<img width=\"100\" src=\"" + $("#<%=txtLicense.ClientID%>").val() + "\">");
                }
            }
            $(".upload-img").InitUploader({ filesize: "<%=siteConfig.imgsize %>", sendurl: "../tools/upload_ajax.ashx", swf: "../scripts/webuploader/uploader.swf", filetypes: "gif,jpg,png,bmp", back: uploadbackMain  });
        });
    </script>
</head>
<body style="margin: 0; min-width: 1200px">
    <form id="form1" runat="server">
        <uc1:header runat="server" ID="header" />
        <div class="middle member tab-content" style="position:relative;">
            <dl>
                <dt>用户名：</dt>
                <dd>
                    <input class="input normal" runat="server" id="username" style="width: 300px" type="text" datatype="/^[a-zA-Z0-9\-\_]{2,50}$/" sucmsg=" " ajaxurl="../tools/admin_ajax.ashx?action=manager_validate" />
                    <span class="Validform_checktip">*字母、下划线，不可修改</span>
                </dd>
            </dl>
            <dl>
                <dt>密码：</dt>
                <dd>
                    <input class="input normal" runat="server" id="password" style="width: 300px" type="password" datatype="*6-20" nullmsg="请设置密码" errormsg="密码范围在6-20位之间" sucmsg=" " />
                    <span class="Validform_checktip">*</span>
                </dd>
            </dl>
            <dl>
                <dt>确认密码：</dt>
                <dd>
                    <input class="input normal" runat="server" id="password1" style="width: 300px" type="password" datatype="*" recheck="password" nullmsg="请再输入一次密码" errormsg="两次输入的密码不一致" sucmsg=" " />
                    <span class="Validform_checktip">*</span>
                </dd>
            </dl>
            <dl>
                <dt>机构名称：</dt>
                <dd>
                    <input class="input normal" runat="server" id="mechanismName" datatype="*" style="width: 300px" type="text" /><span class="Validform_checktip">*</span></dd>
            </dl>
            <dl>
                <dt>法定代表人名称：</dt>
                <dd>
                    <input class="input normal" runat="server" id="legalPersonName" style="width: 300px" type="text" /></dd>
            </dl>
            <dl>
                <dt>法定代表人身份证（正面）：</dt>
                <dd>
                    <asp:TextBox ID="txtLegalPersonCardId1" datatype="*" nullmsg="请选法定代表人身份证（正面）上传" runat="server" CssClass="input normal upload-path" />
                    <div class="upload-box upload-img"></div>
                </dd>
            </dl>
             <dl>
                <dt></dt>
                <dd id="preLegalPersonCardId1">
                    <img width="100" src="images/shenfen1.png"></dd>
            </dl>
            <dl>
                <dt>法定代表人身份证（反面）：</dt>
                <dd>
                    <asp:TextBox ID="txtLegalPersonCardId2" datatype="*" nullmsg="请选法定代表人身份证（反面）上传" runat="server" CssClass="input normal upload-path" />
                    <div class="upload-box upload-img"></div>
                </dd>
            </dl>
            <dl>
                <dt></dt>
                <dd id="preLegalPersonCardId2">
                    <img width="100" src="images/shenfen.png"></dd>
            </dl>
            <dl>
                <dt>企业执照：</dt>
                <dd>
                    <asp:TextBox ID="txtLicense" runat="server" datatype="*" nullmsg="请选企业执照上传" CssClass="input normal upload-path" />
                    <div class="upload-box upload-img"></div>
                </dd>
            </dl>
            <dl>
                <dt></dt>
                <dd id="preLicense">
                    <img width="100" src="images/zhizhao.png"></dd>
            </dl>
            <dl>
                <dt>机构地址：</dt>
                <dd>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <uc1:City runat="server" ID="City" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </dd>
            </dl>
            <dl>
                <dt>&nbsp;</dt>
                <dd>
                    <input runat="server" class="input normal" id="address" datatype="*" nullmsg="请填写详细地址" style="width: 655px" value="" placeholder="请输入详细地址" type="text" /></dd>
            </dl>
            <dl>
                <dt>移动电话：</dt>
                <dd>
                    <input runat="server" class="input normal" id="mobile" datatype="*" style="width: 300px" type="text" /><span class="Validform_checktip">*</span></dd>
            </dl>
            <dl>
                <dt>固定电话：</dt>
                <dd>
                    <input runat="server" id="phone1" class="input normal" style="width: 50px" type="text" />&nbsp;&nbsp;-&nbsp;&nbsp;<input id="phone2" runat="server" class="input normal" style="width: 150px" type="text" /></dd>
            </dl>
            <dl>
                <dt>邮箱地址：</dt>
                <dd>
                    <input class="input normal" runat="server" id="email" style="width: 300px" type="text" /></dd>
            </dl>
            <dl>
                <dt>学校规模：</dt>
                <dd>
                    <input class="input normal" runat="server" id="schooleScale" style="width: 300px" type="text" /></dd>
            </dl>
            <dl>
                <dt>办学内容：</dt>
                <dd>
                    <textarea class="input normal" runat="server" id="chooleContent" style="padding: 10px; border: 1px #ccc solid; width: 655px"></textarea></dd>
            </dl>
            <dl>
                <dt></dt>
                <dd>
                    <asp:Button ID="Button1" CssClass="btn-member" runat="server" Text="提交信息" OnClick="Button1_Click" /><input class="btn-member btn-member-1" onclick="javascript: window.location = window.location;" value="重置信息" type="button" /></dd>
            </dl>
        </div>
        <uc1:footer runat="server" ID="footer" />
    </form>
</body>
</html>
