$(document).ready(function() {
	initAuthority();
	$("#op").framecombox({});

	//默认日期
	$('#queryEndDate').val(getYyyy_MM_dd());
	$('#queryBeignDate').val(getYyyy_MM_dd(-30));
	
	$("#table").frametable({
		columns : [ 
				{name:'id', text:'id', hidden:true},
				{name : 'custId',	text : '客户id',hidden:true},
				{name : 'name',	text : '姓名'},
				{name : 'tel',	text : '电话'},
				{name : 'amount',	text : '金额(元)'},
				{name : 'loanDays',	text : '天数(天)'},
				{name : 'loanRate',	text : '利息(%)'},
				{name : 'displayLoanType',	text : '类型'},
				{name : 'loanDateText',	text : '贷款日期'},
				{name : 'displayPaybackStatus',	text : '还款状态'},
				{name : 'paybackAmount',	text : '还款金额(元)'},
				{name : 'paybackDateText',	text : '还款日期'},
				{name : 'createDate',	text : '创建日期',hidden:true},
				{name : 'createTime',	text : '创建时间',hidden:true},
				{name : 'closeDate',	text : '结束日期',hidden:true},
				{name : 'closeTime',	text : '结束时间',hidden:true},
				{name : 'status',	text : '状态,0正常,1删除',hidden:true},
				{name : 'remark',	text : '说明'}
		],
       	op: [
      		/*{name:'view', rowData:'paybackStatus',authority:'update',text:'编辑', type:'icon', clazz:'icon-view', handler: view, hidden: paybackAuthority},*/
      		{name:'paybackSuccess',rowData:'paybackStatus',authority:'update',text:'确认还款', type:'icon', clazz:'icon-submitCheck', handler: paybackSuccess,hidden: paybackAuthority},
      		{name:'edit', rowData:'paybackStatus',text:'编辑',authority:'update', type:'icon', clazz:'icon-edit', handler: edit, hidden: paybackAuthority},
	    	{name:'delete', rowData:'paybackStatus',text:'删除',authority:'delete', type:'icon', clazz:'icon-del', handler: del, hidden: paybackAuthority}
	    ],            
		datatype : "server",
		tableClass : "table-bordered table-hover table-striped",
		url : 'tryRealLoan/queryTryRealLoanPage.do',
		//rowsurl : 'tryRealLoan/queryTryRealLoanListCount.do',
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
		util.navigate("/tryRealLoan/tryRealLoanEdit.do");
	});
});
//查看
function view(data,el) {
	util.navigate("/tryRealLoan/tryRealLoanEdit.do?op=view&id=" + data.id);
}
//编辑
function edit(data,el) {
	util.navigate("/tryRealLoan/tryRealLoanEdit.do?op=update&id=" + data.id);
}	
//确认还款
function paybackSuccess(data,el) {
	util.navigate("/tryRealLoan/tryRealLoanPayback.do?op=update&id=" + data.id);
}	
//删除
function del(data,el) {
	art.dialog.confirm("确定删除吗？",function(){
		$.post(cxt + '/tryRealLoan/delete.do',{id:data.id},function(data2){
			if(data2.success){
				$('li.active').click();
			}else{
				art.dialog.alert(data2.message);
			}
		},"json");
	});
}	
