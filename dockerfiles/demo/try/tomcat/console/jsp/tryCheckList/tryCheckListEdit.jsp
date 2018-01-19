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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/tryCheckList/tryCheckListEdit.js"></script>
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
				<input id="id" name="id" type="hidden" value="${tryCheckList.id}">
				<ul class="form-wrap formgroup_wrap">
					<li>
						<span class="form_span" title="审核类型">审核类型</span>
						<select class="form-control" id="checkType" name="checkType" value="${tryCheckList.checkType}">
							<c:forEach items="${checkTypeList}" var="item">
								<option value="${item.dictValue}" <c:if test="${item.dictValue eq tryCheckList.checkType}">selected="selected"</c:if> >${item.text }</option>
							</c:forEach>
							</select>
						<%-- <input type="text" class="form-control" id="checkType" name="checkType"  value="${tryCheckList.checkType}" placeholder="请输入审核类型,1:贷款申请审核"/> --%>
						<p id='checkTypeTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="业务id">用户名:</span>
						<input type="text" class="form-control" id="loginId" name="loginId"  value="${tryCheckList.loginId}" />
						<p id='busIdTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="审核状态">审核状态</span>
						<select class="form-control" id="checkStatus" name="checkStatus" value="${tryCheckList.checkStatus}">
							<c:forEach items="${checkStatusTypeList}" var="item">
								<option value="${item.dictValue}" <c:if test="${item.dictValue eq tryCheckList.checkStatus}">selected="selected"</c:if> >${item.text }</option>
							</c:forEach>
							</select>
						<%-- <input type="text" class="form-control" id="checkStatus" name="checkStatus"  value="${tryCheckList.checkStatus}" placeholder="请输入审核状态,0,未提交,1:待审核,2:审核通过,3:审核拒绝"/> --%>
						<p id='checkStatusTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="审核意见">审核意见:</span>
						<input type="text" class="form-control" id="remark" name="remark"  value="${tryCheckList.remark}" placeholder="请输入审核意见"/>
						<p id='remarkTip' class="form_tips formalert"></p>
					</li>
					<%-- <li>
						<span class="form_span" title="创建人">创建人:</span>
						<input type="text" class="form-control" id="createUserId" name="createUserId"  value="${tryCheckList.createUserId}" placeholder="请输入创建人"/>
						<p id='createUserIdTip' class="form_tips formalert"></p>
					</li> --%>
				</ul>
			</form>
		</div>
	</div>
</body>