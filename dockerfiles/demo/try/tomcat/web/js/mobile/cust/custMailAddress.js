$(function(){
	$('input[name=mailAddress]').change(function() {
		checkMailAddress();
	});
	//确定
	$(".btn-submit2").on("click",function(){
		if(checkMailAddress()){
			var formData = $("#form").serializeArray();
			$.ajax({
				type:'post',
				url:cxt + '/personal/updateMailAddress.do',
				dataType:'json',
				data:formData,
				success:function(data){
					if(data.success){
						location.href = cxt + "/personal/personalInfo.do";
					//window.history.back(-1); 
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
function checkMailAddress(){
	var mailAddress = $("#mailAddress").val();
	if(mailAddress&&mailAddress.length > 100){
		$("#desc").show();
		$("#desc label").text("邮寄地址的字数不得超过100字");
		return false
	}
//	if(mailAddress&&mailAddress.length < 5){
//		$("#desc").show();
//		$("#desc label").text("邮寄地址的字数不得低于5字");
//		return false
//	}
	return true;
}
