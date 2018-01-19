$(document).ready(function() {
	locationIndex(tabView.commonwealTabView);//导航栏定位
	$('#name').change(function() {
		checkName();
	});
	$('#tel').change(function() {
		checkTel();
	});
	$('input[name=idAddress]').change(function() {
		checkIdAddress();
	});
	$('input[name=job]').change(function() {
		checkJob();
	});
	$('input[name=nowAddress]').change(function() {
		checkNowAddress();
	});
	$('input[name=age]').change(function() {
		checkAge();
	});
	$('#amount').change(function() {
		checkAmount();
		
	});
	$('#loanUse').change(function() {
		checkLoanUse();
	});
	$('#loanTerm').change(function() {
		checkLoanTerm();
	});
	$('#repaymentSource').change(function() {
		checkRepaymentSource();
	});
	$('#checkCode').change(function() {
		checkCheckCode()
	});
	$('input[name=companyName]').change(function() {
		checkCompanyName();
	});
	$('input[name=industry]').change(function() {
		checkIndustry();
	});
	$('input[name=registerAddress]').change(function() {
		checkRegisterAddress();
	});
	$('input[name=officeAddress]').change(function() {
		checkOfficeAddress();
	});
	$('input[name=years]').change(function() {
		checkYears();
	});
	$('#amountCompany').change(function() {
		checkAmountCompany();
	});
	$('#loanUseCompany').change(function() {
		checkLoanUseCompany();
	});
	$('#loanTermCompany').change(function() {
		checkLoanTermCompany();
	});
	$('#repaymentSourceCompany').change(function() {
		checkRepaymentSourceCompany();
	});
	$('#checkCodeCompany').change(function() {
		checkCheckCodeCompany()
	});
	
	//个人贷款提交
	$("#personSubmit").on("click",function(){
		if(checkName()&&checkTel()&&checkJob()&&checkIdAddress()&&checkNowAddress()&&checkAge()&&checkAmount()&&checkLoanUse()&&checkLoanTerm()&&checkRepaymentSource()&&checkCheckCode()){
			var formData = $("#person").serializeArray();
			$.ajax({
				type:'post',
				url:cxt + '/loanApplication/submitFP.do',
				dataType:'json',
				data:formData,
				success:function(data){
					if(data.success){
						location.href = cxt + "/loanApplication/pcLoanApplicationViewResult.do";
						//alert(1);
					}else{
						tryModel.alert(data.message);
					}
				},
				error:function(result){
					tryModel.alert("服务器异常");
				}
			});
		}
	});
	//企业贷款提交
	$("#companySubmit").on("click",function(){
		if(checkCompanyName()&&checkIndustry()&&checkRegisterAddress()&&checkOfficeAddress()&&checkYears()&&checkAmountCompany()&&checkLoanUseCompany()&&checkLoanTermCompany()&&checkRepaymentSourceCompany()&&checkCheckCodeCompany()){
			var formData = $("#company").serializeArray();
			$.ajax({
				type:'post',
				url:cxt + '/loanApplication/submitFP.do',
				dataType:'json',
				data:formData,
				success:function(data){
					if(data.success){
						location.href = cxt + "/loanApplication/pcLoanApplicationViewResult.do";
						//alert(1);
					}else{
						tryModel.alert(data.message);
					}
				},
				error:function(result){
					tryModel.alert("服务器异常");
				}
			});
		}
	});
});
//检验名称是否为空
function checkName(){
	var name = $("#name").val();
	if(!name){
		$("#nameText").text("姓名不能为空!");
		return false;
	}
	$("#nameText").text("");
	return true;
}
function checkTel(){
	var mobile = $("#tel").val();
	//var pattern = /0?(13|14|15|18)[0-9]{9}/;
	var pattern = /^\d+$/;
	if(!mobile){
		$("#telText").text("手机号不能为空!");
		return false;
	}
	if(mobile.length!=11){
		$("#telText").text("手机号码为11位");
		return false
	}
	if(!pattern.test(mobile)){
		$("#telText").text("请输入正确的手机号!");
		return false;
	}
	$("#telText").text("");
	return true;
}
//检验职业是否为空
function checkJob(){
	var job = $("#job").val();
	if(!job){
		$("#jobText").text("请选择职业!");
		return false;
	}
	$("#jobText").text("");
	return true;
	
}
//检验身份证地址是否为空
function checkIdAddress(){
	var idAddress = $("#idAddress").val();
	if(!idAddress){
		$("#idAddressText").text("身份证地址不能为空!");
		return false;
	}
	$("#idAddressText").text("");
	return true;
}
//检验现居住地址是否为空
function checkNowAddress(){
	var nowAddress = $("#nowAddress").val();
	if(!nowAddress){
		$("#nowAddressText").text("现居住地址不能为空!");
		return false;
	}
	$("#nowAddressText").text("");
	return true;
}
//检验年龄是否为空
function checkAge(){
	var age = $("#age").val();
	if(!age){
		$("#ageText").text("请选择年龄!");
		return false;
	}
	$("#ageText").text("");
	return true;
	
}
//检验拟借金额
function checkAmount(){
	var amount = $("#amount").val();
	var pattern = /^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/;
	if(!amount){
		$("#amountText").text("拟借金额不能为空!");
		return false;
	}
	if(!pattern.test(amount)){
		$("#amountText").text("金额格式不对!");
		return false
	}
	$("#amountText").text("");
	return true;
}
//检验借款用途
function checkLoanUse(){
	var loanUse = $("#loanUse").val();
	if(!loanUse){
		$("#loanUseText").text("请选择借款用途!");
		return false;
	}
	$("#loanUseText").text("");
	return true;
	
}
//检验借款期限
function checkLoanTerm(){
	var loanTerm = $("#loanTerm").val();
	var pattern = /^[1-9]\d*$/;
	if(!loanTerm){
		$("#loanTermText").text("借款期限不能为空!");
		return false;
	}
	if(!pattern.test(loanTerm)){
		$("#loanTermText").text("借款期限必须是正整数!");
		return false
	}
	$("#loanTermText").text("");
	return true;
}
//检验还款来源
function checkRepaymentSource(){
	var repaymentSource = $("#repaymentSource").val();
	if(!repaymentSource){
		$("#repaymentSourceText").text("请选择还款来源!");
		return false;
	}
	$("#repaymentSourceText").text("");
	return true;
	
}
//检验验证码
function checkCheckCode(){
	var checkCode = $("#checkCode").val();
	if(!checkCode){
		$("#checkCodeText").text("验证码不能为空!");
		return false;
	}
	$("#checkCodeText").text("");
	return true;
}
//检验企业名称是否为空
function checkCompanyName(){
	var companyName = $("#companyName").val();
	if(!companyName){
		$("#companyNameText").text("企业名称不能为空!");
		return false;
	}
	$("#companyNameText").text("");
	return true;
}
//检验职业是否为空
function checkIndustry(){
	var industry = $("#industry").val();
	if(!industry){
		$("#industryText").text("请选择行业!");
		return false;
	}
	$("#industryText").text("");
	return true;
}
//检验公司注册地址是否为空
function checkRegisterAddress(){
	var registerAddress = $("#registerAddress").val();
	if(!registerAddress){
		$("#registerAddressText").text("公司注册地址不能为空!");
		return false;
	}
	$("#registerAddressText").text("");
	return true;
}
//检验公司办公地址是否为空
function checkOfficeAddress(){
	var officeAddress = $("#officeAddress").val();
	if(!officeAddress){
		$("#officeAddressText").text("公司办公地址不能为空!");
		return false;
	}
	$("#officeAddressText").text("");
	return true;
}
//检验成立年限
function checkYears(){
	var years = $("#years").val();
	if(!years){
		$("#yearsText").text("请选择成立年限!");
		return false;
	}
	$("#yearsText").text("");
	return true;
	
}
//检验拟借金额
function checkAmountCompany(){
	var amount = $("#amountCompany").val();
	var pattern = /^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/;
	if(!amount){
		$("#amountCompanyText").text("拟借金额不能为空!");
		return false;
	}
	if(!pattern.test(amount)){
		$("#amountCompanyText").text("金额格式不对!");
		return false
	}
	$("#amountCompanyText").text("");
	return true;
}
//检验借款用途
function checkLoanUseCompany(){
	var loanUse = $("#loanUseCompany").val();
	if(!loanUse){
		$("#loanUseCompanyText").text("请选择借款用途!");
		return false;
	}
	$("#loanUseCompanyText").text("");
	return true;
	
}
//检验借款期限
function checkLoanTermCompany(){
	var loanTerm = $("#loanTermCompany").val();
	var pattern = /^[1-9]\d*$/;
	if(!loanTerm){
		$("#loanTermCompanyText").text("借款期限不能为空!");
		return false;
	}
	if(!pattern.test(loanTerm)){
		$("#loanTermCompanyText").text("借款期限必须是正整数!");
		return false
	}
	$("#loanTermCompanyText").text("");
	return true;
}
//检验还款来源
function checkRepaymentSourceCompany(){
	var repaymentSource = $("#repaymentSourceCompany").val();
	if(!repaymentSource){
		$("#repaymentSourceCompanyText").text("请选择还款来源!");
		return false;
	}
	$("#repaymentSourceCompanyText").text("");
	return true;
	
}
//检验验证码
function checkCheckCodeCompany(){
	var checkCode = $("#checkCodeCompany").val();
	if(!checkCode){
		$("#checkCodeCompanyText").text("验证码不能为空!");
		return false;
	}
	$("#checkCodeCompanyText").text("");
	return true;
}

//验证码刷新
function changeImg(obj){
	var imgHeight = 96;
    var imgWidth = 34;
	var codeLen  = 4;
	
	$("#"+obj.id).attr("src",cxt + "/login/getCode.do?"+Math.random()+"&imgHeight="+imgHeight+"&imgWidth="+imgWidth+"&codeLen="+codeLen);
}