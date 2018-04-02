<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Word44.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="word/jQuery-2.1.4.min.js"></script>
	<script type="text/javascript" src="word/FileSaver.js"></script>
    <script type="text/javascript" src="word/jquery.wordexport.js"></script>

  </head>
  
  <body>
      <div id="pagecontent">
          <h2>小池</h2>
          <h4>作者：<span style="color:red;">杨万里</span></h4>
          <p>泉眼无声惜细流，树阴照水爱晴柔。<br>
                                     小荷才露尖尖角，早有蜻蜓立上头。</p>
          <!-- <img src="https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1677270865,1390310093&fm=58" />  -->
          <img src="/image/home/bg1.png" style="width:200px;height:100px;"> 
      </div>
      <button class="word-export">word</button>
      <script>
        $(function() {
		    $(".word-export").click(function() {
		        //alert("click");
		        $("#pagecontent").wordExport("fileName");
		        //fileName为导出的word文件的命名
		    });
		    
		   
		});
		
		
       
      </script>
      
  </body>
</html>
