$(document).ready(function() {
	
	/** 校验密码 */
	$('input[name=password]').change(function() {
		$("#passwordText").text("");
		checkPwd();
	});
	
	/** 校验手机号 */
	$('input[name=mobile]').change(function() {
		//$("#mobileText").text("");
		var mobile = $("#mobile").val();
		//checkMobile();
		syncheckMobile(mobile,function(data){
			if(!data.success){
				$("#mobileText").text(data.message);
				return false;
			}else{
				$("#mobileText").text("");
				return true;
			}
		});
		
	});
	
	/** 校验再次密码 */
	$('input[name=confirmPwd]').change(function() {
		$("#confirmPwdText").text("");
		checkAgainPassword();
	});
	
	/** 输入验证码 */
	$('input[name=checkCode]').change(function() {
		//$("#checkCodeText").text("");
	});
	//发送验证码
	$("#smsCode2").on("click",function(){
		var _this = $(this);
		if(_this.hasClass('try-disabled')){
			return false;
		}
		if (!checkMobile()){
			return false;
		}
		var mobile = $("#mobile").val();
		syncheckMobile(mobile,function(data){
			if(!data.success){
				$("#mobileText").text(data.message);
			}else{
				getSmsCode(_this,"/register/smsSend.do");
			}
		});
		
	});
	
	//注册
	$("#register_submit").on("click",function(){
		if(checkLoginId() && checkMobile() && smsCheckCode() && checkPwd() && checkAgainPassword() && checkMailAddress() && checkCode()&&checkSufferRecommendNum()){
				var formData = $("#form").serializeArray();
				$.ajax({
					type:'post',
					url: cxt + '/register/submit.do',
					data:formData,
					dataType:'json',
					success:function(data){
						if(data.success){
							location.href = cxt + "/index/pcIndexList.do";
						}else{
							tryModel.alert(data.message);
							//$("#checkboxText").text(data.message);
						}
						
					},
					error:function(result){
						tryModel.alert(data.message);
	                }
				});
			
		}
		
	});
	
});

//获取验证码
/*function getSmsCode(e){
	var mobile = $("#mobile").val();
	var _this = e;
	_this.prop("disabled",true);
	_this.removeAttr('onclick');
	if(checkMobile()){
		$.ajax({
			type:'post',
			url:cxt + '/register/smsSend.do',
			dataType:'json',
			data:{'phone':mobile},
			success:function(data){
				if(data.success){
					
					var count = 60;
					var timer = window.setInterval(function(){
						count--;
						if(count>=0){
							_this.text("剩余"+count+"秒");
						}else{
							//关闭定时器
							window.clearInterval(timer);
							//重新发送
                         _this.text("重新发送");
							//设置按钮可按
                         _this.prop("disabled",false);
                         _this.attr('onclick','getSmsCode($(this))');
						}
					},1000);
				}else{
					$("#mobileText").text(data.message);
				}
			},
			error:function(result){
				
			}
		});
	}
}
*/

//校验登录名格式
function checkLoginId(){
	var loginId = $("#loginId").val();
	var pattern = /^[a-zA-z][a-zA-Z0-9_]{4,16}$/;
	if(!loginId){
		$("#loginIdText").text("用户名不能为空!");
		return false
	}
	if(loginId.length > 16 || loginId.length < 5 || !pattern.test(loginId)){
		$("#loginIdText").text("用户名必须由5~16位字母开头,由数字、字母组成!");
		return false
	}
	
	$("#loginIdText").text("");
	return true;
}

/** 用户名校验 */
function synCheckLoginId(){
	var loginId = $("#loginId").val();
	if(checkLoginId()){
		$.ajax({
			type:'post',
			url:cxt + '/register/checkLoginId.do',
			data:{'loginId':loginId},
			dataType:'json',
			success:function(data){
				if(!data.success){
					$("#loginIdText").text("用户名已存在,请重新输入!");
					return false;
				}else{
					$("#loginIdText").text("");
					return true;
				}
				
			}
		});
		
	}
}



//校验密码格式
function checkPwd(){
	var password = $("#password").val();
	if(!password){
		$("#passwordText").text("密码不能为空!");
		return false
	}
	if(password.length < 6 || password.length > 18){
		$("#passwordText").text("密码长度必须在6~18位之间");
		return false
	}
	if(!regexFunction.regExpPassWord(password)){
		$("#passwordText").text(regexEnum.passWordTips);
		return false
	}
	return true;
}

//校验再次密码
function checkAgainPassword(){
	var confirmPwd = $("#confirmPwd").val();
	var password = $("#password").val();
	if(!confirmPwd){
		$("#confirmPwdText").text("再次密码不能为空!");
		return false
	}
	if(password != confirmPwd){
		$("#confirmPwdText").text("两次输入的密码需一致");
		return false;
	}
	return true;
}



//校验手机号格式
function checkMobile(){
	var mobile = $("#mobile").val();
	//var pattern = /0?(13|14|15|18)[0-9]{9}/;
	var pattern = /^\d+$/;
	if(!mobile){
		$("#mobileText").text("手机号不能为空!");
		return false;
	}
	if(mobile.length!=11){
		$("#mobileText").text("手机号码为11位");
		return false
	}
	if(!pattern.test(mobile)){
		$("#mobileText").text("请输入正确的手机号!");
		return false;
	}
	$("#mobileText").text("");
	return true;
}

//校验验证
function smsCheckCode(){
	var checkCode = $("#smsCode").val();
	if(!checkCode){
		$("#smsCodeText").text("短信验证码不能为空!");
		return false;
	}
	$("#smsCodeText").text("");
	return true;
}

//验证码
function checkCode(){
	var checkCode = $("#checkCode").val();
	if(!checkCode){
		$("#checkCodeText").text("验证码不能为空!");
		return false;
	}
	$("#checkCodeText").text("");
	return true;
}

//校验邮寄地址
function checkMailAddress(){
	var mailAddress = $("#mailAddress").val();
//	if(!mailAddress){
//		$("#mailAddressText").text("邮寄地址不能为空!");
//		return false;
//	}
	if(mailAddress&&mailAddress.length>100){
		$("#mailAddressText").text("邮寄地址不能超过100字!");
		return false;
	}
//	if(mailAddress&&mailAddress.length<5){
//		$("#mailAddressText").text("邮寄地址不能少于5字!");
//		return false;
//	}
	$("#mailAddressText").text("");
	return true;
}
//校验邀请码
function checkSufferRecommendNum(){
	var sufferRecommendNum=$("#sufferRecommendNum").val();
	if(sufferRecommendNum){
		if(sufferRecommendNum.length>10){
			$("#sufferRecommendNumText").text("推荐码不能超过10字!");
			return false;
		}else{
			$("#sufferRecommendNumText").text("");
			return true;
		}
	}
	return true;
}
//校验勾选注册
function isCheckbox(){
	if(!$('#checkbox').is(':checked')) {
		tryModel.alert("请勾选注册协议!");
		return false;
	}
	return true;
}

//后台校验手机号码
function syncheckMobile(mobile,callback){
	$.ajax({
		type:'post',
		url:cxt + '/register/checkMobile.do',
		data:{'mobile':mobile},
		dataType:'json',
		success:function(data){
			
			if(callback){
				callback(data);
			}
			
		}
	});
	
	
}

