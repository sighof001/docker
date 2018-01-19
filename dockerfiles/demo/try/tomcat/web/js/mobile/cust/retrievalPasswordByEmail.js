$(function(){
	$('input[name=email]').change(function() {
		checkEmail();
	});
	/*$('input[name=verifyCode]').change(function() {
		checkCode();
	});*/
	$('input[name=password]').change(function() {
		checkPwd();
	});
	$('input[name=confirmPwd]').change(function() {
		checkAgainPassword();
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
			$("#desc label").text("邮箱不正确,请重新输入!");
			return;
		}
		if(checkCode()&&checkPwd()&&checkAgainPassword()){
				var formData = $("#form").serializeArray();
				$.ajax({
					type:'post',
					url: cxt + '/login/submitByEmail.do',
					data:formData,
					dataType:'json',
					success:function(data){
						if(data.success){
							location.href = cxt + "/myAccountPwd/passwordUpdateSuccess.do";
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
	
	
	//获取验证码
	$('.getvalid').on("click",function(){
        var email = $("#email").val();
		var _this = $(this);
		var wait=60;
		if (email){
		$.ajax({
            type:'POST',
            dataType:'JSON',
			data:{'email':email},
			url:cxt + '/sms/sendVerifyByEmail.do',
			success:function(data){
				if(data.success){
					 _this.prop("disabled",true);
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
						},1000)
				}else{
					$("#desc").show();
					$("#desc label").text(data.message);
				}
			}
		})
        }else {
        	$("#desc").show();
			$("#desc label").text("请输入邮箱");
		}
	});
	
	
});


//去掉前后空格 
function trim(str) {
    var strnew = str.replace(/^\s*|\s*$/g, "");  
    return strnew;  
}


//校验密码
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

//校验验证
function checkAgainPassword(){
	var confirmPwd = $("#confirmPwd").val();
	var password = $("#password").val();
	var pattern = /^[a-zA-Z]\w{5,17}$/;
	if(!confirmPwd){
		$("#desc").show();
		$("#desc label").text("确认密码不能为空!");
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
//校验验证码
function checkCode(){
	var verifyCode=$('input[name=checkCode]').val();
	if(!verifyCode){
		$("#desc").show();
		$("#desc label").text("验证码不能为空!");
		return false;
	}
	return true;
}


//校验邮箱
function checkEmail(){
	var email = $("#email").val();
	//var pattern = /0?(13|14|15|18)[0-9]{9}/;
	if(!email){
		$("#desc").show();
		$("#desc label").text("邮箱不正确,请重新输入!");
		return false;
	}
	$.ajax({
		type:'post',
		url:cxt + '/sms/checkEmail.do',
		data:{'email':trim(email)},
		dataType:'json',
		success:function(data){
			if(!data.success){
				$("#desc").show();
				$("#desc label").text(data.message);
				$('.getvalid').prop("disabled",true);
				return false;
			}else{
				$('.getvalid').prop("disabled",false);
				return true;
			}
		}
	});
}

