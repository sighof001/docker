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
				<span class="query-label">登录名：</span>
				<div class="col-xs-2">
					<input id="name" type="text" class="form-control" placeholder="查询帐号">
				</div>
				<span class="query-label">姓名：</span>
				<div class="col-xs-2">
					<input id="caption" type="text" class="form-control" placeholder="查询姓名">
				</div>
				<button id="query-btn" class="btn btn-primary disabled" disabled>
					<i class="icon-search"></i> 查询</button>
				<button id="add-btn" class="btn btn-danger disabled" disabled>
					<i class="icon-plus"></i> 增加</button>
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
		          {name:'domainID', text:'登录名', sort: true, width: 200},
		          {name:'userName', text:'姓名', sort: true, width: 200},
		          {name:'mobile', text:'电话号码', sort: true, align: 'right', width: 200},
		          {name:'orgName', text:'所属部门', sort: true, align: 'right', width: 300,hidden: true},
		          {name:'groupId', text:'用户组编码', hidden: true}
		         ],
		op: [
				{name:'edit', authority:'update', text:'编辑', type:'icon', clazz:'icon-edit', handler: doEdit, hidden: testAuthority2},
				{name:'delete', authority:'delete', text:'删除', type:'icon', clazz:'icon-trash', handler: doDelete, hidden: testAuthority2},
				{name:'purview', authority:'update',text:'授权', type:'icon', clazz:'icon-user-md', handler: doPurview, hidden: testAuthority2}
				/* {name:'group', authority:'update', text:'分组', type:'icon', clazz:'icon-group', handler: doGroup, hidden: testAuthority2} */
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
//	 		单击查询之后显示返回
			$("#get_back").show();
	});
	
// 	返回刷新页面
	$("#get_back").on("click",function(){
		util.navigate("/admin/user/list.jsp");
	});
	
	$("#add-btn").on("click", function() {
		util.navigate("/admin/user/edit.jsp?op=add");
	});
	
});

function doEdit(data) {
	util.navigate("/admin/user/edit.jsp?op=update&id="+data.id);
}

function doDelete(data) {
	var btn = confirm("是否删除用户["+data.userName+"]?");
	if (!btn) return false; 
	util.getServerData("/user2/deleteuser.do", {id:data.id}, function(o) {
		if (o.rs_code == 0) {
			$("#table").frametable("deleteRow", {name:"id", value:data.id});
			alert("用户["+data.userName+"]删除成功！");
		}else
			alert(o.message);
	});
}

function doPurview(data) {
	util.navigate("/admin/user/purview.jsp?id="+data.id+"&name="+encodeURIComponent(data.caption));
}

function doGroup(data) {
	util.navigate("/admin/user/group.jsp?id="+data.id+"&groupid="+data.groupId+"&name="+encodeURIComponent(data.caption));
}

function destroy(){
	$("#table").frametable("destroy");
};

function testAuthority2(name,rowData){
	if(testAuthority(name)){
		return true;
	}
	if(const_user_id_admin == rowData['id']){
		return true;
	}
	
	return false;
}


</script>