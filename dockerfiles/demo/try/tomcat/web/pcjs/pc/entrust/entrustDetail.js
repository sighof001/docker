$(function(){
	
	
	checkEnableStyle();
	//减少金额
	$(".icon-minus").on("click",function(){
		//判断减少按钮是否启用
		if($(".icon-minus").is(".enable_icon")){
			var minus = parseFloat($("#money").val()) - 1.00;
			$("#money").val(minus.toFixed(2));
			
		}
		checkEnableStyle();
		
	});
	
	
	
	//增加金额
	$(".icon-add").on("click",function(){
		
		//判断增加按钮是否启用
		if($(".icon-add").is(".enable_icon")){
			var add = parseFloat($("#money").val()) + 1.00;
			$("#money").val(add.toFixed(2));
		}
		
		checkEnableStyle();
		
	});
	
	//触发输入框就关闭错误提示
	$('input').on("click",function(){
		$("#error").hide();
		$("#entrustErrer").hide();
	});
	
	
	//支付委托订单
	$("#payBtn").on("click",function(){
		var formData = $("#payForm").serializeArray();
		console.log(formData);
		$.ajax({
			type:'post',
			url: cxt + "/webEntrust/paymentEntrustOrder.do",
			dataType:'json',
			data:formData,
			beforeSend:beforeSend,
			success:function(data){
				if(data.success){
					location.href = cxt + "/webEntrust/successDetails/"+data.payOrderId+".do"
				}else{
					$("#error").html(data.message).show();
				}
			},
			error:function(result){
				$("#error").html(result.message).show();
			},
			complete:complete
		});
		
	});
	
	
	//立即委托
	$("#btn-submit").on("click",function(){
		var formData = $("#form").serializeArray();
		$.ajax({
			type:'post',
			url: cxt + "/webEntrust/submitOrder.do",
			dataType:'json',
			data:formData,
			async: false,
			beforeSend:beforeSend,
			success:function(data){
				if(data.success){
					$("#pwdPopup").popup('open');
					$("#orderId").val(data.orderId);
				}else{
					$("#entrustErrer").text(data.message).show();
				}
				
			},
			error:function(result){
				$("#entrustErrer").text(result.message).show();
			},
			complete:complete
		});
		
		
	});
	
	
	//计算到期收益
	$("#money").on("blur",function(){
		var rate = $("#rate").val();
		var term = $("#term").text();
		var money = $("#money").val();
		var pattern = /^(([1-9]\d{0,9})|0)(\.\d{1,2})?$/;
		if(!pattern.test(money)){
			$("#entrustErrer").text("请输入正确金额!").show();
		}
		
		var result = parseFloat(rate) / 360 * parseFloat(term) * parseFloat(money);
		
		if(result != undefined){
			$("#receipts").text(result.toFixed(2));
		}
	});
	
	
});


function checkEnableStyle(){
	
	//金额小于起投金额时不能再减
	if(parseFloat($("#money").val()) <= parseFloat($("#startAmount").text())){
		$(".icon-minus").removeClass("enable_icon");
	}else{
		$(".icon-minus").addClass("enable_icon");
	}
	
	//金额大于余额时不能增加
	if(parseFloat($("#money").val()) >= parseFloat($("#amount").text())){
		$(".icon-add").removeClass("enable_icon");
	}else{
		$(".icon-add").addClass("enable_icon");
	}
	
}