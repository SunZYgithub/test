<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>

    
    <!-- 添加框架功能  2017-4-21 star-->
    <!-- <meta http-equiv="content-type" content="text/html;charset=gb2312"> -->
    <link rel="stylesheet" href="plugin/css/font-awesome.min.css">
    <link rel="stylesheet" href="plugin/css/jquery-ui.min.css">
    
    <script type="text/javascript" src="plugin/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="plugin/jQuery/jquery-ui.min.js"></script>  
    
    <!-- vue.js -->
    <script src="https://unpkg.com/vue"></script>
    </head>
    <body>
    <img src="/image/broadcast/test.png">
    <video width="320" height="240" controls>
	  <source src="/image/broadcast/xinyiglass.mp4" type="video/mp4">
	  <source src="movie.ogg" type="video/ogg">
	您的浏览器不支持Video标签。
	</video>
	<div>
	<embed type="application/x-shockwave-flash" class="edui-faked-video" pluginspage="http://www.macromedia.com/go/getflashplayer 

" src="http://www.xinyiglass.com/en/Uploads/201608/57c5582d2023a.mp4 

" width="420" height="280" wmode="transparent" play="true" loop="false" menu="false" allowscriptaccess="never" allowfullscreen="true"/>
      </div>
      <div id="app">
        <p>{{massage}}</p>
      </div>
      
      <div id="app-2">
        <span v-bind:title="massage">鼠标悬停几秒后显示信息</span>
      </div>
      
      <div id="app-3">
        <p v-if="see">显示</p>
      </div>
      
      <div id="app-4">
        <ol>
          <li v-for="todo in todos">
            {{todo.title}}
          </li>
        </ol>  
      </div>
       
      <div id="app-5">
        <p>{{mag}}</p>
        <button v-on:click="reverseMag">reverse</button>
      </div>
      
      <div id="app-6">
        <p>{{message}}</p>
                         请输入：
        <input v-model="message" />
      </div>
      
      <div id="app-7">
        <ol>
          <todo-item v-for="item in groceryList" v-bind:todo="item" v-bind:key="item.id"></todo-item>
        </ol>
      </div>
      
      
      
      
      <script>
        new Vue({
            el:'#app',
            data:{
                massage:'hello vue.js!'
            }
        })
        var app2 = new Vue({
            el:'#app-2',
            data:{
                massage:'页面加载于'+new Date().toLocaleString()
            }
        }) 
        var app3 = new Vue({
            el:'#app-3',
            data:{
                see:true
            }
        })
        var app4 = new Vue({
            el:'#app-4',
            data:{
                todos:[
                 {title:'title1'},
                 {title:'title2'},
                 {title:'title3'},
                 {title:'title4'}
                ]
            }
        })
        var app5 = new Vue({
            el:'#app-5',
            data:{
                mag:'Hello Vue.js!'
            },
            methods:{
                reverseMag:function(){
                    this.mag = this.mag.split('').reverse().join('')
                }
            }
        })
        var app6 = new Vue({
            el:'#app-6',
            data:{
                message:'Hello Vue.js'
            }
        })
        
        //   组件 测试
        Vue.component('todo-item',{
            props:['todo'],
            template:'<li>{{todo.text}}</li>'
        })
        var app7 = new Vue({
            el:'#app-7',
            data:{
                groceryList:[
                    {id:0,text:'蔬菜'},
                    {id:0,text:'水果'},
                    {id:0,text:'奶酪'}
                ]
            }
        })
        
      </script> 
    
    <!-- 
    <style>
       table{display:block;}
       tr{height:30px;line-height:30px;}
       td{height:100%;float:left;margin:10px 5px;}
       .btn button,.btn p{float:left;}
       
       .hide {
          transition: all linear 0.5s;
          background-color: lightblue;
          height: 100px;
          width: 100%;
          position: relative;
          top: 0;
          left: 0;
        }
        
        .ng-hide {
          height: 0;
          width: 0;
          background-color: transparent;
          top:-200px;
          left: 200px;
        }
    </style>
    <script src="http://cdn.static.runoob.com/libs/angular.js/1.4.6/angular.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/angular.js/1.4.6/angular-animate.min.js"></script>
    
    <script src="http://cdn.bootcss.com/angular-ui-bootstrap/0.11.2/ui-bootstrap-tpls.js"></script>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0-beta.2/css/bootstrap-grid.min.css">  
    
    
    <script src="js/require.js" data-main="js/main.js"></script>
    
    
    
  </head>
  
  <body >
    <div ng-app="myApp1">
        <h1>隐藏 DIV: <input type="checkbox" ng-model="myCheck"></h1>
        <div class="hide" ng-hide="myCheck"></div>
    </div>
    
    <div ng-app="myApp" ng-controller="testCtrl"> 
        <table style="background:#dfdfdf;height:600px;">
          <tr>
            <td>PARKING_CODE </td>
            <td>PARKING_TYPE </td>
            <td>CAR_NUM </td>
          </tr>
          <tr ng-repeat="x in datas">
            <td>{{ x.PARKING_CODE }}</td>
            <td>{{ x.PARKING_TYPE }}</td>
            <td>{{ x.CAR_NUM }}</td>
          </tr>
        </table>
         
        <input type="hidden" class="currentpage" value="{{p_current}}"/>
        <input type="hidden" class="pageSize" value="{{p_pernum}}"/>
        <div class="btn" style="width:100%;">
            <button ng-click="first()">首页</button>
            <button ng-click="pre()">上一页</button>
            <p style="color:red;">{{p_current}}</p>
            <button ng-click="next()">下一页</button>
            <button ng-click="fin()">尾页</button>
            <p>总共<span style="color:red;" class="allPage">{{p_all_page}}</span>页</p>
        </div>
    </div>  
    
    <br><br>
    
    <div ng-app="mainApp" ng-controller="testController">
        <p>请输入<input type="number" ng-model="number"/></p>
        <button ng-click="square()">x<sup>2</sup></button>
        <p>结果：{{result}}</p>
    </div>    
    --> 
    <!-- <div ng-app="myApp2"> 
        
        <script type="text/ng-template" id="myModelContent.html">  
        <div class="modal-header">  
            <h3 class="modal-title">模态框</h3>  
        </div>  
        <div class="modal-body">  
            <ul>  
                <li ng-repeat="item in items">  
                <a ng-click="selected.item = item">{{item}}</a>  
                </li>  
                <div class="h2">当前选择： <b>{{selected.item}}</b></div>  
            </ul>  
        </div>  
        <div class="modal-footer">  
            <button class="btn btn-primary" ng-click="ok()">  
            确认  
            </button>  
            <button class="btn btn-warning" ng-click="cancel()">退出</button>  
        </div>  
    </script>  
      
    <div class="container h1">AngularJS 模态对话框</div>  
    <section class="row">  
        <section ng-controller="modalDemo" class="col-md-6"  
            style="margin: 40px auto; float: none; background: #fff; padding: 30px;">  
            <button class="btn btn-default" ng-click="open('lg')">大模态</button>  
            <button class="btn btn-default" ng-click="open()">中模态</button>  
            <button class="btn btn-default" ng-click="open('sm')">小模态</button>  
            <hr>  
            <div class="h1" ng-show="selected">当前选择：{{selected}}</div>  
        </section>  
    </section>  -->
        

    
    <script>
        
       // var myApp1 = angular.module('myApp1', ['ngAnimate']);
       /*  
        angular.module('myApp2', [ 'ui.bootstrap' ])  
	// demo controller  
	.controller('modalDemo', function($scope, $modal, $log) {  
	    // list  
	    $scope.items = [ 'angularjs', 'backbone', 'canjs', 'Ember', 'react' ];  
	    // open click  
	    $scope.open = function(size) {  
	        var modalInstance = $modal.open({  
	            templateUrl : 'myModelContent.html',  
	            controller : 'ModalInstanceCtrl', // specify controller for modal  
	            size : size,  
	            resolve : {  
	                items : function() {  
	                    return $scope.items;  
	                }  
	            }  
	        });  
	        // modal return result  
	        modalInstance.result.then(function(selectedItem) {  
	            $scope.selected = selectedItem;  
	        }, function() {  
	            $log.info('Modal dismissed at: ' + new Date())  
	        });  
	    }  
	})  
	// modal controller  
	.controller('ModalInstanceCtrl', function($scope, $modalInstance, items) {  
	      
	    $scope.items = items;  
	      
	    $scope.selected = {  
	        item : $scope.items[0]  
	    };  
	    // ok click  
	    $scope.ok = function() {  
	        $modalInstance.close($scope.selected.item);  
	    };  
	    // cancel click  
	    $scope.cancel = function() {  
	        $modalInstance.dismiss('cancel');  
	    }  
	});   */

    </script> 
    

  </body>
</html>  