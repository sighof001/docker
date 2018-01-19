$(function(){
	var isSubmiting = false;
	$('.ok').on("tap",function(){
		
		if(isSubmiting){
			return false;
		}
		
		if(!validateInput()){
			return false;
		}
		/*if(ybDialog.confirm("确定申请提现吗？",function(){
			return true;
		},function(){
			return false;
		})){
			return false;
		}*/
		
		/*if(!confirm("确定申请提现吗？")){
			return false;
		}*/
		ybDialog.confirm("确定申请提现吗？",function(){
			//确认的时候
			var amount = $('input[name="amount"]').val();
			var payPassword = $('input[name="payPassword"]').val();
			
			isSubmiting = true;
			$.post(cxt + '/order/withdraw.do',{amount:amount,payPassword:payPassword},function(data){
				$('.error').html('');
				
				if(data.success){
					location.href = cxt + '/order/withdrawSuccess.do?orderId=' + data.order.id;
				}else{
					$('.error').html(data.message);
				}
				
				isSubmiting = false;
			},"json");
		}),function(){
			return false;
		}
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
	var banlance = $('#banlance');
	if(input.val() == ''){
		$('.error').text('请输入提现金额');
		input.focus();
		return false;
	}
	if(!reg.test(input.val())){
		$('.error').text('只能输入数字,小数点后两位');
		input.focus();
		return false;
	}
	if(parseFloat(input.val()) <= 0){
		$('.error').text('输入金额不能小于0');
		input.focus();
		return false;
	}
	if(parseFloat(input.val()) > parseFloat(banlance.val())){
		$('.error').text('余额不足');
		input.focus();
		return false;
	}

	$('.error').text('');
	return true;
}


function validatPayPassword(){
	var input = $('input[name="payPassord"]');
	if(input.val() == ''){
		$('.error').text('请输入支付密码');
		input.focus();
		return false;
	}

	$('.error').text('');
	return true;
}