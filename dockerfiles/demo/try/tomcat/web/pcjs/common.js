/*******选项卡start***/
var tab=function(tab_content,tab_item,tbaNavUl,tabNavOn){

	$(tab_content).find(tab_item).eq(0).show().siblings().hide();

	var index=0;

	$(tbaNavUl).children("li").click(function(){

		index=$(tbaNavUl).children("li").index(this);

		$(this).addClass(tabNavOn).siblings().removeClass(tabNavOn);

		$(tab_content).find(tab_item).eq(index).show().siblings().hide();

		})	

	}
/*******选项卡end***/

/*******返回到顶部start********/

$('#top-back').hide()
$(window).scroll(function(){
	 if($(this).scrollTop() > 350){
		$("#top-back").fadeIn();
	 }
	 else{
		$("#top-back").fadeOut();
	 }
  })	
//置顶事件
function topBack(){
  $('body,html').animate({scrollTop:0},300);
}

/*******返回到顶部end********/
$(function(){
	$('body').on("click","a.login, area.login",function(){
		var $this = $(this);
		$.post(cxt + '/login/checkLogin.do',function(data){
			if(data.success){
				location.href = $this.attr('href');
			}else{
				$("#gologin").modal("show");
			}
		},"json");
		
		return false;
	});
	$('body').on("click","a.try-disabled",function(){

		
		return false;
	});
	
	//现在所有type=number 不能输入其他文字
	$('input[type=number]').keypress(function(e) {
		var arr = [48,49,50,51,52,53,54,55,56,57,37,38,39,40,8,9,13,0,46];
		var flag = false;
		for(var i in arr){
			if(arr[i] == e.which){
				flag = true;
				break;
			}
		}
		if(!flag){
			return false;
		}
	});
	
	//监听充值与体现
	$("body").on("click","a.auth-status-btn",function(){
		var $this = $(this);
		AuthStatus.isAuth(function(flag){
			if(flag){
				location.href = $this.attr('href');
			}
		});
		
		return false;
		
	});
	
	submitGroup();
});


var tabView = {
		indexTabView: 0,		//网站首页
		productsTabView: 1,		//委托投资
		locanTabView: 2,		//贷款申请
		commonwealTabView: 3,	//公益金融
		newsTabView: 4,			//财富学堂
		safetyTabView: 5,		//安全保障
		downloadTabView: 6 		//下载App
}
	

/**定位导航栏   index:页面下标 */
function locationIndex(index) {
	var li = $("#menu li");
	li.eq(index).addClass("active");
}

var goodsTypeNormal = 0;//产品类型:普通产品
var goodsTypeFp = 1;//产品类型:扶贫产品
var goodsTerm = 0;//期限为0天-活期跟扶贫产品

/** 判断是否为扶贫产品*/
function isProductFp(type){
	if(type == goodsTypeFp){
		return true;
	}
	return false;
}
/** 判断是否为活期产品*/
function isProductCurrent(type,term){
	if(type == goodsTypeNormal&&term == goodsTerm){
		return true;
	}
	return false;
}

function submitGroup(){
	var wrap = $('.submit-group-wrap');
	wrap.each(function(){
		var inputs = $(this).find('.submit-group');
		submitOneGroup(inputs) ;
	});
}

/**
 * 一个表格的一组input,最后一个为提交按钮
 * @param inputs
 */
function submitOneGroup(inputs){
	inputs.each(function(i){
		$(this).keypress(function(e){
			if(e.which != 13){
				return true;
			}
			
			if(i == inputs.size() - 2){
				inputs.get(i + 1).click();
				return false;
			}
			
			inputs.get(i + 1).focus();
			return false;
		});
		
	});
}


/**
 * 校验用户状态信息
 * @param callback
 */
var AuthStatus = {
		isAuth:function (callback){
			$.post(cxt + '/myView/isAuthWeb.do',function(data){
				if(data.success){
					var auth =  data.auth;
					var flag = true;
					var myRealAuth = cxt + "/myView/pcMyAssetView.do?menuId=myRealAuth";
					var myBankCard = cxt + "/myView/pcMyAssetView.do?menuId=myBankCard";
					var mySet =  cxt + "/myView/pcMyAssetView.do?menuId=mySet";
					
					if(!auth[appConstants.real_auth]){
						flag = false;
						tryModel.alert("您还没有进行实名认证! <a href="+myRealAuth+">去实名 </a>");
					}else if(!auth[appConstants.bind_bankinfo]){
						flag = false;
						tryModel.alert("您还没有绑定银行卡! <a href="+myBankCard+">去绑定 </a>");
					}else if(!auth[appConstants.paypwd_unset]){
						flag = false;
						tryModel.alert("您还没有设置支付密码! <a href="+mySet+">去设置 </a>");
					}
					
					if(callback){
						callback(flag,data.auth);
					}
				}else{
					tryModel.alert("获取用户状态失败");
				}
			},"json");
			
		}
		
		
}
	
/**
 * 短信验证码
 */
function getSmsCode(e,url2,type){
	
	var mobile = $("#mobile").val();
	//var _this = e;
	 e.prop("disabled",true);
	 e.addClass('try-disabled');
	// _this.removeAttr('onclick');
	 
	var wait=60;
	$.ajax({
        type:'POST',
        dataType:'JSON',
		data:{'phoneNumber':mobile,"type":type},
		url:cxt + url2,
		success:function(data){
			if(data.success){
					var count = 60;
					var timer = window.setInterval(function(){
						count--;
						if(count>=0){
							e.text("剩余"+count+"秒");
						}else{
							//关闭定时器
							window.clearInterval(timer);
							//重新发送
                         e.text("重新发送");
							//设置按钮可按
                         e.prop("disabled",false);
                    	 e.removeClass('try-disabled');
                         //_this.attr('onclick','getSmsCode($(this))');
						}
					},1000)
					$("#mobileText").text("");
					if($("#smsCodeText").length > 0){ 
						$("#smsCodeText").text("");
					}
			}else{
				//设置按钮可按
				e.prop("disabled",false);
              //  _this.attr('onclick','getSmsCode($(this),url2)');
				$("#mobileText").text(data.message);
				if($("#smsCodeText").length > 0){ 
					$("#smsCodeText").text(data.message);
				}
			}
		}
	})
}
	

