$(document).ready(function() {
	
	initAuthority();
	$("#op").framecombox({});

	//默认日期
	$('#queryEndDate').val(getYyyy_MM_dd());
	$('#queryBeignDate').val(getYyyy_MM_dd(-30));
	
	$("#table").frametable({
		columns : [ 
				{name:'id', text:'交易流水号', hidden:true},
				{name:'checkStatus', text:'checkStatus', hidden:true},
				{name:'payStatus', text:'payStatus', hidden:true},
				{name:'checkDesc', text:'checkDesc', hidden:true},
				{name:'payDesc', text:'payDesc', hidden:true},
				{name : 'tradeAvailableBalance',	text : '当前余额'},
				{name : 'amountText',	text : '提现金额'},
				{name : 'availableBalance',	text : '提现后余额',hidden:true},
				{name : 'createTimeStr',	text : '申请时间'},
				{name : 'checkStatusText',	text : '审核状态'},
				{name : 'checkTimeStr',	text : '审核时间'},
				{name : 'checkUserId',	text : '审核人'},
				{name : 'payStatusText',	text : '付款状态'},
				{name : 'loginId',	text : '申请人'},
				{name:'custAmount', text:'用户当前余额',hidden:true}
				
		],          
       	op: [
      		{name:'view', authority:'query',text:'详情', type:'icon', clazz:'icon-view', handler: view, hidden: testAuthority},
       		{name:'shtg', authority:'update',text:'审核通过', type:'icon', clazz:'icon-submitCheck', handler: shtg, hidden: testAuthorityTg},
       		{name:'shjj', authority:'update',text:'审核拒绝', type:'icon', clazz:'icon-auditFail', handler: shjj, hidden: testAuthorityJj},
       		{name:'pay', authority:'update',text:'付款', type:'icon', clazz:'icon-due', handler: pay, hidden: testAuthorityPay}
 	    ],  
		datatype : "server",
		tableClass : "table-bordered table-hover table-striped",
		url : 'tryOrder/queryWithdrawListForCheck.do',
		query_param : formutil.getFields($("#query-form")),
		pageName : 'page',
		pageSizeName : 'limit',
		callback:function(){
			$("td[name='availableBalance']").each(function(i){
				if(Number($(this).text())<0){
					$(this).addClass('error');
				}
			});
		}
	});

	$("#query-btn").on("click", function() {
		var params = formutil.getFields($("#query-form"));
		$("#table").frametable("query", params);
		
		return false;
	});

	//确认拒绝
	$("#fail").on("click",function(){
		var remark=$("#remark").val();
		var id=$("#id").val();
		if(!checkRemark()){
			return false;
		}
		
		$.post(cxt + '/tryOrder/shjjTx.do',{id:id,checkDesc:remark},function(data){
			if(data.success){
//				artDialog.alert("审核完成");
				$('li.active').click();
			}else{
				artDialog.alert(data.message);
			}
		},"json");
		
		$("#myModal").modal("hide");
		
		return false;
	});

});

//审核通过
function shtg(data,el) {
	artDialog.confirm("确定审核通过吗？",function(){
		$.post(cxt + '/tryOrder/shtgTx.do',{id:data.id},function(data){
			if(data.success){
//				artDialog.alert("审核完毕");
				$('li.active').click();
			}else{
				artDialog.alert(data.message);
			}
		},"json");
	});
}

//审核拒绝
function shjj(data,el) {
	$("#myModal").modal("show");
	$("input[name='id']").val(data.id);
}	

//付款
function pay(data,el) {
	artDialog.confirm("确定付款吗？",function(){
		submitWaiting();		
		$.post(cxt + '/tryOrder/payTx.do',{id:data.id},function(data){
			art.dialog.list['broadcastLoading'].close();
			if(data.success){
				//artDialog.alert("成功");
				$('li.active').click();
			}else{
				artDialog.alert(data.message);
			}
			
		},"json");
	});
}	
//审核意见校验-不超过200字
function checkRemark(){
	var remark = $("#remark").val();
	if(!remark){
		art.dialog.alert("请填写审核意见");
		return false
	}
	if(remark.length > 200){
		art.dialog.alert("审核意见在200字以内");
		return false
	}
	return true;
}

function testAuthorityTg(name,data) {
	if(testAuthority(name)){
		return true;
	}
	
	if(const_check_status_unaudit == data.checkStatus){
		return false;
	}
	
	return true;
	
}

function testAuthorityJj(name,data) {
	return testAuthorityTg(name,data);
}

function testAuthorityPay(name,data) {
	if(testAuthority(name)){
		return true;
	}
	
	//支付成功时隐藏
	if(const_pay_status_success == data.payStatus){
		return true;
	}
	//支付失败时隐藏
	if(const_pay_status_fail == data.payStatus){
		return true;
	}
	
	if(const_check_status_pass == data.checkStatus){
		return false;
	}
	
	
	return true;
	
}
//查看
function view(data,el) {
	util.navigate("/tryOrder/withdrawEditForCheck.do?op=view&id=" + data.id);
}
