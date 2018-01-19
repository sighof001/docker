<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="../../header/header.jsp"%>
<%request.setCharacterEncoding("utf-8");%>
</head>
<body onunload="destroy()">
		<div class="panel panel-default no-border">
		<div class="panel-heading">
			<div id="query-form" class="row">
				<span class="query-label">用户名</span>
				<div class="col-xs-2">
					<input id="name" type="text" class="form-control" placeholder="模板名">
				</div>
				<button id="query-btn" class="btn btn-primary disabled" />
					<i class="icon-search"></i> 查询</button>
				<button id="add-btn" class="btn btn-danger disabled" disabled >
					<i class="icon-plus"></i> 增加</button>
			</div>
		</div>
		<div id="table" class="panel-body"></div>
	</div>
</body>
<script>
$(document).ready(function(){
	initAuthority();
	
	$("#table").frametable({
		columns: [
		          {name:'id',test:'ID',hidden:true},
		          {name:'name', text:'模板名称', width: 200},
		          {name:'mobile', text:'模板名称', width: 200},
		          {name:'email', text:'模板路径', sort: true, width: 300}
		         ],
		op: [
			   {name:'delete', authority:'delete', text:'删除', type:'icon', clazz:'icon-trash', handler: doDelete, hidden: testAuthority},
			   {name:'purview', authority:'update',text:'授权', type:'icon', clazz:'icon-user-md', handler: doPurview, hidden: testAuthority}
		    ],
		datatype: "server",
		tableClass: "table-bordered table-hover table-striped",
		url: 'tempuser/getalltmps.do',
		rowsurl: 'tempuser/get_tmp_count.do',
		pageName: 'page',
		pageSizeName: 'limit'
	});
});
</script>