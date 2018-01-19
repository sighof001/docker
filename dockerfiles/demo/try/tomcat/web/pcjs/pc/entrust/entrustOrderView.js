$(function(){
	
	//监听电子保单(普通)
	$('.downloadPolicy').on("click",function(){
		var policyUpload=$('input[name=policyUpload]').val();
		if(!policyUpload){
			tryModel.alert("暂未生成保单,请联系客服人员");
		}else{
			var id=$("#orderId").val();
			//href="<%=request.getContextPath() %>/webEntrust/pcDownLoadPolicy.do?id=${tryOrder.id}"
			location.href = cxt + "/webEntrust/pcDownLoadPolicy.do?id="+id;
		}
	})
	//监听电子保单(扶贫)
	$('.downloadPolicyFp').on("click",function(){
		
		var policyUpload=$(this).attr("contentValue");
		if(!policyUpload){
			tryModel.alert("暂未生成保单,请联系客服人员");
		}else{
			var id=$(this).attr("idValue");
			location.href = cxt + "/webEntrust/pcDownLoadPolicy.do?id="+id;
		}
	})
	
	
});