<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>新闻观世界</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/libs/particles/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mycss/index.css"/>
</head>
<body>
<div id="particles-js"></div>
<div class="inedex-container">
    <!--导航条-->
    <ul class="layui-nav layui-bg-blue">
        <li class="layui-nav-item nav">
            <a href="${pageContext.request.contextPath}/news/index">首页</a>
        </li>
        <li class="layui-nav-item nav0">
            <a href="${pageContext.request.contextPath}/news/findByValue?value=0">社会新闻</a>
        </li>
        <li class="layui-nav-item nav1">
            <a href="${pageContext.request.contextPath}/news/findByValue?value=1">经济新闻</a>
        </li>
        <li class="layui-nav-item nav2">
            <a href="${pageContext.request.contextPath}/news/findByValue?value=2">科技新闻</a>
        </li>
        <li class="layui-nav-item nav3">
            <a href="${pageContext.request.contextPath}/news/findByValue?value=3">时政新闻</a>
        </li>
        <li class="layui-nav-item nav4">
            <a href="${pageContext.request.contextPath}/news/findByValue?value=4">国际新闻</a>
        </li>
        <li class="layui-nav-item nav5">
            <a href="${pageContext.request.contextPath}/news/findByValue?value=5">体育新闻</a>
        </li>
        <li class="layui-nav-item layui-layout-right" lay-unselect>
            <a href="javascript:"><img src="//t.cn/RCzsdCq" class="layui-nav-img" alt="">
                ${user.userName}
            </a>
            <dl class="layui-nav-child">
                <dd><a href="${pageContext.request.contextPath}/user/toEditUser" id="editUser">修改个人信息</a></dd>
                <dd><a href="${pageContext.request.contextPath}/user/loginOut" id="loginOut">退了</a></dd>
            </dl>
        </li>
    </ul>

    <div id="show">
        <c:forEach items="${allNews}" var="n">
            <div class="layui-row">
                <div class="layui-card layui-col-md8" style="margin: 20px;">
                    <div class="layui-card-header title">${n.title}</div>
                    <div class="layui-card-body content"> ${n.content} </div>
                    <div class="layui-card-footer">
                        <div class="layui-col-md2">
                            <i class="layui-icon layui-icon-username"></i>&nbsp ${n.author}
                        </div>
                        <div class="layui-col-md2">
                            <i class="layui-icon layui-icon-note"></i>
                            &nbsp
                            <c:choose>
                                <c:when test="${n.newsType == 0}">社会新闻</c:when>
                                <c:when test="${n.newsType == 1}">经济新闻</c:when>
                                <c:when test="${n.newsType == 2}">科技新闻</c:when>
                                <c:when test="${n.newsType == 3}">时政新闻</c:when>
                                <c:when test="${n.newsType == 4}">国际新闻</c:when>
                                <c:when test="${n.newsType == 5}">体育新闻</c:when>
                            </c:choose>
                        </div>
                        <div class="layui-col-md4">
                            <i class="layui-icon layui-icon-vercode"></i>&nbsp${n.publishTime}
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <h1 id="test" style="display: none">${value}</h1>
</div>
</body>
<script src="${pageContext.request.contextPath}/assets/libs/jquery-1.12.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.all.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/particles/particles.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/particles/js/app.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/particles/js/lib/stats.js"></script>
<script src="${pageContext.request.contextPath}/myjs/inedex.js"></script>

</html>