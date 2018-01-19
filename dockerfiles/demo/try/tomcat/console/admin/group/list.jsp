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
				<span class="query-label">组名称：</span>
				<div class="col-xs-2">
					<input id="name" type="text" class="form-control" placeholder="查询帐号">
				</div>
				<button id="query-btn" class="btn btn-primary disabled" disabled>
					<i class="icon-search"></i> 查询</button>
				<button id="add-btn" class="btn btn-danger disabled" disabled>
					<i class="icon-plus"></i> 新增&修改</button>
					
				<span class="pull-right" style="margin-right: 20px">&nbsp;</span>	
				<button id="update-btn" class="btn btn-success pull-right disabled" disabled>
					<i class="icon-user"></i> 设置用户</button>
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
		          {name:'id', text:'ID', hidden:true},
		          {name:'name', text:'组名称', sort: true, width: 200},
		          {name:'path', text:'路径', sort: true, width: 400},
		          {name:'desc', text:'描述'}
		         ],
		op: [
				{name: 'delete', text:'删除', type:'icon', clazz:'icon-trash', handler: doDelete, authority:'delete', hidden: testAuthority},
				{name: 'purview', text:'授权', type:'icon', clazz:'icon-user-md', handler: doPurview, authority:'update', hidden: testAuthority},
				{name: 'user', text:'所属用户', type:'icon', clazz:'icon-user', handler: doUser, authority:'update', hidden: testAuthority}
		    ],					
		datatype: "server",
		tableClass: "table-bordered table-hover table-striped",
		url: 'group/querygroup.do',
		rowsurl: 'group/querygrouprows.do',
		pageName: 'page',
		pageSizeName: 'limit'
	});
	
	$("#query-btn").on("click", function() {
		var params = formutil.getFields($("#query-form"));
		$("#table").frametable("query", params); 
	});
	
	$("#add-btn").on("click", function() {
		util.navigate("/admin/group/groupmgr.jsp?op=add");
	});
	
	
	$("#update-btn").on("click", function() {
		util.navigate("/admin/group/groupuser.jsp");
	});
});

function doDelete(data) {
	var btn = confirm("是否删除用户组["+data.name+"]?");
	if (!btn) return false; 
	util.getServerData("/group/delete_group.do", {id:data.id}, function(o) {
		if (o.rs_code == 0) {
			$("#table").frametable("deleteRow", {name:"id", value:data.id});
			alert("用户组["+data.name+"]删除成功！");
		}else
			alert(o.message);
	});
}

function doPurview(data) {
	util.navigate("/admin/group/purview.jsp?id="+data.id+"&name="+encodeURIComponent(data.name));
}

function doUser(data) {
	util.navigate("/admin/group/users.jsp?id="+data.id+"&name="+encodeURIComponent(data.name));
}
function destroy(){
	$("#table").frametable("destroy");
};

</script>