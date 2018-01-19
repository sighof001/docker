$(document).ready(function() {
	//发送验证码
	$("#smsCode2").on("click",function(){
		if($(this).hasClass('try-disabled')){
			return false;
		}
		getSmsCode($(this),"/login/smsSend.do");
	})
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
			var account = $("#account").val();
			$.ajax({
				type:'post',
				url:cxt +'/login/pcCheckAccount.do',
				data:formData,
				dataType:'json',
				success:function(data){
					if(data.success){
						location.href = cxt + "/login/pcForgotPasswordSecurity/"+account+".do?paramType="+data.paramType;
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
	var pattern = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
	if(!loginId){
		$("#accountText").text("账号不能为空!");
		return false;
	}
	if(!pattern.test(loginId)){
		$("#accountText").text("邮箱格式不正确,请重新输入");
		return false
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
	var smsCode = $("#smsCode").val();
	if(!smsCode){
		tryModel.alert("验证码不能为空!");
		return false;
	}
	return true;
}


//验证码刷新
function changeImg(obj){
	var imgHeight = 96;
    var imgWidth = 34;
	var codeLen  = 4;
	
	$("#"+obj.id).attr("src",cxt + "/login/getCode.do?"+Math.random()+"&imgHeight="+imgHeight+"&imgWidth="+imgWidth+"&codeLen="+codeLen);
}
