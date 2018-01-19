var isSubmiting = false;
$(function(){	
	$('input[name=remark]').change(function() {
		checkRemark();
	});
	//审核通过
	$("#auditPass").click(function(){
		var id=$("#id").val();
			art.dialog.confirm("确定审核通过吗？",function(){
				$.post(cxt + '/tryCustLoan/audit.do',{id:id,"statue":"pass"},function(data){
					if(data.success){
						artDialog.alert("审核成功",function(){
							$("#back2Index").click();
						});
					}else{
						artDialog.alert(data.message);
					}
				},"json");
			//util.navigate("/tryCustLoan/audit.do?statue=pass&id="+$("#id").val());
			//art.dialog.alert("审核成功");
			});
	});
	/*$(".btn_audit").on("click",function(){
		var remark=$("#remark").val();
		var id=$("#id").val();
		$("#myModal").modal("hide");
		if(checkRemark()){
			util.navigate("/tryCustLoan/audit.do?statue=fail&id=" + id+"&remark="+remark);
			art.dialog.alert("审核成功");
		}else{
			art.dialog.alert("请填写审核意见");
		}
	});*/
	//审核拒绝
	$("#fail").on("click",function(){
		var remark=$("#remark").val();
		var id=$("#id").val();
		if(!checkRemark()){
			return false;
		}
		$.post(cxt + '/tryCustLoan/audit.do',{"id":id,"remark":remark,"statue":"fail"},function(data){
			if(data.success){
				artDialog.alert("审核成功",function(){
					$("#back2Index").click();
				});	
			}else{
				artDialog.alert(data.message);
			}
		},"json");
		$("#myModal").modal("hide");
		return false;
		/*if(checkRemark()){
		    util.navigate("/tryCustLoan/audit.do?statue=fail&id=" + id+"&remark="+remark);
			art.dialog.alert("审核成功");
		}else{
			art.dialog.alert("请填写审核意见");
		}*/
	});
	//弹出模态框
	$("#auditFail").on("click",function(){
		$("#myModal").modal("show");
	});
	if(op == const_op_view){//查看时不可修改
		$('input,select,radio').prop("disabled",true);
		$('#form-save-btn').hide();
		$('.view-hidden').hide();
		//如果已经审核过了,就隐藏按钮
		//先拿到状态值
		//console.log($('#checkStatus').val());
		if($('#checkStatus').val()!=1){
			$('.btn_audit').hide();
		}
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
	var r = cxt + '/tryCustLoan/tryCustLoanList.do';
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
		formUrl = cxt + "/tryCustLoan/addTryCustLoan.do";
	}else if(op == const_op_update){
		formUrl = cxt + "/tryCustLoan/updateTryCustLoan.do";
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
	/**
	 * 校验姓名
	 */
	$("#name").formValidator({onFocus:"请输入姓名",onCorrect:"&nbsp;",tipCss:tipCss,onShow:"&nbsp;"})
	.inputValidator({min:1,onError:"姓名不能为空"});
	/**
	 * 校验手机号码
	 */
	$("#tel").formValidator({
		onFocus:"请输入手机号",
		onCorrect:"&nbsp;",
		tipCss:tipCss,
		onShow:"&nbsp;"
	}).inputValidator({
		min:11,
		onError:"电话号码为11位数"
	}).inputValidator({
		max:11,
		onError:"电话号码为11位数"
	}).regexValidator({        
		regExp:regexEnum.num1,             
		onError:"请输入正确的电话号码"      
	});
	/**
	 * 校验身份证地址
	 */
	$("#idAddress").formValidator({onFocus:"请输入身份证地址",onCorrect:"&nbsp;",tipCss:tipCss,onShow:"&nbsp;"})
	.inputValidator({min:1,onError:"身份证地址不能为空"}).inputValidator({
		max:200,
		onError:"地址不能超过200个字符"
	});
	/**
	 * 校验现居住地
	 */
	$("#nowAddress").formValidator({onFocus:"请输入现居住地",onCorrect:"&nbsp;",tipCss:tipCss,onShow:"&nbsp;"})
	.inputValidator({min:1,onError:"现居住地不能为空"}).inputValidator({
		max:200,
		onError:"地址不能超过200个字符"
	});
	/**
	 * 校验年龄
	 */
	$("#age").formValidator({onFocus:"请输入年龄",onCorrect:"&nbsp;",tipCss:tipCss,onShow:"&nbsp;"})
	.inputValidator({min:1,onError:"年龄不能为空"}).inputValidator({
		max:3,
		onError:"年龄不能超过3个字符"
	}).regexValidator({        
		regExp:regexEnum.age,             
		onError:"请输入正确的年龄范围16-150岁"     
	});
	/**
	 * 校验借款金额
	 */
	$("#amount").formValidator({onFocus:"请输入借款金额",onCorrect:"&nbsp;",tipCss:tipCss,onShow:"&nbsp;"})
	.inputValidator({min:1,onError:"借款金额不能为空"}).inputValidator({
		max:22,
		onError:"借款金额不能超过22个字符"
	})
	.regexValidator({          
		regExp:regexEnum.amount,          
		onError:"金额,必须是2位小数数值"      
	});
	/**
	 * 校验贷款用途
	 */
	$("#loanUse").formValidator({onFocus:"请输入贷款用途",onCorrect:"&nbsp;",tipCss:tipCss,onShow:"&nbsp;"})
	.inputValidator({min:1,onError:"贷款用途不能为空"}).inputValidator({
		max:100,
		onError:"贷款用途不能超过100个字符"
	});
	/**
	 * 校验借款期限(天)
	 */
	$("#loanTerm").formValidator({onFocus:"请输入借款期限(天)",onCorrect:"&nbsp;",tipCss:tipCss,onShow:"&nbsp;"})
	.inputValidator({min:1,onError:"借款期限(天)不能为空"}).inputValidator({
		max:11,
		onError:"期限(天)不能超过11个字符"
	})
	.regexValidator({          
		regExp:regexEnum.num1,             
		onError:"期限(天),必须是正数"      
	});
	/**
	 * 校验还款来源
	 */
	$("#repaymentSource").formValidator({onFocus:"请输入还款来源",onCorrect:"&nbsp;",tipCss:tipCss,onShow:"&nbsp;"})
	.inputValidator({min:1,onError:"还款来源不能为空"}).inputValidator({
		max:100,
		onError:"还款来源不能超过100个字符"
	});
}
//审核意见校验-不超过200字
function checkRemark(){
	var remark = $("#remark").val();
	if(!remark){
		art.dialog.alert("请填写审核意见");
		return false
	}
	if(remark.length > 200){
		art.dialog.alert("审核意见在200字以内");
		return false
	}
	return true;
}
