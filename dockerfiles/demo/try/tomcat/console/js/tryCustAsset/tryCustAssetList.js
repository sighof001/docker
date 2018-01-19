$(document).ready(function() {
	initAuthority();
	$("#op").framecombox({});

	
	$("#table").frametable({
		columns : [ 
				{name:'id', text:'id', hidden:true},
				{name : 'loginId',	text : '用户名'},
				{name : 'goodsName',	text : '商品名称'},
				{name : 'displayBeginDate',	text : '起息日'},
				{name : 'displayEndDate',	text : '到期日'},
				{name : 'amount',	text : '总金额'},
				{name : 'displayStatus',	text : '资产状态'},
				{name : 'createUserId',	text : '创建人',hidden:true},
				{name : 'createDate',	text : '创建日期',hidden:true},
				{name : 'createTime',	text : '创建时间',hidden:true}
		],
       	op: [
      		{name:'view', authority:'query',text:'查看', type:'icon', clazz:'icon-view', handler: view, hidden: testAuthority}
	    ],            
		datatype : "server",
		tableClass : "table-bordered table-hover table-striped",
		url : 'tryCustAsset/queryTryCustAssetPage.do',
		//rowsurl : 'tryCustAsset/queryTryCustAssetListCount.do',
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
		util.navigate("/tryCustAsset/tryCustAssetEdit.do");
	});
});
//查看
function view(data,el) {
	util.navigate("/tryCustAsset/tryCustAssetEdit.do?op=view&id=" + data.id);
}
//编辑
function edit(data,el) {
	util.navigate("/tryCustAsset/tryCustAssetEdit.do?op=update&id=" + data.id);
}	
//删除
function del(data,el) {
	art.dialog.confirm("确定删除吗？",function(){
		$.post(cxt + '/tryCustAsset/delete.do',{id:data.id},function(data2){
			if(data2.success){
				$('li.active').click();
			}else{
				art.dialog.alert(data2.message);
			}
		},"json");
	});
}	
function returnPage(){
	var r = cxt + '/tryCustAsset/tryCustAssetList.do';
	if(returnType == '1'){
		
	}else if(returnType == '2'){
		r = '';
	}
	
	location.href = r;
}