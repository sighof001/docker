$(function(){	
	
	initValidator();
	
	$('#save-btn').click(function(){
		var length = $("input[type='checkbox']:checked").length;
		if(length <= 0){
			art.dialog.alert("必须至少勾选一项");
			return false;
		}
		
		$('#edit-form').submit();
	});
	
});

function returnPage(){
	var r = cxt + '/tryCustInfo/tryCustInfoList.do';
	
	location.href = r;
}



function initValidator(){
	$.formValidator.initConfig({
		//mode:"AutoTip",
		mode:"FixTip",
		formID:"edit-form",
		ajaxForm:{
			type : "POST",
			dataType : "json",
			buttons:$("#save-btn"),
			url: cxt + "/tryCustTypeGoodsType/tryCustTypeGoodsTypeSubimt.do",
			beforeSend: function() {
				art.dialog.through({
					id: 'broadcastLoading',
					title: false,
				    content: '<img src="' + cxt + '/image/common/loading.gif" />',
				    lock: true
				});
			},
			error: function(a, b) {
				art.dialog.list['broadcastLoading'].close();
				art.dialog.alert("保存失败！");
				return false;
			},
			success: function(data) {
				art.dialog.list['broadcastLoading'].close();
				if(data.success){
					$("#success-hint").removeClass("hidden");
					$("#error-hint").addClass("hidden");
					$("#success-hint").html('保存成功');
				}else{
					$("#success-hint").addClass("hidden");
					$("#error-hint").removeClass("hidden");
					$("#error-hint").empty();
					$("#error-hint").html('保存失败:' + data.message);
				}
				return true;
			}
		}
	});
}