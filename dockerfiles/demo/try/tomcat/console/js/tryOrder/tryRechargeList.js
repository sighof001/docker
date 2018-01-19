$(document).ready(function() {
	initAuthority();
	$("#op").framecombox({});

	//默认日期
	$('#queryEndDate').val(getYyyy_MM_dd());
	$('#queryBeignDate').val(getYyyy_MM_dd(-30));
	//$('#valueDate').val(getYyyy_MM_dd());
	//$('#dueDate').val(getYyyy_MM_dd(1));
	$("#table").frametable({
		columns : [ 
				{name : 'id',	text : '交易编号',width:100},
				{name : 'loginId',	text : '用户名',width:100},
				{name : 'createTimeStr',	text : '充值日期',width:100},
				{name : 'amount', text : '充值金额',width:100},
//				{name : 'checkStatusText', text : '审核状态'},
				{name : 'payStatusText', text : '付款状态',width:100},
				{name : 'payDesc', text : '付款信息'}
				
		],          
		datatype : "server",
		tableClass : "table-bordered table-hover table-striped",
		url : 'tryRecharge/queryTryRechargePage.do',
		//rowsurl : 'tryOrder/queryTryOrderListCount.do',
		query_param : formutil.getFields($("#query-form")),
		pageName : 'page',
		pageSizeName : 'limit'
	});

	$("#query-btn").on("click", function() {
		var params = formutil.getFields($("#query-form"));
		$("#table").frametable("query", params);
		
		return false;
	});
	
	//新增
	$("#add-btn").on("click", function() {
		util.navigate("/tryOrder/tryOrderEdit.do");
	});
});
	
