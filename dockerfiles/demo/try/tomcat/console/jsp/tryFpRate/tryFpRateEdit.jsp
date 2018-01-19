<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="/header/header.jsp"%>
<%@ include file="/jsp/include.jsp"%>
<link href="<%=request.getContextPath()%>/css/edit.css" type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/progressbar.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/plugin/jquery.form.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/plugin/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/tryFpRate/tryFpRateEdit.js"></script>
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
				<input id="id" name="id" type="hidden" value="${tryFpRate.id}">
				<ul class="form-wrap formgroup_wrap">
					<li>
						<span class="form_span" title="天数">天数:</span>
						<input type="text" class="form-control" id="days" name="days"  value="${tryFpRate.displayDays}" placeholder="请输入天数 "/>
						<p id='daysTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="本金">本金:</span>
						<input type="text" class="form-control" id="principal" name="principal"  value="${tryFpRate.principal}" placeholder="请输入本金"/>
						<p id='principalTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="利率">利率:</span>
						<input type="text" class="form-control" id="rate" name="rate"  value="${tryFpRate.displayRate}" type="number" placeholder="请输入利率"/>
						<p id='rateTip' class="form_tips formalert"></p>
					</li>
				</ul>
			</form>
		</div>
	</div>
</body>