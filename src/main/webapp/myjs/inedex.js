$(function () {
    switch ($("#test").text()) {
        case '-1':
            $(".nav").addClass("layui-this");
            break;
        case '0':
            $(".nav0").addClass("layui-this");
            break;
        case '1':
            $(".nav1").addClass("layui-this");
            break;
        case '2':
            $(".nav2").addClass("layui-this");
            break;
        case '3':
            $(".nav3").addClass("layui-this");
            break;
        case '4':
            $(".nav4").addClass("layui-this");
            break;
        case '5':
            $(".nav5").addClass("layui-this");
            break;
    }
});
