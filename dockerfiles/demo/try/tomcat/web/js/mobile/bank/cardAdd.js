$(function() {
	/*$('input[name=cardNumber]').change(function() {
		checkCardNum();
	});
	$('input[name=mobile]').change(function() {
		checkPhoneNum();
	});*/
	/**
	 * 校验银行卡
	 */
	$('input[name=cardNumber]').change(function() {
		checkCardNum();
		var cardNumber = $("#cardNumber").val();
		if(checkCardNum()){
			$.ajax({
				type:'post',
				url:cxt + '/bank/checkCardNumber.do',
				data:{'cardNumber':trim(cardNumber)},
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
	});
	/**
	 * 校验手机号
	 */
	$('input[name=mobile]').change(function() {
		checkPhoneNum();
		var mobile = $("#mobile").val();
		if(checkPhoneNum()){
			$.ajax({
				type:'post',
				url:cxt + '/bank/checkMobile.do',
				data:{'mobile':trim(mobile)},
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
	});	
	// 输入时,错误提示隐藏
	$("input").on('input', function(e) {
		$("#desc").hide();
		$("#desc label").text("");
	});

	// 保存银行卡
	$(".btn").on("click", function() {
		
		if (checkCardNum()&&checkBankName()&&checkPhoneNum()&&checkCode()) {
			
			var formData = $("#form").serializeArray();
			$.ajax({
				type : 'post',
				url : cxt + '/bank/cardInfo.do',
				data : formData,
				dataType : 'json',
				success : function(data) {
					if (data.success) {
						location.href = cxt + "/bank/cardAddSuccess.do";
					} else {
						$("#desc").show();
						$("#desc label").text(data.message);
					}

				},
				error : function(result) {
					$("#desc").show();
					$("#desc label").text("服务器异常!");
				}
			});
		}

	});
	//获取验证码
	$('.getvalid').on("click",function(){
		 //拿到
        var mobile = $("#mobile").val();
		var _this = $(this);
		var wait=60;
		if (mobile){
		$.ajax({
            type:'POST',
            dataType:'JSON',
			data:{'phoneNumber':mobile,"type":"bank"},
			url:cxt + '/sms/sendVerifyCode.do',
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
			$("#desc label").text("请输入手机号码");
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
		$("#desc").show();
		$("#desc label").text("银行卡号不能为空!");
		return false;
	}
	if (cardNumber.length < 16 || cardNumber.length > 19) {
		$("#desc").show();
		$("#desc label").text("银行卡号长度必须在16~19位之间");
		return false;
	}
	if (!pattern.test(cardNumber)) {
		$("#desc").show();
		$("#desc label").text("请输入正确的银行卡号!");
		return false;
	}
	return true;
	/*$.ajax({
		type:'post',
		url:cxt + '/bank/checkCardNumber.do',
		data:{'cardNumber':trim(cardNumber)},
		dataType:'json',
		success:function(data){
			if(!data.success){
				$("#bankName").attr("disabled",false);
				$("#desc").show();
				$("#desc label").text(data.message);
				$("#bankName").val("");
				$("#bankName").attr("disabled",true);
				return false;
			}else{
				$("#bankName").val("");
				$("input[name=bankName]").val(data.tryBankBin.bankName);
				$("#bankCode").val(data.tryBankBin.bankCode);
				$("#bankName").attr("disabled",true);
				return true;
			}
		}
	});*/
//	return true;
}
// 校验手机号码是否是系统的手机号码
function checkPhoneNum() {
	var mobile = $("#mobile").val();
	//var pattern = /0?(13|14|15|18)[0-9]{9}/;
	if(!mobile){
		$("#desc").show();
		$("#desc label").text("手机号不能为空!");
		return false;
	}
	return true;
	/*$.ajax({
		type:'post',
		url:cxt + '/bank/checkMobile.do',
		data:{'mobile':trim(mobile)},
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
	});*/
	/*if(!pattern.test(mobile)){
		$("#desc").show();
		$("#desc label").text("请输入正确的手机号!");
		return false;
	}*/
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
//检验银行卡号
function checkBankName(){
	var bankCode = $("#bankCode").val();
	if(!bankCode){
		$("#desc").show();
		$("#desc label").text("请选择银行卡!");
		return false;
	}
	return true;
}