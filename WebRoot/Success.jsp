<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">   
    <title>My JSP 'Success.jsp' starting page</title>
	
	<!-- <script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.js"></script> -->
	<link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">		
 	<!-- 	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,user-scalable:no"> -->
	
	<!-- 添加框架功能  2017-4-21 star-->
	<!-- <meta http-equiv="content-type" content="text/html;charset=gb2312"> -->
	<!-- <link rel="stylesheet" href="plugin/css/font-awesome.min.css">
	<link rel="stylesheet" href="plugin/css/jquery-ui.min.css">
	<link rel="stylesheet" type="text/css" href="plugin/css/public.css"> -->
	<script type="text/javascript" src="plugin/jQuery/jQuery-2.1.4.min.js"></script>
	<script src="plugin/jQuery/jquery-ui.min.js"></script>	
	<!-- <link rel="stylesheet" href="plugin/css/jquery.datetimepicker.css"> -->
	<script src="plugin/jQuery/jquery.datetimepicker.full.js"></script>	
	<script src="plugin/js/xygdev.commons.js"></script>	
	
	
	<!-- 添加框架功能  2017-4-21 end-->
	
	<style>
		@media screen and (min-width:915px){
			 .park_refresh{width:100px;height:26px;margin-left:15%;float:left;}
		}
		@media screen and (max-width:915px){
			 .park_refresh{width:100px;height:26px;margin-left:1%;float:left;}
		}
		@media screen and (max-width:801px){
			 .park_refresh{width:100px;height:26px;margin:8% 0 0 38%;float:left;}
		}
		@media screen and (min-width:750px){
			/* 提示P */
			.hintP{display:block;margin:10px  0 10px 25%;font-size:15px;color:blue;}			
		}
		@media screen and (max-width:750px){
			/* 提示P */		
			.hintP{display:none;}		
		}
		 @media screen and (min-width:738px) {/*分辨率大于900实行这里面的CSS样式*/
			 ul{width:100%;}
        	 #heard ul li{width:33.3%;float:left;text-align:center;font-size:20px;padding:10px 0;}    	
			 #delPark{height:26px;border-radius:3px;background:beige;border:1px solid #666;margin-left:22%;float:left;}
		}
		 @media screen and (max-width: 738px) { /*当屏幕尺寸小于600px时，应用下面的CSS样式*/
			ul{width:100%;}
			#heard ul li{width:33.3%;float:left;height:36px;line-height:31px;text-align:center;font-size:16px;padding:10px 0;}		
			#delPark{height:26px;border-radius:3px;background:beige;border:1px solid #666;margin-left:10%;float:left;}
		}  
		@media screen and (max-width: 564px) {
		 	ul{width:100%;}
			#heard ul li{width:33.3%;float:left;height:30px;font-size:15px;padding:10px 0;} 
		 	#delPark{height:26px;border-radius:3px;background:beige;border:1px solid #666;margin-left:1%;float:left;}
		 } 
		@media screen and (max-width: 500px) {
		 	ul{width:100%;}
			#heard ul li{width:33.3%;float:left;height:60px;font-size:15px;padding:10px 0;}  	
		 }
        *{margin:0;padding:0;}
        body,html{width:100%;background:#fff;font-family:"微软雅黑";position:relative;}
        
        .btnHid{visibility:hidden;}
        #tab tr td{font-size:15px;}
        html { overflow-x: hidden; overflow-y:scoll; } 
        tr{width:25%;height:35px;}
        thead tr{font-size:25px;}
        td{height:20px;text-align:center;}
        ul,li{list-style:none;letter-spacing:8px;}   
        #tabForm tr td{font-size:15px;}
      	h1{width:100%;text-align:center;margin:20px 0;}
        input:-webkit-autofill { 
			-webkit-box-shadow: 0 0 0px 1000px #FFF inset; 
			}
		input:focus{
			transition:border linear .2s,box-shadow linear .5s;
			outline:none;
			border-color:rgba(93,149,242,.75);
			box-shadow:0 0 8px rgba(93,149,242,.105);
		} 
        .left{float:left;!import;}
        /*
        * never滑动CSS 
        */
        .li1 {background:#000;color:#FFF;}
      	.li2,.li3,.li4{background:#222;color:#777;}
      	.changeLi{color:#fff;cursor:pointer;}
        /*
      	*  弹出框CSS
      	*/     
      	.windows{position:relative;width:100%;display:none;}
      	.popWindows{position: fixed;width:100%;height:100%;background:#000;opacity:0.8;z-index:3;transition:opacity 3s linear;display:none;}
      	.line{position:relative;width:100%;height:3px;background:black;}
      	.slideDiv{position:fixed;top:0px;left:50%;border-radius:15px;display:none;margin:50px 0 0 -240px;min-width:320px;z-index:4;background:#fff;}
      	.slideDivH{padding:19px;color:#444;font-size:20px;padding-left:68px;letter-spacing:8px;border-bottom:1px solid #e5e5e5;}
      	.formDiv{width:100%;height：46px;margin:0px 0;font-size:20px;overflow:hidden;}
      	.formLabel{display:block;margin-left: 110px;float:left;}
      	.formText{width:130px;margin:0px 80px 0 20px;float:left;}
      	.formP{width:322px;line-height:20px;margin-left:80px;text-align:center;font-size:16px;}
      	.btnDiv{text-align:right;}
      	.btnYes{width: 100px; height:30px;background:#000;color:#fff;border:none;border-radius:5px;margin:0 15px 15px 15px;float:right;}
      	.btnYes:hover{cursor:pointer;}
      	.btnNo{ width:80px;height: 30px;border:none;border-radius:5px;}  	
        /*
        *  gotoTop 
        */
      	#gotoTop{width:50px;height:60px;background:#90dda5;top:70%;right:20px;position:fixed;display:none;}
      	    
        #insertPark{overfloat:hidden;}
        button:hover{cursor:pointer;}
        #page:hover{cursor:pointer;}
        
    </style>
    
  </head> 
  <body>
  	  <div id="div1" style="margin-top:200px;">
		  <p>欢迎使用 wangEditor 编辑器</p>
      </div>
      <button id="btn1">获取html</button>
      <button id="btn2">获取text</button>
      <img src="">
      
  	  <div id="heard" style="position:fixed;width:100%;left:0;top:0;overflow:hidden;"> 
      	  <div style="background:#abcdef;height:90px;line-height:90px;font-size:30px;font-weight:bold;letter-spacing:10px;text-align:center;">后台管理页面</div>
          <ul >
 		  		<li class="li1">车位管理</li>
 		   		<!-- <li class="li2">停车场进出库操作	</li> -->
 		  		<li class="li3">停车场车辆管理</li>
 		  		<li class="li4" >退出登录</li>
 	      </ul> 
	  </div>
	  
	  <div style="width:100%;overflow:hidden; z-index: 200; ">
	  <!-- //  车位操作	 -->
		<div id="opera_park" style="overflow:hidden;"> 
			 <div id="adPark" class = "windows">
				<div class = "popWindows"></div> 	
				<div id="slide1" class="slideDiv" style="margin-top:150px;">
					
					<!--2017/4/26  id->close_addPark11 -->
				    <h4 class="slideDivH"><i class="fa fa-truck  fa-lg"></i>&nbsp;新增车位<i class="fa fa-window-close" id="close_addPark11" style="margin-left:240px;cursor:pointer;"></i></h4>	 
				 	<div class="line"></div>
				 	<form> 		
				    <!-- 加一个hidden隐藏域 -->
				    <!-- 2017/4/26 form放于新增更新  中 -->
				   <!-- 
				    	<input type="hidden" id="typeC1" name="typeC" value="fc1" />
				    	<div class="formDiv">
					    	<label for="ins_parkId" class="formLabel">新增车位编号:</label>
					    	<input type="text" name="ins_parkId" id="ins_parkId" class="formText" placeholder="例如：A001"  />
					    	<br/>
					    	<p id="cue_parkC" class="formP"></p>
				    	</div> 	
				    	<div class="formDiv">
					    	<label for="ins_parkType" class="formLabel">新增车位类型:</label>
					    	<input  type="text" name="ins_parkType" id="ins_parkType" class="formText" placeholder="只能填写'A'或者'B'" />
					    	<br/>
					    	<p id="cue_parkT" class="formP" ></p>
				    	</div>				    
				    	<div class="btnDiv">
					    	<input type="button" id="btn_insertPark" value="新增车位" class="btnYes">
					    	<button id="quit_N1" class="btnNo">取消</button><br/>	2017/4/24
				    	</div> -->
				    </form>
			    </div>
		    </div> 
		    <div id="dePark" class = "windows">
			    	<div class = "popWindows"></div> 	
					<div id="slide2" class="slideDiv" style="margin-top:150px;">			
					    <h4 class="slideDivH">删除车位<i class="fa fa-window-close" id="close_delPark" style="margin-left:240px;cursor:pointer;"></i></h4>	
					    <form>
				 	    <!--   加一个hidden隐藏域 -->
					    	<input type="hidden" id="typeC2" name="typeC" value="fc2" />
					    	<div class="formDiv">
						    	<label for="del_parkId" class="formLabel">删除车位编号:</label>
						    	<input type="text"  placeholder="例如：A001" id="del_parkId" name="del_parkId" class="formText"/>
					    		<br/>
					    		<p id="cue_parkC1" class="formP"></p>
					    	</div>
					    	<div class="btnDiv">
						    	<input type="button" id="btn_delPark" value="删除车位" class="btnYes">
						    	<button id="quit_N2" class="btnNo">取消</button>  
				    		</div>							
					    </form>
					</div>
		    </div>
            <!-- 添加<iframe>标签提交表单时不刷新页面 -->
		    <!-- <iframe id="rfFrame" name="rfFrame" src="about:blank" style="display:none;"></iframe>  -->
	  		<!--  登入提示框	  -->
		    <%
		     	 HttpSession sess = request.getSession();
			     String errMsg3 = (String)sess.getAttribute("msg");
			     sess.setAttribute("msg", null);			 		      
		   	%>  

		  
		   <!-- 2017/4/24 id -->
		   <div style="width:70%;margin:183px auto 42px;overflow:hidden;border-left:2px solid #ccc;border-right:2px solid #ccc;"> 
				<button id="addPark11" style="height:26px;border-radius:3px;background:beige;border:1px solid #666;margin-left:28%;float:left;"><div style="float:left;height:25px;line-height:25px;margin:0 7px;">添加车位&nbsp;<i class="fa fa-truck  fa-lg"></i></div></button>
				<button id="delPark" ><div style="float:left;height:25px;line-height:25px;margin:0 7px;">删除车位&nbsp;<i class="fa fa-car fa-lg fa-fw"></i></div></button>
		   </div>
		   
		   
		   <h3 style="width:70%;margin:20px 0 0 16%;letter-spacing:3px;">显示车位信息:</h3> 
		   <div style="overflow:hidden;width:100%;margin-top:18px;">
			   <div style="float:left;width:49%;height:139px;background:aliceblue;">
				   	 <div style="width:70%;margin:19px auto 22px;font-size:20px;background:aliceblue;overflow:hidden;">
					    <label for = "park_currentpage" style="display:block;text-indent: 65px;font-size:18px;margin-bottom:-24px;float:left;">当前车位页码:</label>
						<input type = "text" style="width:70px;display:block;float:right;margin-top:4px;text-align:center;"readonly = "readonly" name = "park_currentpage111" id="park_currentpage111" value="1"/>
						<br/>
					 </div>
					 
					 <!-- 2017/4/24 -->
					 <div style="width:70%;margin:0 auto 16px;font-size:20px;overflow:hidden;">
						<label for = "park_pageSize" style="display:block;text-indent: 65px;font-size:18px;margin-bottom:-24px;float:left;cursor:pointer;">当前车位行数:</label>
						<input type = "text" style="width:70px;display:block;float:right;margin-top:4px;text-align:center;" name ="park_pageSize" id="park_pageSize" value="5"/>
						<br/>	
					 </div>
					 
					 
					 <p id="hintP1" class="hintP" ><i class="fa fa-warning" style="margin:0 10px;"></i>可更改车位行数</p>
			    </div>
			    <div style="width:2px;height:139px;float:left;margin-left:1%;border-left:2px dashed #ccc;"></div>
			    <div style="float:left;width:49%;height:139px;background:azure;float:right;">
			   		<h4 style="width:70%;margin:11px 0 11px 62px ;">现有车位数量: <span class="nowparkNum" style="color:red;font-size:26px;margin-left:23px;"></span></h4>
					<h4 style="width:70%;margin:11px 0 47px 62px;">现空车位数量: <span class="nownoparkNum" style="color:red;font-size:26px;margin-left:23px;"></span></h4>
			    </div>
			</div>
		    
		    <!-- 2017/4/26 -->
		     <table border="2" id="tb" data-table="Resp" style="padding:10px 0  0 200px;overflow:hidden; width:70%;margin:60px auto 0;border-collapse:collapse;">
		    	<thead >
		      		<tr>
			      		<th class="td_PC" data-column="db">车位号码</th>
			      		<th class="td_PT" data-column="db">车位类型</th>
			      		<th class="td_CN" data-column="db">车牌号码</th>
			      		<th class="td_IT" data-column="db">入库时间</th>
		      		   
		      		</tr>
		      	
		      	</thead>
		      	<tbody id="tab" data-table="Resp"></tbody>
		    </table> 
		
	  <!-- 2017-4-21  添加内容 stert -->    
	  
	  <!-- 主表格区域 start -->
      <!-- <div class="table">
        <table id="tb" data-table="Resp">
          <tr>
            <th class="td_PC" data-column="db">车位号码</th>
            <th class="td_PT" data-column="db">车位类型</th>
            <th class="td_CN" data-column="db">车牌号码</th>
     	    <th class="td_IT" data-column="db">功能描述</th>
     	    
     	  </tr>
     	  <tr>
     	    <td class="td_PC" data-column="db"></td>
            <td class="td_PT" data-column="db"></td>
            <td class="td_CN" data-column="db"></td>
     	    <td class="td_IT" data-column="db"></td>
     	 
     	  </tr>
        </table>
      </div> -->
      <!-- 主表格区域 end -->
	      
      <!-- 主表格按钮区域 start -->
      <div class="table_button" id="table" data-table="Resp" style="width:70%;margin-left:15%;">
        <div class="setting">
          <i class="fa fa-cog pointer" data-reveal-id="setting" title="表格设置" data-dismissmodalclass="close-setting"></i>
        </div>
        <div class="setting">
          <i class="fa fa-search pointer" data-reveal-id="query" data-key="true" title="条件查询" data-dismissmodalclass="close-query-frame"></i>
        </div>
        <div class="setting">
          <i class="fa fa-plus-circle pointer" data-key="true" title="新增车位" data-reveal-id="ui" data-key="true" data-dismissmodalclass="close-ui-frame" data-crudtype="pre-insert" data-type="insert"></i>
        </div>
        <div class="setting">
          <i id='park_refresh' class="fa fa-refresh pointer" title="刷新数据" ></i>
        </div>
        <div id="setting">
          <!-- 设置菜单区域 start -->
	        <div class="title">
		      <span>设置</span>
		      <a class="close-setting">&#215;</a>
		    </div>  
		    <div class="line"></div>
		    <div class="content">
		      <ul>
		        <li><a class="pointer" data-rowdefine="init" data-reveal-id="row-def" data-pageframe="row-def" data-table="#tb">定义列</a></li>
		        <li><a class="pointer">显示行数</a>
		          <ul>
		            <li>
		              <a class="set_page_size pointer" data-pagetype="setpagesize" >
		                <i class="fa fa-dot-circle-o " data-value="5"></i>5
		              </a>
		            </li>
		            <li>
		              <a class="set_page_size pointer" data-pagetype="setpagesize" >
		                <i class="fa fa-dot-circle-o hidden" data-value="10"></i>10
		              </a>
		            </li>
		            <li>
		              <a class="set_page_size pointer" data-pagetype="setpagesize" >
		                <i class="fa fa-dot-circle-o hidden" data-value="15"></i>15
		              </a>
		            </li>
		            <li>
		              <a class="set_page_size pointer" data-pagetype="setpagesize" >
		                <i class="fa fa-dot-circle-o hidden" data-value="25"></i>25
		              </a>
		            </li>
		            <li>
		              <a class="set_page_size pointer" data-pagetype="setpagesize" >
		                <i class="fa fa-dot-circle-o hidden" data-value="50"></i>50
		              </a>
		            </li> 
		          </ul>
		        </li>
		        <li><a class="pointer" data-rowdefine="init" data-ordertable="#tb" data-reveal-id="orderby" data-pageframe="orderby">多维排序</a></li>
		        <li><a class="pointer" data-config="init" data-reveal-id="config">个人配置</a></li>
		       </ul>
		     </div>  
          <!-- 设置菜单区域 end -->    
          </div>
          <div>
          <!-- 分页按钮区域 start -->
	          <div class="arrow_S margin" id="park_fin1" >
		        <i id="last" class="fa fa-step-forward pointer"  ></i>
		      </div>
		      <div class="arrow_L" id="park_next1" >
		        <i id="next" class="fa fa-chevron-circle-right pointer" ></i>
		      </div>
		      <div class="pageRow" >
		       	<!-- <span id="pageRow" data-type="row">1</span> -->
		       	<input type = "text" style="width:70px;display:block;float:right;margin-top:4px;text-align:center;"readonly = "readonly" name = "park_currentpage" id="park_currentpage" value="1"/>
		      </div>
		      <div class="arrow_L"  id="park_pre1" >
		        <i id="previous" class="fa fa-chevron-circle-left pointer" ></i>
		      </div>
		      <div class="arrow_S" id="park_fir1" >
		        <i id="first" class="fa fa-step-backward pointer"></i>
		      </div>
	          <!-- 分页按钮区域 end -->
	          <!-- <input type="hidden" data-type="size" id="page_size" value="5"/>
	          <input type="hidden" data-type="number" id="page_no" value="1"/>
	          <input type="hidden" data-type="orderby" id="ORDER_BY" value="RESP_ID"/> 
	          <input type="hidden" data-type="cond"/>
	          <input type="hidden" data-type="url" value="resp/getRespPage.do"/>
	          <input type="hidden" data-type="jsontype" value="table"/>  -->
        </div>
      </div>
      <!-- 主表格按钮区域 end --> 
   
      <!-- 定义列区域 start --> 
      <div id="row-def">
       <div class="title pointer">
         <span class="title_name">定义列</span>
       </div>
	   <a class="close-reveal-modal">&#215;</a>
       <div class="line"></div>
       <div class="contain">
         <select class="option_frame" data-type="hide" multiple='multiple' title='隐藏'></select>
         <div class="button_frame">
     	   <button class="button" data-rowdefine="hide" data-pageframe="row-def">
     	     <i class="fa fa-angle-left fa-2x"></i>
     	   </button>
     	   <button class="button" data-rowdefine="show" data-pageframe="row-def">
     	     <i class="fa fa-angle-right fa-2x"></i>
     	   </button>
     	   <button class="button" data-rowdefine="hide_all" data-pageframe="row-def">
     	     <i class="fa fa-angle-double-left fa-2x"></i>
     	   </button>
     	   <button class="button" data-rowdefine="show_all" data-pageframe="row-def">
     	     <i class="fa fa-angle-double-right fa-2x"></i>
     	   </button>
         </div>
         <select class="option_frame" data-type="show" multiple='multiple' title='显示'></select>
         <div class="button_frame">
     	   <button class="button" data-rowdefine="up" data-pageframe="row-def">
     	     <i class="fa fa-angle-up fa-2x"></i>
     	   </button>
     	   <button class="button" data-rowdefine="down" data-pageframe="row-def">
     	     <i class="fa fa-angle-down fa-2x"></i>
     	   </button>
     	   <button class="button" data-rowdefine="top" data-pageframe="row-def">
     	     <i class="fa fa-angle-double-up fa-2x"></i>
     	   </button>
     	   <button class="button" data-rowdefine="bottom" data-pageframe="row-def">
     	     <i class="fa fa-angle-double-down fa-2x"></i>
     	   </button>
         </div>
         <input type="hidden" data-type="table">
       </div>
     </div>
      <!-- 定义列区域 end -->
    
      <!-- 多维排序区域 start -->
      <div id="orderby">
       <div class="title pointer">
         <span class="title_name">多维排序</span>
       </div>
       <a class="close-reveal-modal">&#215;</a>
       <div class="line"></div>
       <div class="contain">
         <div class="item" id="col1">
           <span>排序一：</span>
           <select class="select"></select>
		   <input type="radio" name="col1" class="col1" checked="checked" value="ASC" />ASC 
           <input type="radio" name="col1" class="col1" value="DESC" />DESC 
         </div>  
         <div class="item" id="col2">
           <span>排序二：</span>
           <select class="select"></select>
		   <input type="radio" name="col2" class="col2" checked="checked" value="ASC" />ASC 
           <input type="radio" name="col2" class="col2" value="DESC" />DESC 
         </div> 
         <div class="item" id="col3">
           <span>排序三：</span>
           <select class="select"></select>
		   <input type="radio" name="col3" class="col3" checked="checked" value="ASC" />ASC 
           <input type="radio" name="col3" class="col3" value="DESC" />DESC 
         </div> 
       </div>
       <div class="footer">
         <button class='right pointer' data-order=true >排序</button>
       </div>
     </div>
      <!-- 多维排序区域 end -->
   
      <!-- 个人配置区域 start -->
      <!-- <div id="config">
      <div class="title pointer">
        <span class="title_name">个人配置</span>
      </div>
      <a class="close-reveal-modal">&#215;</a>
      <div class="line"></div>
      <div class="contain" id="configtabs">
        <ul>
          <li><a href="#tabs-1">保存配置</a></li>
          <li><a href="#tabs-2">加载配置</a></li>
        </ul>
        <div id="tabs-1" class='tab'>
          <div class="item" style="text-indent:3rem">
            <label class="pointer" for="USER_INTERACT_NAME">自定义名称：</label>
            <input type="text" name="USER_INTERACT_NAME" id="USER_INTERACT_NAME">
          </div>
          <div class="item" style="text-indent:6rem">
            <label class="pointer" for="CONFIG_DESCRIPTION">描述：</label>
            <input type="text" name="DESCRIPTION" id="CONFIG_DESCRIPTION">
          </div>
          <div class="item" style="text-indent:6rem">
            <label class="pointer" for="PUBLIC_FLAG">共享</label>
            <input type="checkbox" name="PUBLIC_FLAG" id="PUBLIC_FLAG">
            <label class="pointer" for="DEFAULT_FLAG">默认</label>
            <input type="checkbox" name="DEFAULT_FLAG" id="DEFAULT_FLAG">
            <label class="pointer" for="AUTOQUERY_FLAG">自动查询</label>
            <input type="checkbox" name="AUTOQUERY_FLAG" id="AUTOQUERY_FLAG"> 
          </div>
          <div class="item">
            <button class='pointer' data-config="save" >保存</button>
          </div>
        </div>
        <div id="tabs-2" class='tab'>
          <div class="item" style="text-indent:6rem;margin:50px auto 60px">
            <label class="pointer" for="loding_format">选择配置:</label>
            <select id="loding_format"></select>
          </div>
          <div class="item">
            <button class='pointer' data-config="load">加载</button>
          </div>
        </div>
      </div>
    </div> -->
      <!-- 个人配置区域 end -->
      
      <!-- 更新/新增职责区域 start -->
      <div id='ui' class='pop_frame row-2'>     
        <div class='title pointer'>      
          <span data-type="update"><i class="fa fa-globe fa-1x" aria-hidden="true"></i>&nbsp;更新车位</span>
          <span data-type="insert"><i class="fa fa-globe fa-1x" aria-hidden="true"></i>&nbsp;新增车位</span>
        </div>
        
         <!-- 2017/4/26  加ID -->
        <a id="close_addPark" class="close-ui-frame" data-type="close">&#215;</a>
        <div class='line'></div>
        <div class='content row-2'>
          <form id='updateData'>
            <!-- <input type='hidden' id='RESP_ID' name="RESP_ID" data-update="db"/>
            <label for='RESP_CODE' class='left md'>车位编码</label>
            <input type='text' id='RESP_CODE' name='RESP_CODE' data-update="db" required='required' class='left lg'/>
            <label for='RESP_NAME' class='left md'>车位类型</label>
            <input type='text' id='RESP_NAME' name='RESP_NAME' data-update="db" required='required' class='left lg'/>
            <label for='DESCRIPTION' class='left md'>车牌号码</label>
            <input type='text' id='DESCRIPTION' name='DESCRIPTION' data-update="db" class='left lg'/>
            <label for='MENU_CODE' class='left md'>入库时间</label> 
            <input type="text" id="MENU_NAME" name="MENU_NAME" data-update="db" class="left md" data-modify="true" required="required" data-pageframe="ui"  data-lovbtn="MENU_LOV"  data-param="MENU_NAME"/>
            <input type='hidden' id='MENU_ID' name='MENU_ID' data-update="db"/>
 			-->
 			
 			<!-- 2017/4/26 -->
 			<!-- 加一个hidden隐藏域 -->
	    	<input type="hidden" id="typeC1" name="typeC" value="fc1" />
	    	<div class="formDiv" style="height:47px;">
		    	<label for="ins_parkId" class="formLabel">新增车位编号:</label>
		    	<input type="text" name="ins_parkId" id="ins_parkId" class="formText" placeholder="例如：A001"  />
		    	<br/>
		    	<p id="cue_parkC" class="formP"></p>
	    	</div> 	
	    	<div class="formDiv" style="height:47px;">
		    	<label for="ins_parkType" class="formLabel">新增车位类型:</label>
		    	<input  type="text" name="ins_parkType" id="ins_parkType" class="formText" placeholder="只能填写'A'或者'B'" />
		    	<br/>
		    	<p id="cue_parkT" class="formP" ></p>
	    	</div>				    
	    	<!-- <div class="btnDiv">
		    	<input type="button" id="btn_insertPark" value="新增车位" class="btnYes">
		    	<button id="quit_N1" class="btnNo">取消</button><br/>	2017/4/24
	    	</div> -->
 			
          </form>
        </div>
        <div class='foot btnDiv'>       
          <button  class="right update_confirm pointer" data-type="update" data-keyup="enter" data-crudtype="update" data-pageframe="ui" >提交更新</button>
          <button id="btn_insertPark" class="right update_confirm pointer" data-type="insert" data-keyup="enter"  >新增</button>
        </div>    
      </div> 
      <!-- 更新/新增职责区域 end -->
     
      <!-- 条件查询区域 start -->
      <div id='query' class='pop_frame row-3'>     
        <div class='title pointer'>      
          <span><i class="fa fa-globe"></i>&nbsp;车位查询</span>
        </div>
        <a class="close-query-frame" data-type="close">&#215;</a>
        <div class='line'></div>
        <div class='content row-3'>
          <form>
            <label for='RESP_NAME_Q' class='left md'>车位编号:</label> 
            <input type='text' id='RESP_NAME_Q' name='RESP_NAME' data-update="db" class='left md' data-modify='true' data-pageframe="query"  data-lovbtn='RESP_LOV_Q'  data-param="RESP_NAME"/>
            <input type='hidden' id='RESP_ID_Q' name='RESP_ID' data-update="db"/>
            <input type='button' id="RESP_LOV_Q" class='left button pointer' data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="query" data-bg="lov-modal-bg" data-dismissmodalclass='close-lov' data-lovname="职责查询" data-queryurl="lov/getRespPage.do" data-jsontype="resp" data-defaultquery="true" data-th=["职责ID","职责编码","职责名称","描述"] data-td=["RESP_ID&none","RESP_CODE","RESP_NAME","RESP_DESC"] data-selectname=["职责编码","职责名称"] data-selectvalue=["RESP_CODE","RESP_NAME"] data-choose=[".RESP_ID",".RESP_NAME"] data-recid=["#RESP_ID_Q","#RESP_NAME_Q"] value="···"/>
            <br style="clear:both"/>
            <label for='MENU_NAME_Q' class='left md'>车位类型:</label> 
            <input type="text" id="MENU_NAME_Q" name="MENU_NAME" data-update="db" class="left md" data-modify="true" data-pageframe="query"  data-lovbtn="MENU_LOV_Q"  data-param="MENU_NAME"/>
            <input type='hidden' id='MENU_ID_Q' name='MENU_ID' data-update="db"/>
            <input type='button' id="MENU_LOV_Q" class='left button pointer' data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="query" data-bg="lov-modal-bg" data-dismissmodalclass='close-lov' data-lovname="菜单查询" data-queryurl="lov/getMenuPage.do" data-jsontype="menu" data-defaultquery="true" data-th=["菜单ID","菜单编码","菜单名称","描述"] data-td=["MENU_ID&none","MENU_CODE","MENU_NAME","MENU_DESC"] data-selectname=["菜单编码","菜单名称"] data-selectvalue=["MENU_CODE","MENU_NAME"] data-choose=[".MENU_ID",".MENU_NAME"] data-recid=["#MENU_ID_Q","#MENU_NAME_Q"] value="···"/>
            <br style="clear:both"/>
            <label for="START_DATE_F" class="left md">车牌号码:</label>
            <input type="text" id="START_DATE_F" name="START_DATE_F" class="left lg" />
            <label class="left md">入库时间：</label>
            <input type="text" id="START_DATE_T" name="START_DATE_T" class="left lg" data-datatype="date" placeholder="入库日期"/>
            <br style="clear:both"/>
          </form>
        </div>
        <div class='foot'>             
          <button class="right pointer"  data-buttonframe="table" data-keyup="enter" data-crudtype="query" data-pageframe="query">车位查询</button>
        </div> 
      </div>
      <!-- 条件查询区域 end -->     
     
	  <!-- 2017-4-21  添加内容 end -->    
		    
		    	    
		  <!--   <div id="park_btnDiv" style="width:70%;margin:30px auto 157px;text-align:center;overflow:hidden;">
			    <button id = "park_fir11" style="width:40px;height:25px;margin-left:10px;float:left;">首页</button>
				<button id = "park_pre11" style="width:60px;height:25px;margin-left:10px;float:left;">上一页<span class="glyphicon glyphicon-menu-left"  aria-hidden="true"></span></button>
			    <button id = "park_next11" style="width:60px;height:25px;margin-left:10px;float:left;">下一页<span class="glyphicon glyphicon-menu-right"  aria-hidden="true"></span></button>
				<button id = "park_fin11" style="width:40px;height:25px;margin-left:10px;float:left;">末页</button>
				<div id = "park_skip1" style="width:160px;float:left;overflow:hidden;">跳转到：第
					<input type="text" name = "park_currentpage1" id="park_currentpage1" style="width: 42px; ">页
				</div>
				<button id="park_btn11" style="width:43px;height:25px;float:left;"><i class="fa fa-search  fa-lg "></i></button>
				<button id="park_refresh11" class="park_refresh">刷新当前页面</button>
			</div>	  -->	 
			<!-- //存放scorllTop值 -->
			<!--  	<input type="hidden" id="hdnvalue" class="hdnvalue" value="0" /> -->		 	
		 </div>	 
	
		 <!-- //  历史信息查询	 -->
	     <div id="hisForm" style="display:none;">	
	     	 <div id="enCar" class = "windows">
				<div class = "popWindows"></div> 	
			    <div id="slide3" class="slideDiv">
					<h3 class="slideDivH">车辆入库<i class="fa fa-window-close" id="close_carEnt" style="margin-left:240px;cursor:pointer;"></i></h3>	
				 	<form> 		
				<!--   加一个hidden隐藏域 -->
				    	<input type="hidden" name="typeF" id="typeF1" value="ff1" />
				    	<div class="formDiv">
					    	<label class="formLabel">车牌号码:</label>
					    	<input type="text"  placeholder="例如：a001" id="ent_carId" class="formText" name="ent_carId" />
					    	<br/>
					    	<p id="cue_carId" class="formP"></p>
				    	</div>
				    	<div class="formDiv">
					    	<label for="entTime" class="formLabel">入库时间:</label>
					    	<input id="entTime" class="formText" type="text" name="entTime" placeholder="2017-01-01 00:00:00" />
					    	<br/>
					    	<p id="cue_entTime" class="formP"></p>
				    	</div>
				    	<div class="btnDiv">
					    	<input type="button" id="carEnter" class="btnYes" value="车辆入库" >
					    	<button id="quit_N3" class="btnNo">取消</button><br/>	
				    	</div>
				    </form>
			    </div> 
		    </div> 
		    <div id="ouCar" class = "windows">
			    	<div class = "popWindows"></div> 	
					<div id="slide4" class="slideDiv">			
					    <h3 class="slideDivH">车辆出库<i class="fa fa-window-close" id="close_carOut" style="margin-left:240px;cursor:pointer;"></i></h3>	
					    <form>
				 		<!--   加一个hidden隐藏域 -->
					    	<input type="hidden" name="typeF" id="typeF2" value="ff2" />
					    	<div class="formDiv">
						    	<label for="out_carId" class="formLabel">车牌号码:</label>
						    	<input type="text"  placeholder="例如：a001" id="out_carId" class="formText" name="out_carId" />
					    		<br/>
					    		<p id="cue_carId1" class="formP"></p>
					    	</div>
					    	<div class="formDiv">
						    	<label for="outTime" class="formLabel">出库时间:</label>
						    	<input id="outTime" class="formText" type="text" name="outTime" placeholder="2017-01-01 00:00:00" />
						    	<br/>
						    	<p id="cue_outTime" class="formP"></p>
				    		</div>	
				    		<h2 style="margin:0px 0 30px 167px;"><span style="">总费用：￥</span><span id="fee" style = "color:red;font-size:35px;">0</span></h2>
					    	<div class="btnDiv">
						    	<input type="button" id="carOut" class="btnYes" value="车辆出库" >
						    	<button id="quit_N4" class="btnNo">取消</button>  
				    		</div>							
					    </form>   
					</div>
		    </div> 	     		     	
	     	<div style="width:70%;margin:172px auto 20px;overflow:hidden;"> 
				<button id="entCar" style="height:26px;background:beige;border:1px solid #666;margin-left:28%;border-radius:3px;float:left;"><div style="float:left;height:25px;line-height:25px;margin:0 7px;">车辆入库&nbsp;<i class="fa fa-truck  fa-lg"></i></div></button>
				<button id="outCar" style="height:26px;background:beige;border:1px solid #666;margin-left:18%;border-radius:3px;float:left;"><div style="float:left;height:25px;line-height:25px;margin:0 7px;">车辆出库&nbsp;<i class="fa fa-car  fa-lg"></i></div></button>
			</div>
	     	<h3 style="border-top:2px solid #e8ecee;width:70%;padding:14px;margin:10px auto;">车库历史车辆信息：</h3>		 	
			<div style="width:70%;margin:10px auto 20px;font-size:20px;overflow:hidden;">
			    <label for = "currentpage" style="display:block;text-indent: 100px;font-size:20px;float:left;">当前历史页码:</label>
				<input type = "text" readonly = "readonly" style="width:50px;margin-left:100px;text-align:center;" name = "currentpage" id="currentpage" value="1"/><br/>
			</div>
			<div style="width:70%;margin:0 auto 15px;font-size:20px;overflow:hidden;">
				<label for = "pageSize" style="display:block;text-indent: 100px;font-size:20px;margin:0;float:left;cursor:pointer;">当前页码行数:</label>
				<input type = "text" style="width:50px;margin-left:100px;text-align:center;" name ="pageSize" id="pageSize" value="9"/>	
			</div>
			<p style="width:100%;margin:0 0 30px 20%;font-size:15px;color:blue;float:left;"><i class="fa fa-warning" style="margin:0 10px;"></i>可更改页码行数</p>
		 	<table  border="2" style="padding:10px 0  0 200px;overflow:hidden; width:70%;margin:0 auto;border-collapse:collapse;">
		 		<thead >
		      		<tr>
			      		<th>车位号码</th>
			      		<th>车位类型</th>
			      		<th>车牌号码</th>
			      		<th>入库时间</th>
			      		<th>出库时间</th>
			      		<th>消费金额</th>
		      		</tr>
		      	</thead>
		      	<tbody id="tabForm"></tbody>	      		
		     </table>
			 <div id="his_btnDiv" style="width:70%;margin:30px auto 70px;text-align:center;overflow:hidden;">
			    <button id = "his_fir2" style="width:40px;height:25px;margin:20px 10px 0 0;float:left;">首页</button>
				<button id = "his_pre2" style="width:60px;height:25px;margin:20px 10px 0 0;float:left;">上一页</button>
			    <button id = "his_next2" style="width:60px;height:25px;margin:20px 10px 0 0;float:left;">下一页</button>
				<button id = "his_fin2" style="width:40px;height:25px;margin:20px 10px 0 0;float:left;">末页</button>
				<div id = "his_skip2" style="width:160px;float:left;margin:20px 0 0 10px;">跳转到：第
					<input type="text" name = "his_currentpage2" id="his_currentpage2" style="width: 42px; ">页
				</div>
				<button id="his_btn2" style="width:43px;height:25px;margin:20px 10px 0 0;float:left;"><i class="fa fa-search  fa-lg "></i></button>
				<button id="his_refresh1" style="width:100px;height:26px;float:left;margin:20px 0 0 140px;">刷新当前页面</button>
			</div>
		 </div>	 
		 <!-- //    用户是否退出弹出窗         -->
		 <div id="pop" style="display:none;">		
		 	 <div style="position:relative;width:100%;height:916px;">
				 <div style="position: absolute;top: 0px;left: 0;width:100%;height:916px;background:#000;opacity:0.6;z-index:3;"></div> 	
			 	 <div  id="slide5" style="position:absolute;top:150px;left:50%;border-radius:15px;display:none;margin:50px 0 0 -240px;min-width:320px;z-index:4;background:#fff;">
					<h3 style="text-align:center;">是否退出当前账户！！！<i class="fa fa-window-close" id="close_account" style="margin:31px 0 28px 28px;cursor:pointer;"></i></h3>				
					<div style="padding:45px;">
						<input type="button" id="quit_Y" class="btnYes" value="退出账户" >
						<button id="quit_N" class="btnNo">取消</button>  
				    </div>					
			 	 </div>	
		 	 </div>
		 	 <div>	 	 	
		 	 </div> 
		 </div>	
		
	 </div>	 
  	 <!--  点击回到顶部 -->
  	 <div id="page"></div> 	 
  	 
  	 
  	
  <!-- =====================登入是否成功, 车位是否添加及删除 提示框=======================-->
	<script>
	
	 	var err3 = '<%=errMsg3 %>';
		if(err3!='null'){
		    alert(err3);		      
		}    
	</script> 
	 <!--   ====================================== 动画效果	================================ -->																	
	<script>	
	    
		// 点击回到顶部	
		function gotoTop(min_height){ 
			var gotoTop_html = '<div id="gotoTop" ><i class="fa fa-chevron-up fa-2x fa-inverse" style="margin:10px;"></i></div>'; 
			$("#page").append(gotoTop_html); 
			$("#gotoTop").click(
				function(){$('html,body').animate({scrollTop:0},800); 
			}).hover(function(){
				/* 不能使颜色渐变 */				
				//  $("#gotoTop").animate({left:'25px'});
				$(this).css("background","#35b558");
				$(".fa-chevron-up").replaceWith('<p class="nm_p" style="margin:7px;color:#fff;">回到顶部</p>');
			},function(){
				//	$(this).animate({background:'#90dda5'});
				$("#gotoTop").css("background","#90dda5");
				$(".nm_p").replaceWith('<i class="fa fa-chevron-up fa-2x fa-inverse" style="margin:10px;"></i>');				
			});		
			min_height ? min_height = min_height : min_height = 20; 
			$(window).scroll(function(){ 
				var s = $(window).scrollTop(); 
				if( s > min_height){ 
					$("#gotoTop").fadeIn(500); 
				}else{ 
					$("#gotoTop").fadeOut(500); 
				}; 
			}); 
		}; 	
		gotoTop();
		
		//  动画效果   		
       $(".li1").click(function(){
      		$("#opera_park").css("display","block").siblings("div").css("display","none")
       })
  
       $(".li3").click(function(){
      		$("#hisForm").css("display","block").siblings("div").css("display","none")
       })
       $("#heard>ul").find("li").click(function(){
       		alert("11")
      		$(this).attr("class","li1").siblings("li").attr("class","li2");      	
       }) 
       $("#heard").find("li").hover(function(){
        	if($(this).hasClass("li1")){
      			$(this).addClass("li1")
      		}else{
      			$(this).addClass("changeLi").siblings("li").removeClass("changeLi")
      		}
       },function(){
       		$(this).removeClass("changeLi")
       })  
  	   	   	 
	  //是否退出页面
      $(".li4").click(function(){
     		$("#pop").css("display","block").siblings("div").css("display","none");
     		$("#adPark").css("display","block");
			$("#slide5").slideDown("quick");
			$("ul li:first-child").attr("class","li1").siblings("li").attr("class","li2");
      })
      $("#quit_Y").click(function(){
			window.location.href="index.jsp"
	  })
	  $("#quit_N").click(function(){
	  		$("#pop").css("display","none");
	  		$("#slide5").css("display","none");
	  })
	  
	  function close1(){
	  		$("#pop").css("display","none");
	  		$("#slide5").css("display","none");
	  		$("#opera_park").css("display","block").siblings("div").css("display","none");
	  		$("ul li:first-child").attr("class","li1").siblings("li").attr("class","li2");
	 		$("ul>li").removeAttr("style")
	  }
	  $("#close_account").click(function(){
	  		close1();
	  })
	  $("#quit_N").click(function(){
	 		close1();
	 }) 
	  function close2(e){
	  		e.preventDefault();
	 	    $("#cue_parkT").css("display","none");
			$("#cue_parkC").css("display","none");
			document.getElementById("ins_parkId").value="";
			document.getElementById("ins_parkType").value="";
	  		$("#adPark").css("display","none");
	  		$("#slide1").toggle("5s");
	  		$(".popWindows").css("display","none");
	  }
	   $("#quit_N1").click(function(e){
	 	    close2(e);
	  }) 
	  $("#close_addPark").click(function(e){
	  		close2(e);
	  })
	  function close3(e){
	  		$("#dePark").css("display","none");
	  		e.preventDefault();
	 		$("#cue_parkC1").css("display","none"); 
			document.getElementById("del_parkId").value="";
	  		$("#dePark").css("display","none");
	  		$("#slide2").css("display","none");	  		
	  		$(".popWindows").css("display","none");
	  }
	   $("#quit_N2").click(function(e){
	 		close3(e);
	  }) 
	  $("#close_delPark").click(function(e){
	  		close3(e);
	  })
	  function close4(e){
	  		e.preventDefault();
	 		$("#cue_carId").css("display","none");
			$("#cue_entTime").css("display","none");
			document.getElementById("ent_carId").value="";
			document.getElementById("entTime").value="";
	  		$("#enCar").css("display","none");
	  		$("#slide3").css("display","none");
	  		$(".popWindows").css("display","none");	
	  }
	   $("#quit_N3").click(function(e){
	 		close4(e);
	  }) 
	   $("#close_carEnt").click(function(e){
	 		close4(e);	
	  })  
	  function close5(e){
	  		e.preventDefault();
	 		$("#cue_carId1").css("display","none");
			$("#cue_outTime").css("display","none");
			document.getElementById("out_carId").value="";
			document.getElementById("outTime").value="";
	  		$("#ouCar").css("display","none");
	  		$("#slide4").css("display","none");	
	  		$(".popWindows").css("display","none");
	  		$("#fee").text("0");
	  }
	  $("#quit_N4").click(function(e){
	 		close5(e);
	  }) 
	  $("#close_carOut").click(function(e){
	 		close5(e);
	  })
	  
    </script>
	
	<!-- ==================车位管理页面---添加车位 提示==================== -->
    <script type="text/javascript">  
    /*   添加删除车位 提示 */
    function chkinPut(){
  		if($("#ins_parkId").val() == ""){
  			$("#cue_parkC").css({"display":"block","background":"yellow","color":"#333","text-align":"center"}).html("请输入车位编号！！！")
			$("#ins_parkId").focus();	
  			return false;
  		}
  		var parkCreg = /^[A-B]{1}[0-9]{3}$/; 
		var obj = document.getElementById("ins_parkId").value;
  		if(!parkCreg.test(obj)) {	
			$("#cue_parkC").css({"display":"block","background":"#FFE384","color":"#333","text-align":"center"}).html("请输正确车位编号(例如 A001)！！");
			$("#ins_parkId").focus();
			return false;  
		}else{
			$("#cue_parkC").css({"display":"block","background":"green","color":"#333","text-align":"center"}).html("输入成功！！！")
			$("#ins_parkType").focus();
		}			
  		var obj1 = document.getElementById("ins_parkType").value;
  		if($("#ins_parkType").val() == ""){
  			$("#cue_parkT").css({"display":"block","background":"yellow","color":"#333","text-align":"center"}).html("请输入车位类型！！！")
  			return false;
  		}else if(obj1!="A"&&obj1!="B") { 	    	
		    $("#cue_parkT").css({"display":"block","background":"#FFE384","color":"#333","text-align":"center"}).html("请输正确车位类型(A或B)！！！")	        	
		  	$("#ins_parkType").focus();
		  	return false;  
		}else{	
			$("#cue_parkT").css({"display":"block","background":"green","color":"#333","text-align":"center"}).html("输入成功！！！")	
			$("#ins_parkType").blur();
		}
		
		var ins_parkId = document.getElementById("ins_parkId").value;
		var ins_parkType  = document.getElementById("ins_parkType").value; 
		var typeC1 = document.getElementById("typeC1").value;
		$.ajax({
			url:'C.C',
			type:'post',
			data:{"ins_parkId":ins_parkId ,"ins_parkType":ins_parkType,"typeC":typeC1},
			dataType:'json',
			success:function(data1){
			console.log("datajiajajiajiajajia:"+data1);	
				alert(data1.msg);
			},error:function(){
				alert("json格式返回错误133");
			}
		})	
  	}
  	
	$("#ins_parkType").focus(function(){
			$("#cue_parkC1").css("display","none"); 
			document.getElementById("del_parkId").value="";
	})  
	$("#addPark").click(function(){
		$("#adPark").css("display","block");
		$("#slide1").slideDown("quick");
		$(".popWindows").css("display","block");
	}) 
    /* 添加车位操作 */
  	$("#btn_insertPark").on("click",function(){
  		return chkinPut();
  	}) 	
   	function chkindelparkPut(){
  		if($("#del_parkId").val() == ""){
			$("#cue_parkC1").css({"display":"block","background":"yellow","color":"#333","text-align":"center"}).html("请输入车位编号！！！")
  			$("#del_parkId").focus();
  			return false;
  		}
  		var parkCreg = /^[A-B]{1}[0-9]{3}$/; 
		var obj = document.getElementById("del_parkId").value;
  		if(!parkCreg.test(obj)) {	
			$("#cue_parkC1").css({"display":"block","background":"#FFE384","color":"#333","text-align":"center"}).html("请输正确车位编号(例如 A001)！！");
			$("#del_parkId").focus();
			return false;  
		}else{
			$("#cue_parkC1").css({"display":"block","background":"green","color":"#333","text-align":"center"}).html("输入成功！！！")		
		} 
		var del_parkId = document.getElementById("del_parkId").value;
		var typeC2 = document.getElementById("typeC2").value;
		$.ajax({
			url:'C.C',
			type:'post',
			data:{"del_parkId":del_parkId ,"typeC":typeC2},
			dataType:'json',
			success:function(data1){
			console.log("datajiajajiajiajajia:"+data1);	
				alert(data1.msg);
			},error:function(){
				alert("json格式返回错误");
			}
		})
  	}  		
  	$("#delPark").click(function(){
		$("#dePark").css("display","block");
		$("#slide2").slideDown("quick");
		$(".popWindows").css("display","block");
	}) 
	 /* 删除车位操作 */
  	 $("#btn_delPark").on("click",function(){
  		return chkindelparkPut();
  	})   	
    /* 	汽车进出库提示 */
 	 function entcarPut(){
  		if($("#ent_carId").val() == ""){
			$("#ent_carId").focus();
			$("#cue_carId").css({"display":"block","background":"yellow","color":"#333","text-align":"center"}).html("请输入车牌号码！！！")
  			return false;
  		}
  		var carCreg = /^[a-b]{1}[0-9]{3}$/; 
		var obj = document.getElementById("ent_carId").value;
  		if(!carCreg.test(obj)) {
			$("#cue_carId").css({"display":"block","background":"#FFE384","color":"#333","text-align":"center"}).html("请输正确车牌号码(例如 a001)！！");
			$("#ent_carId").focus();
			return false;  
		} else{
			$("#cue_carId").css({"display":"block","background":"green","color":"#333","text-align":"center"}).html("输入成功！！！")
			$("#ent_carId").blur();
		} 	

  		if($("#entTime").val()!=""){
	  		var cCreg = /^(?:(?:(?:(?:(?:1[6-9]|[2-9][0-9])?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00)))([-/.])(?:0?2\1(?:29)))|(?:(?:(?:1[6-9]|[2-9][0-9])?[0-9]{2})([-/.])(?:(?:(?:0?[13578]|1[02])\2(?:31))|(?:(?:0?[13-9]|1[0-2])\2(?:29|30))|(?:(?:0?[1-9])|(?:1[0-2]))\2(?:0?[1-9]|1[0-9]|2[0-8])))) ([01]\d|2[01234]):([0-5]\d|60):([0-5]\d|60)$/; 
			var ob = document.getElementById("entTime").value;
	  		if(!cCreg.test(ob)) {
				$("#cue_entTime").css({"display":"block","background":"#FFE384","color":"#333","text-align":"center"}).html("(例如2017-01-01 00:00:00)！！");
				return false;  
			}else{
				$("#cue_entTime").css({"display":"block","background":"green","color":"#333","text-align":"center"}).html("输入成功！！！")
			} 
		}else{
			$("#cue_entTime").css({"display":"block","background":"green","color":"#333","text-align":"center"}).html("当前时间为系统时间！！！")
			$('#entTime').attr('placeholder','当前时间为系统时间');
		}
		var ent_carId = document.getElementById("ent_carId").value;
		var entTime  = document.getElementById("entTime").value; 
		var typeF1 = document.getElementById("typeF1").value;
		$.ajax({
			url:'F.F',
			type:'post',
			data:{"ent_carId":ent_carId ,"entTime":entTime,"typeF":typeF1},
			dataType:'json',
			success:function(data){
				alert(data.msg);
				$("#fee").text("0");
			},error:function(){
				alert("json格式返回错误");
			}
		})   	
  	}  
  	$("#entCar").click(function(){
  		$("#enCar").css("display","block");
  		$("#slide3").slideDown("quick");
  		$(".popWindows").css("display","block");
  	})
  	/* 汽车进库操作 */
  	$("#carEnter").on("click",function(){
  		return entcarPut();
  	})
  		function outcarPut(){
  		if($("#out_carId").val() == ""){
			$("#out_carId").focus();
			$("#cue_carId1").css({"display":"block","background":"yellow","color":"#333","text-align":"center"}).html("请输入车牌号码！！！")
  			return false;
  		}
  		var carCreg = /^[a-b]{1}[0-9]{3}$/; 
		var obj1 = document.getElementById("out_carId").value;
  		if(!carCreg.test(obj1)) {	
			$("#cue_carId1").css({"display":"block","background":"#FFE384","color":"#333","text-align":"center"}).html("请输正确车牌号码(例如 a001)！！");
			$("#out_carId").focus();
			return false;  
		}else{
			$("#cue_carId1").css({"display":"block","background":"green","color":"#333","text-align":"center"}).html("输入成功！！！")
			$("#out_carId").blur();
		}  	
		
  		if($("#outTime").val()!=""){
	  		var carTCreg = /^(?:(?:(?:(?:(?:1[6-9]|[2-9][0-9])?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00)))([-/.])(?:0?2\1(?:29)))|(?:(?:(?:1[6-9]|[2-9][0-9])?[0-9]{2})([-/.])(?:(?:(?:0?[13578]|1[02])\2(?:31))|(?:(?:0?[13-9]|1[0-2])\2(?:29|30))|(?:(?:0?[1-9])|(?:1[0-2]))\2(?:0?[1-9]|1[0-9]|2[0-8])))) ([01]\d|2[01234]):([0-5]\d|60):([0-5]\d|60)$/; 
			var obj = document.getElementById("outTime").value;
	  		if(!carTCreg.test(obj)) {
				$("#cue_outTime").css({"display":"block","background":"#FFE384","color":"#333","text-align":"center"}).html("(例如2017-01-01 00:00:00)！！");
				$("#outTime").focus();
				return false;  
			}else{
				$("#cue_outTime").css({"display":"block","background":"green","color":"#333","text-align":"center"}).html("输入成功！！！");
			}
		}else{
			$("#cue_outTime").css({"display":"block","background":"green","color":"#333","text-align":"center"}).html("当前时间为系统时间！！！")
			$('#outTime').attr('placeholder','当前时间为系统时间');
		}
		var out_carId = document.getElementById("out_carId").value;
		var outTime  = document.getElementById("outTime").value; 
		var typeF2 = document.getElementById("typeF2").value;
		
		$.ajax({
			url:'F.F',
			type:'post',
			data:{"out_carId":out_carId ,"outTime":outTime,"typeF":typeF2},
			dataType:'json',
			success:function(data){
				console.log("data:"+data);	
				console.log("fee:"+data.fee);
				alert(data.msg)
				$("#fee").text(data.fee);
			},error:function(){
				alert("json格式返回错误");
			}
		})	
  	}
  	
  	$("#outCar").click(function(){
  		$("#ouCar").css("display","block");
  		$("#slide4").slideDown("quick");
  		$(".popWindows").css("display","block");
  	})
  	/* 汽车出库操作 */
  	$("#carOut").on("click",function(){
  		return outcarPut();  
   	})
    /* 	判断按钮是否被隐藏 */
  	function btnIshide(pageNo,allPage,ap,np){
		$(".nowparkNum").text(ap);
		$(".nownoparkNum").text(np); 
		document.getElementById("park_currentpage").value=pageNo;
  		 if(pageNo==1){
			if(allPage == 1){
				//$("#park_btnDiv").children().addClass("btnHid");
				//$("#park_refresh").removeClass("btnHid");
				
				$("#park_fir1").addClass("btnHid");
				$("#park_pre1").addClass("btnHid");
				$("#park_next1").addClass("btnHid");
				$("#park_fin1").addClass("btnHid");
			
				/* 2017-4-25 */
			}else{
				$("#park_fir1").addClass("btnHid");
				$("#park_pre1").addClass("btnHid");
				$("#park_next1").removeClass("btnHid");
				$("#park_fin1").removeClass("btnHid");
				$("#park_skip1").removeClass("btnHid");
				$("#park_btn1").removeClass("btnHid");	
			}
		}else if(pageNo == allPage){
			$("#park_fir1").removeClass("btnHid");
			$("#park_pre1").removeClass("btnHid");
			$("#park_next1").addClass("btnHid");
			$("#park_fin1").addClass("btnHid");
			$("#park_skip1").removeClass("btnHid");
			$("#park_btn1").removeClass("btnHid");
		}else{
			//$("#park_btnDiv").children().removeClass("btnHid");
			$("#park_fir1").removeClass("btnHid");
			$("#park_pre1").removeClass("btnHid");
			$("#park_next1").removeClass("btnHid");
			$("#park_fin1").removeClass("btnHid");
			
			/* 2017-4-24 */
			
		}
  	} 
  	function hisbtnIshide(pageNo,allPage){
  		 if(pageNo==1){
			if(allPage == 1){
			 	  $("#his_btnDiv").children().addClass("btnHid");
			 	  $("#his_refresh1").removeClass("btnHid");	
			}else{
				  $("#his_fir2").addClass("btnHid");
				  $("#his_pre2").addClass("btnHid");
				  $("#his_next2").removeClass("btnHid");
				  $("#his_fin2").removeClass("btnHid");
				  $("#his_skip2").removeClass("btnHid");
				  $("#his_btn2").removeClass("btnHid");
			}
		}else if(pageNo == allPage){
			$("#his_fir2").removeClass("btnHid");
			$("#his_pre2").removeClass("btnHid");
			$("#his_next2").addClass("btnHid");
			$("#his_fin2").addClass("btnHid");
			$("#his_skip2").removeClass("btnHid");
			$("#his_btn2").removeClass("btnHid");
		}else{
			$("#his_btnDiv").children().removeClass("btnHid");	
	    }
  	} 	
    /* 输入行数  页码是否为正整数 */
  	function PSnumChange(){
  		var numCreg = /^[1-9]*[1-9][0-9]*$/; 
		if(!numCreg.test($("#park_pageSize").val())){
				alert("请输入正整数！！！");
				$("#park_pageSize").focus();
		}else{
			$("#tab").find('tr').remove();
			document.getElementById("park_currentpage").value = 1;
			park_ajax_null();
		}
  	}	
  	function PCnumChange(){
  		var numCreg = /^[1-9]*[1-9][0-9]*$/; 
		var obj = document.getElementById("park_currentpage1").value;
		if(!numCreg.test(obj)){
			alert("请输入正整数！！！");
			$("#park_currentpage1").focus();
		}else{	
			var park_currentpage = document.getElementById("park_currentpage1").value;
			park_ajax_isFas(park_currentpage,false);
		}
  	}	
    function hisPSnumChange(){
  		var numCreg = /^[1-9]*[1-9][0-9]*$/; 
		var obj1 = document.getElementById("pageSize").value;
		if(!numCreg.test(obj1)){
				alert("请输入正整数！！！");
		//		$("#park_pageSize").focus();
		}else{
			$("#tabForm").find('tr').remove();
			document.getElementById("currentpage").value = 1;
			his_ajax_null();
		}
  	} 	
  	function hisPCnumChange(){
  		var numCreg = /^[1-9]*[1-9][0-9]*$/; 
		var obj = document.getElementById("his_currentpage2").value;
		if(!numCreg.test(obj)){
			alert("请输入正整数！！！");
			$("#his_currentpage2").focus();
		}else{
			var currentpage = document.getElementById("his_currentpage2").value;
			his_ajax_isFas(currentpage,false);
		}
  	} 	
   </script>	  
   <!-- 	=========查询车位条件改变，点击查询======== -->
   <script>
   		 /* form滑动效果 */	
   		 function formHover(formId){
			  $(formId).find("tr:odd").hover(function(){
			  	   	$(this).css({"background":"#555","color":"#fff","transtion":"all .3s"}).siblings("tr").css({"background":"#fff","color":"#000","transtion":"all 3s"});
			  		
			  },function(){	
					$(this).css({"background":"#fff","color":"#000","transtion":"all .3s"});
			  })
			  	   
			  $(formId).find("tr:even").hover(function(){
			  	   	$(this).css({"background":"#222","color":"#fff","transtion":"all .3s"}).siblings("tr").css({"background":"#fff","color":"#000","transtion":"all 3s"});
			  
			  },function(){
			  	   	$(this).css({"background":"#fff","color":"#000","transtion":"all .3s"});
			  })
  	   	}			
 		function  park_ajax_null(){
   	  		 var park_currentpage = document.getElementById("park_currentpage").value;
			 var park_pageSize = document.getElementById("park_pageSize").value;	
		  	 $.ajax({	
		  		url:'E.E',
		  		type:'get',
		  		data:{"park_currentpage":park_currentpage ,"park_pageSize":park_pageSize,"lastPage":false },
		  		dataType:'json',
		  		success:function(data){	
		  		    var da = data.da;
		  			for (i=0;i<da.length;i++) {  	              		                
					       $("#tab").append("<tr><td class='td_PC'>"+da[i].PARKING_CODE+"</td>"+	
	  				        "<td class='td_PT'>"+da[i].PARKING_TYPE+"</td>"+
	  				        "<td class='td_CN'>"+da[i].CAR_NUM+"</td>"+
	  				        "<td class='td_IT'>"+da[i].IN_TIME+"</td></tr>")    				         				        	  				        
				   } 
				   var ap = data.ap;
				   var np = data.np;
				   var pageNo =parseInt(data.pageCurrentpage);
				   var allPage = parseInt(data.allPage);
				   btnIshide(pageNo,allPage,ap,np);				   
			  	   formHover(tab);   	 			
		  		}		
		  	 }); 
   	    }
   	    function  park_ajax_isFas(park_currentpage,lastPage){
   	    	 $("#tab").find('td').html("");
	  			var park_pageSize = document.getElementById("park_pageSize").value;
	   	    	 $.ajax({	
				  		url:'E.E',
				  		type:'get',
				  		data:{"park_currentpage":park_currentpage ,"park_pageSize":park_pageSize,"lastPage":lastPage },
				  		dataType:'json',
				  		success:function(data){	  					
				  			var da = data.da;
				  			for (i in da) {  	              		                
							    $("#tab").find('tr').eq(i).find(".td_PC").text(da[i].PARKING_CODE);
				                $("#tab").find('tr').eq(i).find(".td_PT").text(da[i].PARKING_TYPE);
				                $("#tab").find('tr').eq(i).find(".td_CN").text(da[i].CAR_NUM);
				                $("#tab").find('tr').eq(i).find(".td_IT").text(da[i].IN_TIME);	    
						   }   
						   var ap = data.ap;
						   var np = data.np; 
						   var pageNo =parseInt(data.pageCurrentpage);
						   var allPage = parseInt(data.allPage);					
	 					   btnIshide(pageNo,allPage,ap,np);		   
				  		}
				 }); 
   	    }  	      	    
   	    function  his_ajax_null(){
   	  		 var currentpage = document.getElementById("currentpage").value;
			 var pageSize = document.getElementById("pageSize").value;	
		  	 $.ajax({	
		  		url:'G.G',
		  		type:'post',
		  		data:{"currentpage":currentpage ,"pageSize":pageSize,"lastPage":false },
		  		dataType:'json',
		  		success:function(data){	
		  			var da = data.da;
		  			for (i=0;i<da.length;i++) {  	              		                
					    $("#tabForm").append("<tr><td class='td_PC'>"+da[i].PARKING_CODE+"</td>"+	
	  				        "<td class='td_PT'>"+da[i].PARKING_TYPE+"</td>"+
	  				        "<td class='td_CN'>"+da[i].CAR_NUM+"</td>"+
	  				        "<td class='td_IT'>"+da[i].IN_TIME+"</td>"+
	  				        "<td class='td_OT'>"+da[i].OUT_TIME+"</td>"+
	  				        "<td class='td_CH'>"+da[i].CHARGE+"</td></tr>")   	  				        	  				        
				    } 
				    var pageNo = data.pageCurrentpage;
				    var allPage = data.allPage;
				    document.getElementById("currentpage").value=pageNo;
				    hisbtnIshide(pageNo,allPage)				    
				    formHover(tabForm);    	
		  		}
		  	 });   
   	    }
   	    function  his_ajax_isFas(currentpage,lastpage){
   	    	 // var currentpage = document.getElementById("currentpage").value;
   	  		 $("#tabForm").find('td').html("");
			 var pageSize = document.getElementById("pageSize").value;
   	    	 $.ajax({	
			  		url:'G.G',
			  		type:'post',
			  		data:{"currentpage":currentpage ,"pageSize":pageSize,"lastPage":lastpage },
			  		dataType:'json',
			  		success:function(data){	  					
			  			var da = data.da;
			  			for (i in da) {  	              		                
						    $("#tabForm").find('tr').eq(i).find(".td_PC").text(da[i].PARKING_CODE);
			                $("#tabForm").find('tr').eq(i).find(".td_PT").text(da[i].PARKING_TYPE);
			                $("#tabForm").find('tr').eq(i).find(".td_CN").text(da[i].CAR_NUM);
			                $("#tabForm").find('tr').eq(i).find(".td_IT").text(da[i].IN_TIME);	
			                $("#tabForm").find('tr').eq(i).find(".td_OT").text(da[i].OUT_TIME);	
			                $("#tabForm").find('tr').eq(i).find(".td_CH").text(da[i].CHARGE);	    
					   }
					    var pageNo = data.pageCurrentpage;
					    var allPage = data.allPage;
					    document.getElementById("currentpage").value=pageNo;
						hisbtnIshide(pageNo,allPage);    
			  		}
			 });	
   	    }  	    
 		/* 改变行数时   */ 
		$(function(){
		/* 正整数 */	
		     $("#park_pageSize").on("change",function(){
				 PSnumChange();
			 })	
			 $("#pageSize").on("change",function(){
				 hisPSnumChange();
			 }) 	
		})
		/* 记录滚动条高度 */	
   		$("#park_pageSize").blur(function(){
   				$(".hdnvalue").val(document.documentElement.scrollTop); 
   		})	
    </script>   
  
	<!-- 	======================   点击上下按钮分页          ======== -->  
    <script type="text/javascript">  
	   	 park_ajax_null();  	
	   	 his_ajax_null(); 	  	  		
  		 $("#park_fir1").on("click",function(){ 	    	
	  	    	//document.getElementById("park_currentpage1").value="";        /* 2017/4/25	 */
	  			var park_currentpage = 1;
	  			park_ajax_isFas(park_currentpage,false);		 
  	     })    
  	     $("#park_pre1").on("click",function(){ 
  	     		//document.getElementById("park_currentpage1").value="";		 /* 2017/4/25	 */		
	  			 var park_currentpage = parseInt($("#park_currentpage").val()-1); 
	  			 park_ajax_isFas(park_currentpage,false);
  	     })	 	    
  	     $("#park_next1").on("click",function(){
  	 			//document.getElementById("park_currentpage1").value="";		 /* 2017/4/25	 */
	  			var park_currentpage = parseInt($("#park_currentpage").val())+1;
	  			park_ajax_isFas(park_currentpage,false);
		 })		
	  	 $("#park_fin1").on("click",function(){ 	
	  		//document.getElementById("park_currentpage1").value="";  			 /* 2017/4/25	 */
	  		var park_currentpage = parseInt($("#park_currentpage").val())+1;		
			park_ajax_isFas(park_currentpage,true);
		 })		
		 $("#park_btn1").on("click",function(){
		  	PCnumChange();	
  		 });		
		 $("#park_refresh").on("click",function(){ 
   	    	var park_currentpage = document.getElementById("park_currentpage").value;
			park_ajax_isFas(park_currentpage,false);
     	 })    	 
     	 $("#his_fir2").on("click",function(){ 	    					
	  	    	//document.getElementById("his_currentpage2").value="";			 /* 2017/4/25	 */
	  			var currentpage = 1;
	  			his_ajax_isFas(currentpage,false);	  		  	
  	     })	     
  	     $("#his_pre2").on("click",function(){				
	  			var currentpage = document.getElementById("currentpage").value-1;
	  			//document.getElementById("his_currentpage2").value="";			 /* 2017/4/25	 */
	  			his_ajax_isFas(currentpage,false)		
  	     })	 	    
  	     $("#his_next2").on("click",function(){							
	  			//document.getElementById("his_currentpage2").value="";			 /* 2017/4/25	 */
	 			var currentpage = parseInt( document.getElementById("currentpage").value)+1;
	  			his_ajax_isFas(currentpage,false)
		 })		
	  	 $("#his_fin2").on("click",function(){ 	
		  	var currentpage = parseInt( document.getElementById("currentpage").value)+1;
		  	his_ajax_isFas(currentpage,true)
		 })		
		 $("#his_btn2").on("click",function(){
		  	hisPCnumChange();		 	
  		 });
		
		 $("#his_refresh1").on("click",function(){ 
			var currentpage = document.getElementById("currentpage").value;
			his_ajax_isFas(currentpage,false); 
     	 })  	    
   console.log("loading end");   
   </script>
   
   
   
   <!-- 2017-4-21  添加脚本 star -->
   <script>       
        $(function() {
	        var E = window.wangEditor
    var editor = new E('#div1')
    editor.create()

    document.getElementById('btn1').addEventListener('click', function () {
        // 读取 html
        alert(editor.txt.html())
    }, false)

    document.getElementById('btn2').addEventListener('click', function () {
        // 读取 text
        alert(editor.txt.text())
    }, false)

            //设置拖拽
     		$("#slide1").draggable({ handle: ".slideDivH"})
            $("#ui").draggable({ handle: ".title" });
    		$("#query").draggable({ handle: ".title" });
    		//初始化CRUD和LOV条件查询
    		$().crudListener();	
    		$().revealListener(); 	 
    		$.fn.beforeInsert = function(){
    			RegExpValidate('^\\w+$','RESP_CODE','regExpError("职责编码格式不符合规范!");');
    			RegExpValidate('^[\u4e00-\u9fa5]{0,}$','RESP_NAME','regExpError("职责名称必须为汉字!");');
    		}
    		$.fn.beforeUpdate = function(){
    		    RegExpValidate('^\\w+$','RESP_CODE','regExpError("职责编码格式不符合规范!");');
    		    RegExpValidate('^[\u4e00-\u9fa5]{0,}$','RESP_NAME','regExpError("职责名称必须为汉字!");');
    		}	
    		$.fn.afterReveal = function(){
    		    $('#START_DATE').val(new Date().format('yyyy-MM-dd hh:mm:ss'));
    		    $('label[for="RESP_CODE"]').click();
    		}
    		$('input[data-datatype="date"]').datetimepicker({
				  lang:"ch",           //语言选择中文
				  timepicker:true,    //启用时间选项
				  format:"Y-m-d H:i:s",      //格式化日期
				  step: 30,
				  showOnClick: true,
				  allowBlank:true
			});
        });
        
        jQuery.json={
        	getContent:function(data,JSONtype){  
        	    if(JSONtype=='table'){
        	        for(i=0;i<(pageMaxRow-pageMinRow+1);i++){
                    	$('.RESP_CODE',$('#tb tr:eq('+(i+1)+')')).html(data.rows[i].RESP_CODE); 
                   	 	$('.RESP_NAME',$('#tb tr:eq('+(i+1)+')')).html(data.rows[i].RESP_NAME); 
                    	$('.DESCRIPTION',$('#tb tr:eq('+(i+1)+')')).html(data.rows[i].DESCRIPTION);
                    	$('.MENU_CODE',$('#tb tr:eq('+(i+1)+')')).html(data.rows[i].MENU_CODE); 
                    	$('.MENU_NAME',$('#tb tr:eq('+(i+1)+')')).html(data.rows[i].MENU_NAME);   
                    	$('.START_DATE',$('#tb tr:eq('+(i+1)+')')).html(data.rows[i].START_DATE);   
                    	$('.END_DATE',$('#tb tr:eq('+(i+1)+')')).html(data.rows[i].END_DATE); 
                    	$('.MENU_ID',$('#tb tr:eq('+(i+1)+')')).html(data.rows[i].MENU_ID); 
                    	$('.RESP_ID',$('#tb tr:eq('+(i+1)+')')).html(data.rows[i].RESP_ID); 
                	}
                	$().crudListener();
                	$().revealListener(); 
        	    }else if(JSONtype=='menu'){
        	        if(pageMaxRow==0&&pageMinRow==0){
        	            console.log('no data');
        	        }else{
        	            for(i=0;i<(pageMaxRow-pageMinRow+1);i++){
       	            	    $('td:eq(0)',$('.contentbox tr:eq('+(i+1)+')')).html(data.rows[i].MENU_ID);  
       	            	    $('td:eq(1)',$('.contentbox tr:eq('+(i+1)+')')).html(data.rows[i].MENU_CODE);     	                    
       	            	    $('td:eq(2)',$('.contentbox tr:eq('+(i+1)+')')).html(data.rows[i].MENU_NAME);
       	            	    $('td:eq(3)',$('.contentbox tr:eq('+(i+1)+')')).html(data.rows[i].DESCRIPTION);       	               	        
       	            	} 
        	        }       	            	    
        	    }else if(JSONtype=='user'){
        	        if(pageMaxRow==0&&pageMinRow==0){
        	            console.log('no data');
        	        }else{
        	            for(i=0;i<(pageMaxRow-pageMinRow+1);i++){
       	            	    $('td:eq(0)',$('.contentbox tr:eq('+(i+1)+')')).html(data.rows[i].USER_ID);       	                    
       	            	    $('td:eq(1)',$('.contentbox tr:eq('+(i+1)+')')).html(data.rows[i].USER_NAME);
       	            	    $('td:eq(2)',$('.contentbox tr:eq('+(i+1)+')')).html(data.rows[i].DESCRIPTION);       	               	        
       	            	} 
        	        }       	            	    
        	    }else if(JSONtype=='resp'){
        	        if(pageMaxRow==0&&pageMinRow==0){
        	            console.log('no data');
        	        }else{
        	            for(i=0;i<(pageMaxRow-pageMinRow+1);i++){
       	            	    $('td:eq(0)',$('.contentbox tr:eq('+(i+1)+')')).html(data.rows[i].RESP_ID);  
       	            	    $('td:eq(1)',$('.contentbox tr:eq('+(i+1)+')')).html(data.rows[i].RESP_CODE);     	                    
       	            	    $('td:eq(2)',$('.contentbox tr:eq('+(i+1)+')')).html(data.rows[i].RESP_NAME);
       	            	    $('td:eq(3)',$('.contentbox tr:eq('+(i+1)+')')).html(data.rows[i].DESCRIPTION);       	               	        
       	            	} 
        	        }       	            	    
        	    }            	   	
       	    },	
       	    getUpdateJSON:function(data){   
       	        $('#RESP_ID').val(data.rows[0].RESP_ID);
       	        $('#RESP_CODE').val(data.rows[0].RESP_CODE);
       	        $('#RESP_NAME').val(data.rows[0].RESP_NAME);
       	        $('#DESCRIPTION').val(data.rows[0].DESCRIPTION);
       	        $('#MENU_ID').val(data.rows[0].MENU_ID);
       	        $('#MENU_NAME').val(data.rows[0].MENU_NAME);
       	        $('#START_DATE').val(data.rows[0].START_DATE);
       	        $('#END_DATE').val(data.rows[0].END_DATE);   	        
       	    },
       	    getMSG:function(data){
       	        pageMinRow=parseInt(data.pageMinRow);
        	    pageMaxRow=parseInt(data.pageMaxRow);
        	    firstPageFlag=data.firstPageFlag;
        	    lastPageFlag=data.lastPageFlag;
        	   	totalPages=data.totalPages;
       	    }
       	}
    </script>
    <script type="text/javascript" src="plugin/layer/layer.js"></script> 
    <script type="text/javascript" src="plugin/js/data.validate.js"></script>
    <script type="text/javascript" src="plugin/js/jQuery.reveal.js"></script> 
    <script type="text/javascript" src="plugin/js/jQuery.page.js"></script>
    <!-- <script type="text/javascript" src="plugin/js/jQuery.lov.js"></script> --> 
    <script type="text/javascript" src="plugin/js/jQuery.crud.js"></script> 
    <script type="text/javascript" src="plugin/js/jQuery.rowdefine.js"></script> 
    <script type="text/javascript" src="plugin/js/jQuery.irr.orderby.js"></script>	 
    <!-- <script type="text/javascript" src="plugin/js/jQuery.irr.init.js"></script>	     -->
   <!-- 2017-4-21  添加脚本 end -->
   <script type="text/javascript" src="plugin/js/wangEditor.min.js"></script>
    
   
   </body>
</html>