<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="/header/header.jsp"%>
<%@ include file="/jsp/include.jsp"%>
<link href="<%=request.getContextPath()%>/css/edit.css" type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/progressbar.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/plugin/jquery.form.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/plugin/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/oldInterestOrder/oldInterestOrderEdit.js"></script>
<script type="text/javascript">
var op = '${op}';
var returnType = '${returnType}';
</script>
</head>
<body>
	<div class="panel panel-default no-border">
		<div class="panel-heading floating-top">
			<!-- 头部步骤说明-->
			<div class="flow_container">
			<!---头部 start-->
			 <div class="theme_title">${title}</div>
			</div>
			<a class="btn btn-danger btn-block floating-back" href="javascript:returnPage();">返回列表</a>
			<button id="save" type="button" class="btn btn-danger btn-block floating-back view-hidden">保存</button>
		</div>
		<div class="panel-body floating-content">
			<form id="edit-form" name="edit-form" class="row" onSubmit="return false">
				<input id="id" name="id" type="hidden" value="${oldInterestOrder.id}">
				<div id="tableTradeInfo" title="${title}" class="form_box_item">
				<ul class="form-wrap formgroup_wrap">
					<%-- <li>
						<span class="form_span" title="委托id">委托id:</span>
						<input type="text" class="form-control" id="entrustId" name="entrustId"  value="${oldInterestOrder.entrustId}" placeholder="请输入委托id"/>
						<p id='entrustIdTip' class="form_tips formalert"></p>
					</li> --%>
					<li>
						<span class="form_span" title="用户名">用户名:</span>
						<input type="text" class="form-control" id="custId" name="custId"  value="${oldInterestOrder.loginId}" placeholder="请输入客户id"/>
						<p id='custIdTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="付息金额">付息金额:</span>
						<input type="text" class="form-control" id="amount" name="amount"  value="${oldInterestOrder.amount}" placeholder="请输入付息金额"/>
						<p id='amountTip' class="form_tips formalert"></p>
					</li>
					
					<li>
						<span class="form_span" title="付息时间">付息时间:</span>
						<input type="text" class="form-control" id="createDate" name="createDate"  value="${oldInterestOrder.createDateText}" placeholder="请输入创建人"/>
						<p id='createDateTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="付息人">付息人:</span>
						<input type="text" class="form-control" id="createUserId" name="createUserId"  value="${oldInterestOrder.createUserId}" placeholder="请输入创建人"/>
						<p id='createUserIdTip' class="form_tips formalert"></p>
					</li>
					</ul>
					<ul class="form-wrap formgroup_wrap">
					<li class="textarea">
						<span class="form_span" title="说明">说明:</span>
						<textarea class="form-control" id="remark" name="remark" placeholder="请输入说明">${oldInterestOrder.remark}</textarea>
						<p id='remarkTip' class="form_tips formalert"></p>
					</li>
				</ul>
				</div>
			</form>
		</div>
	</div>
</body>