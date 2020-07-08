<%@ page import="com.newspublish.bean.News" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.util.regex.Matcher" %>
<%@ page import="java.util.ArrayList" %>
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
            <a href="${pageContext.request.contextPath}/news/findByValue/0" class="nav-a">社会新闻</a>
        </li>
        <li class="layui-nav-item nav1">
            <a href="${pageContext.request.contextPath}/news/findByValue/1" class="nav-a">经济新闻</a>
        </li>
        <li class="layui-nav-item nav2">
            <a href="${pageContext.request.contextPath}/news/findByValue/2" class="nav-a">科技新闻</a>
        </li>
        <li class="layui-nav-item nav3">
            <a href="${pageContext.request.contextPath}/news/findByValue/3" class="nav-a">时政新闻</a>
        </li>
        <li class="layui-nav-item nav4">
            <a href="${pageContext.request.contextPath}/news/findByValue/4" class="nav-a">国际新闻</a>
        </li>
        <li class="layui-nav-item nav5">
            <a href="${pageContext.request.contextPath}/news/findByValue/5" class="nav-a">体育新闻</a>
        </li>
        <li class="layui-nav-item layui-layout-right" lay-unselect>
            <a href="javascript:" class="nav-a"><img src="//t.cn/RCzsdCq" class="layui-nav-img" alt="">
                ${user.userName}
            </a>
            <dl class="layui-nav-child">
                <dd><a href="${pageContext.request.contextPath}/user/toEditUser" id="editUser" class="nav-a">修改个人信息</a>
                </dd>
                <dd><a href="${pageContext.request.contextPath}/user/loginOut" id="loginOut" class="nav-a">退出</a></dd>
            </dl>
        </li>
    </ul>

    <div id="show">
        <%!
            String findImg(String content) {
                int index1 = content.indexOf("<img");
                if (index1 != -1) {
                    int index2 = content.indexOf("http", index1);
                    int index3 = content.indexOf("\"", index2);
                    String imgLocation = content.substring(index2, index3);
                    return imgLocation;
                } else {
                    return null;
                }
            }

            String findBriefContent(String content) {
                Pattern p = Pattern.compile("<p(.*?)<");
                Matcher m = p.matcher(content);
                List<String> result = new ArrayList<String>();
                while (m.find()) {
                    String temp = m.group(1);
                    int index = temp.indexOf(">");
                    temp = temp.substring(index + 1);
                    if (temp.length() == 0) {
                        result.add("[图片]");
                    } else {
                        result.add(temp);
                    }
                }
                String briefContent = "";
                for (int i = 0, flag = 0; flag < 2; i++) {
                    if (result.get(i).equals("[图片]") == false) {
                        briefContent += "<p>" + result.get(i) + "</p>";
                        flag++;
                    } else if (flag != 0) {
                        briefContent = briefContent.substring(0, briefContent.length() - 4) + "[图片]</p>";
                    } else {
                        continue;
                    }
                }
                briefContent = briefContent.substring(0, briefContent.length() - 4) + "...</p>";
                return briefContent;
            }
        %>
        <%
            List<News> thisPageNews = (List<News>) request.getAttribute("thisPageNews");
            for (News news : thisPageNews) {
        %>
        <div class="layui-row">
            <div class="layui-col-md8 layui-card" style="margin: 20px;">
                <a href="${pageContext.request.contextPath}/news/queryNewsByID/<%=news.getNewsId()%>" class="news-card">
                    <div class="layui-col-md12 layui-card-header title">
                        <%=news.getTitle()%>
                    </div>
                    <div class="layui-col-md12 layui-card-body content" style="color: #777777">
                        <%
                            String content = news.getContent();
                            String briefContent = findBriefContent(content);
                        %>
                        <%=briefContent%>
                    </div>
                    <div class="layui-card-footer layui-row" style="color: #777777">
                        <div class="layui-col-md3">
                            <i class="layui-icon layui-icon-username"></i><%=news.getAuthor()%>
                        </div>
                        <div class="layui-col-md3">
                            <i class="layui-icon layui-icon-note"></i>
                            <c:choose>
                                <c:when test="<%=news.getNewsType()==0%>">社会新闻</c:when>
                                <c:when test="<%=news.getNewsType()==1%>">经济新闻</c:when>
                                <c:when test="<%=news.getNewsType()==2%>">科技新闻</c:when>
                                <c:when test="<%=news.getNewsType()==3%>">时政新闻</c:when>
                                <c:when test="<%=news.getNewsType()==4%>">国际新闻</c:when>
                                <c:when test="<%=news.getNewsType()==5%>">体育新闻</c:when>
                            </c:choose>
                        </div>
                        <div class="layui-col-md6">
                            <i class="layui-icon layui-icon-vercode"></i><%=news.getPublishTime()%>
                        </div>
                    </div>

                </a>
            </div>
            <div class="layui-col-md3 news-img">
                <a href="${pageContext.request.contextPath}/news/queryNewsByID/<%=news.getNewsId()%>">
                    <c:choose>
                        <c:when test="<%=findImg(content)!=null%>">
                            <img src="<%=findImg(content)%>" class="img">
                        </c:when>
                        <c:otherwise>
                            <img src="${pageContext.request.contextPath}/assets/img/imgNone.png" class="img">
                        </c:otherwise>
                    </c:choose>
                </a>
            </div>
        </div>
        <%}%>
    </div>
    <nav aria-label="Page navigation example" class="pageSelect">
        <ul class="pagination">
            <li class="page-item">
                <a class="page-link"
                   href="${pageContext.request.contextPath}/news/${controller}/${column}/${pageNumber-1}">Previous</a>
            </li>
            <c:if test="${pageNumber>2}">
                <li class="page-item"><div class="page-link">...</div></li>
            </c:if>
            <c:if test="${pageNumber>1}">
                <li class="page-item">
                    <a class="page-link"
                       href="${pageContext.request.contextPath}/news/${controller}/${column}/${pageNumber-1}">${pageNumber-1}</a>
                </li>
            </c:if>
            <li class="page-item">
                <a class="page-link"
                   href="${pageContext.request.contextPath}/news/${controller}/${column}/${pageNumber}">${pageNumber}</a>
            </li>
            <c:if test="${pageNumber<pageCounts}">
                <li class="page-item">
                    <a class="page-link"
                       href="${pageContext.request.contextPath}/news/${controller}/${column}/${pageNumber+1}">${pageNumber+1}</a>
                </li>
            </c:if>
            <c:if test="${pageNumber<pageCounts-1}">
                <li class="page-item"><div class="page-link">...</div></li>
            </c:if>
            <li class="page-item">
                <a class="page-link"
                   href="${pageContext.request.contextPath}/news/${controller}/${column}/${pageNumber+1}">Next
                </a>
            </li>
        </ul>
    </nav>
    <h1 id="test" style="display: none;">${column}</h1>
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