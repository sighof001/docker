var isSubmiting = false;
$(function(){
	//审核通过
	$("#auditPass").click(function(){
			var id=$("#id").val();
			art.dialog.confirm("确定审核通过吗？",function(){
				$.post(cxt + '/tryCheckRealAuth/audit.do',{id:id,"statue":"pass"},function(data){
					if(data.success){
						artDialog.alert("审核成功",function(){
							$('#back2Index').click();
						});
					}else{
						artDialog.alert(data.message);
					}
				},"json");
			});
	});
	//审核拒绝
	$("#fail").on("click",function(){
		var remark=$("#remark").val();
		var id=$("#id").val();
		if(!checkRemark()){
			return false;
		}
		$.post(cxt + '/tryCheckRealAuth/audit.do',{"id":id,"remark":remark,"statue":"fail"},function(data){
			if(data.success){
				artDialog.alert("审核成功",function(){
					$('#back2Index').click();
				});
			}else{
				artDialog.alert(data.message);
			}
		},"json");
		
		$("#myModal").modal("hide");
		return false;
		/*if(checkRemark()){
		    util.navigate("/tryCheckRealAuth/audit.do?statue=fail&id=" + id+"&remark="+remark);
			art.dialog.alert("审核成功");
		}else{
			art.dialog.alert("请填写审核意见");
		}*/
	});
	//弹出模态框
	$("#auditFail").on("click",function(){
		$("#myModal").modal("show");
	});
	/*$("#auditFail").click(function(){
		art.dialog.confirm("确定审核拒绝吗？",function(){
		util.navigate("/tryCheckRealAuth/audit.do?statue=fail&id="+$("#id").val());
		});
	});*/
	if(op == const_op_view){//查看时不可修改
		$('input,select,radio').prop("disabled",true);
		$('#form-save-btn').hide();
		$('.view-hidden').hide();
		//如果已经审核过了,就隐藏按钮
		//先拿到状态值
		console.log($('#authStatus').val());
		if($('#authStatus').val().substring(3,4) ==1||$('#authStatus').val().substring(3,4)==2){
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
	var r = cxt + '/tryCheckRealAuth/tryCheckRealAuthList.do';
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
		formUrl = cxt + "/tryCheckRealAuth/addTryCustInfo.do";
	}else if(op == const_op_update){
		formUrl = cxt + "/tryCheckRealAuth/updateTryCustInfo.do";
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
	$("#loginId").formValidator({
		onFocus:"请输入登录名",
		onCorrect:"&nbsp;",
		tipCss:tipCss
	}).inputValidator({
		min:1,
		onError:"登录名不能为空"
	}).inputValidator({
		max:10,
		onError:"登录名不能超过10个字符"
	}).regexValidator({          
		regExp:"^[0-9a-zA-Z]+$",             
		onError:"只能字母数字"      
	});
	
	$("#password").formValidator({
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
	});
	
	$("#realName").formValidator({
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
	});
	
	
	$("#nickName").formValidator({
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
	});
	
	$("#mobile").formValidator({
		onFocus:"请输入手机号",
		onCorrect:"&nbsp;",
		tipCss:tipCss
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
	
	$("#cardNumber").formValidator({
		onFocus:"请输入银行号",
		onCorrect:"&nbsp;",
		tipCss:tipCss
	}).inputValidator({
		min:1,
		onError:"银行号不能为空"
	}).inputValidator({
		max:20,
		onError:"姓名不能超过20个字符"
	}).regexValidator({        
		regExp:regexEnum.num1,             
		onError:"请输入正确银行号"      
	});
	
	$("#idCard").formValidator({
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
	});
	
	$("#payPassword").formValidator({
		onFocus:"请输入支付密码",
		onCorrect:"&nbsp;",
		tipCss:tipCss
	}).inputValidator({
		min:1,
		onError:"支付密码不能为空"
	}).inputValidator({
		max:18,
		onError:"支付密码不能超过18个字符"
	}).regexValidator({        
		regExp:regexEnum.username,             
		onError:"请输入正确的支付密码"      
	});
	
	
	$("#email").formValidator({
		onFocus:"请输入电子邮箱",
		onCorrect:"&nbsp;",
		tipCss:tipCss
	}).inputValidator({
		min:1,
		onError:"电子邮箱不能为空"
	}).inputValidator({
		max:18,
		onError:"电子邮箱不能超过18个字符"
	}).regexValidator({        
		regExp:regexEnum.email,             
		onError:"请输入正确的电子邮箱"      
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