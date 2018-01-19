<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="../../header/header.jsp"%>
</head>
<body onunload="destroy()">
	<div class="panel panel-default no-border">
		<div class="panel-heading">
			<div id="query-form" class="row">
				<span class="query-label">操作名：</span>
				<div class="col-xs-2">
					<input id="name" type="text" class="form-control" placeholder="查询操作">
				</div>
				<span class="query-label">中文名：</span>
				<div class="col-xs-2">
					<input id="caption" type="text" class="form-control" placeholder="操作中文名">
				</div>
				<span class="query-label">类型：</span>
				<div class="col-xs-2">
					<select id="type" class="form-control" >
						<option value="">空</option>
						<option value="1">特殊操作</option>
						<option value="0">通用操作</option>
					</select>
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
<script>
$(document).ready(function(){
	$("#type").selectpicker({});
	initAuthority();	
	$("#table").frametable({
		columns: [
		          {name:'id', text:'ID', hidden: true},
		          {name:'name', text:'名称', sort: true, width: 200},
		          {name:'caption', text:'中文名', sort: true, width: 200},
		          {name:'type', text:'类型', sort: true, width: 200, transform: function(row) {
		        	  return (row.type == '0')? "通用操作": "特殊操作";
		          }},
		          {name:'desc', text:'备注', align: 'right', width: 200}
		         ],
		op: [
				{name:'edit', authority:'update', text:'编辑', type:'icon', clazz:'icon-edit', handler: doEdit, hidden: testAuthority},
				{name:'delete', authority:'delete', text:'删除', type:'icon', clazz:'icon-trash', handler: doDelete, hidden: testAuthority}
		    ],					
		datatype: "server",
		tableClass: "table-bordered table-hover table-striped",
		url: 'operate/query.do',
		rowsurl: 'operate/queryrows.do',
		pageName: 'page',
		pageSizeName: 'limit'
	});
	
	$("#query-btn").on("click", function() {
		var params = formutil.getFields($("#query-form"));
		$("#table").frametable("query", params); 
	});
	
	$("#add-btn").on("click", function() {
		util.navigate("/admin/operate/edit.jsp?op=add");
	});
	
	$("#update-btn").on("click", function() {
		util.navigate("/admin/operate/setmenu.jsp");
	});
});

function doEdit(data) {
	util.navigate("/admin/operate/edit.jsp?op=update&id="+data.id);
}

function doDelete(data) {
	var btn = confirm("是否删除操作["+data.name+"]?");
	if (!btn) return false; 
	util.getServerData("/operate/delete.do", {id:data.id}, function(o) {
		if (o.rs_code == 0) {
			$("#table").frametable("deleteRow", {name:"id", value:data.id});
			alert("操作["+data.name+"]删除成功！");
		}else
			alert(o.message);
	});
}
function destroy(){
	$("#table").frametable("destroy");
};
</script>