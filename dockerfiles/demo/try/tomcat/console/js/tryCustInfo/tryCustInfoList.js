$(document).ready(function() {
	initAuthority();
	$("#op").framecombox({});

	//默认日期
	$('.wdate').val(getYyyy_MM_dd());
	$("#table").frametable({
		columns : [ 
				{name:'id', text:'id', hidden:true},
				{checkbox:true,align:'center', name:'box',width:10,text:"<input type='checkbox'  onclick = 'check()' id='check-all'/>"},
				{name : 'loginId',	text : '登录名'},
				{name : 'realName',	text : '姓名'},
				{name : 'nickName',	text : '昵称'},
				{name : 'mobile',	text : '手机'},
				{name : 'cardNumber',	text : '银行卡号'},
				{name : 'idCard',	text : '身份证号'},
				{name : 'email',	text : '电子邮箱'},
				//{name : 'custType',	text : '用户类型'},//,0:普通用户,1:扶贫用户
				{name : 'custTypeText',text : '用户类型'},
				{name : 'status',	text : '用户状态',hidden:true},//,0:正常,1:冻结,2:失效
				{name : 'statusText',	text : '用户状态'},
//				{name : 'createUserId',	text : '创建人'},//,如果是自己注册则为空
//				{name : 'createDate',	text : '创建日期'},
//				{name : 'createTime',	text : '创建时间'}
		],
       	op: [
       	    {name:'view', authority:'query',text:'查看', type:'icon', clazz:'icon-view', handler: view, hidden: testAuthority},
      		{name:'eidt', authority:'update',text:'编辑', type:'icon', clazz:'icon-edit', handler: edit, hidden: testAuthority},
	    	{name:'delete',rowData:'status', authority:'delete',text:'置为失效', type:'icon', clazz:'icon-invalid', handler: del, hidden: testAuthorityForDelete},
	    	{name:'reset', authority:'update',text:'重置银行卡', type:'icon', clazz:'icon-plan', handler: resetBankCard, hidden: testAuthority},
	    	
	    ],            
		datatype : "server",
		tableClass : "table-bordered table-hover table-striped",
		url : 'tryCustInfo/queryTryCustInfoPage.do',
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
		util.navigate("/tryCustInfo/tryCustInfoEdit.do");
	});
	
	//冻结
	$("#frozen-btn").on("click",function(){
		var length = $("input[type='checkbox']:checked").length;
		if(length == 0){
			art.dialog.alert("请勾选需要冻结的选项!");
			return;
		}
		art.dialog.confirm("确定冻结吗？",function(){
			var ids = new Array(); 
			$("input[type='checkbox']:checked").each(function(i){
				
				var id = $(this).parent("td").prev().text();
				if(id != 'id' && id != undefined && id != ""){
					ids.push(id);
				}
				
			});
			
			$.post(cxt + '/tryCustInfo/frozen.do',{ids:ids.join(",")},function(data){
				if(data.success){
					$('li.active').click();
					art.dialog.alert("冻结成功!");
				}else{
					art.dialog.alert(data.message);
				}
			},"json");
		});
	});
	
	
	//解冻 
	$(".unhitch-btn").on("click",function(){
		var length = $("input[type='checkbox']:checked").length;
		if(length == 0){
			art.dialog.alert("请勾选需要操作的选项!");
			return;
		}
		var text = $(this).find('span').text();
		art.dialog.confirm("确定"+text+"吗？",function(){
			var ids = new Array(); 
			$("input[type='checkbox']:checked").each(function(i){
				
				var id = $(this).parent("td").prev().text();
				if(id != 'id' && id != undefined && id != ""){
					ids.push(id);
				}
				
			});
			
			$.post(cxt + '/tryCustInfo/unhitch.do',{ids:ids.join(",")},function(data){
				if(data.success){
					$('li.active').click();
					art.dialog.alert(text+"成功!");
				}else{
					art.dialog.alert(data.message);
				}
			},"json");
		});
	});
	
	//激活
	$(".activation-btn").on("click",function(){
		var length = $("input[type='checkbox']:checked").length;
		if(length == 0){
			art.dialog.alert("请勾选需要操作的选项!");
			return;
		}
		var text = $(this).find('span').text();
		art.dialog.confirm("确定"+text+"吗？",function(){
			var ids = new Array(); 
			$("input[type='checkbox']:checked").each(function(i){
				
				var id = $(this).parent("td").prev().text();
				if(id != 'id' && id != undefined && id != ""){
					ids.push(id);
				}
				
			});
			
			$.post(cxt + '/tryCustInfo/activation.do',{ids:ids.join(",")},function(data){
				if(data.success){
					$('li.active').click();
					art.dialog.alert(text+"成功!");
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
	util.navigate("/tryCustInfo/tryCustInfoEdit.do?op=view&id=" + data.id);
}
//编辑
function edit(data,el) {
	util.navigate("/tryCustInfo/tryCustInfoEdit.do?op=update&id=" + data.id);
}	
//授权
function purview(data,el){
	util.navigate("/tryCustInfo/tryCustInfoPurview.do?op=purview&id=" + data.id);
}

//删除
function del(data,el) {
	art.dialog.confirm("确定将此用户置为失效吗？",function(){
		$.post(cxt + '/tryCustInfo/delete.do',{id:data.id},function(data2){
			if(data2.success){
				$('li.active').click();
			}else{
				art.dialog.alert(data2.message);
			}
		},"json");
	});
}	
//重置银行卡
function resetBankCard(data,el){
	art.dialog.confirm("确定允许此用户重新绑定银行卡吗？",function(){
		$.post(cxt + '/tryCustInfo/resetBankCard.do',{id:data.id},function(data2){
			if(data2.success){
				$('li.active').click();
				art.dialog.alert("操作成功");
			}else{
				art.dialog.alert(data2.message);
			}
		},"json");
	});
}