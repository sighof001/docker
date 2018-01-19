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
				<span class="query-label">用户：</span>
				<div class="col-xs-2">
					<input id="name" type="text" class="form-control" placeholder="查询帐号">
				</div>
				<span class="query-label">姓名：</span>
				<div class="col-xs-2">
					<input id="caption" type="text" class="form-control" placeholder="查询姓名">
				</div>
				<button id="query-btn" class="btn btn-primary disabled" disabled>
					<i class="icon-search"></i> 查询</button>
				<button id="get_back" class="btn btn-primary" style="display: none">
					 返回</button>
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
		          {name:'domainID', text:'域用户', sort: true, width: 300},
		          {name:'userName', text:'姓名', sort: true, width: 300},
		          {name:'mobile', text:'电话号码', sort: true, align: 'right', width: 300},
		          {name:'orgName', text:'所属部门', hidden:true},
		          {name:'groupId', text:'用户组编码', hidden: true}
		         ],
		op: [
// 				{name:'edit', authority:'update', text:'编辑', type:'icon', clazz:'icon-group', handler: doEdit, hidden: testAuthority},
// 				{name:'delete', authority:'delete', text:'删除', type:'icon', clazz:'icon-trash', handler: doDelete, hidden: testAuthority},
				{name:'purview', authority:'update',text:'授权', type:'icon', clazz:'icon-user-md', handler: doPurview, hidden: testAuthority},
// 				{name:'group', authority:'update', text:'查看', type:'icon', clazz:'icon-edit', handler: doGroup, hidden: testAuthority}
				{name: 'look', text:'查看角色', type:'icon', clazz:'icon-user', handler: doPurviews, authority:'update', hidden: testAuthority}
		    ],					
			datatype: "server",
			tableClass: "table-bordered table-hover table-striped",
			url: 'user2/queryuser.do',
			rowsurl: 'user2/queryuserrows.do',
			pageName: 'page',
			pageSizeName: 'limit'
	});
	
	$("#query-btn").on("click", function() {
		var params = formutil.getFields($("#query-form"));
		$("#table").frametable("query", params);
// 		单击查询之后显示返回
		$("#get_back").show();
	});
	
// 	返回刷新页面
	$("#get_back").on("click",function(){
		util.navigate("/admin/tmpuser/userFormwork.jsp");
	});
	
	$("#add-btn").on("click", function() {
		util.navigate("/admin/tmpuser/roleQuery.jsp?id="+data.id);
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
// 	encodeURIComponent(data.userName)
	util.navigate("/admin/tmpuser/formworkEdit.jsp?op=update&id="+data.id+"&name="+encodeURI(encodeURI(data.userName))+"&domainID="+data.domainID);
}

// function doUser(data) {
// 	util.navigate("/admin/role/users.jsp?id="+data.id+"&name="+encodeURIComponent(data.caption));
// }

function doPurviews(data){
	util.navigate("/admin/tmpuser/roleQuery.jsp?id="+data.id+"&name="+encodeURI(encodeURI(data.userName)));
}

function destroy(){
	$("#table").frametable("destroy");
};
</script>