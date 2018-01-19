$(document).ready(function() {
	$('input[name=remark]').change(function() {
		checkRemark();
	});
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
				{name : 'tel',	text : '联系电话',hidden:true},
				{name : 'displayJob',	text : '职业',hidden:true},
				{name : 'idAddress',	text : '身份证地址',hidden:true},
				{name : 'nowAddress',	text : '现居住地址',hidden:true},
				{name : 'displayAge',	text : '年龄',hidden:true},
				{name : 'amount',	text : '拟借金额'},
				{name : 'companyName',	text : '企业名称',hidden:true},
				{name : 'displayIndustry',	text : '行业',hidden:true},
				{name : 'registerAddress',	text : '公司注册地址',hidden:true},
				{name : 'officeAddress',	text : '公司办公地址',hidden:true},
				{name : 'displayYears',	text : '成立年限',hidden:true},
				{name : 'displayLoanUse',	text : '贷款用途'},
				{name : 'displayRepaymentSource',	text : '还款来源'},
				{name : 'loanTerm',	text : '借款期限(天)'},
				{name : 'displayLoanType',	text : '借款类型'},
				{name : 'displayCheckStatus',	text : '审核状态'},
				{name : 'auditRemark',	text : '审核意见'},
				{name : 'createUserId',	text : '创建人',hidden:true},
				{name : 'createDate',	text : '创建日期',hidden:true},
				{name : 'createTime',	text : '创建时间',hidden:true}
		],
       	op: [
      		{name:'view', authority:'query',text:'查看', type:'icon', clazz:'icon-view', handler: view, hidden: testAuthority},
      		/*{name:'edit', authority:'update',text:'编辑', type:'icon', clazz:'icon-edit', handler: edit, hidden: testAuthority},
	    	{name:'delete', authority:'delete',text:'删除', type:'icon', clazz:'icon-del', handler: del, hidden: testAuthority},*/
      		{name:'checkPass', rowData:"checkStatus",authority:'update',text:'审核通过', type:'icon', clazz:'icon-submitCheck', handler: checkPass, hidden: hiddenAuditButtonAuthority},
	    	{name:'checkFail',rowData:"checkStatus", authority:'update',text:'审核拒绝', type:'icon', clazz:'icon-auditFail', handler: checkFail, hidden: hiddenAuditButtonAuthority}
	    ],            
		datatype : "server",
		tableClass : "table-bordered table-hover table-striped",
		url : 'tryCustLoan/queryTryCustLoanPage.do',
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
	//新增
	$("#add-btn").on("click", function() {
		util.navigate("/tryCustLoan/tryCustLoanEdit.do");
	});
	
	//确认拒绝
	$("#fail").on("click",function(){
		var remark=$("#remark").val();
		var id=$("#id").val();
		if(!checkRemark()){
			return false;
		}
		$.post(cxt + '/tryCustLoan/audit.do',{"id":id,"remark":remark,"statue":"fail"},function(data){
			if(data.success){
				artDialog.alert("审核完成");
				$('li.active').click();
			}else{
				artDialog.alert(data.message);
			}
		},"json");
		$("#myModal").modal("hide");
		return false;
		/*if(checkRemark()){
			util.navigate("/tryCustLoan/audit.do?statue=fail&id=" + id+"&remark="+remark);
			art.dialog.alert("审核成功");
		}else{
		}*/
	});
	
});
//查看
function view(data,el) {
	util.navigate("/tryCustLoan/tryCustLoanEdit.do?op=view&id=" + data.id);
}
//编辑
function edit(data,el) {
	util.navigate("/tryCustLoan/tryCustLoanEdit.do?op=update&id=" + data.id);
}	
//删除
function del(data,el) {
	art.dialog.confirm("确定删除吗？",function(){
		$.post(cxt + '/tryCustLoan/delete.do',{id:data.id},function(data2){
			if(data2.success){
				$('li.active').click();
			}else{
				art.dialog.alert(data2.message);
			}
		},"json");
	});
}	
//审核通过
function checkPass(data,el){
	art.dialog.confirm("确定审核通过吗？",function(){
		$.post(cxt + '/tryCustLoan/audit.do',{id:data.id,"statue":"pass"},function(data){
			if(data.success){
				artDialog.alert("审核成功");
				$('li.active').click();
			}else{
				artDialog.alert(data.message);
			}
		},"json");
		//util.navigate("/tryCustLoan/audit.do?statue=pass&id=" + data.id);
		//art.dialog.alert("审核成功");
	});
}
//审核拒绝
function checkFail(data,el){
	$("#myModal").modal("show");
	$("#id").val(data.id);
	/*art.dialog.confirm("确定审核拒绝吗？",function(){
		//util.navigate("/tryCustLoan/audit.do?statue=fail&id=" + data.id);
	});*/
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

