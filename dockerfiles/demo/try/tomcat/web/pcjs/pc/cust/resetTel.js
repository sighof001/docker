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
		getSmsCode($(this),"/sms/sendVerifyCode.do","tel");
	})
	// 提交
	$("#submit").on("click", function() {
		if (checkCode()) {
			var formData = $("#form").serializeArray();
			$.ajax({
				type : 'post',
				url : cxt + '/myAccountPwd/updateMobile.do',
				data : formData,
				dataType : 'json',
				success : function(data) {
					if (data.success) {
						$(".p_bandEmail").trigger("click");
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