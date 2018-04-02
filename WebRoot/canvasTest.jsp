<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'canvasTest.jsp' starting page</title>  
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <style>
        .clocks{
            width:204px;
            height:204px;
            margin:20px auto;
        }
        .picture{
            width:500px;
            eight:500px;
            margin:auto;
        }
    </style>
  </head>
  
  <body>
    
    <h2 style="width:100%;text-align:center;">a clock case about canvas 2D</h2>
    <div class="clocks">
        <canvas id="clockCanvas" width="210px" height="210px"></canvas>
    </div> 
    
    <h2 style="width:100%;margin:50px auto 20px;text-align:center;">a picture album case about vanvas 3D</h2>
    <div class="picture">
        <canvas id="pictureCanvas" width="300" height="300"></canvas>
    </div> 
    
    <h2>SVG测试</h2>
    <svg xmlns="http://www.w3.org/2000/svg" version="1.1" height="190">
        <polygon points="100,10 40,180 190,60 10,60 160,180"
          style="fill:lime;stroke:purple;stroke-width:5;fill-rule:evenodd;">
    </svg>
    
    
    
    
    <script type="text/javascript">
        var canvas = document.getElementById("clockCanvas");
        var ctx = canvas.getContext('2d');
        run();
        setInterval(run,1000);
        function run(){
            var clockRadius = 105;//刻度半径
            var time = new Date();//获取现在时间
            var sec = time.getSeconds();//获取秒
            var min = time.getMinutes();//获取分钟
            var hour = time.getHours();//获取小时
            hour = hour>12 ? hour-12 : hour;
            ctx.clearRect(0,0,200,200);
            ctx.save();
            ctx.beginPath();
            ctx.lineWidth = 3;
            ctx.arc(105,105,100,0,2*Math.PI);
            ctx.fillStyle = '#fff';
            ctx.fill();
            ctx.strokeStyle = '#000';
            ctx.stroke();
            ctx.restore();
            ctx.save();
            ctx.translate(105,105);
            for(var i=0; i<60; i++){
                if(i%5 == 0){
                    ctx.beginPath();
                    ctx.moveTo(0,90);
                    ctx.lineTo(0,100);
                    ctx.lineWidth = 5;
                    ctx.strokeStyle = "red";
                    ctx.stroke();
                    ctx.rotate(Math.PI/30);
                }else{
                    ctx.beginPath();
                    ctx.moveTo(0,90);
                    ctx.lineTo(0,100);
                    ctx.lineWidth = 1;
                    ctx.strokeStyle = "black";
                    ctx.stroke();
                    ctx.rotate(Math.PI/30);
                }

            }
            //设置刻度数字
            ctx.beginPath();
            ctx.font = '20px Arial'; //set font about clock scale
            ctx.fillStyle = '#000';
            ctx.textAlign = 'center';
            ctx.textBaseline = 'middle';
            for (var n = 1; n <= 12; n++) {
                var theta = (n - 3) * (Math.PI * 2) / 12;
                var x = clockRadius * 0.7 * Math.cos(theta);
                var y = clockRadius * 0.7 * Math.sin(theta);
                ctx.fillText(n, x, y);
            }  
            ctx.restore();
            //秒针
            ctx.save();
            ctx.translate(105,105);
            ctx.rotate(sec*Math.PI/30);
            ctx.beginPath();
            ctx.moveTo(0,20);
            ctx.lineTo(0,-90);
            ctx.lineWidth = 1;
            ctx.strokeStyle = "#0f0";
            ctx.stroke();
            ctx.restore();
            //分针
            ctx.save();
            ctx.translate(105,105);
            ctx.rotate(sec*Math.PI/1800 + min*Math.PI/30);//每一秒再分60分，秒针走一刻度，分针要走1/60刻度,sec*(6*Math.PI/180)/60
            ctx.beginPath();
            ctx.moveTo(0,20);
            ctx.lineTo(0,-70);
            ctx.lineWidth = 3;
            //ctx.strokeStyle = "black";
            ctx.stroke();
            ctx.restore();
            //时针
            ctx.save();
            ctx.translate(105,105);
            ctx.rotate(min*Math.PI/360 + hour*Math.PI/6);//每一小时走过5个刻度线,60分钟,30deg，分成60份,30deg/60
            ctx.beginPath();
            ctx.moveTo(0,20);
            ctx.lineTo(0,-50);
            ctx.lineWidth = 4;
            //ctx.strokeStyle = "black";
            ctx.stroke();
            ctx.restore();
        }
        //2D时钟   end
        
        // pictureCanvas 测试
        
        var c=document.getElementById('pictureCanvas');
        var ctx1=c.getContext('2d');
        //渐变
        var grd=ctx1.createRadialGradient(75,50,5,90,60,100);
		grd.addColorStop(0,'red');
		grd.addColorStop(1,'white');
		
		// Fill with gradient
		ctx1.fillStyle = grd;
		ctx1.fillRect(10,10,150,80);
		ctx1.arc(50,150,50,0,2*Math.PI);
		ctx1.strokeStyle='red';
		ctx1.fillStyle='blue';
		ctx1.fill();
		ctx1.stroke();
		
		
		//3D canvas测试
		var c1 = document.getElementById('pictureCanvas');
		var ctx2 = c1.getContext('3D');
		
		
		
		
		
    </script>
    
  </body>
</html>
