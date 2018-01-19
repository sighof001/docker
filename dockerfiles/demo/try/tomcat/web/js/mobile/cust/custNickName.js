$(function(){
	$('input[name=nickName]').change(function() {
		checkNickName();
	});
	//确定
	$(".btn-submit2").on("click",function(){
		if(checkNickName()){
			var formData = $("#form").serializeArray();
			$.ajax({
				type:'post',
				url:cxt + '/personal/updateNickName.do',
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
function checkNickName(){
	var nickName = $("#nickName").val();
	if(nickName.length > 50){
		$("#desc").show();
		$("#desc label").text("昵称的字数不得超过50");
		return false
	}
	return true;
}
