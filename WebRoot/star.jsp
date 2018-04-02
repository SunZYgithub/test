<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>


<style>
*{
    margin:0;
    padding:0;
    }
div,span{padding:0;margin:0;}
.star{width:200px;height:28px; display:block; margin:300px 0 0 200px;}
.star span{ display:inline-block;width:27px;height:28px;cursor:pointer;background:url(star/star.png);}
.star .current{background:;}
.text{width:200px; margin:0 auto; text-align:center;height:30px; line-height:30px;}
.star span.current{background: url(star/stars.png);}
</style>
</head>
<body>



<div id="star" class="star" style="float:left;">
    <span class="stars" id='1'><img src="star/star.png" width="100%" height="100%" /></span>
    <span class="stars" id='2'><img src="star/star.png" width="100%" height="100%" /></span>
    <span class="stars" id='3'><img src="star/star.png" width="100%" height="100%" /></span>
    <span class="stars" id='4'><img src="star/star.png" width="100%" height="100%" /></span>
    <span class="stars" id='5'><img src="star/star.png" width="100%" height="100%" /></span>
</div>
<div class="starShade" style="width:170px;height:30px;position:absolute;left:200px;top:300px;background:#fff;display:none;opacity:0;"></div>
<div id="text" style="float:left;margin-top:305px;"></div>


<script>
/*
    $('li').hover(function(){
        for(var i=0;i<5;i++){
        $(this).addClass('wu')
        }
    },function(){
        $(this).removeClass('wu')
    })
    */
    var oBox=document.getElementById("star");
    var oSpan=oBox.getElementsByTagName("span");
    var iNer=document.getElementById("text");
    var oText=["非常不满意！","一般不满意！","不满意！","满意！","非常满意！"];
    for(var i=0;i<oSpan.length;i++){
        oSpan[i].onmouseover=function(){
            for(var j=0;j<this.id;j++){
                oSpan[j].className="current";
                text.innerHTML=oText[j];
                $('.current img').attr('src','star/stars.png')
            }
        };
        var star=true;
        oSpan[i].onmouseout=function(){
            if(!star)return;
            for(var j=0;j<this.id;j++){
                oSpan[j].className="stars";
                text.innerHTML="";
                $('.stars img').attr('src','star/star.png')
            }
        };
        oSpan[i].onclick=function(){
            if(!star){
                star=true;
                for(var j=0;j<this.id;j++){
                    text.innerHTML="";
                }
            }else{
                star=false;
                for(var j=0;j<this.id;j++){
                    text.innerHTML=oText[j]
                }
                $('.starShade').css('display','block')
            }
            
        };
    }

</script>

<script>
        function matchReplaceSrc(){
        
        }
        
        //思路分两步：作者（yanue）.
        //1，匹配出图片img标签（即匹配出所有图片），过滤其他不需要的字符
        //2.从匹配出来的结果（img标签中）循环匹配出图片地址（即src属性）
        var model = "<img class='' src='' width='' alt=''/>";
        var str = "<img src=\"11.jpg\" width='50' > !!! aaa !!! <img src=\"22.png\" alt=\"   \" />"
        console.log("str1::"+str);
        //匹配图片（g表示匹配所有结果i表示区分大小写）
        var imgReg = /<img.*?(?:>|\/>)/gi;
        //匹配src属性
        var srcReg = /src=[\'\"]?([^\'\"]*)[\'\"]?/i;
        var arr = str.match(imgReg);
        //console.log('所有已成功匹配图片的数组：'+arr);
        for (var i = 0; i < arr.length; i++) {
            
            var src = arr[i].match(srcReg);
            console.log("src"+(i+1)+":"+src);
            //获取图片地址
            if(src[1]){
                var imgSrc = src[1];
                console.log('已匹配的图片地址'+(i+1)+'：'+imgSrc);
                var n= str.replace(imgSrc,"test");
                console.log("str2::"+n)
            }   
        }
        console.log("str3::"+n)
         
</script>

</body>
</html>
