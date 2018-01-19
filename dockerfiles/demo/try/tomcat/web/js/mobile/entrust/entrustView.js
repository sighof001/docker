$(function(){
	//监听电子保单
	$('#test').on("click",function(){
		var policyUpload=$('#policyUpload').val();
		if(!policyUpload){
			ybDialog.alert("暂未生成保单,请联系客服人员");
		}else{
			var id=$("#orderId").val();
			location.href = cxt + "/webEntrust/policyView/"+id+".do";
			//<%=request.getContextPath() %>/webEntrust/policyView/${order.id}.do
		}
	});
	
	
	$('.extract').click(function(){
		var $this = $(this);
		TryAuthStatus.isAuth(function(flag){
			if(flag){
				location.href = $this.attr('href');
			}
		});
		
		return false;
	});

});




