$(document).ready(function() {
	initAuthority();
	$("#op").framecombox({});

	//默认日期
	$('.wdate').val(getYyyy_MM_dd());
	//$('#valueDate').val(getYyyy_MM_dd());
	//$('#dueDate').val(getYyyy_MM_dd(1));
	$("#table").frametable({
		columns : [ 
				{name:'id', text:'id', hidden:true},
				{name : 'custId',	text : '客户id',hidden:true},
				{name : 'name',	text : '姓名'},
				{name : 'tel',	text : '联系电话'},
				{name : 'displayJob',	text : '职业'},
				{name : 'idAddress',	text : '身份证地址',hidden:true},
				{name : 'nowAddress',	text : '现居住地址'},
				{name : 'displayAge',	text : '年龄'},
				{name : 'amount',	text : '拟借金额'},
				{name : 'companyName',	text : '企业名称'},
				{name : 'displayIndustry',	text : '行业'},
				{name : 'registerAddress',	text : '公司注册地址',hidden:true},
				{name : 'officeAddress',	text : '公司办公地址',hidden:true},
				{name : 'displayYears',	text : '成立年限',hidden:true},
				{name : 'displayLoanUse',	text : '贷款用途'},
				{name : 'loanTerm',	text : '借款期限(天)'},
				{name : 'displayRepaymentSource',	text : '还款来源'},
				{name : 'displayLoanType',	text : '借款类型'},
				{name : 'displayCheckStatus',	text : '审核状态'},
				{name : 'createUserId',	text : '创建人',hidden:true},
				{name : 'createDate',	text : '创建日期',hidden:true},
				{name : 'createTime',	text : '创建时间',hidden:true}
		],
       	op: [
      		{name:'view', authority:'query',text:'查看', type:'icon', clazz:'icon-view', handler: view, hidden: testAuthority}
	    ],            
		datatype : "server",
		tableClass : "table-bordered table-hover table-striped",
		url : 'tryCheckAuditList/queryTryCheckAuditPage.do',
		//rowsurl : 'tryCustLoan/queryTryCustLoanListCount.do',
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
	util.navigate("/tryCheckAuditList/tryCheckAuditListEdit.do?op=view&id=" + data.id);
}
		
