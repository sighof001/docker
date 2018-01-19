$(document).ready(function() {
	initAuthority();
	$("#op").framecombox({});

	//默认日期
	$('#queryEndDate').val(getYyyy_MM_dd());
	$('#queryBeignDate').val(getYyyy_MM_dd(-30));
	
	$("#table").frametable({
		columns : [
				{name:'assetId', text:'资产id', hidden:true},
				{name:'id', text:'交易编号'},
				{name : 'loginId',	text : '用户名'},
				{name : 'goodsName',	text : '返息项目'},
				{name : 'rateText',	text : '年化利率'},
				{name : 'amountText',	text : '返息金额'},
				{name : 'createDateText',	text : '返息日期'},
//				{name : '',	text : '次数'},
//				{name : '',	text : '返回金额'},
//				{name : '',	text : '该项目总计'},
				
		],
		op: [
	      		{name:'view', authority:'query',text:'详情', type:'icon', clazz:'icon-view', handler: view, hidden: testAuthority}
		    ], 
		datatype : "server",
		tableClass : "table-bordered table-hover table-striped",
		url : 'tryPayment/queryTryPaymentPage.do',
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
	
	
});
	

//查看
function view(data,el) {
	util.navigate("/tryPayment/tryPaymentEdit.do?op=view&id=" + data.id);
}
