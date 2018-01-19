$(document).ready(function() {
	initAuthority();
	$("#op").framecombox({});

	//默认日期
	$('.wdate').val(getYyyy_MM_dd());
	$('#queryPayOutStatus').val('0');
	//$('#dueDate').val(getYyyy_MM_dd(1));
	$("#table").frametable({
		columns : [ 
				{name:'id', text:'交易流水号', hidden:true},
				{name : 'loginId',	text : '用户名'},
				{name : 'realName',	text : '姓名'},
				{name : 'mobile',	text : '手机'},
				{name : 'goodsName',	text : '商品名称'},
				{name : 'displayRate',	text : '利率(%)'},
				{name : 'term',	text : '期限(年)'},
				{name : 'contractNumber',	text : '合同号', hidden:true},
				{name : 'amount',	text : '委托金额(元)'},
				{name : 'entrustDateText',	text : '委托日期'},
				{name : 'dueDateText',	text : '到期日期'},
				{name : 'lastInterestTimeText',	text : '上次付息时间'},
				{name : 'status',	text : '订单状态,0:正常,1：已取消,2:已删除', hidden:true},
				{name : 'displayPayOutStatus',	text : '状态'},
				{name : 'payOutAmount',	text : '转出金额(元)'},
				{name : 'payOutUserId',	text : '转出人', hidden:true},
				{name : 'payOutDateText',	text : '转出日期'},
				{name : 'payOutTime',	text : '转出时间', hidden:true},
				{name : 'remark',	text : '说明', hidden:true},
				{name : 'createUserId',	text : '创建人', hidden:true},
				{name : 'createDate',	text : '创建日期', hidden:true},
				{name : 'createTime',	text : '创建时间', hidden:true}
		],
       	op: [
      		{name:'view', authority:'query',text:'查看', type:'icon', clazz:'icon-view', handler: view, hidden: testAuthority},
      		{name:'payInterest', authority:'update',rowData:'payOutStatus',text:'付息', type:'icon', clazz:'icon-due', handler: payInterest, hidden: showOldEntrustAuthority},
      		{name:'payOut', authority:'update',rowData:'payOutStatus',text:'转出', type:'icon', clazz:'icon-export', handler: payOut, hidden: showOldEntrustAuthority},
//	    	{name:'delete', authority:'delete',text:'删除', type:'icon', clazz:'icon-del', handler: del, hidden: testAuthority}
	    ],            
		datatype : "server",
		tableClass : "table-bordered table-hover table-striped",
		url : 'oldEntrustOrder/queryOldEntrustOrderPage.do',
		//rowsurl : 'oldEntrustOrder/queryOldEntrustOrderListCount.do',
		query_param : formutil.getFields($("#query-form")),
		pageName : 'page',
		pageSizeName : 'limit'
	});

	$("#query-btn").on("click", function() {
		var params = formutil.getFields($("#query-form"));
		$("#table").frametable("query", params);
		
		return false;
	});
	//导出数据
  	$('#export').on('click',function(){
	  	location.href = cxt + '/oldEntrustOrder/exportForInterest.do';
  	});
  	//批量付息
	$("#batchInterest").on("click",function(){
		var _this = $(this);
		 var fileDir = $("#upfile").val();  
		    var suffix = fileDir.substr(fileDir.lastIndexOf("."));  
		    if("" == fileDir){  
		    	art.dialog.alert("选择需要导入的Excel文件！");  
		        return false;  
		    }  
		    if(".xls" != suffix && ".xlsx" != suffix ){  
		    	art.dialog.alert("选择Excel格式的文件导入！");  
		        return false;  
		    }  
		$("#form1").ajaxSubmit({
			anysc:false,
			type: "POST",
			url:cxt + '/oldInterestOrder/batchInterestSubmit.do',
			dataType: "json",
			beforeSubmit:buttonDisable(_this),
		    success: function(data){
		    	$('#batchInterest').prop("disabled",true);
		     	if(data.success){
		     		$('li.active').click();
		     		art.dialog.alert("批量付息成功");
		     	  	$('#batchInterest').prop("disabled",false);
		   		 }
		    	else{
		    		art.dialog.alert(data.message);
		    		$('#batchInterest').prop("disabled",false);
		    	}
			}
		})
	})
  	
	//新增
	$("#add-btn").on("click", function() {
		util.navigate("/oldEntrustOrder/oldEntrustOrderEdit.do");
	});
	autocompleteOpType(cxt+"/tryCustInfo/getAllCustInfo.do");
});
//查看
function view(data,el) {
	util.navigate("/oldEntrustOrder/oldEntrustOrderEdit.do?op=view&id=" + data.id);
}
//编辑
function edit(data,el) {
	util.navigate("/oldEntrustOrder/oldEntrustOrderEdit.do?op=update&id=" + data.id);
}	
//删除
function del(data,el) {
	art.dialog.confirm("确定删除吗？",function(){
		$.post(cxt + '/oldEntrustOrder/delete.do',{id:data.id},function(data2){
			if(data2.success){
				$('li.active').click();
			}else{
				art.dialog.alert(data2.message);
			}
		},"json");
	});
}	
//付息
function payInterest(data,el){
//	art.dialog.confirm("确定进入付息操作页面？",function(){
		util.navigate("/oldEntrustOrder/oldEntrustOrderInterest.do?op=update&id=" + data.id);
//	});
}
//转出
function payOut(data,el){
	art.dialog.confirm("确定转出到用户余额吗？",function(){
		$.post(cxt + '/oldEntrustOrder/UpdateOldEntrustOrderPayOut.do',{id:data.id},function(data2){
			if(data2.success){
				$('li.active').click();
			}else{
				art.dialog.alert(data2.message);
			}
		},"json");
	//	util.navigate("/oldEntrustOrder/UpdateOldEntrustOrderPayOut.do?id=" + data.id);
		//util.navigate("/oldEntrustOrder/oldEntrustOrderPayOut.do?op=update&id=" + data.id);
	});
}
function autocompleteOpType(date){
	$("#queryLoginIdText").autocomplete(date, {
	    dataType: "json",
	    extraParams: { //后台参数
	    	customerAccount: function() {
	            return encodeURI(encodeURI($("#queryLoginId").val())); //url的参数传递
	        }
	    },
	    parse: function(data) {
			return $.map(data, function(row) {
	            return {
	                data: row,
	                value: row.loginId + row.mobile,
	                result: row.loginId
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
	        return "<I><b>" + data.loginId + "</b></I>【" + data.mobile + "】";
	    },
	    formatMatch: function(data, i, total) {
	        return  data.loginId;
	    },
	    formatResult: function(data) {
	        return data.mobile;
	    }
	}).result(function(event, item) {
	    $('#queryLoginId').val(item.loginId);
	    $('#queryLoginIdText').val(item.loginId+'【'+item.mobile+'】');
	});
	
	
}
//按钮失效
function buttonDisable(e){
	e.prop("disabled",true);
}