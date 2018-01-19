$(function(){
	
	$('input[name=oldPayPassword]').change(function() {
		checkOldPayPassword();
	});
	$('input[name=payPassword]').change(function() {
		checkPwd();
	});
	$('input[name=rePayPassword]').change(function() {
		checkPwdAgain();
	});
	
	
	
	//输入时,错误提示隐藏
	$("input").on('input',function(e){  
		$("#desc").hide();
		$("#desc label").text("");
	});  
	
	//修改支付密码
	$(".btn").on("click",function(){
		var oldPayPassword = $("#oldPayPassword").val();
		if(!oldPayPassword){
			$("#desc").show();
			$("#desc label").text("原支付密码不能为空!");
			return;
		}
		if(checkPwd()&&checkPwdAgain()){
				var formData = $("#form").serializeArray();
				$.ajax({
					type:'post',
					url: cxt + '/bank/submitUpdate.do',
					data:formData,
					dataType:'json',
					success:function(data){
						if(data.success){
							location.href = cxt + "/myAccountPwd/updateSuccess.do";
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
	var payPassword = $("#payPassword").val();
	var pattern = /^[0-9]*$/;
	if(!payPassword){
		$("#desc").show();
		$("#desc label").text("支付密码不能为空!");
		return false
	}
	if(payPassword.length < 6 || payPassword.length > 8){
		$("#desc").show();
		$("#desc label").text("密码以长度必须在6~8位之间");
		return false
	}
	if(!pattern.test(payPassword)){
		$("#desc").show();
		$("#desc label").text("支付密码只能是数字!");
		return false
	}
	return true;
}
//校验确认密码
function checkPwdAgain(){
	var payPassword = $("#payPassword").val();
	var rePayPassword = $("#rePayPassword").val();
	if(payPassword!=rePayPassword){
		$("#desc").show();
		$("#desc label").text("两次密码不一致!");
		return false
	}
	return true;
}

//校验原密码
function checkOldPayPassword(){
	var oldPayPassword = $("#oldPayPassword").val();
	if(!oldPayPassword){
		$("#desc").show();
		$("#desc label").text("原交易密码不能为空!");
		return false
	}
	$.ajax({
		type:'post',
		url:cxt + '/myView/checkOldPayPassword.do',
		data:{'oldPayPassword':trim(oldPayPassword)},
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