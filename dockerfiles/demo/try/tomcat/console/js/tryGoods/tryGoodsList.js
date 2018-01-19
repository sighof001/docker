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
				{checkbox : true,align : 'center',name : 'box',width : 10,text : "<input type='checkbox'  onclick = 'check()' id='check-all'/>"},
				{name : 'goodsCode',	text : '编号'},
				{name : 'goodsName',	text : '名称'},
				{name : 'displayGoodsType',	text : '类型'},
				{name : 'rate',	text : '年化利率'},
				{name : 'term',	text : '期限(天)'},
				{name : 'interestFrequency',	text : '计息频率(天)'},
				{name : 'startAmount',	text : '起投金额(元)'},
				{name : 'increaseAmount',	text : '递增金额(元)'},
				{name : 'displayPublishStatus',	text : '上架'},
				{name : 'displayRecommendFlag',	text : '推荐'},
				{name : 'payInterestTypeStr',	text : '返息方式',hidden:true},
				{name : 'displayDescription',	text : '产品介绍'},
				{name : 'sequence',	text : '序号'},
				{name : 'createUserId',	text : '创建人',hidden:true},
				{name : 'createDate',	text : '创建日期',hidden:true},
				{name : 'createTime',	text : '创建时间',hidden:true}
		],
       	op: [
       	    {name:'view', authority:'query',text:'查看', type:'icon', clazz:'icon-view', handler: view, hidden: testAuthority},
      		{name:'eidt',rowData:'publishStatus', authority:'update',text:'编辑', type:'icon', clazz:'icon-edit', handler: edit, hidden: showEditButtonAuthority},
	    	{name:'delete', authority:'delete',text:'删除', type:'icon', clazz:'icon-del', handler: del, hidden: showEditButtonAuthority},
//	    	{name:'publish',rowData:'publishStatus', authority:'update',text:'上架', type:'icon', clazz:'icon-export', handler: publish, hidden: showEditButtonAuthority},
//	    	{name:'unpublish',rowData:'publishStatus', authority:'update',text:'下架', type:'icon', clazz:'icon-unpublish', handler: unpublish, hidden: showEditButtonAuthority2}
	    ],            
		datatype : "server",
		tableClass : "table-bordered table-hover table-striped",
		url : 'tryGoods/queryTryGoodsPage.do',
		//rowsurl : 'tryGoods/queryTryGoodsListCount.do',
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
		util.navigate("/tryGoods/tryGoodsEdit.do");
	});
	//上架
	$("#publish").on("click",function(){
		var length = $("input[type='checkbox']:checked").length;
		if(length == 0){
			art.dialog.alert("请勾选需要上架的产品!");
			return;
		}
		art.dialog.confirm("确定上架吗？",function(){
			var ids = new Array(); 
			$("input[type='checkbox']:checked").each(function(i){
				var id = $(this).parent("td").prev().text();
				if(id != 'id' && id != undefined && id != ""){
					ids.push(id);
				}
				
			});
			$.post(cxt + '/tryGoods/publishMore.do',{ids:ids.join(",")},function(data){
				if(data.success){
					$('li.active').click();
					art.dialog.alert("上架成功!");
				}else{
					art.dialog.alert(data.message);
				}
			},"json");
			
		});
		
	});
	//下架
	$("#unPublish").on("click",function(){
		var length = $("input[type='checkbox']:checked").length;
		if(length == 0){
			art.dialog.alert("请勾选需要下架的产品!");
			return;
		}
		art.dialog.confirm("确定下架吗？",function(){
			var ids = new Array(); 
			$("input[type='checkbox']:checked").each(function(i){
				var id = $(this).parent("td").prev().text();
				if(id != 'id' && id != undefined && id != ""){
					ids.push(id);
				}
				
			});
			$.post(cxt + '/tryGoods/unPublishMore.do',{ids:ids.join(",")},function(data){
				if(data.success){
					$('li.active').click();
					art.dialog.alert("下架成功!");
				}else{
					art.dialog.alert(data.message);
				}
			},"json");
			
		});
		
	});
});
//查看
function view(data,el) {
	util.navigate("/tryGoods/tryGoodsEdit.do?op=view&id=" + data.id);
}
//编辑
function edit(data,el) {
	util.navigate("/tryGoods/tryGoodsEdit.do?op=update&id=" + data.id);
}	
//删除
function del(data,el) {
	art.dialog.confirm("确定删除吗？",function(){
		$.post(cxt + '/tryGoods/delete.do',{id:data.id},function(data2){
			if(data2.success){
				$('li.active').click();
			}else{
				art.dialog.alert(data2.message);
			}
		},"json");
	});
}
//上架
function publish(data,el){
	art.dialog.confirm("确定上架吗？",function(){
		$.post(cxt+'/tryGoods/publish.do',{op:'update',id:data.id},function(data2){
			if(data2.success){
				artDialog.alert("上架成功");
				$('li.active').click();
			}else{
				art.dialog.alert(data2.message);
			}
		},"json");
		//util.navigate("/tryGoods/publish.do?op=update&id=" + data.id);
	});
}
//下架
function unpublish(data,el){
	art.dialog.confirm("确定下架吗？",function(){
		$.post(cxt+'/tryGoods/unpublish.do',{op:'update',id:data.id},function(data2){
			if(data2.success){
				artDialog.alert("下架成功");
				$('li.active').click();
			}else{
				art.dialog.alert(data2.message);
			}
		},"json");
	});
}
//复选框选择
function check() {
	var checkall = $("#check-all")[0];
	var checkbox$ = $('input[type="checkbox"]');
	var checkboxLength = checkbox$.length;
	var checkedLength = $('input[type="checkbox"]:checked').length;
	for (var i = 1; i < checkbox$.size(); i++) {
		checkbox$[i].onclick = function() {
			if (!checkbox$.checked) {
				checkall.checked = false;
			}
		}
	}
	for (var i = 0; i < checkbox$.size(); i++) {
		checkbox$[i].checked = checkall.checked;
	}
}