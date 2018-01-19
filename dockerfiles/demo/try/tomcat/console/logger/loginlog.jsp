<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="../header/header.jsp"%>
<link
	href="<%=path%>/js/plugin/datetimepicker/jquery.simple-dtpicker.css"
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
						<span class="query-label col-xs-3">类型：</span>
						<div class="col-xs-6">
							<select id="type">
								<option value="" selected>全部</option>
								<option value="登录">登录</option>
								<option value="退出">退出</option>
							</select>
						</div>
					
						<button id="query-btn" class="btn btn-primary">
							<i class="icon-search"></i> 刷新
						</button>
					</div>
				</div>
			</div>
		</div>
		<div id="table" class="panel-body"></div>
	</div>
</body>
<script type="text/javascript"
	src="<%=path%>/js/plugin/datetimepicker/jquery.simple-dtpicker.js"></script>
<script>
	$(document).ready(function() {
		$("#type").selectpicker({});
		$('[data-type=datetime]').appendDtpicker({"locale": "cn"});
		$("#table").frametable({
			columns : [ {
				name : 'userName',
				text : '登录名',
				sort : true,
				width : 150
			}, {
				name : 'userCaption',
				text : '姓名',
				sort : true,
				width : 200
			}, {
				name : 'memo',
				text : 'ip',
				sort : true,
				align : 'right',
				width : 200
			}, {
				name : 'strTime',
				text : '登录/退出时间',
				sort : true
			}, {
				name : 'op',
				text : '类型',
				sort : true
			} ],
			datatype : "server",
			tableClass : "table-bordered table-hover table-striped",
			url : 'logger/query_login_logs.do',
			rowsurl : 'logger/get_login_logs_rows.do',
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