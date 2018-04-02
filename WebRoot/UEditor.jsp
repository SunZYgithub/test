<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'UEditor.jsp' starting page</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
	<!-- 
	<script type="text/javascript" charset="utf-8" src="utf8-jsp/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="utf8-jsp/ueditor.all.min.js"> </script>
	<script type="text/javascript" charset="utf-8" src="utf8-jsp/lang/zh-cn/zh-cn.js"></script>
     -->
     <script type="text/javascript" src="js/wangEditor.min.js"></script>
  </head>
  
  <body>
    <form action="server.php" method="post">
        <!-- 加载编辑器的容器 -->
        <script id="container" name="content" type="text/plain">
            这里写你的初始化内容
        </script>
    </form>
    <!-- 配置文件 -->
    <script type="text/javascript" src="utf8-jsp/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="utf8-jsp/ueditor.all.js"></script>
    <!-- 实例化编辑器 -->
    <script type="text/javascript">
        //var editor = UE.getEditor('container');
    </script>
    
    <textarea id="div1"></textarea>
    <script>
        var E = window.wangEditor
	    var editor = new E('#div1')
	    //editor.customConfig.zIndex = 100
	    editor.create()
    </script>
  
  </body>
</html>
