﻿/*********************************************************
            
			        正则式验证数据
                      Author:Bird
				 Creation Date:2016.12.29
				 Last Updated By:Bird
*********************************************************/

/*********************************************************
							修改日志
		2016.12.29 创建js文件,初始程序逻辑运行成功

*********************************************************/

/****正则表达式 数据验证****/
function RegExpValidate(regExp,data,func){
	var reg = new RegExp(regExp);  
	var obj = document.getElementById(data);
	if(obj.value){
		if(!reg.test(obj.value)){
	        if(func){
	        	eval(func);
			}else{	
				console.log('缺失回调函数');
			}
		}
	}	
}

/****默认回调函数****/
function regExpError(msg){
	if(layer){
		layer.alert(msg,{title:'警告',offset:[150]});
	}else{
	    alert(msg);	
	}
	throw new error('数据正则验证失败');
}


/****验证是否为纯数字****/
//  ^[0-9]*$

/****验证是否为非零正整数****/
//  ^\\+?[1-9][0-9]*$

/****验证是否为X个数字****/
//  ^\\d{x}$ 

/****验证至少为X个数字****/
//  ^\\d{x,}$ 

/****验证小数点后至多有一位数的正实数****/
//  ^[0-9]+(.[0-9]{2})?$

/****验证密码格式是否正确****/
//首位必须是字母，最少六位，最多十五位字符
//  ^[a-zA-Z]\\w{5,14}$

/****验证汉字****/
//  ^[\u4e00-\u9fa5]{0,}$ 

/****验证url****/
//  [a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?