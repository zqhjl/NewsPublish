<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>管理员后台</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">管理员后台</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item" lay-unselect>
                <a href="javascript:">
                    <img src="//t.cn/RCzsdCq" class="layui-nav-img" alt="">
                    ${user.userName}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="${pageContext.request.contextPath}/user/toEditUser" id="editUser">修改个人信息</a>
                    </dd>
                    <dd><a href="${pageContext.request.contextPath}/user/loginOut" id="loginOut">退了</a>
                    </dd>
                </dl>
            </li>
        </ul>

    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">新闻发布</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="${pageContext.request.contextPath}/news/toNewsList" data-id="1" data-title="新闻列表"
                               data-url="${pageContext.request.contextPath}/news/toNewsList"
                               class="site-demo-active" data-type="tabAdd">新闻列表</a>
                        </dd>
                        <dd>
                            <a href="${pageContext.request.contextPath}/news/toPublish" data-id="2" data-title="新闻发布"
                               data-url="${pageContext.request.contextPath}/news/toPublish"
                               class="site-demo-active" data-type="tabAdd">新闻发布</a>
                        </dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">欢迎来到管理员系统</div>
        <!--  <div  class="layui-tab" lay-filter="demo" lay-allowclose="true">
            <ul class="layui-tab-title"></ul>
            <div class="layui-tab-content"></div>
        </div> -->
        <iframe id="iframeMain" src="" style="width: 100%" height="100%"></iframe>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        ©PRMS
    </div>
</div>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/myjs/tab.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;
        var $ = layui.$;

        $("#loginOut").on('click', function () {
            window.location.href = "${pageContext.request.contextPath}/user/loginOut";
        });

        $(document).ready(function () {
            $("dd>a").click(function (e) {
                e.preventDefault();
                $("#iframeMain").attr("src", $(this).attr("href"));
            });
        });
    });
</script>
</body>
</html>
