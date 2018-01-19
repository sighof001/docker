var isSubmiting = false;
$(function(){	
	if(op == const_op_view){//查看时不可修改
		$('input,select,radio').prop("disabled",true);
		$('#form-save-btn').hide();
		$('.view-hidden').hide();
	}else if(op == const_op_update){
		initValidator();
		$('#loginId').prop("disabled",true);
		$('#mobile').prop("disabled",true);
		$('.hiddenInput').prop("disabled",true);
	}else{
		//查看时无需初始化验证
		initValidator();
		$('.forNew').prop("disabled",true);
		$('.hiddenInput').prop("disabled",true);
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
	var r = cxt + '/tryCustInfo/tryCustInfoList.do';
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
		formUrl = cxt + "/tryCustInfo/addTryCustInfo.do";
	}else if(op == const_op_update){
		formUrl = cxt + "/tryCustInfo/updateTryCustInfo.do";
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
//	$("#loginId").formValidator({
//		onFocus:"请输入登录名",
//		onCorrect:"&nbsp;",
//		tipCss:tipCss
//	}).inputValidator({
//		min:5,
//		onError:"登录名长度不能少于5个字符"
//	}).inputValidator({
//		max:16,
//		onError:"登录名不能超过16个字符"
//	}).regexValidator({          
//		regExp:"^[a-zA-z][a-zA-Z0-9_]{4,16}$",             
//		onError:"用户名必须由字母开头,由数字、字母组成!"      
//	});
	
	/*$("#password").formValidator({
		onFocus:"请输入密码",
		onCorrect:"&nbsp;",
		tipCss:tipCss
	}).inputValidator({
		min:1,
		onError:"密码不能为空"
	}).inputValidator({
		max:10,
		onError:"密码不能超过10个字符"
	}).regexValidator({        
		regExp:"^[0-9a-zA-Z]+$",             
		onError:"只能字母数字"      
	});*/
	
	/*$("#realName").formValidator({
		onFocus:"请输入姓名",
		onCorrect:"&nbsp;",
		tipCss:tipCss
	}).inputValidator({
		min:1,
		onError:"姓名不能为空"
	}).inputValidator({
		max:10,
		onError:"姓名不能超过10个字符"
	}).regexValidator({        
		regExp:regexEnum.chinese,             
		onError:"请输入中文姓名"      
	});*/
	
	
/*	$("#nickName").formValidator({
		onFocus:"请输入昵称",
		onCorrect:"&nbsp;",
		tipCss:tipCss
	}).inputValidator({
		min:1,
		onError:"昵称不能为空"
	}).inputValidator({
		max:10,
		onError:"昵称不能超过10个字符"
	}).regexValidator({        
		regExp:regexEnum.username,             
		onError:"匹配由数字、26个英文字母或者下划线组成的字符串"      
	});*/
	
//	$("#mobile").formValidator({
//		onFocus:"请输入手机号",
//		onCorrect:"&nbsp;",
//		tipCss:tipCss
//	}).inputValidator({
//		min:1,
//		onError:"手机号不能为空"
//	}).inputValidator({
//		max:11,
//		onError:"手机号不能超过11个字符"
//	}).regexValidator({        
//		regExp:regexEnum.mobile,             
//		onError:"请输入正确的手机号"      
//	});
	
/*	$("#idCard").formValidator({
		onFocus:"请输入身份证号",
		onCorrect:"&nbsp;",
		tipCss:tipCss
	}).inputValidator({
		min:1,
		onError:"身份证号不能为空"
	}).inputValidator({
		max:18,
		onError:"身份证号不能超过18个字符"
	}).regexValidator({        
		regExp:regexEnum.idcard,             
		onError:"请输入正确的身份证号"      
	});*/

	
	
/*	$("#email").formValidator({
		onFocus:"请输入电子邮箱",
		onCorrect:"&nbsp;",
		tipCss:tipCss
	}).inputValidator({
		max:40,
		onError:"电子邮箱不能超过40个字符"
	}).regexValidator({        
		regExp:regexEnum.email,             
		onError:"请输入正确的电子邮箱"      
	});*/
	

}