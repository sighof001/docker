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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/oldEntrustOrder/oldEntrustOrderPayOut.js"></script>
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
				<input id="entrustId" name="entrustId" type="hidden" value="${oldEntrustOrder.id}">
				<input id="custId" name="custId" type="hidden" value="${oldEntrustOrder.custId}">
				<div id="tableTradeInfo" title="${title}" class="form_box_item">
				<ul class="form-wrap formgroup_wrap">
					<li>
						<span class="form_span" title="委托金额">委托金额:</span>
						<input type="text" class="form-control" id="amount" name="amount" value="${oldEntrustOrder.amount}" disabled="disabled"/>
						<input type="hidden" class="form-control" id="amount" name="amount" value="${oldEntrustOrder.amount}"/>
						<p id='amountTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="转出金额">转出金额:</span>
						<input type="text" class="form-control" id="payOutAmount" name="payOutAmount"  placeholder="请输入转出金额"/>
						<p id='payOutAmountTip' class="form_tips formalert"></p>
					</li>
					</ul>
					<ul class="form-wrap formgroup_wrap">
					<li class="textarea">
						<span class="form_span" title="说明">说明:</span>
						<textarea class="form-control" id="remark" name="remark" placeholder="请输入说明">${tryGoods.remark}</textarea>
						<p id='remarkTip' class="form_tips formalert"></p>
					</li>
					<%-- <li>
						<span class="form_span" title="创建人">创建人:</span>
						<input type="text" class="form-control" id="createUserId" name="createUserId"  value="${oldEntrustOrder.createUserId}" placeholder="请输入创建人"/>
						<p id='createUserIdTip' class="form_tips formalert"></p>
					</li> --%>
				</ul>
			</form>
		</div>
	</div>
</body>