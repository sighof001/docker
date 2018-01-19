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
	src="<%=request.getContextPath()%>/js/tryCustAsset/tryCustAssetList.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/list.js"></script>
<script>
	
</script>
</head>
<body>
	<div class="panel panel-default no-border">
		<div class="panel-heading">
			<div id="query-form" class="query-form">
				<ul class="query-form-wrap form-wrap">
					<li><span class="form_span">用户名：</span> <input
						id="queryCreateUserId" name="queryCreateUserId" type="text"
						placeholder="用户名"></li>
					<li><span class="form_span">资产状态：</span> <select
						id='queryStatus' name='queryStatus'>
							<option value="">请选择</option>
							<c:forEach items="${statusList}" var="item">
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
		</div>
		<div id="table" class="panel-body tableContent"></div>
	</div>
</body>

</html>