$(document).ready(function() {
	getCookie("loginId","password");
	//检验登录名称是否为空
	function checkUserName(){
		var item = $("#pub_loginId");
		if(!item.val()){
	//		$('.error').text('');
//			$("#pub_loginIdText").text("用户不能为空!");
			$(".error_pub").text("用户不能为空!");
			item.focus();
			return false;
		}
		$(".error_pub").text("");
		return true;
		
	}

	//校验密码是否为空
	function checkPassWord(){
		var item = $("#pub_password");
		if(!item.val()){
//			$("#pub_passwordText").text("密码不能为空!");
			$(".error_pub").text("密码不能为空!");
			item.focus();
			return false;
		}
		$(".error_pub").text("");
		return true;
	}

	//校验验证码
	function checkCode(){
		var item = $('#pub_checkCode');
		if(item.val() == ''){
//			$("#pub_checkCodeText").text("验证码不能为空!");
			$(".error_pub").text("验证码不能为空!");
			item.focus();
			return false;
		}
		$(".error_pub").text("");
		return true;
	}
	
	function checkInput(){
		return checkUserName() && checkPassWord() && checkCode();
	}
	
	//登录
	$("#pub_submit").on("click",function(){
		if(!checkInput()){
			return false;
		}

//		var formData = $("#pub_login_form").serializeArray();
		var formData = {};
		formData.loginId = $('#pub_loginId').val();
		formData.password = $('#pub_password').val();
		formData.checkCode = $('#pub_checkCode').val();
		
		$.ajax({
			type:'post',
			url:cxt + '/login/login.do',
			dataType:'json',
			data:formData,
			success:function(data){
				if(data.success){
					setCookie("loginId",formData.loginId);
					location.href = cxt + "/index/pcIndexList.do";
				}else{
					$(".error_pub").text(data.message);
					$("#pub_loginId").focus();
					$("#pub_codeImg").click();
				}
			},
			error:function(result){
				$(".error_pub").text("服务器异常!");
			}
		});
	});
});

//验证码刷新
function changeImg(obj){
	var imgHeight = 96;
    var imgWidth = 34;
	var codeLen  = 4;
	
	$("#"+obj.id).attr("src",cxt + "/login/getCode.do?"+Math.random()+"&imgHeight="+imgHeight+"&imgWidth="+imgWidth+"&codeLen="+codeLen);
}
//设置cookie,保存30天
function setCookie(name,value){
	var Days = 30;
	var exp = new Date();
	exp.setTime(exp.getTime() + Days*24*60*60*1000);
	document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString()
//	document.cookie = c_password + "="+ escape (pValue) + ";expires=" + exp.toGMTString()
}
//获取cookie
function getCookie(name){
	var arr = '';
	var arr2 = '';
	reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
//	reg2=new RegExp("(^| )"+password+"=([^;]*)(;|$)");
	if(arr=document.cookie.match(reg)){
//		arr2=document.cookie.match(reg2);
		$("#pub_loginId").val(arr[2]);
//		$("#pub_password").val(arr2[2]);
		//return unescape(arr[2]);
	}else{
		return null;
	}
}