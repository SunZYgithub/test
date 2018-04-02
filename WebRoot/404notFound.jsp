<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head> 
  <title>404 NOT FOUND</title>
  <base href="<%=basePath%>">    
  <meta http-equiv="content-type" content="text/html;charset=gb2312">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="keywords" content="this by them, txt, custom websites, custom web applications, web development, mobile development, roadmapping, custom cms website, design with purpose">
  <!-- <link href="plugin/css/error/404.css" rel="stylesheet" type="text/css" media="screen, projection" /> -->
  <script type="text/javascript" src="plugin/js/error/typekit.js"></script>
  <script type="text/javascript">try{Typekit.load();}catch(e){}</script>
  <script type="text/javascript" src="plugin/jQuery/jQuery-2.1.4.min.js"></script>
  <!--[if lte IE 9]>
  <script src="plugin/js/error/vendor-ie9.js" type="text/javascript"></script>
  <link href="plugin/css/error/404-ie9.css" rel="stylesheet" type="text/css" media="screen, projection" />
  <![endif]-->
  <style>
  	*{margin:0;padding:0;}
  	body{font:normal 100%/1.5 "kepler-std",sans-serif;}
  	.x404{background:#222d32 url(images/road.png);}
  	.x404 .container{margin-top:-155px;padding:3em 0;}
  	.x404 .container h3{padding:0 1em;text-align:center;line-height:1.3;letter-spacing:0.05em;color:#fff;position:relative;font-size:1em;option:0;}
  	.slogan{font-size:65px;}
  	.container h3 b {display:block;font-size:1.25em;}
  	#quit {color:#319554;text-decoration:none;color:#3EBB6A;}
	.shakeimage{position:relative; display:block;width:30%;height:220px;left:30%; top:300px;z-index:100;animation:caranmi 3s ease infinite}
	@keyframes caranmi{0%,100%{transform:translateY(60px)} 50%{transform:translateY(30px)}}
  	@keyframes containanmi{0%,100%{transform:;}}
  </style>
</head>
<body class="x404 x404_index">
	<img src="images/car.png" class="shakeimage" > 
	<div class="container">
		 <h3>
	         <span class="slogan" style="font-size:85px">404 NOT FOUND</span><br><b>当前页面正在建设中，请点击<a id="quit" href="javascript:void(0)">此处</a>返回地球</b>
	     </h3>
	</div>
  	<script> 
		 $('#quit').on('click',function(){
          //alert($('base').attr('href'));
	          if (top != self) {
	             parent.$('#signout').click();
	          }else{
	             $(this).attr('href',$('base').attr('href'));
	             window.location.href($('base').attr('href'));
	          }  
	      });
	      window.analytics||(window.analytics=[]),window.analytics.methods=["identify","track","trackLink","trackForm","trackClick","trackSubmit","page","pageview","ab","alias","ready","group","on","once","off"],window.analytics.factory=function(t){return function(){var a=Array.prototype.slice.call(arguments);return a.unshift(t),window.analytics.push(a),window.analytics}};for(var i=0;window.analytics.methods.length>i;i++){var method=window.analytics.methods[i];window.analytics[method]=window.analytics.factory(method)}window.analytics.load=function(t){var a=document.createElement("script");a.type="text/javascript",a.async=!0,a.src=("https:"===document.location.protocol?"https://":"http://")+"d2dq2ahtl5zl1z.cloudfront.net/analytics.js/v1/"+t+"/analytics.min.js";var n=document.getElementsByTagName("script")[0];n.parentNode.insertBefore(a,n)},window.analytics.SNIPPET_VERSION="2.0.8",
		  window.analytics.load("04kof9hy7t");
	      window.analytics.page();
	</script> 
</body>
</html>

