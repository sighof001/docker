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
				<span class="query-label">角色名：</span>
				<div class="col-xs-2">
					<input id="name" type="text" class="form-control" placeholder="查询帐号">
				</div>
				<span class="query-label">中文名：</span>
				<div class="col-xs-2">
					<input id="caption" type="text" class="form-control" placeholder="查询姓名">
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
	initAuthority();	
	$("#table").frametable({
		columns: [
		          {name:'id', text:'ID', width: 150,hidden:true},
		          {name:'name', text:'角色名', sort: true, width: 200},
		          {name:'caption', text:'中文名', sort: true, width: 200},
		          {name:'desc', text:'描述', width: 200}
		         ],
		op: [
				{name: 'edit', text:'编辑', type:'icon', clazz:'icon-edit', handler: doEdit, authority:'update', hidden: testAuthority},
				{name: 'delete', text:'删除', type:'icon', clazz:'icon-trash', handler: doDelete, authority:'delete', hidden: testAuthority},
				{name: 'purview', text:'授权', type:'icon', clazz:'icon-user-md', handler: doPurview, authority:'update', hidden: testAuthority},
				{name: 'user', text:'所属用户', type:'icon', clazz:'icon-user', handler: doUser, authority:'update', hidden: testAuthority}
				/* {name: 'group', text:'所属用户组', type:'icon', clazz:'icon-group', handler: doGroup, authority:'update', hidden: testAuthority} */
		    ],					
		datatype: "server",
		tableClass: "table-bordered table-hover table-striped",
		url: 'role22/queryrole.do',
		rowsurl: 'role22/queryrolerows.do',
		pageName: 'page',
		pageSizeName: 'limit'
	});
	
	$("#query-btn").on("click", function() {
		var params = formutil.getFields($("#query-form"));
		$("#table").frametable("query", params); 
	});
	
	$("#add-btn").on("click", function() {
		util.navigate("/admin/role/edit.jsp?op=add");
	});
});

function doEdit(data) {
	util.navigate("/admin/role/edit.jsp?op=update&id="+data.id);
}

function doDelete(data) {
	var btn = confirm("是否删除角色["+data.name+"]?");
	if (!btn) return false; 
	//util.getServerData("/role/deleterole.do", {id:data.id}, function(o) {
	util.getServerData("/role2/delete.do", {id:data.id}, function(o) {
		if (o.rs_code == 0) {
			$("#table").frametable("deleteRow", {name:"id", value:data.id});
			alert("角色["+data.name+"]删除成功！");
		}else
			alert(o.message);
	});
}

function doPurview(data) {
	util.navigate("/admin/role/purview.jsp?id="+data.id+"&name="+encodeURIComponent(data.caption));
}

function doUser(data) {
	util.navigate("/admin/role/users.jsp?id="+data.id+"&name="+encodeURIComponent(data.caption));
}

function doGroup(data) {
	util.navigate("/admin/role/group.jsp?id="+data.id+"&name="+encodeURIComponent(data.caption));
}

function destroy(){
	$("#table").frametable("destroy");
};
</script>