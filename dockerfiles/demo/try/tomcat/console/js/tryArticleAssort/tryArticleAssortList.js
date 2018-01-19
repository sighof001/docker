$(document).ready(function() {
	initAuthority();
	$("#op").framecombox({});

	//默认日期
	$('.wdate').val(getYyyy_MM_dd());
	//$('#valueDate').val(getYyyy_MM_dd());
	//$('#dueDate').val(getYyyy_MM_dd(1));
	$("#table").frametable({
		columns : [ 
				{name:'id', text:'', hidden:true},
				{name : 'themeName',	text : '栏目名称'},
				{name : 'themeKey',	text : '栏目key'},
				{name : 'sequence',	text : '排序'},
				{name : 'displayType',	text : '类型'},
		],
       	op: [
      		{name:'view', authority:'query',text:'查看', type:'icon', clazz:'icon-view', handler: view, hidden: testAuthority},
      		{name:'edit', authority:'update',text:'编辑', type:'icon', clazz:'icon-edit', handler: edit, hidden: testAuthority},
	    	{name:'delete', authority:'delete',text:'删除', type:'icon', clazz:'icon-del', handler: del, hidden: testAuthority}
	    ],            
		datatype : "server",
		tableClass : "table-bordered table-hover table-striped",
		url : 'tryArticleAssort/queryTryArticleAssortPage.do',
		//rowsurl : 'tryArticleAssort/queryTryArticleAssortListCount.do',
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
		util.navigate("/tryArticleAssort/tryArticleAssortEdit.do");
	});
});
//查看
function view(data,el) {
	util.navigate("/tryArticleAssort/tryArticleAssortEdit.do?op=view&id=" + data.id);
}
//编辑
function edit(data,el) {
	util.navigate("/tryArticleAssort/tryArticleAssortEdit.do?op=update&id=" + data.id);
}	
//删除
function del(data,el) {
	art.dialog.confirm("确定删除吗？",function(){
		$.post(cxt + '/tryArticleAssort/delete.do',{id:data.id},function(data2){
			if(data2.success){
				$('li.active').click();
			}else{
				art.dialog.alert(data2.message);
			}
		},"json");
	});
}	
