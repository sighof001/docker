$(function(){
	//获取cookie
	getCookie("loginId");
	$(".inputtxt").on("click",function(){
		$("#desc label").text("");
	});
	
	//登录
	$(".btn-submit2").on("click",function(){
		//设置cookie
		var loginId = $("#loginId").val();
		var password = $("#password").val();
		//setCookie("password",password);
		if(checkUserName() && checkPassWord() && checkCode()){
			var formData = $("#form").serializeArray();
			$.ajax({
				type:'post',
				url:cxt + '/login/login.do',
				dataType:'json',
				data:formData,
				success:function(data){
					if(data.success){
						setCookie("loginId",loginId);
						location.href = cxt + "/index/indexList.do";
					}else{
						$("#desc").show();
						$("#desc label").text(data.message);
						$("#imgCode").click();
					}
				},
				error:function(result){
					$("#desc").show();
					$("#desc label").text("服务器异常!");
				}
			});
		}
		
	});
	
	
	//预览密码
	var flag = "1";
	$('#showPwd').on("click",function(){
		if(flag == "1"){
			$("#password").attr("type","test");
			flag = "2";
		}else{
			$("#password").attr("type","password");
			flag = "1";
		}
		
	});
	
	
	
});


//检验登录名称是否为空
function checkUserName(){
	var loginId = $("#loginId").val();
	if(!loginId){
		$("#desc").show();
		$("#desc label").text("用户不能为空!");
		return false;
	}
	$("#desc label").text("");
	return true;
	
}

//校验密码是否为空
function checkPassWord(){
	var password = $("#password").val();
	if(!password){
		$("#desc").show();
		$("#desc label").text("密码不能为空!");
		return false;
	}
	$("#desc label").text("");
	return true;
}

//校验验证码
function checkCode(){
	var code = $("#checkCode").val();
	if(!code){
		$("#desc").show();
		$("#desc label").text("验证码不能为空!");
		return false;
	}
	$("#desc label").text("");
	return true;
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
//	reg2=new RegExp("(^| )"+password+"=([^;]*)(;|$)");
	if(arr=document.cookie.match(reg)){
//		arr2=document.cookie.match(reg2);
		$("#loginId").val(arr[2]);
//		$("#password").val(arr2[2]);
		//return unescape(arr[2]);
	}else{
		return null;
	}
}