
$(function(){
	//计算收益	
	$('select[name="goodsId"]').change(function(){
		var term = $('select[name="goodsId"] option:selected').attr('term');
		if(term == 0){
			$('input[name="term"]').prop("readonly",false);
		}else{
			$('input[name="term"]').val(term).prop("readonly",true);
		}

		calEarnings();
	}).change();
	
	//计算收益
	$('.calc').on("keyup",function(e){
		calEarnings();
		return false;
	});
	
	//马上委托
	$('.ok').on("click",function(){
		var goodsId = $('select[name="goodsId"]').val();
		location.href = cxt + '/webEntrust/pcEntrustDetail/' + goodsId + '.do';
		return false;
	});
	

	//$('select[name="goodsId"]').change();
});

function validateAmount(){
	var item = $('input[name="amount"]');
	if (item.val() == "") {
		$('.error').text('请输入金额');
		item.focus();
		return false;
	}
	
	var reg = regEnum.decimal;
	if(!reg.test(item.val())){
		$('.error').text('金额只能输入数字');
		item.focus();
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
function calEarnings(){
	if(!validateInput()){
		return false;
	}
	var rate = $('select[name="goodsId"] option:selected').attr('rate');
	var amount = $('input[name="amount"]').val();
	var term = $('input[name="term"]').val();

	$('.income').text($.yb.calEarnings(amount,rate,term));
	$('.error').text('');
	
	return false;
}