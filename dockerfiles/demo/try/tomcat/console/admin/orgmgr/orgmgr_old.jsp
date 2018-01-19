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
<!-- 				<span class="query-label">机构名：</span> -->
<!-- 				<div class="col-xs-2"> -->
<!-- 					<input id="name" type="text" class="form-control" placeholder="机构名"> -->
<!-- 				</div> -->
<!-- 				<span class="query-label">机构码：</span> -->
<!-- 				<div class="col-xs-2"> -->
<!-- 					<input id="orgCode" type="text" class="form-control" placeholder="机构码"> -->
<!-- 				</div> -->
<!-- 				<button id="query-btn" class="btn btn-primary disabled" /> -->
<!-- 					<i class="icon-search"></i> 查询</button> -->
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
		          {name:'id', text:'ID', width: 200},
		          {name:'name', text:'机构名', sort: true, width: 120},
		          {name:'orgCode', text:'机构号', sort: true, width: 150},
		          {name:'orgPCode', text:'上级机构号', sort: true, align: 'right', width: 150},
		          {name:'type', text:'机构类型', sort: true, align: 'right', width: 80},
		          {name:'level', text:'机构层级',width:80 }
		         ],
		op: [
				{name:'edit', authority:'update', text:'编辑', type:'icon', clazz:'icon-edit', handler: doEdit, hidden: testAuthority},
				{name:'delete', authority:'delete', text:'删除', type:'icon', clazz:'icon-trash', handler: doDelete, hidden: testAuthority}
		    ],
		datatype: "server",
		tableClass: "table-bordered table-hover table-striped",
		url: 'orgmgr/get_orgmgrs.do',
		rowsurl: 'orgmgr/get_orgmgrs_rows.do',
		pageName: 'page',
		pageSizeName: 'limit'
	});
	
	$("#query-btn").on("click", function() {
		var params = formutil.getFields($("#"));
		$("#table").frametable("query", params); 
	});
	
	$("#add-btn").on("click", function() {
		util.navigate("/admin/orgmgr/edit.jsp?op=add");
	});
	
});

function doEdit(data) {
	util.navigate("/admin/orgmgr/edit.jsp?op=update&id="+data.id);
}

function doDelete(data) {
	var btn = confirm("是否删除机构：["+data.name+"]?");
	if (!btn) return false; 
	util.getServerData("/orgmgr/del_orgmr.do", {id:data.id}, function(o) {
		if (o.rs_code == 0) {
			$("#table").frametable("deleteRow", {name:"id", value:data.id});
			alert("机构["+data.name+"]删除成功！");
		}else
			alert(o.message);
	});
}

function doPurview(data) {
	util.navigate("/admin/orgmgr/purview.jsp?id="+data.id+"&name="+encodeURIComponent(data.caption));
}

function doGroup(data) {
	util.navigate("/admin/orgmgr/group.jsp?id="+data.id+"&groupid="+data.groupId+"&name="+encodeURIComponent(data.caption));
}

function destroy(){
	$("#table").frametable("destroy");
};

</script>