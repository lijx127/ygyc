<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="pinglun.ascx.cs" Inherits="DTcms.Web.ygyc.pinglun" %>
<link rel="stylesheet" type="text/css" href="/css/validate.css" />
<link rel="stylesheet" type="text/css" href="/css/pagination.css" />
<link rel="stylesheet" type="text/css" href="/scripts/artdialog/ui-dialog.css" />
<script type="text/javascript" charset="utf-8" src="/scripts/jquery/jquery.form.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/scripts/artdialog/dialog-plus-min.js"></script>
<script type="text/javascript" charset="utf-8" src="/scripts/jquery/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" charset="utf-8" src="/scripts/jquery/jquery.pagination.js"></script>
<script type="text/javascript">
    $(function () {
        //初始化评论列表
        pageInitComment();
        //初始化发表评论表单
        AjaxInitForm('#comment_form', '#btnSubmit', 1, '', pageInitComment);
    });
    //初始化评论列表
    function pageInitComment() {
        AjaxPageList('#comment_list', '#pagination', 10, 0, '/tools/submit_ajax.ashx?action=comment_list&article_id={model.id}', '/templates/main/images/user-avatar.png');
    }
</script>
<div class="comment-add">
    <form id="comment_form" name="comment_form" url="/tools/submit_ajax.ashx?action=comment_add&article_id={model.id}">
        <div class="editor">
            <textarea id="txtContent" name="txtContent" class="input" datatype="*" sucmsg=" "></textarea>
        </div>
        <div class="subcon">
            <input id="btnSubmit" name="submit" class="btn right" type="submit" value="提交评论（Ctrl+Enter）" />
            <span>验证码：</span>
            <input id="txtCode" name="txtCode" type="text" class="input small" datatype="s4-4" errormsg="请填写4位验证码" sucmsg=" " onkeydown="if(event.ctrlKey&&event.keyCode==13){document.getElementById('btnSubmit').click();return false};" />
            <a href="javascript:;" onclick="ToggleCode(this, '/tools/verify_code.ashx');return false;">
                <img src="/tools/verify_code.ashx" width="80" height="22" style="vertical-align: middle;" />
                看不清楚？</a>
        </div>
    </form>
</div>

<div class="comment-box">
    <ol id="comment_list" class="comment-list"></ol>
</div>
<!--放置页码-->
<div class="page-box" style="margin-left: -8px;">
    <div id="pagination" class="digg"></div>
</div>
<div class="line10"></div>
<!--/放置页码-->
