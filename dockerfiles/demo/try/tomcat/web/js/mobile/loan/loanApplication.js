$(document).ready(function() {
	$('.pop_tip').hide();//隐藏提示框
	$('#name').change(function() {
		checkName();
	});
	$('#tel').change(function() {
		checkTel();
	});
	$('#idAddress').change(function() {
		checkIdAddress();
	});
	$('#nowAddress').change(function() {
		checkNowAddress();
	});
	$('#person_amount').change(function() {
		checkAmount();
	});
	$('#person_loanTerm').change(function() {
		checkLoanTerm();
	});
	$("#companyName").change(function(){
		checkCompanyName();
	});
	$("#nameCompany").change(function(){
		checkNameCompany();
	});
	$("#telCompany").change(function(){
		checkTelCompany();
	});
	$("#registerAddress").change(function(){
		checkRegisterAddress();
	});
	$("#officeAddress").change(function(){
		checkOfficeAddress();
	});
	$("#enterprise_amount").change(function(){
		checkAmountEnterprise();
	});
	$("#enterprise_loanTerm").change(function(){
		checkLoanTermEnterprise();
	});
	
	$("input").click(function(){
		$(".errorInfo").text("");
	});
	
	//个人贷款提交
	$("#person_submit").on("click",function(){
		if(checkName()&&checkTel()&&checkIdAddress()&&checkNowAddress()&&checkAmount()&&checkLoanTerm()&&personCheckCheckCode()){
			var formData = $("#person_form").serializeArray();
			$.ajax({
				type:'post',
				url:cxt + '/loanApplication/submit.do',
				dataType:'json',
				data:formData,
				success:function(data){
					if(data.success){
						location.href = cxt + "/loanApplication/successLoan/"+data.loanId+".do";
						//location.href = cxt + "/index/indexList.do";
					}else{
						$(".errorInfo").text(data.message);
					}
				},
				error:function(result){
					$(".errorInfo").text("服务器异常");
				}
			});
		}
	});
	
	//企业贷款提交
	$("#enterprise_submit").on("click",function(){
		if(checkCompanyName()&&checkNameCompany()&&checkTelCompany()&&checkRegisterAddress()&&checkOfficeAddress()&&checkAmountEnterprise()&&checkLoanTermEnterprise()&&checkCheckCodeEnterprise()){
			var formData = $("#enterprise_form").serializeArray();
			$.ajax({
				type:'post',
				url:cxt + '/loanApplication/submit.do',
				dataType:'json',
				data:formData,
				success:function(data){
					if(data.success){
						location.href = cxt + "/loanApplication/successLoan/"+data.loanId+".do";
					}else{
						$(".errorInfo").text(data.message);
					}
				},
				error:function(result){
					$(".errorInfo").text("服务器异常");
				}
			});
		}
	});
	
	
	
	
});
//检验电话
function checkTel(){
	var mobile = $("#tel").val();
	//var pattern = /0?(13|14|15|18)[0-9]{9}/;
	var pattern = /^\d+$/;
	if(!mobile){
		$("#tel").addClass("in_active");
		$("#telText").show();
		$("#telText p:first").text("手机号不能为空!");
		return false;
	}
	if(mobile.length!=11){
		$("#tel").addClass("in_active");
		$("#telText").show();
		$("#telText p:first").text("手机号码为11位");
		return false
	}
	if(!pattern.test(mobile)){
		$("#tel").addClass("in_active");
		$("#telText").show();
		$("#telText p:first").text("请输入正确的手机号!");
		return false;
	}
	$("#telText").hide();
	$("#tel").removeClass("in_active");
	return true;
}
//检验姓名是否为空
function checkName(){
	var name = $("#name").val();
	if(!name){
		$("#name").addClass("in_active");
		$("#nameText").show();
		$("#nameText p:first").text("姓名不能为空!");
		return false;
	}
	$("#nameText").hide();
	$("#name").removeClass("in_active");
	return true;
}
//检验身份证地址是否为空
function checkIdAddress(){
	var idAddress = $("#idAddress").val();
	if(!idAddress){
		$("#idAddress").addClass("in_active");
		$("#idAddressText").show();
		$("#idAddressText p:first").text("身份证地址不能为空!");
		return false;
	}
	$("#idAddressText").hide();
	$("#idAddress").removeClass("in_active");
	return true;
}
//检验现居住地址是否为空
function checkNowAddress(){
	var nowAddress = $("#nowAddress").val();
	if(!nowAddress){
		$("#nowAddress").addClass("in_active");
		$("#nowAddressText").show();
		$("#nowAddressText p:first").text("现居住地址不能为空!");
		return false;
	}
	$("#nowAddressText").hide();
	$("#nowAddress").removeClass("in_active");
	return true;
}
//检验拟借金额(个人贷款)
function checkAmount(){
	var amount = $("#person_amount").val();
	var pattern = /^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/;
	if(!amount){
		$("#person_amount").addClass("in_active");
		$("#person_amountText").show();
		$("#person_amountText p:first").text("拟借金额不能为空!");
		return false;
	}
	if(!pattern.test(amount)){
		$("#person_amount").addClass("in_active");
		$("#person_amountText").show();
		$("#person_amountText p:first").text("金额格式不对!");
		return false
	}
	$("#person_amountText").hide();
	$("#person_amount").removeClass("in_active");
	return true;
}

