$(function(){
	expectedEarnings();
	$('input[name="amount"]').blur(function(){
		expectedEarnings();
		return false;
	});

	
});

function expectedEarnings(){
	if(!validateAmount()){
		return false;
	}
	var goodsId = $('input[name="id"]').val();
	var amount = $('input[name="amount"]').val();
	$.post(cxt + '/goods/expectedEarnings.do',{goodsId:goodsId,amount:amount},function(data){
		if(data.success){
			$('.expectedEarnings').text(data.earnings);
			$('.error').text('');
		}else{
			$('.error').text(data.message);
		}
		
	},"json");
	
	return true;
}

function validateAmount(){
	var reg = regEnum.decimal;
	if(!reg.test($('input[name="amount"]').val())){
		$('.error').text('只能输入数字');
		return false;
	}
	return true;
}

function validateInput(){
	if (!validateAmount()) {
		return false;
	}

	$('.error').text('');
	return true;
}
