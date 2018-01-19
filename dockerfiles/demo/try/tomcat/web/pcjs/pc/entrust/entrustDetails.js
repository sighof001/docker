$(function(){
	
	var increaseAmount = parseFloat($("#increaseAmount").text());
	checkEnableStyle();
	//减少金额
	$("#minus").on("click",function(){
		//判断减少按钮是否启用
		if(!$(this).is(".disabled_icon")){
			var minus = parseFloat($("#money").val()) - increaseAmount;
			$("#money").val(minus.toFixed(2));
			
		}else{
			tryModel.alert("不能低于起购金额!");
		}
		checkEnableStyle();
		
	});
	
	
	
	//增加金额
	$("#add").on("click",function(){
		
		//判断增加按钮是否启用
		if(!$(this).is(".disabled_icon")){
			var add = parseFloat($("#money").val()) + increaseAmount;
			$("#money").val(add.toFixed(2));
		}else{
			tryModel.alert("余额不足! <a href='"+ cxt +"/order/pcRechargeEdit.do?menuId=myRealAuth'> 去充值</a>");
		}
		
		checkEnableStyle();
		
	});
	
	//触发输入框就关闭错误提示
	$('input').on("click",function(){
		$("#error").hide();
		$("#entrustErrer").hide();
	});
	
	
	//支付委托订单
	$("#entrust_submit").on("click",function(){
		var money = $("#money").val();
		var id = $("#goodsId").val();
		var payPassword = $("#payPassword").val();
		$.ajax({
			type:'post',
			url: cxt + "/webEntrust/pcEntrustConfirmPay.do",
			dataType:'json',
			data:{"money":money,"id":id,"payPassword":payPassword},
			success:function(data){
				if(data.success){
					location.href = cxt + "/webEntrust/successResult.do"
				}else{
					tryModel.alert(data.message);
				}
			},
			error:function(result){
				tryModel.alert(result.message);
			},
		});
		
	});
	
	
	//计算到期收益
	$("#money").on("blur",function(){
		var term = $("#term").val();
		var money = $("#money").val();
		var pattern = /^(([1-9]\d{0,9})|0)(\.\d{1,2})?$/;
		if(!pattern.test(money)){
			$("#entrustErrer").text("请输入正确金额!").show();
			return;
		}
		
		$('.receipts').each(function(){
			var goodsId = $(this).attr("goodsId");
			var _this = $(this);
			calEarings(goodsId,money,term,function(earnings){
				_this.text(earnings + "元");
			})
		});
	});
	
	//立即委托
	$("#btn-submit").on("click",function(){
		var startAmount = parseFloat($("#startAmount").text());
		var money= parseFloat($("#money").val());
		var amount = parseFloat($("#amount").text());
		var reg = regEnum.decimal_2;
		if(!reg.test(money)){
			$("#minus").addClass("disabled_icon");
			tryModel.alert("只能输入数字,小数后两位!");
			return;
		}
		
		if(money < startAmount){
			$("#minus").addClass("disabled_icon");
			tryModel.alert("购买金额不能小于起购金额~!");
		}else{
			$("#td_money,#str_money").text(money + "元");
			calEarings($("#goodsId").val(),10000.00,appConstants.const_interest_year_day,function(earnings){//每万元年收益(元)
				$("#td_receipts").text(earnings + "元");
			});
			AuthStatus.isAuth(function(flag){
				if(flag){
					if(money > amount){
						tryModel.alert("余额不足! <a href='"+ cxt +"/order/pcRechargeEdit.do?menuId=myRealAuth'> 去充值</a>");
						return;
					}
					$("#transfer_pop").modal("show");
				}
			});
			
		}
		
	});
	
	$("#money").blur();
});

function calEarings(goodsId,money,term,callback){
	
$.post(cxt + '/tool/calEarnings.do',{goodsId:goodsId,amount:money,term:term},function(data){
	if(data.success){
		if(callback){
			callback(data.earnings);
		}
	}else{
		tryModel.alert("计算收益失败~!");
	}
},"json");
	
}


function checkEnableStyle(){
	var money = parseFloat($("#money").val());
	var startAmount = parseFloat($("#startAmount").text());
	var amount = parseFloat($("#amount").text());
	//金额小于起投金额时不能再减
	if(money <= startAmount){
		$("#minus").addClass("disabled_icon");
	}else{
		$("#minus").removeClass("disabled_icon");
	}
	
	//金额大于余额时不能增加
	if(money + parseFloat($("#increaseAmount").text()) > amount){
		$("#add").addClass("disabled_icon");
	}else{
		$("#add").removeClass("disabled_icon");
	}
	
	$("#money").blur();
	
}

