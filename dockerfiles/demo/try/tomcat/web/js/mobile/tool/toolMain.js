$(function(){
	//设置底部配置
	settingBottom(".buttons-b");
	
	$('select[name="goodsId"]').change(function(){
		var term = $('select[name="goodsId"] option:selected').attr('term');
		if(term == 0){
			$('input[name="term"]').val("");
			$('input[name="term"]').prop("readonly",false);
			$('.income').text("0.00");
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
	
	$('.ok').on("tap",function(){
		var goodsId = $('select[name="goodsId"]').val();
		location.href = cxt + '/webEntrust/entrustDetails/' + goodsId + '.do';
		return false;
	});
});

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

function validateAmount(){
	var item = $('input[name="amount"]');
	if (item.val() == "") {
		$('.error').text('请输入金额');
		$('.income').text("0.00");
		item.focus();
		return false;
	}
	var reg = regEnum.decimal;
	if(!reg.test(item.val())){
		$('.error').text('金额只能输入数字');
		$('.income').text("0.00");
		item.focus();
		return false;
	}
	
	if(item.val().length>8){
		$('.error').text('金额只能输入8位以内');
		item.focus();
		return false;
	}
	return true;
}

function validateTerm(){
	var item = $('input[name="term"]');
	if (item.val() == "") {
		$('.error').text('请输入天数');
		$('.income').text("0.00");
		item.focus();
		return false;
	}
	
	var reg = regEnum.int1;
	if(!reg.test(item.val())){
		$('.error').text('存款天数为整数');
		$('.income').text("0.00");
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