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
				{name : 'displayDays',	text : '天数'},
				{name : 'principal',	text : '本金'},
				{name : 'displayRate',	text : '日利率(%)'}
		],
       	op: [
      		{name:'view', authority:'query',text:'查看', type:'icon', clazz:'icon-view', handler: view, hidden: testAuthority},
      		{name:'edit', authority:'update',text:'编辑', type:'icon', clazz:'icon-edit', handler: edit, hidden: testAuthority},
	    	{name:'delete', authority:'delete',text:'删除', type:'icon', clazz:'icon-del', handler: del, hidden: testAuthority}
	    ],            
		datatype : "server",
		tableClass : "table-bordered table-hover table-striped",
		url : 'tryFpRate/queryTryFpRatePage.do',
		//rowsurl : 'tryFpRate/queryTryFpRateListCount.do',
		query_param : formutil.getFields($("#query-form")),
		pageName : 'page',
		pageSizeName : 'limit'
	});

	$("#query-btn").on("click", function() {
		var params = formutil.getFields($("#query-form"));
		$("#table").frametable("query", params);
		
		return false;
	});
	//导出
	$("#export-btn").on("click", function() {
		util.navigate("/tryFpRate/export.do");
	})
	//导入
	$("#inport-btn").on("click", function() {
		util.navigate("/tryFpRate/inport.do");
	})
	//模板导出
	$("#demo-btn").on("click", function() {
		util.navigate("/tryFpRate/excelDemo.do");
	})
	
	//新增
	$("#add-btn").on("click", function() {
		util.navigate("/tryFpRate/tryFpRateEdit.do");
	});
	/*$("#form1").ajaxSubmit({
		
	})*/
	//确定导入
	$("#test").on("click",function(){
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
			url:cxt + '/tryFpRate/inport.do',
			dataType: "json",
			beforeSubmit:buttonDisable(_this),
		    success: function(data){
		    	$('#test').prop("disabled",true);
		     	if(data.success){
		     		$('li.active').click();
		     	  	$('#test').prop("disabled",false);
		   		 }
		    	else{
		    		art.dialog.alert(data.message);
		    		$('#test').prop("disabled",false);
		    	}
			}
		})
	})
});
//按钮失效
function buttonDisable(e){
	e.prop("disabled",true);
}
//查看
function view(data,el) {
	util.navigate("/tryFpRate/tryFpRateEdit.do?op=view&id=" + data.id);
}
//编辑
function edit(data,el) {
	util.navigate("/tryFpRate/tryFpRateEdit.do?op=update&id=" + data.id);
}	
//删除
function del(data,el) {
	art.dialog.confirm("确定删除吗？",function(){
		$.post(cxt + '/tryFpRate/delete.do',{id:data.id},function(data2){
			if(data2.success){
				$('li.active').click();
			}else{
				art.dialog.alert(data2.message);
			}
		},"json");
	});
}	

