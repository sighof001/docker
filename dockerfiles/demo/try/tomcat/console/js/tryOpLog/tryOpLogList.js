$(document).ready(function() {
	initAuthority();
	$("#op").framecombox({});

	//默认日期
	$('#queryCreateDateEnd').val(getYyyy_MM_dd());
	$('#queryCreateDateBegin').val(getYyyy_MM_dd(-7));
	//$('#valueDate').val(getYyyy_MM_dd());
	//$('#dueDate').val(getYyyy_MM_dd(1));
	$("#table").frametable({
		columns : [ 
				{name:'id', text:'id', hidden:true},
				{name : 'opTypeText',	text : '操作类型'},//枚举各种操作
				{name : 'userName',	text : '创建人'},
				{name : 'dateText',	text : '创建日期'},
				{name : 'opUserTypeText',text :'平台类型'},
				{name : 'content',	text : '日志内容'}
				
		],
       	op: [
      		{name:'view', authority:'query',text:'查看', type:'icon', clazz:'icon-view', handler: view, hidden: testAuthority},
//      	{name:'edit', authority:'update',text:'编辑', type:'icon', clazz:'icon-edit', handler: edit, hidden: testAuthority},
//	    	{name:'delete', authority:'delete',text:'删除', type:'icon', clazz:'icon-del', handler: del, hidden: testAuthority}
	    ],            
		datatype : "server",
		tableClass : "table-bordered table-hover table-striped",
		url : 'tryOpLog/queryTryOpLogPage.do',
		//rowsurl : 'tryOpLog/queryTryOpLogListCount.do',
		query_param : formutil.getFields($("#query-form")),
		pageName : 'page',
		pageSizeName : 'limit'
	});

	$("#query-btn").on("click", function() {
		var params = formutil.getFields($("#query-form"));
		$("#table").frametable("query", params);
		
		return false;
	});
	
	autocompleteOpType(cxt+"/tryOpLog/queryTryOpType.do");
	
});
//查看
function view(data,el) {
	util.navigate("/tryOpLog/tryOpLogEdit.do?op=view&id=" + data.id);
}
//编辑
function edit(data,el) {
	util.navigate("/tryOpLog/tryOpLogEdit.do?op=update&id=" + data.id);
}	
//删除
function del(data,el) {
	art.dialog.confirm("确定删除吗？",function(){
		$.post(cxt + '/tryOpLog/delete.do',{id:data.id},function(data2){
			if(data2.success){
				$('li.active').click();
			}else{
				art.dialog.alert(data2.message);
			}
		},"json");
	});
}	



function autocompleteOpType(date){
	$("#queryOpTypeText").autocomplete(date, {
	    dataType: "json",
	    extraParams: { //后台参数
	    	customerAccount: function() {
	            return encodeURI(encodeURI($("#queryOpType").val())); //url的参数传递
	        }
	    },
	    parse: function(data) {
			return $.map(data, function(row) {
	            return {
	                data: row,
	                value: row.text + row.dictValue,
	                result: row.dictValue
	            }
	        });
	    },
	    minChars: 0,
	    max: 100,
	    autoFill: false,
	    mustMatch: false,
	    matchContains: true,
	    multiple: false,
	    width: 250,
	    scrollHeight:250,
	    formatItem: function(data, i, total) {
	        return "<I><b>" + data.text + "</b></I>【" + data.dictValue + "】";
	    },
	    formatMatch: function(data, i, total) {
	        return  data.text;
	    },
	    formatResult: function(data) {
	        return data.dictValue;
	    }
	}).result(function(event, item) {
	    $('#queryOpType').val(item.dictValue);
	    $('#queryOpTypeText').val(item.text);
	});
	
	
}

function reduceDays(date,days){
	var nd = new Date(date);
   nd = nd.valueOf();
   nd = nd - days * 24 * 60 * 60 * 1000;
   nd = new Date(nd);
	   //alert(nd.getFullYear() + "年" + (nd.getMonth() + 1) + "月" + nd.getDate() + "日");
	var y = nd.getFullYear();
	var m = nd.getMonth()+1;
	var d = nd.getDate();
	if(m <= 9) m = "0"+m;
	if(d <= 9) d = "0"+d; 
	var cdate = y+"-"+m+"-"+d;
	return cdate;
}
