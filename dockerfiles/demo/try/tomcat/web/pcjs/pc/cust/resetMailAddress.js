$(function() {	
	// 提交
	$("#submit").on("click", function() {
		if (checkMailAddress()) {
			var formData = $("#form").serializeArray();
			$.ajax({
				type : 'post',
				url : cxt + '/personal/updateMailAddress.do',
				data : formData,
				dataType : 'json',
				success : function(data) {
					if (data.success) {
						$(".my_baseInfo").trigger("click");
					} else {
						tryModel.alert(data.message);
					}

				},
				error : function(result) {
					tryModel.alert("服务器异常!");
				}
			});
		}

	});
	
	
});
	
	
//校验地址长度
function checkMailAddress(){
	var mailAddress=$('#mailAddress').val();
//	if(!mailAddress){
//		$("#mailAddressText").text("邮寄地址不能为空!");
//		return false;
//	}
	if(mailAddress&&mailAddress.length>100){
		$("#mailAddressText").text("邮寄地址长度不能超过100字!");
		return false;
	}
	
	$("#mailAddressText").text("");
	return true;
}
