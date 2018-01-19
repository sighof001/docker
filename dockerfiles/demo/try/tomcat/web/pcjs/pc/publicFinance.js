$(document).ready(function() {
	//换页
	$("#nextPage").on("click",function(){
		$("#table1").attr("hidden",true);
		$("#table2").attr("hidden",false);
	});
	$("#prePage").on("click",function(){
		$("#table2").attr("hidden",true);
		$("#table1").attr("hidden",false);
	});
	//计算收益
	$('#cal').on("click",function(){
		if(!validateInput()){
			return false;
		}
		var amount = $('input[name="amount"]').val();
		var term = $('input[name="term"]').val();
		$.post(cxt + '/tool/calEarningsFp.do',{amount:amount,term:term},function(data){
			if(data.success){
				$('#income').text(data.earnings);
			}else{
				$('#warn').text(data.message);
			}
			
		},"json");
		
		return true;
	});
	
	
});

function validateAmount(){
	var item = $('input[name="amount"]');
	if (item.val() == "") {
		$('#warn').text('请输入金额');
		return false;
	}
	
	var reg = regEnum.decimal;
	if(!reg.test(item.val())){
		$('#warn').text('金额只能输入数字');
		return false;
	}
	return true;
}

function validateTerm(){
	var item = $('input[name="term"]');
	if (item.val() == "") {
		$('#warn').text('请输入天数');
		return false;
	}
	
	var reg = regEnum.int1;
	if(!reg.test(item.val())){
		$('#warn').text('存款天数为整数');
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

	$('#warn').text('');
	return true;
}
