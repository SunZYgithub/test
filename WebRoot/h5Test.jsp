<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'h5Test.jsp' starting page</title>
    
	<meta charset="UTF-8">
	<!-- 百度地图api -->
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=134db1b9cf1f1f2b4427210932b34dcb"></script>  
	
	<style type="text/css">
	   #div1,#div2 {
	       float:left;
	       width:150px;
	       height:70px;
	       padding:10px;
	       margin:0 20px;
	       border:1px solid #ccc;
	   }
	</style>
 
  </head>
  
  <body>
    <h2>拖拽</h2>
    <div style="overflow:hidden;">
		<div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)">
		  <img id="drag1" src="images/car.png" draggable="true" ondragstart="drag(event)" width="100" height="50" style="cursor:pointer;">
		</div>
	    <div id="div2" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
    </div>
    <h2>使用地理定位</h2>
    <p id="demo">获取用户地理位置：</p>
    <button id="btn" >get</button>
    
    <h2>百度地图</h2>
    <div id="status" style="text-align: center"></div>    
    <div style="width:600px;height:480px;border:1px solid gray;margin:30px auto" id="container"></div>    
    
    <h2>video</h2>
    <video width="300" height="200" controls style="background:;">
        <source src="http://www.xinyiglass.com/Uploads/201608/57c559cd6dc25.mp4" type="video/mp4">
        <source src="" type="video/ogg">                
                        浏览器不支持video元素
    </video>
    
    <h2>audio</h2>
    <audio width="200" height="50" controls>
        <source src="" type="audio/ogg">
        <source src="http://www.runoob.com/try/demo_source/horse.mp3" type="audio/mpeg">
                        浏览器不支持audio元素
    </audio>
    
    <h2>input</h2>
    <div style="margin:50px auto;">
        <input type="email"/>
        <input type="password">
    </div>
    
    <h2>语义化标签</h2>
    <aside>
	    <h4>Epcot Center</h4>
	    <p>The Epcot Center is a theme park in Disney World, Florida.</p>
	</aside>
	<article>
	    <header>
	        <h1>Internet Explorer 9</h1>
	        <p><time pubdate datetime="2011-03-15"></time></p>
	    </header>
	    <p>Windows Internet Explorer 9(缩写为 IE9 )是在2011年3月14日21:00发布的</p>
	</article>
	<footer>
	    <p>Posted by: Hege Refsnes</p>
	    <p><time pubdate datetime="2012-03-01"></time></p>
	</footer>
	
	<h2>h5储存</h2>
	<div id="result"></div>
	<div>点击了 <span id="session" style="color:red;"></span> 次</div>
	<button onclick="clickCount()" >click</button>
    
    <h2>web sql</h2>
    <div id="status" name="status">状态信息</div>
    
    <h2>web worker</h2>
    <p>计数：<output id="webWorker"></output></p>
    <button onclick="startWorker()">start</button>
    <button onclick="endWorker()">end</button>
    
    <script>
        //  拖拽
        function clickCount(){
            if(typeof(Storage)!=='undefined'){

	            if(sessionStorage.clickcount){
	                sessionStorage.clickcount=Number(sessionStorage.clickcount)+1
	            }else{
	                sessionStorage.clickcount=1;
	            }
	            document.getElementById("session").innerHTML=' '+sessionStorage.clickcount+' ';
	        }else{

	        }
        }
        if(typeof(Storage)!=='undefined'){
            //alert('1')
            localStorage.sitename="菜鸟教程";
            document.getElementById("result").innerHTML="网站名：" + localStorage.sitename;
     
        }else{
            //alert('2')
            
        }
        
        function allowDrop(ev){
            ev.preventDefault();
        }
        
        function drag(ev){
            ev.dataTransfer.setData('Text',ev.target.id);
        }
        
        function drop(ev){
            ev.preventDefault();
            var data = ev.dataTransfer.getData('Text');
            ev.target.appendChild(document.getElementById(data));
        }
        
        //  web work
        
        var w;
		function startWorker() {
		    if(typeof(Worker) !== "undefined") {
		        if(typeof(w) == "undefined") {
		            w = new Worker("demo_workers.js");
		        }
		        w.onmessage = function(event) {
		            document.getElementById("webWorker").innerHTML = event.data;
		        };
		    } else {
		        document.getElementById("webWorker").innerHTML = "抱歉，你的浏览器不支持 Web Workers...";
		    }
		}
		
		function endWorker() 
		{ 
		    w.terminate();
		    w = undefined;
		}
        
    </script> 
    <script>
        
    </script>
    <script>
        var demo = document.getElementById('demo');
        var btn = document.getElementById('btn');
        var x=121.48789949,y=31.24916171; 
        
        
        document.getElementById("status").innerHTML = "HTML5 Geolocation is supported in your browser.";    
        // 百度地图API功能    
        var map = new BMap.Map("container");    
        var point = new BMap.Point(x,y);  
        map.centerAndZoom(point,12); 
        
        
        function showPosition(position){ 
            x=position.coords.latitude;   
            y=position.coords.longitude; 
            demo.innerHTML='纬度：'+x+',<br/>经度：'+y    
        } 
        
        btn.onclick = function(){
            if(navigator.geolocation) {  
	            navigator.geolocation.getCurrentPosition(showPosition);
	            var geolocation = new BMap.Geolocation();    
	            geolocation.getCurrentPosition(function(r){    
	                if(this.getStatus() == BMAP_STATUS_SUCCESS){    
	                    var mk = new BMap.Marker(r.point);    
	                    map.addOverlay(mk);    
	                    map.panTo(r.point);  
	                }    
	                else {    
	                    alert('failed'+this.getStatus());    
	                }           
	            },{enableHighAccuracy: true})
	            return;
            }
            alert("你的浏览器不支持获取地理位置！");
        }
        
	    
    </script>
      
  </body>
</html>
