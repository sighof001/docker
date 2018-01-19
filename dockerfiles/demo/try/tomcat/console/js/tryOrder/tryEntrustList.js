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
				{name : 'goodsName',	text : '委托产品'},
				{name : 'goodsTypeText',text : '产品类型'},
//				{name : 'rateText',	text : '年化利率'},
				{name : 'amountText',	text : '交易金额'},
//				{name : 'interestText',	text : '计息金额'},
				{name : 'rateText',	text : '年化利率'},
				{name : 'interestFrequency',	text : '计息频率(天)'},
				{name : 'createDateText',	text : '委托日期'},
				{name : 'loginId',	text : '委托人'}
				
		],   
		op: [
		    	{name:'publish',authority:'update',rowData:'policyUpload',text:'上传保单', type:'icon', clazz:'icon-export', handler: publish, hidden: testAuthorityTg},
		    	{name:'publish',authority:'update',rowData:'policyUpload',text:'修改上传保单', type:'icon', clazz:'icon-edit', handler: publish, hidden: testAuthorityPay},
		    ],
		datatype : "server",
		tableClass : "table-bordered table-hover table-striped",
		url : 'tryEntrust/queryTryEntrustPage.do',
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
	  	var url= '/tryEntrust/downloadExcel.do' + param;
		util.navigate(url);
	});
});
//上传
function publish(data,el){
	util.navigate("/tryEntrust/tryEntrustPolicy.do?id=" + data.id);
}
function testAuthorityPay(name,data) {
	if(testAuthority(name)){
		return true;
	}
	
	//支付成功时隐藏
	if(!data.policyUpload){
		return true;
	}
	
	if(data.policyUpload){
		return false;
	}
	
	
	return true;
	
}

function testAuthorityTg(name,data) {
	if(testAuthority(name)){
		return true;
	}
	
	if(!data.policyUpload){
		return false;
	}
	
	return true;
	
}