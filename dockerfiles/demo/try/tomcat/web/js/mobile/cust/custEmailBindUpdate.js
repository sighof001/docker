$(function(){
	
	$('input[name=email]').change(function() {
		checkEmail();
	});
	
	//输入时,错误提示隐藏
	$("input").on('input',function(e){  
		$("#desc").hide();
		$("#desc label").text("");
	});  
	
	//确定
	$(".btn-submit2").on("click",function(){
		var email = $("#email").val();
		if(!email){
			$("#desc").show();
			$("#desc label").text("邮箱不能为空!");
			return;
		}
		if(checkEmail()){
				var formData = $("#form").serializeArray();
				$.ajax({
					type:'post',
					url: cxt + '/sendEmail/sendEmail.do',
					data:formData,
					dataType:'json',
					beforeSend:beforeSend,
					success:function(data){
						if(data.success){
							location.href = cxt + "/myAccountPwd/updateEmailSuccess.do";
						}else{
							$("#desc").show();
							$("#desc label").text(data.message);
						}
						
					},
					error:function(result){
						$("#desc").show();
						$("#desc label").text("服务器异常!");
	                },
	                complete:complete
				});
			
		}
		
	});	
});


//去掉前后空格 
function trim(str) {
    var strnew = str.replace(/^\s*|\s*$/g, "");  
    return strnew;  
}

//校验验证
function checkEmail(){
	var email = $("#email").val();
	var pattern = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
	
	if(!email){
		$("#desc").show();
		$("#desc label").text("邮箱不能为空!");
		return false;
	}
	if(!pattern.test(email)){
		$("#desc").show();
		$("#desc label").text("邮箱格式不正确,请重新输入");
		return false
	}
	return true;
}

