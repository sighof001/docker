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
				{name : 'displayCheckType',	text : '审核类型'},
				{name : 'loginId',	text : '用户名'},
				{name : 'displayCheckStatus',	text : '审核状态'},
				{name : 'remark',	text : '审核意见'},
				{name : 'createUserId',	text : '审核人'},
				{name : 'displayCreateDate',	text : '审核日期'},
				{name : 'displayCreateTime',	text : '审核时间'}
		],
       	op: [
      		{name:'view', authority:'query',text:'查看', type:'icon', clazz:'icon-view', handler: view, hidden: testAuthority}
      	/*	{name:'edit', authority:'update',text:'编辑', type:'icon', clazz:'icon-edit', handler: edit, hidden: testAuthority},
	    	{name:'delete', authority:'delete',text:'删除', type:'icon', clazz:'icon-del', handler: del, hidden: testAuthority}*/
	    ],            
		datatype : "server",
		tableClass : "table-bordered table-hover table-striped",
		url : 'tryCheckList/queryTryCheckListPage.do',
		//rowsurl : 'tryCheckList/queryTryCheckListListCount.do',
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
		util.navigate("/tryCheckList/tryCheckListEdit.do");
	});
});
//查看
function view(data,el) {
	util.navigate("/tryCheckList/tryCheckListEdit.do?op=view&id=" + data.id);
}
//编辑
function edit(data,el) {
	util.navigate("/tryCheckList/tryCheckListEdit.do?op=update&id=" + data.id);
}	
//删除
function del(data,el) {
	art.dialog.confirm("确定删除吗？",function(){
		$.post(cxt + '/tryCheckList/delete.do',{id:data.id},function(data2){
			if(data2.success){
				$('li.active').click();
			}else{
				art.dialog.alert(data2.message);
			}
		},"json");
	});
}	
