
/**
 * 切换底部图标配置
 * thisId:当前页图标所属ID
*/
function settingBottom(thisId){
	$(thisId).addClass("footer-nav-focus");//选中图标显示为蓝色
	$(thisId).removeAttr("href");//去除点击效果
}

$.common = {};
$.common.defaults = {};

/**手机弹出框*/
(function($){
	var Tips = function(options){
		this.options = $.extend({},$.common.defaults.tips,options);
		this.init(this.options);
	}
	
	Tips.prototype = {
		init:function(options){
			$(document.body).append(this.options.html);
			options.html.css({"max-width":this.options.maxWidth + 'px'});
			options.html.addClass(this.options.className);
			options.html.popup();
		},
		open:function(param){
			this.options.html.find('p').text(param.message);
			this.options.html.popup('open',param.options);
		},
		destroy:function(){
			this.options.html.remove();
		}
	};
	
	$.extend({
		tipsdata : '',
		tips : function(option,param){
			if(!option){
				option = {};
			}
			options = (typeof option == 'object' && option);
			if(!$.tipsdata && options){
				$.tipsdata = new Tips(options);
			}
			if(typeof option == 'string'){
				$.tipsdata[option](param);
			}
		},
		alert : function(message,options){
			$.tips();
			var param = {};
			param.message = message;
			param.options = options ? options : {};
			$.tips('open',param);
		}
	});

	$.common.defaults.tips = {
		html:$('<div data-role="popup" id="message"><p></p></div>'),
		className:'ui-content alert',
		maxWidth:640
	};
})(window.jQuery);


//显示加载器  
function beforeSend(XMLHttpRequest){
	  $.mobile.loading('show', {  
	        text: '加载中...', //加载器中显示的文字  
	        textVisible: true, //是否显示文字  
	        theme: 'b',        //加载器主题样式a-e  
	        textonly: false,   //是否只显示文字  
	        html: ""           //要显示的html内容，如图片等  
	    });
	  
}
//隐藏加载器  
function complete(XMLHttpRequest, textStatus){
  $.mobile.loading('hide');  
}

/**
 * 格式化函数
 * 12345格式化为12,345.00
 * 12345.6格式化为12,345.60 
 * @param money:金额
 */ 
function FormatMoney(money) {
    if (/[^0-9\.]/.test(money)) return '0.00';
    money = money.replace(/^(\d*)$/, "$1.");
    money = (money + "00").replace(/(\d*\.\d\d)\d*/, "$1");
    money = money.replace(".", ",");
    var re = /(\d)(\d{3},)/;
    while (re.test(money)) {
        money = money.replace(re, "$1,$2");
    }
    money = money.replace(/,(\d\d)$/, ".$1");
    return '' + money.replace(/^\./, "0.");
}


//去掉前后空格 
function trim(str) {
  var strnew = str.replace(/^\s*|\s*$/g, "");  
  return strnew;  
}
	

//验证码刷新
function changeImg(obj){
	var imgHeight = 96;
    var imgWidth = 34;
	var codeLen  = 4;
	$("#"+obj.id).attr("src",cxt + "/login/getCode.do?"+Math.random()+"&imgHeight="+imgHeight+"&imgWidth="+imgWidth+"&codeLen="+codeLen);
}


//浏览器清除session
function androidCheckOut(){
	$.post(cxt + '/login/webLogOut.do',function(data){
		ybDialog.alert("执行清除 session");
		if(data.success){
			eventListener.logout();
		}else{
			ybDialog.alert(data.message);
		}
	});
	
}

$(function(){
	//现在所有type=number 不能输入其他文字
	$('input[type=number]').keypress(function(e) {
		if (!String.fromCharCode(e.keyCode).match(/[0-9\.]/)) {
			return false;
		}
	});	
	
	$("body").on("tap","a.auth",function(){
		ybDialog.close();
		location.href = $(this).attr('url');
		return false;
	});
	
	
});





/**
 * 校验用户状态信息
 * @param callback
 */
var TryAuthStatus = {
		isAuth:function (callback){
			$.post(cxt + '/myView/isAuthWeb.do',function(data){
				if(data.success){
					var auth =  data.auth;
					var flag = true;
					var myRealAuth = cxt + "/myView/realAuth.do";
					var myBankCard = cxt + "/myView/card.do";
					var mySet =  cxt + "/myView/passwordUpdate.do";
					
					if(!auth[appConstants.real_auth]){
						flag = false;
						ybDialog.alert("您还没有进行实名认证! <a class='auth' href='javascript:void(0);' url="+myRealAuth+">去实名 </a>");
					}else if(!auth[appConstants.bind_bankinfo]){
						flag = false;
						ybDialog.alert("您还没有绑定银行卡! <a class='auth' href='javascript:void(0);' url="+myBankCard+">去绑定 </a>");
					}else if(!auth[appConstants.paypwd_unset]){
						flag = false;
						ybDialog.alert("您还没有设置支付密码! <a class='auth' href='javascript:void(0);' url="+mySet+">去设置 </a>");
					}
					
					if(callback){
						callback(flag,data.auth);
					}
				}else{
					ybDialog.alert("获取用户状态失败");
				}
			},"json");
			
		}
		
		
}
