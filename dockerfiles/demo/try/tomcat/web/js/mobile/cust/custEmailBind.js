$(function(){
	//发送验证码
	$('.getvalid').on("click",function(){
		var mobile = $("#mobile").val();
		var _this = $(this);
		if(mobile){
			_this.prop("disabled",true);
			$.ajax({
				type:'post',
				url:cxt + '/sms/sendVerifyCode.do',
				dataType:'json',
				data:{'phoneNumber':mobile,"type":"email"},
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
					$("#desc").show();
					$("#desc label").text(data.message);
					return false;
				}else{
					return true;
				}
			}
		});
	});
	
	//输入时,错误提示隐藏
	$("input").on('input',function(e){  
		$("#desc").hide();
		$("#desc label").text("");
	});  
	
	//确定
	$(".btn-submit2").on("click",function(){
		var email = $("#email").val();
		if(!email){
			$("#desc").show();
			$("#desc label").text("邮箱不能为空!");
			return;
		}
		if(checkSmsCode()&&checkEmail()){
				var formData = $("#form").serializeArray();
				$.ajax({
					type:'post',
					url: cxt + '/sendEmail/sendEmail.do',
					data:formData,
					dataType:'json',
					beforeSend:beforeSend,
					success:function(data){
						if(data.success){
							location.href = cxt + "/myAccountPwd/updateEmailSuccess.do";
						}else{
							$("#desc").show();
							$("#desc label").text(data.message);
						}
						
					},
					error:function(result){
						$("#desc").show();
						$("#desc label").text("服务器异常!");
	                },
	                complete:complete
				});
			
		}
		
	});	
});


//去掉前后空格 
function trim(str) {
    var strnew = str.replace(/^\s*|\s*$/g, "");  
    return strnew;  
}

//校验验证
function checkEmail(){
	var email = $("#email").val();
	var pattern = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
	
	if(!email){
		$("#desc").show();
		$("#desc label").text("邮箱不能为空!");
		return false;
	}
	if(!pattern.test(email)){
		$("#desc").show();
		$("#desc label").text("邮箱格式不正确,请重新输入");
		return false
	}
	return true;
}

function checkSmsCode(){
	var smsCodeInp = $("#checkCode").val();
	if(!smsCodeInp){
		$("#desc").show();
		$("#desc label").text("短信验证码不能为空!");
		return false;
	}
	return true;
}