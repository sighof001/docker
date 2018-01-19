$(function(){
	$('.ok').on("tap",function(){
		if(!validateInput()){
			return false;
		}
		
		ybDialog.confirm("确认充值吗？",function(){
			var amount = $('input[name="amount"]').val();
			var payPassword = $('input[name="payPassword"]').val();
			$.post(cxt + '/order/checkRecharge.do',{amount:amount,payPassword:payPassword},function(data){
				if(data.success){				
					document.mainForm.action = cxt + '/order/recharge.do';
					document.mainForm.submit();
				}else{
					$('.error').html(data.message);
				}
				return false;
			},"json");
		});
		
		return false;
	});
	
});



function validateInput(){
	if (!validateAmount()) {
		return false;
	}
	
	if (!validatPayPassword()) {
		return false;
	}

	$('.error').text('');	
	return true;
}

function validateAmount(){
	var reg = regEnum.decimal_2;
	var input = $('input[name="amount"]');
	if(!reg.test(input.val())){
		$('.error').text('只能输入正确金额,小数后2位');
		input.focus();
		return false;
	}
	if(parseFloat(input.val()) <= 0){
		$('.error').text('输入金额不能小于0');
		input.focus();
		return false;
	}
	if(parseFloat(input.val()) > appConstants.recharge_max){
		$('.error').text("当日充值上限不能大于"+appConstants.recharge_max+"元");
		input.focus();
		return false;
	}

	$('.error').text('');
	return true;
}


function validatPayPassword(){
	var input = $('input[name="payPassword"]');
	if(input.val() == ''){
		$('.error').text('请输入支付密码');
		input.focus();
		return false;
	}

	$('.error').text('');
	return true;
}