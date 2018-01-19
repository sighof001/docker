<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="/header/header.jsp"%>
<%@ include file="/jsp/include.jsp"%>
<link href="<%=request.getContextPath()%>/css/edit.css" type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/progressbar.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/plugin/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/tryCustAsset/tryCustAssetEdit.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/plugin/jquery-validate.min.js"></script>
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
		</div>
		<div class="panel-body floating-content">
			<form id="edit-form" name="edit-form" onSubmit="return false">
				<input id="id" name="id" type="hidden" value="${tryCustAsset.id}">
				<ul class="form-wrap formgroup_wrap">
					<li>
						<span class="form_span" title="用户名">用户名:</span>
						<input type="text" class="form-control" id="loginId" name="loginId"  value="${tryCustAsset.loginId}"/>
						<p id='createUserIdTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="商品名称">商品名称:</span>
						<input type="text" class="form-control" id="goodsName" name="goodsName"  value="${tryCustAsset.goodsName}" />
						<p id='goodsNameTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="起息日">起息日:</span>
						<input type="text" class="form-control" id="beginDate" name="beginDate"  value="${tryCustAsset.displayBeginDate}" />
						<p id='displayBeginDateTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="到期日">到期日:</span>
						<input type="text" class="form-control" id="endDate" name="endDate"  value="${tryCustAsset.displayEndDate}" />
						<p id='displayEndDateTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="总金额">总金额:</span>
						<input type="text" class="form-control" id="amount" name="amount"  value="${tryCustAsset.amount}" />
						<p id='amountTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="资产状态">资产状态:</span>
						<input type="text" class="form-control" id="status" name="status"  value="${tryCustAsset.displayStatus}" />
						<p id='amountTip' class="form_tips formalert"></p>
					</li>
				</ul>
			</form>
			<div id="success-hint" class="alert alert-info hidden">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				保存成功！
			</div>
			<div id="error-hint" class="alert alert-danger hidden">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				记录已存在！
			</div>
		</div>
	</div>
</body>