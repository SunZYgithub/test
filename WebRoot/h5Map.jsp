<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'h5Map.jsp' starting page</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
	<style type="text/css"> 
	   *{ 
	       height: 100%; //设置高度，不然会显示不出来 
	   } 
	</style> 
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script> 
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=··············"></script> 
	
	<script type="text/javascript" src="http://developer.baidu.com/map/jsdemo/demo/convertor.js"></script> 
	 
	<script> 
		$(function(){ 
		  navigator.geolocation.getCurrentPosition(translatePoint); //定位 
		}); 
		function translatePoint(position){ 
			var currentLat = position.coords.latitude; 
			var currentLon = position.coords.longitude; 
			var gpsPoint = new BMap.Point(currentLon, currentLat); 
			BMap.Convertor.translate(gpsPoint, 0, initMap); //转换坐标 
		} 
		function initMap(point){ 
			//初始化地图 
			map = new BMap.Map("map"); 
			map.addControl(new BMap.NavigationControl()); 
			map.addControl(new BMap.ScaleControl()); 
			map.addControl(new BMap.OverviewMapControl()); 
			map.centerAndZoom(point, 15); 
			map.addOverlay(new BMap.Marker(point)) 
		} 
	</script> 
  </head>
  
  <body>
<div id="map"></div> 
  </body>
</html>
