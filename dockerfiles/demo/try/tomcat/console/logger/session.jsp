<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="../header/header.jsp"%>
</head>
<body>
	<div class="panel panel-default no-border">
		<div class="panel-heading">
			<button id="query-btn" class="btn btn-primary">
				<i class="icon-search"></i> 刷新</button>
		</div>
		<div id="table" class="panel-body">
		</div>
	</div>
</body>
<script>
$(document).ready(function(){
	$("#table").frametable({
		columns: [
		          {name:'id', text:'Session Id'},
		          {name:'userName', text:'用户名', sort: true, width: 150},
		          {name:'userCaption', text:'姓名', sort: true, width: 200},
		          {name:'ip', text:'ip', sort: true, align: 'right', width: 200},
		          {name:'time', text:'登录时间'}
		         ],
		datatype: "server",
		tableClass: "table-bordered table-hover table-striped",
		url: 'logger/get_session_list.do',
		rowsurl: 'logger/get_session_rows.do',
		pageName: 'page',
		pageSizeName: 'limit'
	});
	
	$("#query-btn").on("click", function() {
		$("#table").frametable("query", {}); 
	});
});

</script>

</html>