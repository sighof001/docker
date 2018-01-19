$(document).ready(function() {
	initAuthority();
	$("#op").framecombox({});

	//默认日期
	$('.wdate').val(getYyyy_MM_dd());
	$('#queryBeignTradeDate').val(getYyyy_MM_dd(-30));
	$('#queryEndTradeDate').val(getYyyy_MM_dd());
	$("#table").frametable({
		columns : [ 
				{name:'id', text:'交易流水号', hidden:true},
				{name : 'entrustId',	text : '委托id', hidden:true},
				{name : 'loginId',	text : '用户名'},
				{name : 'realName',	text : '姓名'},
				{name : 'goodsName',	text : '商品名称'},
				{name : 'amount',	text : '金额(元)'},
				{name : 'displayRemark',	text : '说明'},
				{name : 'status',	text : '状态,0正常,1删除', hidden:true},
				{name : 'tradeDateText',	text : '付息时间'},
				{name : 'createUserId',	text : '付息人'}
		],
       	op: [
      		{name:'view', authority:'query',text:'查看', type:'icon', clazz:'icon-view', handler: view, hidden: testAuthority},
//      		{name:'edit', authority:'update',text:'编辑', type:'icon', clazz:'icon-edit', handler: edit, hidden: testAuthority},
//	    	{name:'delete', authority:'delete',text:'删除', type:'icon', clazz:'icon-del', handler: del, hidden: testAuthority}
	    ],            
		datatype : "server",
		tableClass : "table-bordered table-hover table-striped",
		url : 'oldInterestOrder/queryOldInterestOrderPage.do',
		//rowsurl : 'oldInterestOrder/queryOldInterestOrderListCount.do',
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
		util.navigate("/oldInterestOrder/oldInterestOrderEdit.do");
	});
});
//查看
function view(data,el) {
	util.navigate("/oldInterestOrder/oldInterestOrderEdit.do?op=view&id=" + data.id);
}
//编辑
function edit(data,el) {
	util.navigate("/oldInterestOrder/oldInterestOrderEdit.do?op=update&id=" + data.id);
}	
//删除
function del(data,el) {
	art.dialog.confirm("确定删除吗？",function(){
		$.post(cxt + '/oldInterestOrder/delete.do',{id:data.id},function(data2){
			if(data2.success){
				$('li.active').click();
			}else{
				art.dialog.alert(data2.message);
			}
		},"json");
	});
}	
