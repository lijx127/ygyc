//=====================初始化代码======================
$(function () {
    $("#regbuutom").click(function () {
        if ($("#regUserName").val() == "" || $("#regPassWord").val() == "") {
            alert("请填写用户名和登录密码！");
            return false;
        }
        if ($("#regPassWord").val() != $("#regPassWordOk").val()) {
            alert("两次输入密码不一致！");
            return false;
        }
        if (!$("#regtiaokuan").is(":checked"))
        {
            alert("请先同意注册条款！");
            return false;
        }
        $.ajax({
            type: "POST",
            url: "/tools/submit_ajax.ashx?action=user_register&site=main",
            dataType: "json",
            data: {
                "txtUserName": $("#regUserName").val(),
                "txtPassword": $("#regPassWord").val(),
                "txtCode": $("#regtxtCode").val()
            },
            timeout: 20000,
            beforeSend: function (XMLHttpRequest) {
                $("#regbuutom").attr("disabled", true);
            },
            success: function (data, textStatus) {
                if (data.status == 1) {
                    alert("注册成功，请登录！");
                } else {
                    $("#regbuutom").attr("disabled", false);
                    alert(data.msg);
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("状态：" + textStatus + "；出错提示：" + errorThrown);
                $("#regbuutom").attr("disabled", false);
            }
        });
    });
});