/**
 *   myApp
 */

 
        var app = angular.module('myApp', []);
        app.controller('testCtrl', function($scope,$http) {
        
            $scope.count = 0;  
            $scope.p_pernum = 6;     // 每页显示行数
            $scope.p_current = 1;  
            $scope.p_all_page =0;  
            
            var get = function(page,size,callback){ 
                callback(); 
                $http(
                 {
                    url:'E.E',       // URL路径
                    type:'post',
                    dataType:'json',
                    params:{"park_currentpage":page,"park_pageSize":size,"lastPage":false }
                } 
                ) 
                .then(function (result) {
                    $scope.datas = result.data.da;
                    $scope.p_all_page = result.data.allPage;
                });
            } 
            
            get($scope.p_current,$scope.p_pernum,function(){  
                alert("第一次加载");  
            }); 
            $scope.load_page = function(page){  
                get(page,$scope.p_pernum,function(){ });  
            };
            $scope.first=function(){
                $('.currentpage').val(1);
                $scope.load_page(1);
                $scope.p_current = 1;  
            };
            $scope.pre=function(){
                if($('.currentpage').val()-1<=1){
                    $('.currentpage').val(1);
                    $scope.p_current = 1;
                    $scope.load_page(1);
                }else{
                    $('.currentpage').val(parseInt($('.currentpage').val())-1);
                    $scope.load_page(parseInt($('.currentpage').val()));
                    $scope.p_current = parseInt($('.currentpage').val());
                }
                  
            };
            $scope.next=function(){
                if($('.currentpage').val()+1>=$('.allPage').text()){
                    $('.currentpage').val($('.allPage').text());
                    $scope.load_page($('.allPage').text());
                    $scope.p_current = parseInt($('.allPage').text()); 
                }else{
                    $('.currentpage').val(parseInt($('.currentpage').val())+1);
                    $scope.load_page(parseInt($('.currentpage').val()));
                    $scope.p_current = parseInt($('.currentpage').val()); 
                }
            };
            $scope.fin=function(){
                $('.currentpage').val($scope.p_all_page);
                $scope.load_page($scope.p_all_page);
                $scope.p_current = $scope.p_all_page;
            };
            
        });