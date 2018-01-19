$(function(){
	
	$('input[name=email]').change(function() {
		checkEmail();
		var email = $("#email").val();
		$.ajax({
			type:'post',
			url:cxt + '/sendEmail/checkEmailOnly.do',
			data:{'email':trim(email)},
			dataType:'json',
			success:function(data){
				if(!data.success){
					$("#emailText").text(data.message);
					return false;
				}else{
					return true;
				}
			}
		});
	});
	//发送验证码
	$("#smsCode").on("click",function(){
		if($(this).hasClass('try-disabled')){
			return false;
		}
		var mobile = $("#mobile").val();
		if (!mobile){
			return;
		}
		getSmsCode($(this),"/sms/sendVerifyCode.do","email");
	})
	//确定
	$("#submit").on("click",function(){
		if(checkCode()&&checkEmail()){
				var formData = $("#form").serializeArray();
				$.ajax({
					type:'post',
					url: cxt + '/sendEmail/sendEmail.do',
					data:formData,
					dataType:'json',
					success:function(data){
						if(data.success){
							tryModel.alert("邮件已发送成功,请注意查收!",function(){
								$(".my_account").trigger("click");
							});
						}else{
							$("#emailText").text(data.message);
						}
						
					},
					error:function(result){
						tryModel.alert("服务器异常!");
	                }
				});
			
		}
		
	});	
});


//校验验证
function checkEmail(){
	var email = $("#email").val();
	var pattern = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
	
	if(!email){
		$("#emailText").text("邮箱不能为空!");
		return false;
	}
	if(!pattern.test(email)){
		$("#emailText").text("邮箱格式不正确,请重新输入");
		return false
	}
	$("#emailText").text("");
	return true;
}
//获取验证码
/*function getSmsCode(e){
	 //拿到
	var mobile = $("#mobile").val();
	if (!mobile){
		return;
	}
	var _this = e;
	_this.prop("disabled",true);
	 _this.removeAttr("onclick");
	var wait=60;
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
				 _this.prop("disabled",false);
                 _this.attr('onclick','getSmsCode($(this))');
				tryModel.alert(data.message);
			}
		}
	})
   
}*/
//校验验证码
function checkCode(){
	var verifyCode=$('input[name=checkCode]').val();
	console.log(verifyCode);
	if(!verifyCode){
		$("#checkCodeText").text("验证码不能为空!");
		return false;
	}
	$("#checkCodeText").text("");
	return true;
}