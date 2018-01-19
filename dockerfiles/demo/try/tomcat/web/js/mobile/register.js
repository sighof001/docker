$(function(){
	/** 用户名校验 */
	$('input[name=loginId]').change(function() {
		checkLoginId();
		var loginId = $("#loginId").val();
		$.ajax({
			type:'post',
			url:cxt + '/register/checkLoginId.do',
			data:{'loginId':trim(loginId)},
			dataType:'json',
			success:function(data){
				if(!data.success){
					$("#desc").show();
					$("#desc label").text("用户名已存在,请重新输入!");
					return false;
				}else{
					return true;
				}
				
			}
		});
	});
	
	/** 校验密码 */
	$('input[name=password]').change(function() {
		checkPwd();
	});
	
	/** 校验手机号 */
	$('input[name=mobile]').change(function() {
		var mobile = $("#mobile").val();
		checkMobile();
		$.ajax({
			type:'post',
			url:cxt + '/register/checkMobile.do',
			data:{'mobile':trim(mobile)},
			dataType:'json',
			success:function(data){
				if(!data.success){
					$("#desc").show();
					$("#desc label").text("此手机号已存在,请重新输入!");
					return false;
				}else{
					return true;
				}
				
			}
		});
	});
	
	/** 校验再次密码 */
	$('input[name=confirmPwd]').change(function() {
		checkAgainPassword();
	});
	
	//输入时,错误提示隐藏
	$("input").on('input',function(e){  
		$("#desc").hide();
		$("#desc label").text("");
	});  
	
	//注册
	$(".btn-submit2").on("click",function(){
		if(checkLoginId() && checkMobile() && checkSmsCode() && checkPwd() && checkAgainPassword() && checkMailAddress() && checkCode()&&checkSufferRecommendNum() ){
				var formData = $("#form").serializeArray();
				$.ajax({
					type:'post',
					url: cxt + '/register/submit.do',
					data:formData,
					dataType:'json',
					success:function(data){
						if(data.success){
							location.href = cxt + "/index/indexList.do";
						}else{
							$("#desc").show();
							$("#desc label").text(data.message);
						}
						
					},
					error:function(result){
						$("#desc").show();
						$("#desc label").text("服务器异常!");
	                }
				});
			
		}
		
	});
	
	
	//发送验证码
	$('.getvalid').on("click",function(){
		var mobile = $("#mobile").val();
		var _this = $(this);
		if(checkMobile()){
			_this.prop("disabled",true);
			$.ajax({
				type:'post',
				url:cxt + '/register/smsSend.do',
				dataType:'json',
				data:{'phoneNumber':mobile,"type":"register"},
				success:function(data){
					if(data.success){
						var count = 60;
						var timer = window.setInterval(function(){
							count--;
							if(count>=0){
								_this.text(count+"秒");
							}else{
								//关闭定时器
								window.clearInterval(timer);
								//重新发送
	                         _this.text("重新发送");
								//设置按钮可按
	                         _this.prop("disabled",false);
							}
						},1000);
					}else{
						$("#desc").show();
						$("#desc label").text(data.message);
						_this.prop("disabled",false);
					}
				},
				error:function(result){
					
				}
			});
		}
		
		
	});
	
	
});


//校验登录名格式
function checkLoginId(){
	var loginId = $("#loginId").val();
	var pattern = /^[a-zA-z][a-zA-Z0-9_]{4,16}$/;
	if(!loginId){
		$("#desc").show();
		$("#desc label").text("用户名不能为空!");
		return false
	}
	if(loginId.length > 16 || loginId.length < 5 || !pattern.test(loginId)){
		$("#desc").show();
		$("#desc label").text("用户名必须由5~16位字母开头,由数字、字母组成!");
		return false
	}
	return true;
}



//校验密码格式
function checkPwd(){
	var password = $("#password").val();
	var pattern = /^[a-zA-Z]\w{5,17}$/;
	if(!password){
		$("#desc").show();
		$("#desc label").text("密码不能为空!");
		return false
	}
	if(password.length < 6 || password.length > 18){
		$("#desc").show();
		$("#desc label").text("密码以长度必须在6~18位之间");
		return false
	}
	if(!pattern.test(password)){
		$("#desc").show();
		$("#desc label").text("密码以字母开头,只能包含字符、数字和下划线!");
		return false
	}
	return true;
}

//校验再次密码
function checkAgainPassword(){
	var confirmPwd = $("#confirmPwd").val();
	var password = $("#password").val();
	var pattern = /^[a-zA-Z]\w{5,17}$/;
	if(!confirmPwd){
		$("#desc").show();
		$("#desc label").text("再次密码不能为空!");
		return false
	}
	if(confirmPwd.length < 6 || confirmPwd.length > 18){
		$("#desc").show();
		$("#desc label").text("再次密码以长度必须在6~18位之间");
		return false
	}
	if(!pattern.test(confirmPwd)){
		$("#desc").show();
		$("#desc label").text("再次密码以字母开头,只能包含字符、数字和下划线!");
		return false
	}
	
	if(password != confirmPwd){
		$("#desc").show();
		$("#desc label").text("两次密码需一致");
		return false;
	}
	return true;
}



//校验手机号格式
function checkMobile(){
	var mobile = $("#mobile").val();
	//var pattern = /0?(13|14|15|18)[0-9]{9}/;
	var pattern =/^\d+$/;
	if(!mobile){
		$("#desc").show();
		$("#desc label").text("手机号不能为空!");
		return false;
	}
	if(mobile.length!=11){
		$("#desc").show();
		$("#desc label").text("手机号码为11位");
		return false
	}
	if(!pattern.test(mobile)){
		$("#desc").show();
		$("#desc label").text("请输入正确的手机号!");
		return false;
	}
	return true;
}

//校验验证
function checkCode(){
	var checkCode = $("#checkCode").val();
	if(!checkCode){
		$("#desc").show();
		$("#desc label").text("验证码不能为空!");
		return false;
	}
	return true;
}

function checkSmsCode(){
	var smsCodeInp = $("#smsCode").val();
	if(!smsCodeInp){
		$("#desc").show();
		$("#desc label").text("短信验证码不能为空!");
		return false;
	}
	return true;
}

//校验邮寄地址
function checkMailAddress(){
	var mailAddress = $("#mailAddress").val();
//	if(!mailAddress){
//		$("#desc").show();
//		$("#desc label").text("邮寄地址不能为空!");
//		return false;
//	}
	if(mailAddress&&mailAddress.length>100){
		$("#desc").show();
		$("#desc label").text("邮寄地址不能超过100字!");
		return false;
	}
//	if(mailAddress&&mailAddress.length<5){
//		$("#desc").show();
//		$("#desc label").text("邮寄地址不能少于5字!");
//		return false;
//	}
	$("#desc").hide();
	$("#desc label").text("");
	return true;
}
//校验邀请码
function checkSufferRecommendNum(){
	var sufferRecommendNum=$("#sufferRecommendNum").val();
	if(sufferRecommendNum){
		if(sufferRecommendNum.length>10){
			$("#desc").show();
			$("#desc label").text("推荐码不能超过10字!");
			return false;
		}else{
			$("#desc").hide();
			$("#desc label").text("");
			return true;
		}
	}
	return true;
}
