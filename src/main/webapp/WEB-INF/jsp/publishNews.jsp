<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>发布新闻</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mycss/wangEditor.css" media="all">
</head>
<body style="font-family: 'Microsoft YaHei'">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;font-size: 32px;">
    <legend>新闻发布</legend>
</fieldset>
<form class="layui-form layui-form-pane" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">新闻标题</label>
        <div class="layui-input-block">
            <input type="text" name="title" id="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" style="width:150px;">作者 / 发布媒体</label>
        <div class="layui-input-inline">
            <input type="text" name="author" id="author" lay-verify="required" placeholder="请输入作者 / 发布媒体"
                   autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">类型</label>
        <div class="layui-input-block">
            <select id="newsType" name="newsType" lay-verify="required" lay-filter="newsType">
                <option value="0">社会新闻</option>
                <option value="1">经济新闻</option>
                <option value="2">科技新闻</option>
                <option value="3">时政新闻</option>
                <option value="4">国际新闻</option>
                <option value="5">体育新闻</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">文本内容</label>
        <div class="layui-input-block" id="writer">
        </div>
    </div>
    <div class="layui-form-item">
        <button class="layui-btn" id="publishNews">发布新闻</button>
    </div>
</form>
</body>
<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/myjs/wangEditor.min.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form
            , layer = layui.layer
            , laydate = layui.laydate
            , $ = layui.$;

        //日期
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });

        //创建一个编辑器
        //var editIndex = layedit.build('write');
        var E = window.wangEditor
        var editor = new E('#writer')
        editor.create()


        $("#publishNews").on("click", function () {
            var title = $("#title").val();
            var author = $("#author").val();
            var newsType = $("#newsType").val();
            var content = editor.txt.html();
            if (title === "") {
                alert("标题不能为空");
                return false;
            }
            if (author === "") { // 等同于 a === undefined || a === null
                alert("作者不能为空");
                return false;
            }
            $.ajax({
                url: "${pageContext.request.contextPath}/news/publish",
                data: {
                    "title": title,
                    "author": author,
                    "newsType": newsType,
                    "content": content
                },
                type: "POST",
                success: function (data1) {
                    if (data1.flag) {
                        alert("发布新闻成功！");
                        window.location.href = "${pageContext.request.contextPath}/news/toNewsList";
                    } else {
                        alert(data1.message);
                    }
                }
            });


        });
    });
</script>
</html>