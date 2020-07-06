<%@ page import="java.util.Enumeration" %>
<%@ page import="java.security.Principal" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.io.UnsupportedEncodingException" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.util.Locale" %>
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>
<body>
<div id="particles-js"></div>
<div class="inedex-container layui-container layui-fluid">
    <!--导航条-->
    <ul class="layui-nav layui-bg-blue">
        <li class="layui-nav-item nav">
            <a href="${pageContext.request.contextPath}/news/index" class="nav-a">首页</a>
        </li>
        <li class="layui-nav-item nav0">
            <a href="${pageContext.request.contextPath}/news/findByValue?value=0" class="nav-a">社会新闻</a>
        </li>
        <li class="layui-nav-item nav1">
            <a href="${pageContext.request.contextPath}/news/findByValue?value=1" class="nav-a">经济新闻</a>
        </li>
        <li class="layui-nav-item nav2">
            <a href="${pageContext.request.contextPath}/news/findByValue?value=2" class="nav-a">科技新闻</a>
        </li>
        <li class="layui-nav-item nav3">
            <a href="${pageContext.request.contextPath}/news/findByValue?value=3" class="nav-a">时政新闻</a>
        </li>
        <li class="layui-nav-item nav4">
            <a href="${pageContext.request.contextPath}/news/findByValue?value=4" class="nav-a">国际新闻</a>
        </li>
        <li class="layui-nav-item nav5">
            <a href="${pageContext.request.contextPath}/news/findByValue?value=5" class="nav-a">体育新闻</a>
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
                <div class="layui-col-md8 layui-card" style="margin: 20px;">
                    <a href="#" class="news-card">
                        <div class="layui-col-md12 layui-card-header title">${n.title}</div>
                        <div class="layui-col-md12 layui-card-body content" style="color: #777777">
                            <c:set var="content" value="${n.content}"></c:set>
                            <c:if test="${content.length()<=250}">
                                ${content}
                            </c:if>
                            <c:if test="${content.length()>250}">
                                ${content.substring(0,250)}
                            </c:if>
                            ...
                        </div>
                        <div class="layui-card-footer layui-row" style="color: #777777">
                            <div class="layui-col-md3">
                                <i class="layui-icon layui-icon-username"></i>${n.author}
                            </div>
                            <div class="layui-col-md3">
                                <i class="layui-icon layui-icon-note"></i>
                                <c:choose>
                                    <c:when test="${n.newsType == 0}">社会新闻</c:when>
                                    <c:when test="${n.newsType == 1}">经济新闻</c:when>
                                    <c:when test="${n.newsType == 2}">科技新闻</c:when>
                                    <c:when test="${n.newsType == 3}">时政新闻</c:when>
                                    <c:when test="${n.newsType == 4}">国际新闻</c:when>
                                    <c:when test="${n.newsType == 5}">体育新闻</c:when>
                                </c:choose>
                            </div>
                            <div class="layui-col-md6">
                                <i class="layui-icon layui-icon-vercode"></i>${n.publishTime}
                            </div>
                        </div>

                    </a>
                </div>
                <div class="layui-col-md3 news-img">
                    <div class="img"></div>
                </div>
            </div>
        </c:forEach>
    </div>
    <nav aria-label="Page navigation example" class="pageSelect">
        <ul class="pagination">
            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
        </ul>
    </nav>
    <h1 id="test" style="display: none;">${value}</h1>
</div>
</body>
<script src="${pageContext.request.contextPath}/assets/libs/jquery-1.12.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.all.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/particles/particles.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/particles/js/app.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/particles/js/lib/stats.js"></script>
<script src="${pageContext.request.contextPath}/myjs/inedex.js"></script>
<!-- JS, Popper.js, and jQuery -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
</html>