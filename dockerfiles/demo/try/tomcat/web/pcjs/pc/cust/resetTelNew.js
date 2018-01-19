$(function() {
	$('input[name=mobile]').change(function() {
		//checkMobile();
	//	$("#mobileText").text("");
		var mobile = $("#mobile").val();
		$.ajax({
			type:'post',
			url:cxt + '/myAccountPwd/checkOnlyMobile.do',
			data:{'mobile':mobile},
			dataType:'json',
			success:function(data){
				if(!data.success){
					$('.telvalid').prop("disabled",true);
					$("#mobileText").text(data.message);
					return false;
				}else{
					$('.telvalid').prop("disabled",false);
					$("#mobileText").text("");
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
		if (!checkMobile()){
			return;
		}
		getSmsCode($(this),"/sms/sendVerifyCodeNew.do");
	})
	// 提交
	$("#submit").on("click", function() {
		/*var newMobile = $("#mobile").val();
		if(!newMobile){
			$("#mobileText").text("手机号不正确,请重新输入!");
			return;
		}
		$("#mobileText").text("");*/
		if (checkMobile()&&checkCode()) {
			var formData = $("#form").serializeArray();
			$.ajax({
				type : 'post',
				url : cxt + '/myAccountPwd/updateMobileNew.do',
				data : formData,
				dataType : 'json',
				success : function(data) {
					if (data.success) {
						$(".my_account").trigger("click");
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
	var verifyCode=$('input[name=checkCode]').val();
	if(!verifyCode){
		$("#checkCodeText").text("验证码不能为空!");
		return false;
	}
	$("#checkCodeText").text("");
	return true;
}
//校验新手机号
function checkMobile(){
	var mobile = $("#mobile").val();
	var pattern = /^\d+$/;
//	var pattern = /0?(13|14|15|18)[0-9]{9}/;
	if(!mobile){
		$("#mobileText").text("手机号不能为空!");
		$('.telvalid').prop("disabled",true);
		return false;
	}
	if(mobile.length!=11){
		$("#mobileText").text("手机号码为11位");
		$('.telvalid').prop("disabled",true);
		return false;
	}
	if(!pattern.test(mobile)){
		$("#mobileText").text("请输入正确的手机号!");
		$('.telvalid').prop("disabled",true);
		return false;
	}
	$("#mobileText").text("");
	return true;
}
/*function getSmsCode(e){
	 //拿到
    var mobile = $("#mobile").val();
	var _this = e;
	 _this.prop("disabled",true);
	 _this.removeAttr('onclick');
	var wait=60;
	if (checkMobile()){
	$.ajax({
        type:'POST',
        dataType:'JSON',
		data:{'phoneNumber':mobile},
		url:cxt + '/sms/sendVerifyCodeNew.do',
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
				
			}
		}
	})
    }else {
    	$("#mobileText").text("请输入正确的手机号!");
	}
}*/