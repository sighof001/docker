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
	
	
	
	//输入时,错误提示隐藏
	$("input").on('input',function(e){  
		$("#desc").hide();
		$("#desc label").text("");
	});  
	
	//修改登录密码
	$(".btn").on("click",function(){
		var oldPassword = $("#oldPassword").val();
		if(!oldPassword){
			$("#desc").show();
			$("#desc label").text("原登录密码不能为空!");
			return;
		}
		if(checkPwd()&&checkPwdAgain()){
				var formData = $("#form").serializeArray();
				$.ajax({
					type:'post',
					url: cxt + '/myAccountPwd/submitUpdate.do',
					data:formData,
					dataType:'json',
					success:function(data){
						if(data.success){
							location.href = cxt + "/myAccountPwd/passwordUpdateSuccess.do";
							/*setTimeout(function(){
							    location.href=cxt +"/login/loginView.do";
							},2000);*/
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
//校验确认密码
function checkPwdAgain(){
	var password = $("#password").val();
	var rePassword = $("#rePassword").val();
	if(password!=rePassword){
		$("#desc").show();
		$("#desc label").text("两次密码不一致!");
		return false
	}
	return true;
}

//校验原密码
function checkOldPassword(){
	var oldPassword = $("#oldPassword").val();
	if(!oldPassword){
		$("#desc").show();
		$("#desc label").text("原登录密码不能为空!");
		return false
	}
	$.ajax({
		type:'post',
		url:cxt + '/myAccountPwd/checkOldPassword.do',
		data:{'oldPassword':trim(oldPassword)},
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
}