$(function(){
	
	
	//全部买入（全部取出）
//	$(".getvalid").on("click",function(){
//		if(assertTerm !="0"&&isAssertNow){
//			//定期产品
//			$("#number").val(finalAmount);
//		}else{
//			$("#number").val(amount);
//		}
//	});
	
	if(goodsType == "0"){//普通商品
		$(".getvalid").click();
		$("#number").attr("disabled",true);
		$("#errorInfo").text("普通产品不可部分提取").show();
	}
	
	//监听所有输入框
	$("input").on("tap",function(){
		$("#errorInfo").text("");
	});
	
	$(".getvalid").hide();
	
});


/**取出*/
function extract(){
	var number = 0;
	if(assertTerm !="0"){
		//定期产品
		number= $("#oldNumber").val();
	}else{
		number = $("#number").val();
	}
	var reg = regEnum.decimal_2;
	var password = $("#password").val();
	var assetId = $("#assetId").val();
	if(!number){
		$("#errorInfo").text("请输入金额!").show();
		return;
	}
	if(!reg.test(number)){
		$("#errorInfo").text("只能输入数字,小数点后两位!").show();
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
		beforeSend:beforeSend,
		success:function(data){
			if(data.success){
				location.href = cxt + "/webEntrust/extractSuccess/"+data.payOutId+".do";
			}else{
				$("#errorInfo").text(data.message).show();
			}
		},
		error:function(result){
			
		},
		complete:complete
		
	});
	
	

}