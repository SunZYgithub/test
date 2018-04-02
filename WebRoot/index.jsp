<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >  
    <title>My JSP 'index.jsp' starting page</title>	
	<script src="http://cdn.static.runoob.com/libs/jquery/1.10.2/jquery.min.js"></script>
	<style>
		*{margin:0;padding:0;}
		html{width:100%;height:100%;}
		body{background:#abcdef;width:100%;font-family:"微软雅黑";margin:0;padding:0;}
		#btns{display:block;width:100px;height:30px;border:none;border-radius:20px;background:deepskyblue;color:#fff;font-size:18px;margin:40px auto;font-family:"微软雅黑";}
		#btns:hover{cursor:pointer;}
		input:-webkit-autofill { 
			-webkit-box-shadow: 0 0 0px 1000px #999 inset; 
			}
		input:focus{
			transition:border linear .2s,box-shadow linear .5s;
			-moz-transition:border linear .2s,-moz-box-shadow linear .5s;
			-webkit-transition:border linear .2s,-webkit-box-shadow linear .5s;
			outline:none;border-color:rgba(93,149,242,.75);
			box-shadow:0 0 8px rgba(93,149,242,.105);
			-moz-box-shadow:0 0 8px rgba(93,149,242,.5);
			-webkit-box-shadow:0 0 8px rgba(93,149,242,3);
		}

	</style>
  </head> 
  <body>     
  	 <div class = ".block" style="background:;text-align:center;width:70%;height:;margin:15% auto;"> 
  		<h1 style="text-align:center;text-indent:5%;margin:30px auto 100px;letter-spacing:8px;">欢迎来到停车管理系统！！！</h1>  
     	<form action="A.A" method="post" style="margin:30px 0 100px;font-size:20px;">
     		<div style="width:100%;height:30px;overfloat:hidden;">
		    	<label style="font-size:25px;display:block;margin-left:32%;float:left;" for="username">用户名:</label>
		    	<input style="border:none;border-radius:5px;width:130px;height:25px;margin:5px 0 0 70px;float:left;" type="text" id="username" name="username"/>
	    	</div>
	    	<br/>
	    	<div style="width:100%;height:30px;overfloat:hidden;">
		    	<label style="font-size:25px;display:block;margin-left:32%;float:left;" for="password">密码:</label>
		    	<input  style="border:none;border-radius:5px;width:130px;height:25px;margin:5px 0 0 96px;float:left;" type="password" id="password" name="password"/>
			</div>
			<div style="width:100%;">
				<input type="submit" id="btns" value="登入" />
			</div>
	    	
        </form>
    </div> 
    <%
     HttpSession sess = request.getSession();
     String errMsg = (String)sess.getAttribute("msg");
     sess.setAttribute("msg", null);
    %>
    <script>
       var err = '<%=errMsg %>';
       console.log(err);
       if(err!='null'){
        /*   alert(err); */
       }      
    </script>    
  </body>
</html>
