$(document).ready(function() {
	getCookie("loginId");
	//登录
	$("#submit").on("click",function(){
		if(!checkInput()){
			return false;
		}
		var loginId = $("#loginId").val();
		var password = $("#password").val();
		var formData = $("#login_form").serializeArray();
		$.ajax({
			type:'post',
			url:cxt + '/login/login.do',
			dataType:'json',
			data:formData,
			success:function(data){
				if(data.success){
					setCookie("loginId",loginId);
					location.href = cxt + "/index/pcIndexList.do";
				}else{
					tryModel.alert(data.message);
					$("#codeImg").click();
				}
			},
			error:function(result){
				tryModel.alert("服务器异常!");
			}
		});
		
	});
});


//检验登录名称是否为空
function checkUserName(){
	var loginId = $("#loginId").val();
	if(!loginId){
		$("#loginIdText").text("用户不能为空!");
		return false;
	}
	$("#loginIdText").text("");
	return true;
	
}

//校验密码是否为空
function checkPassWord(){
	var password = $("#password").val();
	if(!password){
		$("#passwordText").text("密码不能为空!");
		return false;
	}
	$("#passwordText").text("");
	return true;
}
//校验验证码
function checkCode(){
	var item = $('#checkCode');
	if(item.val() == ''){
		$("#checkCodeText").text("验证码不能为空!");
		item.focus();
		return false;
	}
	$("#checkCodeText").text("");
	return true;
}

function checkInput(){
	return checkUserName() && checkPassWord() && checkCode();
}

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
	//reg2=new RegExp("(^| )"+password+"=([^;]*)(;|$)");
	if(arr=document.cookie.match(reg)){
		//arr2=document.cookie.match(reg2);
		$("#loginId").val(arr[2]);
		//$("#password").val(arr2[2]);
		//return unescape(arr[2]);
	}else{
		return null;
	}
}