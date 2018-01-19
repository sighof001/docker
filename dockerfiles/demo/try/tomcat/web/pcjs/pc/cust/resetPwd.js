$(function(){
	$('input[name=oldPassword]').change(function() {
		checkOldPassword();
	});
	$('input[name=password]').change(function() {
		checkPwd();
	});
	$('input[name=rePassword]').change(function() {
		checkPwdAgain();
	});
	
	//修改登录密码
	$("#submit").on("click",function(){
		var oldPassword = $("#oldPassword").val();
		if(!oldPassword){
			$("#oldPasswordText").text("原登录密码不能为空!");
			return;
		}
		$("#oldPasswordText").text("");
		if(checkPwd()&&checkPwdAgain()){
				var formData = $("#form").serializeArray();
				$.ajax({
					type:'post',
					url: cxt + '/myAccountPwd/submitUpdate.do',
					data:formData,
					dataType:'json',
					success:function(data){
						if(data.success){
							tryModel.alert("登录密码修改成功,请重新登录",function(){
								location.href = cxt + "/login/pcLoginView.do";
							});
						}else{
							$("#rePasswordText").text(data.message);
						}
						
					},
					error:function(result){
						$("#rePasswordText").text("服务器异常!");
	                }
				});
		}
		
	});	
});
//校验密码
function checkPwd(){
	var password = $("#password").val();
	var pattern = /^[a-zA-Z]\w{5,17}$/;
	if(!password){
		$("#passwordText").text("密码不能为空!");
		return false
	}
	if(password.length < 6 || password.length > 18){
		$("#passwordText").text("密码长度必须在6~18位之间");
		return false
	}
	if(!pattern.test(password)){
		$("#passwordText").text("密码以字母开头,只能包含字符、数字和下划线!");
		return false
	}
	$("#passwordText").text("");
	return true;
}
//校验确认密码
function checkPwdAgain(){
	var password = $("#password").val();
	var rePassword = $("#rePassword").val();
	if(password!=rePassword){
		$("#rePasswordText").text("两次密码不一致!");
		return false
	}
	$("#rePasswordText").text("");
	return true;
}

//校验原密码
function checkOldPassword(){
	var oldPassword = $("#oldPassword").val();
	if(!oldPassword){
		$("#oldPasswordText").text("原登录密码不能为空!");
		return false
	}
	$("#oldPasswordText").text("");
	$.ajax({
		type:'post',
		url:cxt + '/myAccountPwd/checkOldPassword.do',
		data:{'oldPassword':oldPassword},
		dataType:'json',
		success:function(data){
			if(!data.success){
				$("#oldPasswordText").text(data.message);
				return false;
			}else{
				$("#oldPasswordText").text("");
				return true;
			}
		}
	});
}