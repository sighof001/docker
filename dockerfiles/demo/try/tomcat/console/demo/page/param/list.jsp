<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="../../../header/header.jsp"%>
</head>
<body>
	<div class="panel panel-default no-border">
		<div class="panel-heading">
			<div id="query-form" class="row">
				<span class="query-label">类型：</span>
				<div class="col-xs-2">
					<input id="type" type="text" class="form-control" placeholder="查询类型">
				</div>
				<span class="query-label">父节点：</span>
				<div class="col-xs-2">
					<input id="pid" type="text" class="form-control">
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

<script type="text/javascript" src="<%=path%>/demo/js/tree-ds.js"></script>
<script>
$(document).ready(function(){
	$("#pid").framedroptree({
		dataSource : new ParamDs("get_by_pid_no_leaf.do"),
		"item-icon" : "icon-tasks",
		"icon-color" : "blue2",
		height: 300
	});
	
	initAuthority();	
	$("#table").frametable({
		columns: [
		          {name:'id', text:'ID', sort: true, width: 150},
		          {name:'name', text:'名称', sort: true, width: 200},
		          {name:'pname', text:'父节点', sort: true, width: 200},
		          {name:'type', text:'类型', align: 'right', sort: true, width: 200}
		         ],
		op: [
				{name:'edit', authority:'update', text:'编辑', type:'icon', clazz:'icon-edit', handler: doEdit, hidden: testAuthority},
				{name:'delete', authority:'delete', text:'删除', type:'icon', clazz:'icon-trash', handler: doDelete, hidden: testAuthority}
		    ],					
		datatype: "server",
		tableClass: "table-bordered table-hover table-striped",
		url: 'demo/param/query.do',
		rowsurl: 'demo/param/queryrows.do',
		pageName: 'page',
		pageSizeName: 'limit'
	});
	
	$("#query-btn").on("click", function() {
		var params = formutil.getFields($("#query-form"));
		$("#table").frametable("query", params); 
	});
	
	$("#add-btn").on("click", function() {
		util.navigate("/demo/page/param/edit.jsp?op=add");
	});
	
});

function doEdit(data) {
	util.navigate("/demo/page/param/edit.jsp?op=update&id="+data.id);
}

function doDelete(data) {
	var btn = confirm("是否删除参数["+data.name+"]?");
	if (!btn) return false; 
	util.getServerData("/demo/param/delete.do", {id:data.id}, function(o) {
		if (o.code == 0) {
			$("#table").frametable("deleteRow", {name:"id", value:data.id});
			alert("参数["+data.name+"]删除成功！");
		}else
			alert(o.message);
	});
}

</script>