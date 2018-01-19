<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<meta http-equiv="Conten-Type" content="text/html; charset=UTF-8">
<head>
<%@ include file="../../header/header.jsp"%>
<%request.setCharacterEncoding("utf-8");%>
</head>
<body onunload="destroy()">
	<div class="panel panel-default no-border">
		<div class="panel-heading">
			<div id="query-form" class="row">
				<span class="query-label">模板名：</span>
				<div class="col-xs-2">
					<input id="name" type="text" class="form-control" placeholder="模板名">
				</div>
				<button id="query-btn" class="btn btn-primary" />
					<i class="icon-search"></i> 查询</button>
<!-- 				<button id="add-btn" class="btn btn-danger disabled" disabled > -->
<!-- 					<i class="icon-plus"></i> 增加</button> -->
			</div>
		</div>
		<div id="table" class="panel-body"></div>
<!-- 		<div id="table2" class="panel-body"></div> -->
	</div>
</body>
<script>
$(document).ready(function(){
	initAuthority();
	
	$("#table").frametable({
		columns: [
		          {name:'id',test:'ID',hidden:true},
		          {name:'name', text:'模板名称', width: 200},
		          {name:'path', text:'模板路径', sort: true, width: 300}
		         ],
		op: [
			   {name:'delete', authority:'delete', text:'删除', type:'icon', clazz:'icon-trash', handler: doDelete, hidden: testAuthority},
			   {name:'purview', authority:'update',text:'授权', type:'icon', clazz:'icon-user-md', handler: doPurview, hidden: testAuthority}
		    ],
		datatype: "server",
		tableClass: "table-bordered table-hover table-striped",
		url: 'tempuser/get_all_tmps.do',
		rowsurl: 'tempuser/get_tmp_count.do',
		pageName: 'page',
		pageSizeName: 'limit',
// 		refresh_at_once:false
	});
	
	
	$("#query-btn").on("click", function() {
		var params = formutil.getFields($("#query-form"));
		$("#table").frametable("query", params); 
	});
	
});

function doDelete(data) {
	var btn = confirm("是否删除模板：["+data.name+"]?");
	if (!btn) return false; 
	util.getServerData("/tempuser/del_tmp.do", {tmpId:data.id}, function(o) {
		if (o.rs_code == 0) {
			$("#table").frametable("deleteRow", {name:"id", value:data.id});
			alert("模板["+data.name+"]删除成功！");
		}else
			alert(o.message);
	});
}

function doPurview(data) {
	util.navigate("/admin/role/rolelist.jsp?tmpId="+data.id+"&templateName="+encodeURI(data.name));
}

function destroy(){
	$("#table").frametable("destroy");
};

</script>