$(function(){
	
	var increaseAmount = parseFloat($("#increaseAmount").val());
	checkEnableStyle();
	//减少金额
	$(".icon-minus").on("click",function(){
		//判断减少按钮是否启用
		if($(".icon-minus").is(".enable_icon")){
			var minus = parseFloat($("#money").val()) - increaseAmount;
			$("#money").val(minus.toFixed(2));
			
		}else{
			ybDialog.alert("不能低于起购金额!");
		}
		checkEnableStyle();
		$("#money").blur();
	});
	
	
	
	//增加金额
	$(".icon-add").on("click",function(){
		
		//判断增加按钮是否启用
		if($(".icon-add").is(".enable_icon")){
			var add = parseFloat($("#money").val()) + increaseAmount;
			$("#money").val(add.toFixed(2));
		}else{
			ybDialog.alert("余额不足!");
		}
		
		checkEnableStyle();
		$("#money").blur();
	});
	
	//触发输入框就关闭错误提示
	$('input').on("click",function(){
		$("#error").hide();
		$("#entrustErrer").hide();
	});
	
	
	//支付委托订单
	$("#payBtn").on("click",function(){
		var formData = $("#form").serializeArray();
		var payPassword = $("#payPassword").val();
		if(!payPassword){
			$("#error").html("支付密码不能为空!").show();
			return;
		}
		formData.push({"name":"payPassword","value":payPassword});
		$.ajax({
			type:'post',
			url: cxt + "/webEntrust/pcEntrustConfirmPay.do",
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
		var pattern = regEnum.decimal_2;
		var money = $("#money").val();
		var amount = $("#amount").text();
		TryAuthStatus.isAuth(function(flag){
			if(flag){
				if(!pattern.test(money)){
					$("#entrustErrer").text("只能输入数字,小数点后两位!").show();
					return;
				}
				if(parseFloat(amount) - parseFloat(money) < 0){
					ybDialog.alert("余额不足! <a class='auth' href='javascript:void(0);' url='"+cxt+ "/order/rechargeEdit.do'>去充值</a>");
					return;
				}
				if(parseFloat(money) < parseFloat($("#startAmount").text())){
					ybDialog.alert("不能低于起购金额!");
					return;
				}
				
				$("#pwdPopup").popup('open');
			}
		});
		
		
		
	});
	
	
	//计算到期收益
	$("#money").on("blur",function(){
		var rate = $("#rate").val();
		var term = $("#term").val();
		var goodsType = $("#goodsType").val();
		var money = $("#money").val();
		var goodsId  = $("#id").val();
		var pattern = regEnum.decimal_2;
		if(!pattern.test(money)){
			$("#entrustErrer").text("只能输入数字,小数点后两位!").show();
		}
		reckon(goodsId,money,term,goodsType)
	});
	
	$("#money").blur();
});

function reckon(goodsId,money,term,goodsType){
	//活期或者扶贫时, 计算"预计每日可收益"
	if(term == 0){
		term = 1;
	}
	if(goodsType == 1){
		//扶贫产品
		calEaringsFp(money,term,function(earnings){
			if(earnings != undefined){
				$("#receipts").text(earnings.toFixed(2));
			}
			checkEnableStyle();
		});
	}else{
		calEarings(goodsId,money,term,function(earnings){
			if(earnings != undefined){
				$("#receipts").text(earnings.toFixed(2));
			}
			checkEnableStyle();
		});
	}
	
}

function checkEnableStyle(){
	
	//金额小于起投金额时不能再减
	if(parseFloat($("#money").val()) <= parseFloat($("#startAmount").text())){
		$(".icon-minus").removeClass("enable_icon");
	}else{
		$(".icon-minus").addClass("enable_icon");
	}
	
	//金额大于余额时不能增加
	if(parseFloat($("#money").val()) + parseFloat($("#increaseAmount").val()) > parseFloat($("#amount").text())){
		$(".icon-add").removeClass("enable_icon");
	}else{
		$(".icon-add").addClass("enable_icon");
	}
	
}


function calEarings(goodsId,money,term,callback){
	
	$.post(cxt + '/tool/calEarnings.do',{goodsId:goodsId,amount:money,term:term},function(data){
		if(data.success){
			if(callback){
				callback(data.earnings);
			}
		}else{
			$("#entrustErrer").text("计算收益失败~!").show();
		}
	},"json");
		
}
function calEaringsFp(money,term,callback){
	
	$.post(cxt + '/tool/calEarningsFp.do',{amount:money,term:term},function(data){
		if(data.success){
			if(callback){
				callback(data.earnings);
			}
		}else{
			$("#entrustErrer").text("计算收益失败~!").show();
		}
	},"json");
	
}