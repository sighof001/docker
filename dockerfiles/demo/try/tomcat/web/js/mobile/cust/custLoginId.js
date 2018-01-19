$(function(){
	$('input[name=loginId]').change(function() {
		checkLoginId();
		var loginId = $("#loginId").val();
		$.ajax({
			type:'post',
			url:cxt + '/myAccountPwd/checkLoginId.do',
			data:{'loginId':trim(loginId)},
			dataType:'json',
			success:function(data){
				if(!data.success){
					$("#desc").show();
					$("#desc label").text("用户名已存在,请重新输入!");
					return false;
				}else{
					return true;
				}
				
			}
		});
	});
	//确定
	$(".btn-submit2").on("click",function(){
		var loginId = $("#loginId").val();
		if(!loginId){
			$("#desc").show();
			$("#desc label").text("用户名不能为空!");
			return false
		}
		if(checkLoginId()){
			var formData = $("#form").serializeArray();
			$.ajax({
				type:'post',
				url:cxt + '/myAccountPwd/updateLoginIdSubmit.do',
				dataType:'json',
				data:formData,
				success:function(data){
					if(data.success){
						location.href = cxt + "/myView/passwordUpdate.do";
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
});




//校验昵称
function checkLoginId(){
	var loginId = $("#loginId").val();
	var pattern = /^[a-zA-z][a-zA-Z0-9_]{4,16}$/;
	if(!loginId){
		$("#desc").show();
		$("#desc label").text("用户名不能为空!");
		return false
	}
	if(loginId.length > 16||loginId.length < 5){
		$("#desc").show();
		$("#desc label").text("用户名长度范围5-16");
		return false
	}
	if(!pattern.test(loginId)){
		$("#desc").show();
		$("#desc label").text("必须由字母开头,由数字、字母或下划线组成!");
		return false
	}
	return true;
}
