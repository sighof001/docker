$(function(){
	$('.ok').on("tap",function(){
		if(!validateInput()){
			return false;
		}
		var amount = $('input[name="amount"]').val();
		var term = $('input[name="term"]').val();
		$.post(cxt + '/tool/calEarningsFp.do',{amount:amount,term:term},function(data){
			if(data.success){
				$('.income').text(data.earnings);
				$('.error').text('');
			}else{
				$('.error').text(data.message);
				$('.income').text('');
			}
			
		},"json");
		
		return true;
	});
	
});

function validateAmount(){
	var amount = $('input[name="amount"]');
	if (amount.val() == "") {
		$('.error').text('请输入金额');
		amount.focus();
		return false;
	}
	
	var reg = regEnum.decimal;
	if(!reg.test(amount.val())){
		$('.error').text('金额只能输入数字');
		amount.focus();
		return false;
	}
	return true;
}

function validateTerm(){
	var item = $('input[name="term"]');
	if (item.val() == "") {
		$('.error').text('请输入天数');
		item.focus();
		return false;
	}
	
	var reg = regEnum.int1;
	if(!reg.test(item.val())){
		$('.error').text('存款天数为整数');
		item.focus();
		return false;
	}
	return true;
}

function validateInput(){
	if (!validateAmount()) {
		return false;
	}
	if (!validateTerm()) {
		return false;
	}

	$('.error').text('');
	return true;
}
