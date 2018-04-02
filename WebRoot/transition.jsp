<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'transition.jsp' starting page</title>
    
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	
	<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script> 
	
	<link rel="stylesheet" type="text/css" href="styles.css">

	<style type="text/css">
	    .xyloading{position:fixed;width:1000px;max-width:100%;margin:auto;left:0;right:0;transition:all 2s;opacity:0;}
        .xyloading.show{opacity:1;}
        
     
		#owl-demo { width: 900px; margin-left: auto; margin-right: auto;}
		#owl-demo .item{ display: block;}
		#owl-demo img { display: block; width: 100%;}

    </style>
  </head>
  
  <body>
    <div class="xyloading" style="">
      <img src="/image/xinyiglass/xyloading.jpg" style="width:100%;">
    </div>
    
    
    <!-- banner -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="2000">
	  <!-- 轮播（Carousel）指标 -->
	  <ol class="carousel-indicators">
	    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	    <li data-target="#myCarousel" data-slide-to="1"></li>
	  </ol>  
	
	  <!-- 轮播（Carousel）项目 -->
	  <div class="carousel-inner">
	    <div class="item active">
	      <img src="/image/xinyiglass/banner1.jpg" alt="First slide">
	    </div>
	    <div class="item">
	      <img src="/image/xinyiglass/banner2.jpg" alt="Second slide">
	    </div>
	  </div>
	  <!-- 轮播（Carousel）导航 -->
	  <a class="carousel-control left" href="#myCarousel" data-slide="prev">‹</a>
	  <a class="carousel-control right" href="#myCarousel" data-slide="next">›</a>
	</div>
    
    <script>
     
		//$(function(){
		    /* setTimeout(function(){
		        $('.xyloading').addClass('show');
		    },1000)
		    setTimeout(function(){
		        $('.xyloading').removeClass('show');
		    },5000)
		     */
		    // 初始化轮播
	        
	        /* $("#myCarousel").carousel({
			  interval: 1000
			}); */
	       
		//})
		 
	


       
    </script>
    
    
  </body>
</html>
