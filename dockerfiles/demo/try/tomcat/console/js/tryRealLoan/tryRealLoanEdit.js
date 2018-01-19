var isSubmiting = false;
$(function(){	
	if(op == const_op_view){//查看时不可修改
		$('input,select,radio').prop("disabled",true);
		$('#form-save-btn').hide();
		$('.view-hidden').hide();
	}else{
		//查看时无需初始化验证
		initValidator();
	}
	//默认日期
	if(op == const_op_add){//新增时才设置默认日期
		$('.wdate').val(getYyyy_MM_dd());
		//$('#valueDate').val(getYyyy_MM_dd());
		//$('#dueDate').val(getYyyy_MM_dd(1));
	}

	$('#save').click(function(){
		$('#edit-form').submit();
	});
		
	/** 此注释中内容可作参考,根据具体业务不同
	
	//计算期限
	$('#valueDate,#dueDate').each(function(){
		$(this).get(0).onclick = function(){
			WdatePicker({
				'dateFmt':'yyyy-MM-dd',
				//计算期限
				'onpicked':calDuration
			});
			
			return false;
		};
	});
	calDuration();
	
	//交易对手信息带出
	$('#counterPartyId').change(function(){
		var selectedOption = $(this).find('option:selected');
		$('#counterPartyName').val(selectedOption.text());
		$('#counterPartyType').val(selectedOption.attr('counterPartyType'));
		$('#counterPartyAccount').val(selectedOption.attr('counterPartyAccount'));
	});
	$('#counterPartyId').change();
	
	//选择利率类型
	$('#rateType').change(function(){
		//固定利率是不可用项( 浮动利率,系数和利差)
		var gdDisable = $('#floatRate,#ratio,#rateDif');
		
		//固定利率
		if(isGdll()){
			gdDisable.val('');
			gdDisable.prop("disabled",true);
		//浮动利率
		}else{
			gdDisable.prop("disabled",false);
		}
	});
	$('#rateType').change();
	
	//生成付息计划
	$('#genPayPlan').click(function(){
		alert('生成付息计划');
	});
	
	//生成重置计划
	$('#genResetPlan').click(function(){
		alert('生成重置计划');
	});
	
	$('#capital2').blur(function(){
		 checkMoney($(this).get(0).id);
	});
	
	$('#capital2').focus(function(){
		$(this).val(removeComma($(this).val()));
	});
	
	*/
});

function returnPage(){
	var r = cxt + '/tryRealLoan/tryRealLoanList.do';
	if(returnType == '1'){
		
	}else if(returnType == '2'){
		r = '';
	}
	
	location.href = r;
}

//计算期限
/**
var calDuration = function(){
	var date1 = $('#valueDate');
	var date2 = $('#dueDate');
	var dif = getDateDiff(date1.val(),date2.val());
	
	$('#duration').val(dif); 
};
*/
/*
//是否固定利率
function isGdll(){
	return const_rate_type_gd == $('#rateType').val();
}
*/

function inputValidate(){
	/*
	if (!validateValueDate()) {
		return false;
	}
	if (!validateRate()) {
		return false;
	}
	*/
	return true;
}
/*
function validateRate(){
	var rate = $('#rate');
	var rateType = $('#rateType');
	//利率类型为固定时，利率不能为空
	if(const_rate_type_gd == rateType.val()){
		if($('#rate').val() == ''){
			showFieldError(rate,'利率类型为固定时，利率不能为空');
			return false;
		}
	}
	
	return true;
}
*/
/*
function validateValueDate(){
	var date1 = $('#valueDate');
	var date2 = $('#dueDate');
	var dif = getDateDiff(date1.val(),date2.val());
	if (dif <= 0) {
		return false;
	}
	return true;
}
*/
function initValidator(){
	var formUrl = '';
	if(op == const_op_add){
		formUrl = cxt + "/tryRealLoan/addTryRealLoan.do";
	}else if(op == const_op_update){
		formUrl = cxt + "/tryRealLoan/updateTryRealLoan.do";
	}
	
	$.formValidator.initConfig({
		//mode:"AutoTip",
		mode:"FixTip",
		formID:"edit-form",
		ajaxForm:{
			type : "POST",
			dataType : "json",
			buttons:$("#button"),
			url: formUrl,
			beforeSend: function() {
				art.dialog.through({
					id: 'broadcastLoading',
					title: false,
				    content: '<img src="' + cxt + '/image/common/loading.gif" />',
				    lock: true
				});
			},
			error: function(a, b) {
				art.dialog.list['broadcastLoading'].close();
				art.dialog.alert("保存失败！");
				return false;
			},
			success: function(data) {
				art.dialog.list['broadcastLoading'].close();
				if(data.success){
					returnPage();
				}else{
					art.dialog.alert(data.message);
				}
				return true;
			}
		}
	});
	
	var tipCss = {top:5,left:20};
	$("#name").formValidator({
		onFocus : "请输入姓名",
		onCorrect : "&nbsp;",
		tipCss : tipCss,
		onShow : "&nbsp;"
	}).inputValidator({
		min : 1,
		onError : "姓名不能为空"
	}).inputValidator({
		max : 50,
		onError : "姓名不能超过50个字符"
	}).regexValidator({
		regExp : regexEnum.chinese,
		onError : "姓名必须是中文"
	});
	$("#tel").formValidator({
		onFocus : "请输入电话",
		onCorrect : "&nbsp;",
		tipCss : tipCss,
		onShow : "&nbsp;"
	}).inputValidator({
		min : 11,
		onError : "电话号码为11位数"
	}).inputValidator({
		max : 11,
		onError : "电话号码为11位数"
	}).regexValidator({
		regExp : regexEnum.num1,
		onError : "请输入正确的电话号码"
	});
	
	$("#amount").formValidator({
		onFocus : "请输入贷款金额",
		onCorrect : "&nbsp;",
		tipCss : tipCss,
		onShow : "&nbsp;"
	}).inputValidator({
		min : 1,
		onError : "贷款金额不能为空"
	}).inputValidator({
		max : 15,
		onError : "贷款金额不能超过15个字符"
	}).regexValidator({
		regExp :regexEnum.newAmount,
		onError : "金额格式为数字,且保留到小数点后2位"
	});
	$("#loanDays").formValidator({
		onFocus : "请输入贷款天数",
		onCorrect : "&nbsp;",
		tipCss : tipCss,
		onShow : "&nbsp;"
	}).inputValidator({
		min : 1,
		onError : "贷款天数不能为空"
	}).inputValidator({
		max : 15,
		onError : "贷款天数不能超过15个字符"
	}).regexValidator({
		regExp : regexEnum.intege1,
		onError : "贷款天数为整数"
	});
	$("#loanRate").formValidator({
		onFocus : "请输入贷款利息",
		onCorrect : "&nbsp;",
		tipCss : tipCss,
		onShow : "&nbsp;"
	}).inputValidator({
		min : 1,
		onError : "贷款利息不能为空"
	}).inputValidator({
		max : 15,
		onError : "贷款利息不能超过15个字符"
	}).regexValidator({
		regExp : regexEnum.newRate1,
		onError : "利息格式为数字,且最多保留到小数点后4位"
	});
	$("#loanDate").formValidator({
		onFocus : "请输入贷款日期",
		onCorrect : "&nbsp;",
		tipCss : tipCss,
		onShow : "&nbsp;"
	}).inputValidator({
		min : 1,
		onError : "贷款日期不能为空"
	}).inputValidator({
		max : 15,
		onError : "贷款日期不能超过15个字符"
	}).regexValidator({
		regExp : regexEnum.date,
		onError : "贷款日期为日期格式"
	});
}