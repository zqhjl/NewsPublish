<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>登陆</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href=" assets/libs/particles/css/style.css">
    <link rel="stylesheet" href=" assets/css/base.css">
    <link rel="stylesheet" href=" assets/css/login.css"/>
</head>
<body>
<!-- particles.js container -->
<div id="particles-js"></div>
<div id="wrapper">
    <div>
        <h1 style="font-size: 44px;">新闻大事件</h1>
        <h2>开阔世界 遇见新的知识、经验和见解</h2>
    </div>
    <nav class="switch_nav">
        <a href="toRegister" id="switch_signup" class="switch_btn">注册</a>
        <a href="javascript:;" id="switch_login" class="switch_btn on">登陆</a>
        <div class="switch_bottom" id="switch_bottom"></div>
    </nav>
    <div id="login">
        <form method="post" action="javascript:;">
            <ul class="group_input">
                <li>
                    <input type="text" class="mobile required" id="mobile" placeholder="账号"/>
                </li>
                <li>
                    <input type="password" class="psd required" id="psd" placeholder="密码"/>
                </li>
                <li>
                    <select id="role" name="role" style="width:299.96px;height:51.32px">
                        <option value="0">用户</option>
                        <option value="1">管理员</option>
                    </select>
                </li>
            </ul>
            <button type="submit" class="submit_btn layui-btn layui-btn-normal" id="btnSubmit">登陆</button>
        </form>
    </div>
    <div id="footer">
        <span>&copy;PRMS</span>
    </div>
</div>
<script src="assets/libs/jquery-1.12.4/jquery.min.js"></script>
<script src="assets/libs/particles/particles.min.js"></script>
<script src="assets/libs/particles/js/app.js"></script>
<script src="assets/libs/particles/js/lib/stats.js"></script>
<script>
    $(function () {
        $("form :input").blur(function () {
            var $parent = $(this).parent();
            $parent.find(".msg").remove(); //删除以前的提醒元素（find()：查找匹配元素集中元素的所有匹配元素）
            //验证手机号
            if ($(this).is("#mobile")) {
                var mobileVal = $.trim(this.value);
                // var regMobile = /^1[3|4|5|7|8][0-9]{9}$/;
                if (mobileVal == "") {
                    var errorMsg = " 请输入账号";
                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
                } else {
                    var okMsg = " 输入正确";
                    $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
                }
            }
            //验证密码
            if ($(this).is("#psd")) {
                var psdVal = $.trim(this.value);
                var regPsd = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/;
                if (psdVal == "" || !regPsd.test(psdVal)) {
                    var errorMsg = " 密码为6-20位字母、数字的组合！";
                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
                } else {
                    var okMsg = " 输入正确";
                    $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
                }
            }
        }).keyup(function () {
            //triggerHandler 防止事件执行完后，浏览器自动为标签获得焦点
            $(this).triggerHandler("blur");
        }).focus(function () {
            $(this).triggerHandler("blur");
        });

        //点击重置按钮时，通过trigger()来触发文本框的失去焦点事件
        $("#btnSubmit").click(function () {
            //trigger 事件执行完后，浏览器会为submit按钮获得焦点
            $("form .required:input").trigger("blur");
            var numError = $("form.onError").length;
            if (numError) {
                return false;
            }

            //alert('登陆成功！')
            var userAccount = $("#mobile").val();
            var userPsw = $("#psd").val();
            var role = $("#role").val();
            alert(role);
            $.ajax({
                url: "${pageContext.request.contextPath}/login",
                data: {
                    "userAccount": userAccount,
                    "userPsw": userPsw,
                    "role": role
                },
                type: "POST",
                dataType: "json",
                success: function (data) {
                    if (data.flag == true) {
                        //  alert("登陆成功了")
                        if (role == '0') {
                            window.location.href = "${pageContext.request.contextPath}/news/queryAllNews"
                        } else {
                            window.location.href = "${pageContext.request.contextPath}/webIndex"
                        }
                    } else {
                        alert(data.message)
                    }
                }
            });

        });
    })

</script>
<script src="layui/layui.all.js"></script>
</body>
</html>
