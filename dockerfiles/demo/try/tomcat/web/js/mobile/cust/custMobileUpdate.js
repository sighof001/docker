$(function(){
	$('input[name=mobile]').change(function() {
		checkOldMobile();
	});
	/*$('input[name=mobile]').keyup(function() {
		checkMobile();
	});*/
	
	
	//输入时,错误提示隐藏
	$("input").on('input',function(e){  
		$("#desc").hide();
		$("#desc label").text("");
	});  
	
	//确定
	$(".btn-submit2").on("click",function(){
		var oldMobile = $("#mobile").val();
		if(!oldMobile){
			$("#desc").show();
			$("#desc label").text("手机号不正确,请重新输入!");
			return;
		}
		if(checkCode()){
				var formData = $("#form").serializeArray();
				$.ajax({
					type:'post',
					url: cxt + '/myAccountPwd/updateMobile.do',
					data:formData,
					dataType:'json',
					success:function(data){
						if(data.success){
							location.href = cxt + "/myAccountPwd/updateMobileNewList.do";
						}else{
							$("#desc").show();
							$("#desc label").text(data.message);
						}
						
					},
					error:function(result){
						$("#desc").show();
						$("#desc label").text("服务器异常!");
	                }
				});
			
		}
		
	});
	
	
	//获取验证码
	$('.getvalid').on("click",function(){
		 //拿到
		//if (checkPhoneNum()) {
        var mobile = $("#mobile").val();
		var _this = $(this);
		var wait=60;
		if (mobile){
		$.ajax({
            type:'POST',
            dataType:'JSON',
			data:{'phoneNumber':mobile,"type":"tel"},
			url:cxt + '/sms/sendVerifyCode.do',
			success:function(data){
				if(data.success){
					 _this.prop("disabled",true);
						var count = 60;
						var timer = window.setInterval(function(){
							count--;
							if(count>=0){
								_this.text(count+"秒");
							}else{
								//关闭定时器
								window.clearInterval(timer);
								//重新发送
                             _this.text("重新发送");
								//设置按钮可按
                             _this.prop("disabled",false);
							}
						},1000)
				}else{
					$("#desc").show();
					$("#desc label").text(data.message);
				}
			}
		})
        }else {
        	$("#desc").show();
			$("#desc label").text("请输入手机号码");
		}
	});
	
	
});


//去掉前后空格 
function trim(str) {
    var strnew = str.replace(/^\s*|\s*$/g, "");  
    return strnew;  
}

//校验验证码
function checkCode(){
	var verifyCode=$('input[name=checkCode]').val();
	if(!verifyCode){
		$("#desc").show();
		$("#desc label").text("验证码不能为空!");
		return false;
	}
	return true;
}


//校验原手机号
function checkOldMobile(){
	
	var oldMobile = $("#mobile").val();
	//var pattern = /0?(13|14|15|18)[0-9]{9}/;
	var pattern = /^\d+$/;
	if(!oldMobile){
		$("#desc").show();
		$("#desc label").text("手机号不能为空!");
		$('.getvalid').prop("disabled",true);
		return false;
	}
	if(oldMobile.length!=11){
		$("#desc").show();
		$("#desc label").text("手机号码为11位");
		$('.getvalid').prop("disabled",true);
		return false
	}
	if(!pattern.test(oldMobile)){
		$("#desc").show();
		$("#desc label").text("请输入正确的手机号!");
		$('.getvalid').prop("disabled",true);
		return false;
	}
	$.ajax({
		type:'post',
		url:cxt + '/bank/checkMobile.do',
		data:{'mobile':trim(oldMobile)},
		dataType:'json',
		success:function(data){
			if(!data.success){
				$("#desc").show();
				$("#desc label").text(data.message);
				$('.getvalid').prop("disabled",true);
				return false;
			}else{
				$('.getvalid').prop("disabled",false);
				return true;
			}
		}
	});
	//$('.getvalid').prop("disabled",false);
}
//校验新手机号
/*function checkMobile(){
	var mobile = $("#mobile").val();
	var pattern = /0?(13|14|15|18)[0-9]{9}/;
	if(!mobile){
		$("#desc").show();
		$("#desc label").text("手机号不能为空!");
		$('.getvalid').prop("disabled",true);
		return false;
	}
	if(!pattern.test(mobile)){
		$("#desc").show();
		$("#desc label").text("请输入正确的手机号!");
		$('.getvalid').prop("disabled",true);
		return false;
	}
	$.ajax({
		type:'post',
		url:cxt + '/myAccountPwd/checkOnlyMobile.do',
		data:{'mobile':trim(mobile)},
		dataType:'json',
		success:function(data){
			if(!data.success){
				$("#desc").show();
				$("#desc label").text("手机号已被注册,请重新输入!");
				$('.getvalid').prop("disabled",true);
				return false;
			}else{
				return true;
			}
			
		}
	});
	$('.getvalid').prop("disabled",false);
	return true;
}*/
