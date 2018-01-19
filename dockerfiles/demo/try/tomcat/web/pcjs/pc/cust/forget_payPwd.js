$(function() {
	//发送验证码
	$("#smsCode").on("click",function(){
		if($(this).hasClass('try-disabled')){
			return false;
		}
		var mobile = $("#mobile").val();
		if (!mobile){
			return;
		}
		getSmsCode($(this),"/sms/sendVerifyCode.do","payPwd");
	})
	$("#payPassword").focus(function(){
		$("#payPasswordText").text("");
	}).blur(function(){
		checkPwd()
	});
	$("#rePayPassword").focus(function(){
		$("#rePayPasswordText").text("");
	}).blur(function(){
		checkPwdAgain();
	});
	// 提交
	$("#submit").on("click", function() {
		if (checkCode()&&checkPwd()&&checkPwdAgain()) {
			var formData = $("#form").serializeArray();
			$.ajax({
				type : 'post',
				url : cxt + '/myAccountPwd/forgetPwdSubmit.do',
				data : formData,
				dataType : 'json',
				success : function(data) {
					if (data.success) {
						tryModel.alert("修改成功",function(){
							$(".my_account").trigger("click");
						});
					} else {
						tryModel.alert(data.message);
					}
				},
				error : function(result) {
					tryModel.alert("服务器异常!");
				}
			});
		}

	});
	
	
});
	
	
//校验验证码
function checkCode(){
	var verifyCode=$('input[name=smsCode]').val();
	if(!verifyCode){
		$("#checkCodeText").text("验证码必填!");
		return false;
	}
	$("#checkCodeText").text("");
	return true;
}
//获取验证码
/*function getSmsCode(e){
	 //拿到
    var mobile = $("#mobile").val();
	var _this = e;
	_this.prop("disabled",true);
	 _this.removeAttr("onclick");
	var wait=60;
	if (mobile){
	$.ajax({
        type:'POST',
        dataType:'JSON',
		data:{'phoneNumber':mobile},
		url:cxt + '/sms/sendVerifyCode.do',
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
					},1000)
			}else{
				tryModel.alert(data.message);
			}
		}
	})
    }else {
    	tryModel.alert("服务器异常");
	}
}*/
//校验密码
function checkPwd(){
	var payPassword = $("#payPassword").val();
	if(!payPassword){
		$("#payPasswordText").text("支付密码不能为空!");
		return false
	}
	if(payPassword.length != 6){
		$("#payPasswordText").text("支付密码为6位数字");
		return false
	}
	if(!regexFunction.regExpPayPass(payPassword)){
		$("#payPasswordText").text(regexEnum.payPassTips);
		return false
	}
	$("#payPasswordText").text("");
	return true;
}
//校验确认密码
function checkPwdAgain(){
	var payPassword = $("#payPassword").val();
	var rePayPassword = $("#rePayPassword").val();
	if(!rePayPassword){
		$("#rePayPasswordText").text("确认支付密码不能为空!");
		return false
	}
	if(payPassword!=rePayPassword){
		$("#rePayPasswordText").text("两次密码不一致!");
		return false
	}
	$("#rePayPasswordText").text("");
	return true;
}