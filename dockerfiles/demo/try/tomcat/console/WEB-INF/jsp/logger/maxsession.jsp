<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="../../../../header/header.jsp"%>
<%
	String fileName = (String)request.getAttribute("fileName");
	String hidden = "hidden";
	if (error != null && !"".equals(error)) {
		hidden = "";
	}
%>
<link
	href="<%=path%>/js/plugin/datetimepicker/jquery.simple-dtpicker.css"
	type="text/css" rel="stylesheet">

</head>
<body>
	<div class="panel panel-default no-border">
		<div class="panel-heading">
		<form action="<%=path%>/logger/query_max_session_chart.do" method="post">
			<div class="row">
				<span class="query-label">开始时间：</span>
				<div class="col-xs-3">
					<input name="begin" type="text" class="form-control"
						data-type="datetime" placeholder="开始时间" value="<%=request.getAttribute("begin")%>">
				</div>
				<span class="query-label">结束时间：</span>
				<div class="col-xs-3">
					<input name="end" type="text" class="form-control"
						data-type="datetime" placeholder="结束时间" value="<%=request.getAttribute("end")%>">
				</div>
				<span class="query-label">间隔：</span>
				<div class="pull-left">
					<select name="interval">
						<option value="5">5(分钟)</option>
						<option value="10">10(分钟)</option>
						<option value="20">20(分钟)</option>
						<option value="30" selected>30(分钟)</option>
						<option value="60">60(分钟)</option>
						<option value="1440">1(天)</option>
					</select>
				</div>
				<div class="col-xs-1">
				<button id="query-btn" class="btn btn-primary">
					<i class="icon-search"></i> 刷新
				</button>
				</div>
			</div>
			
		</form>
		</div>
		<div class="panel-body">
			<div id="error-hint" class="alert alert-danger <%=hidden%>">
				<%=error%>
			</div>
			<img id='myImg' src="<%=path%>/DisplayChart?filename=<%=fileName%>" usemap="#<%=fileName%>" border='0'>
		</div>
	</div>
</body>
<script type="text/javascript"
	src="<%=path%>/js/plugin/datetimepicker/jquery.simple-dtpicker.js"></script>

<script>
$(document).ready(function(){
	var inter = <%=request.getAttribute("interval")%>;
	$('[name=interval] option').prop("selected", "false");
	$('[name=interval] option[value='+inter+']').prop("selected", "selected");
	
	$("[name=interval]").selectpicker({width:'100px'});
	$('[data-type=datetime]').appendDtpicker({"locale": "cn"});

	$("#query-btn").on("click", function() {
		$("form").submit();
	})
});

</script>

</html>