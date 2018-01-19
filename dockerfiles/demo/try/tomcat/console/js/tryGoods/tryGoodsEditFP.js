var isSubmiting = false;
$(function(){	
	if(op == const_op_view){//查看时不可修改
		$('input,select,radio').prop("disabled",true);
		$('#form-save-btn').hide();
		$('.view-hidden').hide();
		$('#description').prop("disabled",true);
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
	var r = cxt + '/tryGoods/tryGoodsListFP.do';
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
		formUrl = cxt + "/tryGoods/addTryGoods.do";
	}else if(op == const_op_update){
		formUrl = cxt + "/tryGoods/updateTryGoods.do";
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
	/**
	 * 校验产品编号
	 */
	var tipCss = {top:5,left:20};
	$("#goodsCode").formValidator({onFocus:"请输入产品编号",onCorrect:"&nbsp;",tipCss:tipCss,onShow:"&nbsp;"})
	.inputValidator({min:1,onError:"产品编号不能为空"}).inputValidator({
		max:50,
		onError:"产品编号不能超过50个字符"
	});
	/**
	 * 校验产品名称
	 */
	$("#goodsName").formValidator({onFocus:"请输入产品名称",onCorrect:"&nbsp;",tipCss:tipCss,onShow:"&nbsp;"})
	.inputValidator({min:1,onError:"产品名称不能为空"}).inputValidator({
		max:200,
		onError:"产品名称不能超过200个字符"
	});
	/**
	 * 校验年化利率
	 */
	$("#rate").formValidator({onFocus:"请输入年化利率",onCorrect:"&nbsp;",tipCss:tipCss,onShow:"&nbsp;"})
	.inputValidator({min:1,onError:"年化利率不能为空"}).inputValidator({
		max:22,
		onError:"利率不能超过22个字符"
	})
	.regexValidator({          
		regExp:regexEnum.rate,             
		onError:"利率,必须是4位小数数值"      
	});
	/**
	 * 校验起投金额
	 */
	$("#startAmount").formValidator({onFocus:"请输入起投金额",onCorrect:"&nbsp;",tipCss:tipCss,onShow:"&nbsp;"})
	.inputValidator({min:1,onError:"起投金额不能为空"}).inputValidator({
		max:22,
		onError:"起投金额不能超过22个字符"
	})
	.regexValidator({          
		regExp:regexEnum.newAmount1,        
		onError:"金额是数字且大于0,最多保留到小数点后2位"      
	});
	/**
	 * 校验递增金额
	 */
	$("#increaseAmount").formValidator({onFocus:"请输入递增金额",onCorrect:"&nbsp;",tipCss:tipCss,onShow:"&nbsp;"})
	.inputValidator({min:1,onError:"递增金额不能为空"}).inputValidator({
		max:22,
		onError:"递增金额不能超过22个字符"
	})
	.regexValidator({          
		regExp:regexEnum.newAmount1,          
		onError:"金额是数字且大于0,最多保留到小数点后2位"      
	});
	
	/**
	 * 校验产品介绍
	 */
	$("#description").formValidator({onFocus:"请输入产品介绍",onCorrect:"&nbsp;",tipCss:tipCss,onShow:"&nbsp;"})
	.inputValidator({min:1,onError:"产品介绍不能为空"}).inputValidator({
		max:500,
		onError:"产品介绍不能超500个字符"
	});
	
	/**
	 * 校验期限(天)
	 */
	$("#term").formValidator({onFocus:"请输入期限(天)",onCorrect:"&nbsp;",tipCss:tipCss,onShow:"&nbsp;"})
	.inputValidator({min:1,onError:"期限(天)不能为空"}).inputValidator({
		max:11,
		onError:"期限(天)不能超过11个字符"
	})
	.regexValidator({          
		regExp:regexEnum.num1,             
		onError:"期限(天),必须是正数"      
	});
	/**
	 * 校验计息频率(天)
	 */
	$("#interestFrequency").formValidator({onFocus:"请输入计息频率(天)",onCorrect:"&nbsp;",tipCss:tipCss,onShow:"&nbsp;"})
	.inputValidator({min:1,onError:"计息频率(天)不能为空"}).inputValidator({
		max:11,
		onError:"计息频率(天)不能超过11个字符"
	})
	.regexValidator({          
		regExp:regexEnum.num1,             
		onError:"计息频率(天),必须是正数"
	});
	$("#sequence").formValidator({
		onFocus:"请输入序号",
		onCorrect:"&nbsp;",
		tipCss:tipCss
		//onShow : "&nbsp;"
	}).inputValidator({
		min : 1,
		onError : "序号不能为空"
	}).inputValidator({
		max:3,
		onError:"序号不能超过3位数字"
	}).regexValidator({
		regExp : regexEnum.num1,
		onError : "序号必须是整数"
	});
}