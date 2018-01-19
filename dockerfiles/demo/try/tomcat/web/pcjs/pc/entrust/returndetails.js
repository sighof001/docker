$(function(){
	
	
	$(".transfer_btn").on("click",function(){
		AuthStatus.isAuth(function(flag){
			calEarnings();
			if(flag){
				$("#transfer_pop").modal("show");
			}
		});
		
	});
	
	
	
	$("#extract").on("click",function(){
		var goodsType = $("#goodsType").val();
		var number = "";
		if(!isProductFp(goodsType)){
			//普通产品-amount
			number = $("#amount").val();
		}else{
			number = $("#paynumber").val();
		}
		var reg = regEnum.decimal_2;
		var password = $("#password").val();
		var amount = $("#amount").val();
		var assetId = $("#assetId").val();
		if(!number){
			$("#errorInfo").text("请输入金额!").show();
			return;
		}
		if(!reg.test(number)){
			$("#errorInfo").text("请输入正确的金额格式,保留小数点两位!").show();
			return;
		}
		var numFloat = parseFloat(number);
		var amoFloat = parseFloat(amount);
		
			if(numFloat > amoFloat){
				$("#errorInfo").text("转出金额不能大于委托金额!").show();
				return;
			}
		if(!password){
			$("#errorInfo").text("支付密码不能为空!").show();
			return;
		}
		
		$.ajax({
				type:'post',
				url: cxt + '/webEntrust/submitExtract.do',
				dataType:'json',
				data:{'number':number,
					'password':password,
					'assetId':assetId},
				success:function(data){
					if(data.success){
						location.href = cxt + "/webEntrust/pcExtractSuccess/"+data.payOutId+".do";
					}else{
						$("#errorInfo").text(data.message).show();
					}
				},
				error:function(result){
					$("#errorInfo").text("网络异常!").show();
				}
		});
		
		
	});
	
	//监听所有输入框
	$("input").on("click",function(){
		$("#errorInfo").text("");
	});
	
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

function calEarnings(){
	
	var assetId = $("#assetId").val();
	var goodsId = $("#goodsId").val();
	var amount = $("#amount").val();
	var interestDay = $("#interestDay").val();
	var goodsType = $("#goodsType").val();
	var assetTerm = $("#assetTerm").val();
//	var timeout = interestDay-assetTerm;
//	if(isProductCurrent(goodsType,assetTerm)){//活期商品
//		$("#paynumber").val(amount).attr("disabled",true);
//		$("#errorInfo").text("温馨提示:普通产品不可部分提取").show();
//	}else if(!isProductFp(goodsType)){//普通商品(活期除外)
//		if(timeout>0){
//			//定期到期后
//			$("#paynumber").val(amount).attr("disabled",true);
//		}else{
//			$("#paynumber").val(marginAmount).attr("disabled",true);
//		}
//		$("#errorInfo").text("温馨提示:普通产品不可部分提取").show();
//		
//	}
//	if(!isProductFp(goodsType)){//普通商品
//		$("#paynumber").val(marginAmount).attr("disabled",true);
//		$("#errorInfo").text("温馨提示:普通产品不可部分提取").show();
//	}
	
	$.post(cxt + '/webEntrust/pcCalEarnings.do',{assetId:assetId,goodsId:goodsId,amount:amount,term:interestDay,goodsType:goodsType},function(data){
		if(data.success){
			console.log(JSON.stringify(data));
			$("#earnings").text(data.earningsVo.earnings);
			$("#less").text(data.earningsVo.less);
			$("#earningsAlready").text(data.earningsVo.earningsAlready);
			$("#interestMargin").text(data.earningsVo.interestMargin);
			$("#entrustAmount").text(data.earningsVo.entrustAmount);
			$("#poundageRate").text(data.earningsVo.poundageRate);
			$("#poundage").text(data.earningsVo.poundage);
			//$("#paynumber").val(data.earningsVo.entrustAmount).attr("disabled",true);
			if(!isProductFp(goodsType)){//活期商品
				$("#paynumber").val(data.earningsVo.entrustAmount).attr("disabled",true);
				$("#errorInfo").text("温馨提示:普通产品不可部分提取").show();
			}
		}else{
			tryModel.alert(data.message);
		}
		
	},"json");
	
}
