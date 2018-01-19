<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="../header/header.jsp"%>
<link
	href="<%=basePath%>/js/plugin/datetimepicker/jquery.simple-dtpicker.css"
	type="text/css" rel="stylesheet">
</head>
<body>
	<div class="panel panel-default no-border">
		<div class="panel-heading">
			<div id="query-form" class="row">
				<div class="row">
					<div class="col-xs-6">
						<span class="query-label col-xs-3">开始时间：</span>
						<div class="col-xs-6">
							<input id="begin" type="text" class="form-control"
								data-type="datetime" placeholder="开始时间">
						</div>
					</div>
					<div class="col-xs-6">
						<span class="query-label col-xs-3">结束时间：</span>
						<div class="col-xs-6">
							<input id="end" type="text" class="form-control"
								data-type="datetime" placeholder="结束时间">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-6">
						<span class="query-label col-xs-3">登录名：</span>
						<div class="col-xs-6">
							<input id="userName" type="text" class="form-control"
								placeholder="查询帐号">
						</div>
					</div>
					<div class="col-xs-6">
						<span class="query-label col-xs-3">操作：</span>
						<div class="col-xs-6">
							<select id="op" class="form-control framecombox" data-empty-node=true 
								data-url="logger/get_log_operates.do">
						</select>
						</div>
					
						<button id="query-btn" class="btn btn-primary">
							<i class="icon-search"></i> 查询
						</button>
					</div>
				</div>
			</div>
		</div>
		<div id="table" class="panel-body"></div>
	</div>
</body>
<script type="text/javascript"
	src="<%=basePath%>/js/plugin/datetimepicker/jquery.simple-dtpicker.js"></script>
<script>
	$(document).ready(function() {
		$("#op").framecombox({});
		$('[data-type=datetime]').appendDtpicker({"locale": "cn"});
		$("#table").frametable({
			columns : [ {name : 'userName',	text : '登录名',	sort : true,width : 150	}, 
			            {name : 'userCaption',	text : '姓名',sort : true,width : 150	}, 
			            {name : 'strTime',text : '操作时间',width : 200,sort : true}, 
			            {name : 'op',text : '操作',sort : true}, 
			            {name : 'name',	text : '操作内容'}, 
			            {name : 'memo',width: 200,text : '备注'} ],
			datatype : "server",
			tableClass : "table-bordered table-hover table-striped table-cell-break table-condensed",
			url : 'logger/query_operate_logs.do',
			rowsurl : 'logger/get_operate_logs_rows.do',
			pageName : 'page',
			pageSizeName : 'limit'
		});

		$("#query-btn").on("click", function() {
			var params = formutil.getFields($("#query-form"));
			$("#table").frametable("query", params);
		});
	});
</script>

</html>