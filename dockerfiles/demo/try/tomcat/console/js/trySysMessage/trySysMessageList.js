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
				{checkbox:true,align:'center', name:'box',width:10,text:"<input type='checkbox'  onclick = 'check()' id='check-all'/>"},
				{name : 'title',	text : '标题'},
//				{name : 'content',	text : '内容'},
				{name : 'messageTypeText',	text : '类型'},//0:系统消息,1:通知公告,2:个人消息
				{name : 'statusText',	text : '状态'},//0:未发布,1:已发布
				{name : 'status',text : '状态',hidden:true},//0:未发布,1:已发布
//				{name : 'receiveTypeText', text : '接收类型'},//0:所有,1:pc,2:app,3:微信',
				{name : 'publishTime',	text : '发布时间'},
				{name : 'createUserId',	text : '创建人/修改人'},
//				{name : 'createDate',	text : '创建日期'},
//				{name : 'createTime',	text : '创建时间'}
		],
       	op: [
      		{name:'view', authority:'query',text:'查看', type:'icon', clazz:'icon-view', handler: view, hidden: testAuthority},
      		{name:'edit', authority:'update',text:'编辑', type:'icon', clazz:'icon-edit', handler: edit, hidden: testAuthorityPublic},
	    	{name:'delete', authority:'delete',text:'删除', type:'icon', clazz:'icon-del', handler: del, hidden: testAuthority}
	    ],            
		datatype : "server",
		tableClass : "table-bordered table-hover table-striped",
		url : 'trySysMessage/queryTrySysMessagePage.do',
		//rowsurl : 'trySysMessage/queryTrySysMessageListCount.do',
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
		util.navigate("/trySysMessage/trySysMessageEdit.do");
	});
	
	//发布
	$("#publish-btn").on("click",function(){
		var length = $("input[type='checkbox']:checked").length;
		if(length == 0){
			art.dialog.alert("请勾选需要发布的!");
			return;
		}
		art.dialog.confirm("确定发布吗？",function(){
			var ids = new Array(); 
			$("input[type='checkbox']:checked").each(function(i){
				
				var id = $(this).parent("td").prev().text();
				if(id != 'id' && id != undefined && id != ""){
					ids.push(id);
				}
				
			});
			
			$.post(cxt + '/trySysMessage/publish.do',{ids:ids.join(",")},function(data){
				if(data.success){
					$('li.active').click();
					art.dialog.alert("发布成功!");
				}else{
					art.dialog.alert(data.message);
				}
			},"json");
		});
	});
	
	
	//撤销
	$("#revoke-btn").on("click",function(){
		var length = $("input[type='checkbox']:checked").length;
		if(length == 0){
			art.dialog.alert("请勾选需要撤销的选项!");
			return;
		}
		art.dialog.confirm("确定撤销项吗？",function(){
			var ids = new Array(); 
			$("input[type='checkbox']:checked").each(function(i){
				
				var id = $(this).parent("td").prev().text();
				if(id != 'id' && id != undefined && id != ""){
					ids.push(id);
				}
			});
			
			$.post(cxt + '/trySysMessage/revoke.do',{ids:ids.join(",")},function(data){
				if(data.success){
					$('li.active').click();
					art.dialog.alert("撤销成功!");
				}else{
					art.dialog.alert(data.message);
				}
			},"json");
		});
	});
});


//复选框选择
function check(){
	var checkall = $("#check-all")[0];
	var checkbox$ = $('input[type="checkbox"]');
	for (var i in checkbox$) {
		checkbox$[i].checked = checkall.checked;
	}
}


//查看
function view(data,el) {
	util.navigate("/trySysMessage/trySysMessageEdit.do?op=view&id=" + data.id);
}
//编辑
function edit(data,el) {
	util.navigate("/trySysMessage/trySysMessageEdit.do?op=update&id=" + data.id);
}	
//删除
function del(data,el) {
	art.dialog.confirm("确定删除吗？",function(){
		$.post(cxt + '/trySysMessage/delete.do',{id:data.id},function(data2){
			if(data2.success){
				$('li.active').click();
			}else{
				art.dialog.alert(data2.message);
			}
		},"json");
	});
}

function testAuthorityPublic(name,rowData){
	
	if(public_yes == rowData['status']){
		return true;
	}
	
	return false;
}
