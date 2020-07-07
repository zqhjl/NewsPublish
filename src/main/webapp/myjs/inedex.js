$(function () {
    switch ($("#test").text()) {
        case '-1':
            $(".nav").addClass("layui-this");
            $("title").html("新闻观世界 - 首页");
            break;
        case '0':
            $(".nav0").addClass("layui-this");
            $("title").html("新闻观世界 - 社会新闻");
            break;
        case '1':
            $(".nav1").addClass("layui-this");
            $("title").html("新闻观世界 - 经济新闻");
            break;
        case '2':
            $(".nav2").addClass("layui-this");
            $("title").html("新闻观世界 - 科技新闻");
            break;
        case '3':
            $(".nav3").addClass("layui-this");
            $("title").html("新闻观世界 - 时政新闻");
            break;
        case '4':
            $(".nav4").addClass("layui-this");
            $("title").html("新闻观世界 - 国际新闻");
            break;
        case '5':
            $(".nav5").addClass("layui-this");
            $("title").html("新闻观世界 - 体育新闻");
            break;
    }
    $("#particles-js").height()
});
