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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/tryOrder/withdrawEditForCheck.js"></script>
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
				<input id="id" name="id" type="hidden" value="${tryOrder.id}">
				<ul class="form-wrap formgroup_wrap">
					<li>
						<span class="form_span" title="提现金额">提现金额:</span>
						<input type="text" class="form-control" id="amount" name="amount"  value="${tryOrder.amountText}"/>
						<p id='amountTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="申请人">申请人:</span>
						<input type="text" class="form-control"  id="loginId" name="loginId"  value="${tryOrder.loginId}"/>
						<p id='loginIdTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="申请时间">申请时间:</span>
						<input type="text" class="form-control"  id="createTimeStr" name="createTimeStr"  value="${tryOrder.createTimeStr}"/>
						<p id='createTimeStrTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="审核状态">审核状态:</span>
						<input type="text" class="form-control"  id="checkStatusText" name="checkStatusText"  value="${tryOrder.checkStatusText}"/>
						<p id='checkStatusTextTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="审核信息">审核信息:</span>
						<input type="text" class="form-control"  id="checkDesc" name="checkDesc"  value="${tryOrder.checkDesc}"/>
						<p id='checkStatusTextTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="审核状态">审核时间:</span>
						<input type="text" class="form-control"  id="checkTimeStr" name="checkTimeStr"  value="${tryOrder.checkTimeStr}"/>
						<p id='checkTimeStrTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="审核状态">审核人:</span>
						<input type="text" class="form-control"  id="checkUserId" name="checkUserId"  value="${tryOrder.checkUserId}"/>
						<p id='checkTimeStrTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="付款状态">付款状态:</span>
						<input type="text" class="form-control"  id="payStatusText" name="payStatusText"  value="${tryOrder.payStatusText}"/>
						<p id='checkStatusTextTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="付款状态">付款时间:</span>
						<input type="text" class="form-control"  id="payTimeStr" name="payTimeStr"  value="${tryOrder.payTimeStr}"/>
						<p id='payTimeStrTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="付款状态">付款人:</span>
						<input type="text" class="form-control"  id="payUserId" name="payUserId"  value="${tryOrder.payOrder.createUserId}"/>
						<p id='checkStatusTextTip' class="form_tips formalert"></p>
					</li>
				</ul>
			</form>
		</div>
	</div>
</body>