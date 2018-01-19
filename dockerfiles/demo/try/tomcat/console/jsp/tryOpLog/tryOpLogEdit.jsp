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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/tryOpLog/tryOpLogEdit.js"></script>
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
			<div id="tableTradeInfo" title="${title}" class="form_box_item">
				<input id="id" name="id" type="hidden" value="${tryOpLog.id}">
				<ul class="form-wrap formgroup_wrap">
					<li>
						<span class="form_span" title="操作类型,枚举各种操作">操作类型,枚举各种操作:</span>
						<input type="text" class="form-control" id="opType" name="opType"  value="${tryOpLog.opType}" placeholder="请输入操作类型,枚举各种操作"/>
						<p id='opTypeTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="创建人">创建人:</span>
						<input type="text" class="form-control" id="userName" name="userName"  value="${tryOpLog.userName}" placeholder="请输入创建人"/>
						<p id='createUserIdTip' class="form_tips formalert"></p>
					</li>
				</ul>
				<ul class="form-wrap formgroup_wrap">
						<li class="textarea">
							<span class="form_span" title="内容">内容:</span>
							<textarea class="form-control" id="content" name="content" placeholder="请输入内容">${tryOpLog.content}</textarea>
							<p id='contentTip' class="form_tips formalert"></p>
						</li>
				</ul>
			</div>
			</form>
		</div>
	</div>
</body>