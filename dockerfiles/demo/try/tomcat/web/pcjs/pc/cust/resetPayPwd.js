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
	
	//修改支付密码
	$("#submit").on("click",function(){
		var oldPayPassword = $("#oldPayPassword").val();
		if(!oldPayPassword){
			$("#oldPayPasswordText").text("原支付密码不能为空!");
			return;
		}
		$("#oldPayPasswordText").text("");
		if(checkPwd()&&checkPwdAgain()){
				var formData = $("#form").serializeArray();
				$.ajax({
					type:'post',
					url: cxt + '/bank/submitUpdate.do',
					data:formData,
					dataType:'json',
					success:function(data){
						if(data.success){
							tryModel.alert("修改成功",function(){
								$(".my_account").trigger("click");
							});
						}else{
							$("#rePayPasswordText").text(data.message);
						}
					},
					error:function(result){
						tryModel.alert("服务器异常!");
	                }
				});
		}
		
	});	
});


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

//校验原密码
function checkOldPayPassword(){
	var oldPayPassword = $("#oldPayPassword").val();
	if(!oldPayPassword){
		$("#oldPayPasswordText").text("原交易密码不能为空!");
		return false
	}
	$("#oldPayPasswordText").text("");
	$.ajax({
		type:'post',
		url:cxt + '/myView/checkOldPayPassword.do',
		data:{'oldPayPassword':oldPayPassword},
		dataType:'json',
		success:function(data){
			if(!data.success){
				$("#oldPayPasswordText").text(data.message);
				return false;
			}else{
				$("#oldPayPasswordText").text("");
				return true;
			}
		}
	});
}