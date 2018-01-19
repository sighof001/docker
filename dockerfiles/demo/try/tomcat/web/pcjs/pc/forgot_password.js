$(document).ready(function() {
	//发送验证码
	$("#smsCode2").on("click",function(){
		var account = $("#account").val();
		var _this = $(this);
		var paramType = $("#paramType").val();
		if(_this.hasClass('try-disabled')){
			return false;
		}
		
		if("0" == paramType){
			var data = {'phoneNumber':account};
			getSendCode(_this,"/login/smsSend.do",data);//手机短信验证码
		}else if("1" == paramType){
			var data = {'email':account};
			getSendCode(_this,"/sms/sendVerifyByEmail.do",data);//邮件验证码
		}
		
		
	});
	if($("#smsCode2").length > 0){
		$("#smsCode").unbind("change").bind("change",function(){
			var val = $(this).val();
			if(val != null || val != ""){
				$("#smsCodeText").text("");
			}
		});
	}
	
	//next 下一步
	$("#submit_for").on("click",function(){
		if(checkLoginId() && checkCode()){
			var formData = $("#form").serializeArray();
			$.ajax({
				type:'post',
				url:cxt +'/login/pcCheckAccount.do',
				data:formData,
				dataType:'json',
				success:function(data){
					if(data.success){
						location.href = cxt + "/login/pcForgotPasswordSecurity/"+data.custInfo.mobile+".do?paramType="+data.paramType;
					}else{
						tryModel.alert(data.message);
					}
				},
				error:function(result){
					tryModel.alert("服务器异常!");
				}
			});
			
			
		}
	});
	
	
	//安全验证 下一步
	$("#submit_sec").on("click",function(){ 
		if(checkSmsCode()){
			var formData = $("#form").serializeArray();
			$.ajax({
				type:'post',
				url:cxt +'/login/pcCheckSecurity.do',
				data:formData,
				dataType:'json',
				success:function(data){
					if(data.success){
						$('#form').submit();
					}else{
						tryModel.alert(data.message);
					}
				},
				error:function(result){
					tryModel.alert("服务器异常!");
				}
			});
		}
	});
	
	//找回 下一步
	$("#submit_res").on("click",function(){ 
		$("#passwordText").text("");
		$("#confirmPwdText").text("");
		if(checkPwd() && checkAgainPassword()){
			var formData = $("#form").serializeArray();
			$.ajax({
				type:'post',
				url:cxt +'/login/pcResetPassword.do',
				data:formData,
				dataType:'json',
				success:function(data){
					if(data.success){
						tryModel.alert("修改成功");
						location.href = cxt + '/index/pcIndexList.do';
					}else{
						tryModel.alert(data.message);
					}
				},
				error:function(result){
					tryModel.alert("服务器异常!");
				}
			});
		}
	});
	
	
	
});


function checkLoginId(){
	var loginId = $("#account").val();
	
	if(!loginId){
		$("#accountText").text("账号不能为空!");
		return false;
	}
	return true;
	
}


function checkCode(){
	var checkCode = $("#checkCode").val();
	if(!checkCode){
		$("#checkCodeText").text("验证码不能为空!");
		return false;
	}
	return true;
}


function checkSmsCode(){
	var code = $("#code").val();
	if(!code){
		tryModel.alert("验证码不能为空!");
		return false;
	}
	return true;
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
		$("#confirmPwdText").text("两次输入密码需一致");
		return false;
	}
	return true;
}
function getSendCode(e,url2,data){
	//var _this = e;
	 e.prop("disabled",true);
	 e.addClass('try-disabled');
	// _this.removeAttr('onclick');
	 
	var wait=60;
	$.ajax({
        type:'POST',
        dataType:'JSON',
		data:data,
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

//验证码刷新
function changeImg(obj){
	var imgHeight = 96;
    var imgWidth = 34;
	var codeLen  = 4;
	
	$("#"+obj.id).attr("src",cxt + "/login/getCode.do?"+Math.random()+"&imgHeight="+imgHeight+"&imgWidth="+imgWidth+"&codeLen="+codeLen);
}
