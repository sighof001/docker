<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="/header/header.jsp"%>
<%@ include file="/jsp/include.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/plugin/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/list.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/tryCheckRealAuth/tryCheckRealAuthList.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/list.css"
	type="text/css" />
</head>
<body>
	<div class="panel panel-default no-border">
		<div class="panel-heading">
			<div id="query-form" class="query-form">
				<ul class="query-form-wrap form-wrap">
					<li><span class="form_span">登录名：</span> <input
						id="queryLoginId" name="queryLoginId" type="text"
						placeholder="登录名"></li>
					<li><span class="form_span">姓名：</span> <input
						id="queryRealName" name="queryRealName" type="text"
						placeholder="姓名"></li>
					<li><span class="form_span">身份证：</span> <input
						id="queryIdCard" name="queryIdCard" type="text" placeholder="身份证">
					</li>
				<li><span class="form_span">审核状态：</span> <select
						id='queryAuthStatus' name='queryAuthStatus'>
							<option value="">请选择</option>
							<c:forEach items="${authStatusTypeList}" var="item">
								<option value="${item.dictValue}">${item.text}</option>
							</c:forEach>
					</select></li>
				</ul>
				<div class="queryBtn_wrap">
					<button id="query-btn" class="btn btn-primary">
						<span>查询</span>
					</button>
				</div>
			</div>
		</div>


		<!--表格头部操作栏 start -->
		<div class="content_title">
			<div class="titleName">列表</div>
			<div class="operation_wrap"></div>
		</div>
		<div id="table" class="panel-body tableContent"></div>
		<!-- 模态框 -->
		<%@ include file="/jsp/tryCustLoan/auditFailCommon.jsp"%>
		<!-- 模态框 -->
	</div>
</body>

</html>