$(document).ready(function() {
	/*$('input[name=remark]').change(function() {
		checkRemark();
	});*/
	//确认拒绝
	$("#fail").on("click",function(){
		var remark=$("#remark").val();
		var id=$("#id").val();
		if(!checkRemark()){
			return false;
		}
		$.post(cxt + '/tryCheckRealAuth/audit.do',{"id":id,"remark":remark,"statue":"fail"},function(data){
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
			if(checkRemark()){
			util.navigate("/tryCheckRealAuth/audit.do?statue=fail&id=" + id+"&remark="+remark);
			//art.dialog.alert("审核成功");
			artDialog.alert("审核完成");
			$('li.active').click();
			}
		}else{
			art.dialog.alert("请填写审核意见");
		}
		$("#myModal").modal("hide");
		return false;*/
	});
	
	
	
	
	initAuthority();
	$("#op").framecombox({});

	//默认日期
	$('.wdate').val(getYyyy_MM_dd());
	$("#table").frametable({
		columns : [ 
				{name:'id', text:'id', hidden:true},
				{name : 'loginId',	text : '登录名'},
				{name : 'realName',	text : '姓名'},
				{name : 'birthday',	text : '出生日期'},
				{name : 'mobile',	text : '手机'},
				{name : 'cardNumber',	text : '银行卡号',hidden:true},
				{name : 'idCard',	text : '身份证号'},
				{name : 'custTypeText',text : '用户类型'},
				{name : 'statusText',	text : '用户状态'},
				{name : 'displayAuthStatus',text : '审核状态'},
				{name : 'realAuthRemark',text : '审核意见'},
		],
       	op: [
       	    {name:'view', authority:'query',text:'查看', type:'icon', clazz:'icon-view', handler: view, hidden: testAuthority},
      		/*{name:'eidt', authority:'update',text:'编辑', type:'icon', clazz:'icon-edit', handler: edit, hidden: testAuthority},*/
      		{name:'checkPass',rowData:'authStatus',authority:'update',text:'审核通过', type:'icon', clazz:'icon-submitCheck', handler: checkPass, hidden: hiddenAuditButtonAuthorityForAuth},
	    	{name:'checkFail',rowData:'authStatus',authority:'update',text:'审核拒绝', type:'icon', clazz:'icon-auditFail', handler: checkFail, hidden: hiddenAuditButtonAuthorityForAuth},
	    ],            
		datatype : "server",
		tableClass : "table-bordered table-hover table-striped",
		url : 'tryCheckRealAuth/queryTryCheckRealAuthPage.do',
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
	util.navigate("/tryCheckRealAuth/tryCheckRealAuthEdit.do?op=view&id=" + data.id);
}
//编辑
function edit(data,el) {
	util.navigate("/tryCheckRealAuth/tryCheckRealAuthEdit.do?op=update&id=" + data.id);
}	
//审核通过
function checkPass(data,el){
	art.dialog.confirm("确定审核通过吗？",function(){
		$.post(cxt + '/tryCheckRealAuth/audit.do',{id:data.id,"statue":"pass"},function(data){
			if(data.success){
				artDialog.alert("审核成功");
				$('li.active').click();
			}else{
				artDialog.alert(data.message);
			}
		},"json");
		//util.navigate("/tryCheckRealAuth/audit.do?statue=pass&id=" + data.id);
	});
}
//审核拒绝
function checkFail(data,el){
	$("#myModal").modal("show");
	$("#id").val(data.id);
	/*art.dialog.confirm("确定审核拒绝吗？",function(){
		util.navigate("/tryCheckRealAuth/audit.do?statue=fail&id=" + data.id);
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
