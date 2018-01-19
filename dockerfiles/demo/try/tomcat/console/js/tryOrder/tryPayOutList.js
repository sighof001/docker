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
				{name : 'id', text:'交易编号'},
				{name : 'loginId',	text : '用户名'},
				{name : 'goodsName',	text : '委托项目'},
//				{name : 'rateText',	text : '年化利率'},
				{name : 'priceText',	text : '申请转出金额'},
				{name : 'amountText',	text : '实际转出金额'},
				{name : 'beginDateText',	text : '委托日期'},
				{name : 'interestText',	text : '利息差(元)'},
				{name : 'poundageText',	text : '手续费'},
//				{name : '', text : '项目利率%'},
				{name : 'createDateText', text : '转出时间'}
				
		],          
		datatype : "server",
		tableClass : "table-bordered table-hover table-striped",
		url : 'tryPayOut/queryTryPayOutPage.do',
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
	
	//导出
	$("#export-btn").on("click", function() {
		var paramO = formutil.getFields($("#query-form"));
		var param = objectToParam(paramO);
		if(param){
			param = '?' + param;
		}
	  	var url= '/tryPayOut/downloadExcel.do' + param;
		util.navigate(url);
	});
	
});
	