//检验借款期限( 个人贷款)
function checkLoanTerm(){
	var loanTerm = $("#person_loanTerm").val();
	var pattern = /^[1-9]\d*$/;
	if(!loanTerm){
		$("#person_loanTerm").addClass("in_active");
		$("#person_loanTermText").show();
		$("#person_loanTermText p:first").text("借款期限不能为空!");
		return false;
	}
	if(!pattern.test(loanTerm)){
		$("#person_loanTerm").addClass("in_active");
		$("#person_loanTermText").show();
		$("#person_loanTermText p:first").text("借款期限必须是正整数!");
		return false
	}
	$("#person_loanTermText").hide();
	$("#person_loanTerm").removeClass("in_active");
	return true;
}


//检验验证码
function personCheckCheckCode(){
	var checkCode = $("#person_checkCode").val();
	if(!checkCode){
		$("#person_checkCode").addClass("in_active");
		$("#person_checkCodeText").show();
		$("#person_checkCodeText p:first").text("验证码不能为空!");
		return false;
	}
	$("#person_checkCodeText").hide();
	$("#person_checkCode").removeClass("in_active");
	return true;
}


/******************企业***************/
//检验电话
function checkTelCompany(){
	var mobile = $("#telCompany").val();
	//var pattern = /0?(13|14|15|18)[0-9]{9}/;
	var pattern = /^\d+$/;
	if(!mobile){
		$("#telCompany").addClass("in_active");
		$("#telCompanyText").show();
		$("#telCompanyText p:first").text("手机号不能为空!");
		return false;
	}
	if(mobile.length!=11){
		$("#telCompany").addClass("in_active");
		$("#telCompanyText").show();
		$("#telCompanyText p:first").text("手机号码为11位");
		return false
	}
	if(!pattern.test(mobile)){
		$("#telCompany").addClass("in_active");
		$("#telCompanyText").show();
		$("#telCompanyText p:first").text("请输入正确的手机号!");
		return false;
	}
	$("#telCompanyText").hide();
	$("#telCompany").removeClass("in_active");
	return true;
}

//检验企业名称是否为空
function checkCompanyName(){
	var companyName = $("#companyName").val();
	if(!companyName){
		$("#companyName").addClass("in_active");
		$("#companyNameText").show();
		$("#companyNameText p:first").text("企业名称不能为空!");
		return false;
	}
	$("#companyNameText").hide();
	$("#companyName").removeClass("in_active");
	return true;
}
//检验姓名是否为空
function checkNameCompany(){
	var name = $("#nameCompany").val();
	if(!name){
		$("#nameCompany").addClass("in_active");
		$("#nameCompanyText").show();
		$("#nameCompanyText p:first").text("姓名不能为空!");
		return false;
	}
	$("#nameCompanyText").hide();
	$("#nameCompany").removeClass("in_active");
	return true;
}


//检验公司注册地址是否为空
function checkRegisterAddress(){
	var registerAddress = $("#registerAddress").val();
	if(!registerAddress){
		$("#registerAddress").addClass("in_active");
		$("#registerAddressText").show();
		$("#registerAddressText p:first").text("公司注册地址不能为空!");
		return false;
	}
	$("#registerAddressText").hide();
	$("#registerAddress").removeClass("in_active");
	return true;
}
//检验公司办公地址是否为空
function checkOfficeAddress(){
	var officeAddress = $("#officeAddress").val();
	if(!officeAddress){
		$("#officeAddress").addClass("in_active");
		$("#officeAddressText").show();
		$("#officeAddressText p:first").text("公司办公地址不能为空!");
		return false;
	}
	$("#officeAddressText").hide();
	$("#officeAddress").removeClass("in_active");
	return true;
}


//检验拟借金额(企业)
function checkAmountEnterprise(){
	var amount = $("#enterprise_amount").val();
	var pattern = /^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/;
	if(!amount){
		$("#enterprise_amount").addClass("in_active");
		$("#enterprise_amountText").show();
		$("#enterprise_amountText p:first").text("拟借金额不能为空!");
		return false;
	}
	if(!pattern.test(amount)){
		$("#enterprise_amount").addClass("in_active");
		$("#enterprise_amountText").show();
		$("#enterprise_amountText p:first").text("金额格式不对!");
		return false
	}
	$("#enterprise_amountText").hide();
	$("#enterprise_amount").removeClass("in_active");
	return true;
}

//检验借款期限(企业)
function checkLoanTermEnterprise(){
	var loanTerm = $("#enterprise_loanTerm").val();
	var pattern = /^[1-9]\d*$/;
	if(!loanTerm){
		$("#enterprise_loanTerm").addClass("in_active");
		$("#enterprise_loanTermText").show();
		$("#enterprise_loanTermText p:first").text("借款期限不能为空!");
		return false;
	}
	if(!pattern.test(loanTerm)){
		$("#enterprise_loanTerm").addClass("in_active");
		$("#enterprise_loanTermText").show();
		$("#enterprise_loanTermText p:first").text("借款期限必须是正整数!");
		return false
	}
	$("#enterprise_loanTermText").hide();
	$("#enterprise_loanTerm").removeClass("in_active");
	return true;
}

//检验验证码
function checkCheckCodeEnterprise(){
	var checkCode = $("#enterprise_checkCode").val();
	if(!checkCode){
		$("#enterprise_checkCode").addClass("in_active");
		$("#enterprise_checkCodeText").show();
		$("#enterprise_checkCodeText p:first").text("验证码不能为空!");
		return false;
	}
	$("#enterprise_checkCodeText").hide();
	$("#enterprise_checkCode").removeClass("in_active");
	return true;
}

//验证码刷新
function changeImg(obj){
	var imgHeight = 88;
    var imgWidth = 30;
	var codeLen  = 4;
	
	$("#"+obj.id).attr("src",cxt + "/login/getCode.do?"+Math.random()+"&imgHeight="+imgHeight+"&imgWidth="+imgWidth+"&codeLen="+codeLen);
}