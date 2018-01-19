$(function(){

	var isSubmiting = false;
	$('.ok').on("click",function(){
		
		if(isSubmiting){
			return false;
		}
		
		if(!validateInput()){
			return false;
		}
		
		tryModel.confirm("确定申请提现吗？",function(){
			
			var amount = $('input[name="amount"]').val();
			var payPassword = $('input[name="payPassword"]').val();
			
			isSubmiting = true;
			$.post(cxt + '/order/withdraw.do',{amount:amount,payPassword:payPassword},function(data){
				$('.error').html('');
				
				if(data.success){
					linkUrl('withdrawSuccess','orderId=' + data.order.id);
				}else{
					$('.error').html(data.message);
				}
				
				isSubmiting = false;
			},"json");
		});
		
		return false;
	});
	
	
	
//	$('input').on('input',function(){
//		$('.error').text('');
//	});
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
		$('.error').text('提现金额不能小于等于0元');
		input.focus();
		return false;
	}
	var banlance = $("#banlance").val();
	if(parseFloat(input.val()) > parseFloat(banlance)){
		$('.error').text("提现金额超过账户余额");
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