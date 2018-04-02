/**
 *   main.js
 */
    require.config({
        paths : {
           
            "mainApp" : "mainApp"   ,
            "myApp":"myApp"
        }
    });

    require(["mainApp","myApp"], function(){
    	//  因为angular 只默认加载一个模块  ，所有需要  手动 加载  除默认模块外 其它的  模块  
        angular.bootstrap(document.querySelector('[ng-app="myApp"]'), ['myApp']);
        angular.bootstrap(document.querySelector('[ng-app="mainApp"]'), ['mainApp']); 
        
    });
    
    