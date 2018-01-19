$(document).ready(function() {
	initAuthority();
	$("#op").framecombox({});

	//默认日期
	$('#queryEndDate').val(getYyyy_MM_dd());
	$('#queryBeignDate').val(getYyyy_MM_dd(-30));
	
	$("#table").frametable({
		columns : [ 
				{name:'id', text:'交易流水号', hidden:true},
				{name : 'loginId',	text : '用户名'},
				{name : 'mobile' , text: '手机'},
				{name : 'amountText',	text : '交易金额'},
				{name : 'orderTypeText' , text : '类型'},//1:充值订单,2:提现订单,3:委托订单,4:转出订单,5:付息
				/*{name : 'custAmountText',	text : '余额'},*/
				{name : 'payStatusText',	text : '订单状态'},
				{name : 'createDateText',	text : '创建日期'}
		],
       	op: [
      		{name:'view', authority:'query',text:'编辑', type:'icon', clazz:'icon-view', handler: view, hidden: testAuthority},
//      		{name:'edit', authority:'update',text:'编辑', type:'icon', clazz:'icon-edit', handler: edit, hidden: testAuthority},
//	    	{name:'delete', authority:'delete',text:'删除', type:'icon', clazz:'icon-del', handler: del, hidden: testAuthority}
	    ],            
		datatype : "server",
		tableClass : "table-bordered table-hover table-striped",
		url : 'tryOrder/queryTryOrderPage.do',
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
	
	//新增
	$("#add-btn").on("click", function() {
		util.navigate("/tryOrder/tryOrderEdit.do");
	});
});
//查看
function view(data,el) {
	util.navigate("/tryOrder/tryOrderEdit.do?op=view&id=" + data.id);
}
//编辑
function edit(data,el) {
	util.navigate("/tryOrder/tryOrderEdit.do?op=update&id=" + data.id);
}	
//删除
function del(data,el) {
	art.dialog.confirm("确定删除吗？",function(){
		$.post(cxt + '/tryOrder/delete.do',{id:data.id},function(data2){
			if(data2.success){
				$('li.active').click();
			}else{
				art.dialog.alert(data2.message);
			}
		},"json");
	});
}	
