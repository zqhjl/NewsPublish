<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>更新新闻</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mycss/wangEditor.css" media="all">
</head>
<body style="font-family: 'Microsoft YaHei'">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;font-size: 32px;">
    <legend>修改新闻</legend>
</fieldset>
<form class="layui-form layui-form-pane" action="javascript:;">
    <div class="layui-form-item">
        <label class="layui-form-label">新闻标题</label>
        <input type="hidden" name="newsId" id="newsId" value="${news.newsId}">
        <div class="layui-input-block">
            <input type="text" name="title" id="title" autocomplete="off" placeholder="请输入标题" class="layui-input"
                   value="${news.title}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" style="width:150px;">作者 / 发布媒体</label>
        <div class="layui-input-inline">
            <input type="text" name="author" id="author" lay-verify="required" placeholder="请输入作者 / 发布媒体"
                   autocomplete="off" class="layui-input" value="${news.author}">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">类型</label>
        <div class="layui-input-block">
            <select id="newsType" name="newsType" lay-verify="required" lay-filter="newsType" style="z-index: 10000">
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
        <button class="layui-btn" id="editNews">更新新闻</button>
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
        var E = window.wangEditor;
        var editor = new E('#writer');
        editor.create();


        $(function () {
            $("#newsType").each(function () {
                // this代表的是<option></option>，对option再进行遍历
                $(this).children("option").each(function () {
                    // 判断需要对那个选项进行回显
                    if (this.value == ${news.newsType}) {
                        // 进行回显
                        $(this).attr("selected", "selected");
                    }
                });
            });
            form.render('select');
            editor.txt.html('${news.content}');

        });

        $("#editNews").on("click", function () {
            var title = $("#title").val();
            var author = $("#author").val();
            var newsType = $("#newsType").val();
            var newsId = $("#newsId").val();
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
                "url": "${pageContext.request.contextPath}/news/updateNews",
                "data": {
                    "newsId": newsId,
                    "title": title,
                    "author": author,
                    "newsType": newsType,
                    "content": content
                },
                "type": "POST",
                "success": function (data) {
                    if (data.flag) {
                        alert("修改成功");
                        window.location.href = "${pageContext.request.contextPath}/news/toNewsList";
                    } else {
                        alert(data.message);
                    }
                }
            });

        });
    });
</script>
</html>