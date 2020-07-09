<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
</head>
<body style="font-family: 'Microsoft YaHei';height: auto">
<%--<table class="layui-hide" id="test" lay-filter="test"></table>--%>
<table id="demo" lay-filter="test"></table>

</body>
<script src="${pageContext.request.contextPath}/layui/layui.all.js"></script>
<script src="${pageContext.request.contextPath}/myjs/tab.js"></script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script>
    layui.use('table', function () {
        var table = layui.table;
        /*var $ = layui.$;*/

        table.render({
            elem: '#demo',
            url: '${pageContext.request.contextPath}/news/queryAllNews',
            toolbar: '#toolbarDemo', //开启头部工具栏，并为其绑定左侧模板
            defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            title: '用户数据表',
            cols: [[
                {type: 'checkbox', fixed: 'left'},
                {field: 'newsId', title: 'ID', width: 100, fixed: 'left', unresize: true, sort: true},
                {field: 'title', title: '新闻标题', width: 150},
                {field: 'author', title: '作者/发布机构', width: 150},
                {
                    field: 'newsType', title: '类型', width: 150, templet: function (d) {
                        if (d.newsType == 0) {
                            return "社会新闻";
                        } else if (d.newsType == 1) {
                            return "经济新闻";
                        } else if (d.newsType == 2) {
                            return "科技新闻";
                        } else if (d.newsType == 3) {
                            return "时政新闻";
                        } else if (d.newsType == 4) {
                            return "国际新闻";
                        } else if (d.newsType == 5) {
                            return "体育新闻";
                        }
                    }
                }
                , {field: 'content', title: '文本内容'}
                , {field: 'publishTime', title: '发布时间', width: 250, sort: true}
                , {fixed: 'right', title: '操作', toolbar: '#barDemo', width: 150}
            ]]
            , page: true/* { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                //,curr: 5 //设定初始在第 5 页
                , groups: 1 //只显示 1 个连续页码
                , first: false //不显示首页
                , last: false //不显示尾页
            }*/, limit: 10
            , parseData: function (res) { //res 即为原始返回的数据
                return {
                    "code": res.code, //解析接口状态
                    "msg": res.message, //解析提示文本
                    "count": res.datas.total, //解析数据长度
                    "data": res.datas.thisPageNews //解析数据列表
                };
            }
        });

        //头工具栏事件
        table.on('toolbar(test)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：' + data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选' : '未全选');
                    break;

                //自定义头工具栏右侧图标 - 提示
                case 'LAYTABLE_TIPS':
                    layer.alert('这是工具栏右侧自定义的一个图标按钮');
                    break;
            }
        });

        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            if (obj.event === 'del') {
                layer.confirm('删除这条新闻么？', function (index) {
                    $.ajax({
                        "url": "${pageContext.request.contextPath}/news/deleteNews",
                        "data": {
                            "newsId": data.newsId
                        },
                        "type": "POST",
                        "success": function (returndata) {
                            if (returndata.flag) {
                                alert("删除成功！");
                                window.location.reload()
                            } else {
                                alert(returndata.message);
                            }
                        }
                    });

                    layer.close(index);
                });
            } else if (obj.event === 'edit') {
                //删除这条数据
                window.location.href = "${pageContext.request.contextPath}/news/toEditNews?newsId=" + data.newsId;
            }
        });
    });
    //页面层


</script>
</html>