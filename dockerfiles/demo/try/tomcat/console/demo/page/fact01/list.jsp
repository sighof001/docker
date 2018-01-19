<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="../../../header/header.jsp"%>
<link href="<%=path%>/js/plugin/jqueryui/css/smoothness/jquery-ui-1.10.4.custom.min.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="<%=path%>/js/plugin/jqueryui/js/jquery-ui-1.10.4.js"></script>
</head>
<body>
	<div class="panel panel-default no-border">
		<div class="panel-heading">
			<div id="query-form" class="row">
				<span class="query-label">日期：</span>
				<div class="col-xs-2">
					<input id="dateCode" type="text" class="form-control" placeholder="需要日期控件">
				</div>
				<span class="query-label">机构：</span>
				<div class="col-xs-2">
					<input id="orgCode" type="text" class="form-control">
				</div>
				<button id="query-btn" class="btn btn-primary disabled" disabled>
					<i class="icon-search"></i> 查询</button>
				<button id="add-btn" class="btn btn-danger disabled" disabled>
					<i class="icon-plus"></i> 增加</button>
			</div>
		</div>
		<div id="table" class="panel-body">
		</div>
	</div>
</body>
<script src="<%=path%>/demo/js/tree-ds.js"></script>
<script>
$(document).ready(function(){
	initAuthority();
	$("#orgCode").framedroptree({
		dataSource : new ParamDs("", "ORG"),
		"item-icon" : "icon-tasks",
		"icon-color" : "blue2",
		height: 300
	});
	
	$("#dateCode").datepicker({
		showOtherMonths: true,
		selectOtherMonths: true
	});
	$("#table").frametable({
		columns: [
		          {name:'id', text:'ID', hidden:true},
		          {name:'dateCode', text:'日期', sort: true},
		          {name:'orgName', text:'机构', sort: true},
		          {name:'qygm', text:'企业规模', sort: true},
		          {name:'pjxs', text:'票据形式', sort: true},
		          {name:'pjtx', text:'票据贴现', sort: true},
		          {name:'pjzl', text:'票据种类', sort: true},
		          {name:'pjfx', text:'票据风险', sort: true},
		          {name:'ye', text:'余额', align: 'right', sort: true},
		          {name:'fse', text:'发生额', align: 'right', sort: true},
		          {name:'dyye', text:'当月余额', align: 'right', sort: true}
		         ],
		op: [
				{name:'edit', authority:'update', text:'编辑', type:'icon', clazz:'icon-edit', handler: doEdit, hidden: testAuthority},
				{name:'delete', authority:'delete', text:'删除', type:'icon', clazz:'icon-trash', handler: doDelete, hidden: testAuthority}
		    ],					
		datatype: "server",
		tableClass: "table-bordered table-hover table-striped",
		url: 'demo/fact01//query.do',
		rowsurl: 'demo/fact01/queryrows.do',
		pageName: 'page',
		pageSizeName: 'limit'
	});
	
	$("#query-btn").on("click", function() {
		var params = formutil.getFields($("#query-form"));
		$("#table").frametable("query", params); 
	});
	
	$("#add-btn").on("click", function() {
		util.navigate("/demo/page/fact01/edit.jsp?op=add");
	});
	
});

function doEdit(data) {
	util.navigate("/demo/page/fact01/edit.jsp?op=update&id="+data.id);
}

function doDelete(data) {
	var btn = confirm("是否删除数据?");
	if (!btn) return false; 
	util.getServerData("/demo/fact01/delete.do", {id:data.id}, function(o) {
		if (o.code == 0) {
			$("#table").frametable("deleteRow", {name:"id", value:data.id});
			alert("数据删除成功！");
		}else
			alert(o.message);
	});
}

</script>