$(function(){	
	var validVerCode = false;
	//获取验证码
	$('#btnVerCode').on("click",function(){
		$(this).countDown(60);
		$.post(cxt + '/order/smfApply.do',{orderId:$('input[name="orderId"]').val()},function(data){
			if(data.success){
				$('.error').text('');
				if(data.verified){
					validVerCode = true;
					$('.verLi').hide();
					$('.error').text('已经验证通过，无需再获取验证码，请直接提交');
				}
			}else{
				$('.error').text(data.message);
			}
		},"json");
		
		return false;
	});
	
	//确认
	var isSubmiting = false;
	$('.ok').on("click",function(){
		if(!validateVerCode(validVerCode)){
			return false;
		}

		var orderId = $('input[name="orderId"]').val();
		var verCode = $('input[name="verCode"]').val();
		isSubmiting = true;
		$.post(cxt + '/order/confirmPay.do',{orderId:orderId,verCode:verCode},function(data){
			if(data.success){
				location.href = cxt + '/order/pcPayResult.do?orderId=' + orderId;
			}else{
				$('.error').text(data.message);
			}
			

			isSubmiting = false;
		},"json");
		
		return false;
		
	});
});

/**
 * 验证验证码
 */
function validateVerCode(validVerCode){
	if(validVerCode){
		return true;
	}
	var verCode = $('input[name="verCode"]');
	if(verCode.val() == ''){
		$('.error').text('请输入验证码');
		verCode.focus();
		return false;
	}
	
	return true;
}



