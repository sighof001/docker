$(function() {
	
	$('input[name=cardNumber]').change(function() {
		checkCardNum();
		var cardNumber = $("#cardNumber").val();
		$.ajax({
			type:'post',
			url:cxt + '/bank/checkCardNumber.do',
			data:{'cardNumber':trim(cardNumber)},
			dataType:'json',
			success:function(data){
				if(!data.success){
					$("#cardNumberText").text(data.message);
					$('.telvalid').prop("disabled",true);
					return false;
				}else{
					$('.telvalid').prop("disabled",false);
					return true;
				}
			}
		});
	
	});
	$('#bankCode').change(function() {
		checkBankName();
	});
	$('input[name=mobile]').change(function() {
		checkPhoneNum();
		var mobile = $("#mobile").val();
		$.ajax({
			type:'post',
			url:cxt + '/bank/checkMobile.do',
			data:{'mobile':trim(mobile)},
			dataType:'json',
			success:function(data){
				if(!data.success){
					$("#mobileText").text(data.message);
					$('.telvalid').prop("disabled",true);
					return false;
				}else{
					$('.telvalid').prop("disabled",false);
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
		if (!checkPhoneNum()){
			return;
		}
		getSmsCode($(this),"/sms/sendVerifyCode.do","bank");
	})
	// 保存银行卡
	$("#submit").on("click", function() {
		if (checkCardNum()&&checkBankName()&&checkPhoneNum()&&checkCode()) {
			var formData = $("#form").serializeArray();
			$.ajax({
				type : 'post',
				url : cxt + '/bank/cardInfo.do',
				data : formData,
				dataType : 'json',
				success : function(data) {
					if (data.success) {
						$(".p_bindcard").trigger("click");
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

// 去掉前后空格
function trim(str) {
	var strnew = str.replace(/^\s*|\s*$/g, "");
	return strnew;
}

// 校验银行卡账号
function checkCardNum() {
	var cardNumber = $("#cardNumber").val();
	var pattern = /^\d{16}|\d{19}$/;
	if (!cardNumber) {
		$("#cardNumberText").text("银行卡号不能为空");
		return false
	}
	if (cardNumber.length < 16 || cardNumber.length > 19) {
		$("#cardNumberText").text("银行卡号长度必须在16~19位之间");
		return false
	}
	if (!pattern.test(cardNumber)) {
		$("#cardNumberText").text("请输入正确的银行卡号");
		return false
	}
	$("#cardNumberText").text("");
	return true;
	
}
/*function checkCardNum() {
	var cardNumber = $("#cardNumber").val();
	var pattern = /^\d{16}|\d{19}$/;
	if (!cardNumber) {
		$("#cardNumberText").text("银行卡号不能为空");
		return false
	}
	if (cardNumber.length < 16 || cardNumber.length > 19) {
		$("#cardNumberText").text("银行卡号长度必须在16~19位之间");
		return false
	}
	if (!pattern.test(cardNumber)) {
		$("#cardNumberText").text("请输入正确的银行卡号");
		return false
	}
	$("#cardNumberText").text("");
	$.ajax({
		type:'post',
		url:cxt + '/bank/checkCardNumber.do',
		data:{'cardNumber':trim(cardNumber)},
		dataType:'json',
		success:function(data){
			if(!data.success){
				$("#cardNumberText").text(data.message);
				return false;
			}else{
				$("#bankName").val("");
				$("input[name=bankName]").val(data.tryBankBin.bankName);
				$("#bankName").attr("disabled",true);
				$("#bankCode").val(data.tryBankBin.bankCode);
				return true;
			}
		}
	});
}
*///校验验证码
function checkCode(){
	var verifyCode=$('input[name=checkCode]').val();
	if(!verifyCode){
		$("#checkCodeText").text("验证码不能为空!");
		return false;
	}
	$("#checkCodeText").text("");
	
	return true;
}
// 校验手机号码是否是系统的手机号码
function checkPhoneNum() {
	var mobile = $("#mobile").val();
	//var pattern = /0?(13|14|15|18)[0-9]{9}/;
	if(!mobile){
		$("#mobileText").text("手机号不能为空!");
		return false;
	}
	$("#mobileText").text("");
	return true;
	/*$.ajax({
		type:'post',
		url:cxt + '/bank/checkMobile.do',
		data:{'mobile':trim(mobile)},
		dataType:'json',
		success:function(data){
			if(!data.success){
				$("#mobileText").text(data.message);
				$('.telvalid').prop("disabled",true);
				return false;
			}else{
				$('.telvalid').prop("disabled",false);
				return true;
			}
		}
	});*/
}
//获取验证码

/*function getSmsCode(e){
	if (!checkPhoneNum()){
		return;
	}
	var mobile = $("#mobile").val();
	var _this = e;
	 _this.prop("disabled",true);
	 _this.removeAttr('onclick');
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
					$("#mobileText").text("");
			}else{
				//设置按钮可按
                _this.prop("disabled",false);
                _this.attr('onclick','getSmsCode($(this))');
				$("#mobileText").text(data.message);
				
			}
		}
	})
}*/
//检验银行卡号
function checkBankName(){
	var bankCode = $("#bankCode").val();
	if(!bankCode){
		$("#cardNameText").text("请选择银行卡!");
		return false;
	}
	$("#cardNameText").text("");
	return true;
}

