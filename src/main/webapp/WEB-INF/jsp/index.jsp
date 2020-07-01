<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
</head>
<body style="background-color:skyblue;">
    <!--这个是导航条-->
    <ul class="layui-nav layui-bg-cyan">
      <li class="layui-nav-item"><a href="">新闻发布</a></li>
      <li class="layui-nav-item layui-this"><a href="">新闻</a></li>
      <li class="layui-nav-item layui-layout-right" lay-unselect="">
        <a href="javascript:"><img src="//t.cn/RCzsdCq" class="layui-nav-img" alt="">${user.userName}</a>
        <dl class="layui-nav-child">
          <dd><a href="javascript:" id="editUser">修改个人信息</a></dd>
          <dd><a href="javascript:" id="loginOut">退了</a></dd>
        </dl>
      </li>
    </ul>

  <div id="show"></div>
   
</body>
<script src="${pageContext.request.contextPath}/layui/layui.all.js"></script>
<script type="text/javascript">
    var $ =layui.$;
   $("#editUser").on("click",function(){
	  window.location.href="${pageContext.request.contextPath}/user/toEditUser"
   });
   $("#loginOut").on("click",function(){
		  window.location.href="${pageContext.request.contextPath}/user/loginOut"
   });
   $(function(){
	   $.ajax({
		   "url" : "${pageContext.request.contextPath}/news/queryAllNews",
		   "data":{},
           "type":"POST",
           "success":function(data){
        	   var htmlString = "";
	           	if(data.flag){
	           	 $.each(data.datas.allNews,function(i,n){
                     htmlString+='<div class="layui-card layui-col-md11" style="margin: 30px;">';
                     htmlString+='<div class="layui-row">';
                     htmlString+='<div class="layui-card-header layui-col-md5"><h1>'+n.title+'</h1></div>';
                     htmlString+='<div class="layui-card-header layui-col-md2">| 报道：'+n.author+'</div>';
                     htmlString+='<div class="layui-card-header layui-col-md2">| 新闻类型：'+changeType(n.newsType)+'</div>';
                     htmlString+='<div class="layui-card-header layui-col-md3">| 报道时间:'+n.publishTime+'</div>';
                     htmlString+='</div>';
                     htmlString+='<div class="layui-card-body">';
                     htmlString+=''+n.content+'';
                     htmlString+='</div>';
                     htmlString+='</div>';
                 });
	           	 $("#show").append(htmlString);
	           	}else{
	           		alert(returndata.message);
	           	}
           }
	   });
	   
	   function changeType(type){
		 	  if(type===0){
	    		  return "社会新闻";
	    	  }
	    	  else if(type===1){
	    		  return "经济新闻";
	    	  }
	    	  else if(type===2){
	    		  return "时政新闻";
	    	  }
	    	  else if(type===3){
	    		  return "国际新闻";
	    	  }
	    	  else if(type===4){
	    		  return "体育新闻";	
	    	  }
	   }
   });
</script>

</html>