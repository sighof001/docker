var regexEnum = {
	payPassReg:"^\\d{6}$",
	payPassTips:"支付密码格式不正确！由6位数字组成",
	passWordReg:"^(?![A-Z]*$)(?![a-z]*$)(?![0-9]*$)(?![^a-zA-Z0-9]*$)\\S{6,18}$",
	passWordTips:"密码格式不正确！由字母、数字、特殊字符最少两种组成"
}
var regexFunction = {
	regExpPassWord:function(passWord){
		var patt = new RegExp(regexEnum.passWordReg);
		return patt.test(passWord)
	},
	regExpPayPass:function(payPass){
		var patt = new RegExp(regexEnum.payPassReg);
		return patt.test(payPass)
	}
}
