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
		        {name : 'id',	text : '交易编号'},
				{name:'id', text:'交易流水号', hidden:true},
				{name : 'loginId',	text : '用户名'},
				{name : 'createTimeStr' , text:'时间'},
				{name : 'amount',	text : '交易金额(元)'},
				{name : 'checkStatusText',	text : '审核状态'},
				{name : 'payStatusText',	text : '支付状态'}
				
		],          
		datatype : "server",
		tableClass : "table-bordered table-hover table-striped",
		url : 'tryWithdrawals/queryTryWithdrawalsPage.do',
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
	
