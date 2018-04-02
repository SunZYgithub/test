/**
 *   mainApp
 */
        var mainApp = angular.module('mainApp',[]);
        mainApp.value('defaultInput',5);
        mainApp.factory('MathService',function(){
            var factory = {};
            factory.multiply = function(a,b){
                return a*b;
            }
            return factory;
        })
        
        mainApp.service('CalcService',function(MathService){
            this.square = function(a){
                return MathService.multiply(a,a);
            }
        })
        
        mainApp.controller('testController', function($scope, CalcService, defaultInput) {
            $scope.number = defaultInput;
            $scope.result = CalcService.square($scope.number);
            
            $scope.square = function(){
                $scope.result = CalcService.square($scope.number);
            }
            
        })