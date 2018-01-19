<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="/header/header.jsp"%>
<%@ include file="/jsp/include.jsp"%>
<link href="<%=request.getContextPath()%>/css/edit.css" type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/progressbar.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/plugin/jquery.form.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/plugin/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/tryArticleAssort/tryArticleAssortEdit.js"></script>
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
				<input id="id" name="id" type="hidden" value="${tryArticleAssort.id}">
				<ul class="form-wrap formgroup_wrap">
					<li>
						<span class="form_span" title="栏目名称">栏目名称:</span>
						<input type="text" class="form-control" id="themeName" name="themeName"  value="${tryArticleAssort.themeName}" placeholder="请输入栏目名称"/>
						<p id='themeNameTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="栏目key">栏目key:</span>
						<input type="text" class="form-control" id="themeKey" name="themeKey"  value="${tryArticleAssort.themeKey}" placeholder="请输入栏目key"/>
						<p id='themeKeyTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="排序">排序:</span>
						<input type="text" class="form-control" id="sequence" name="sequence"  value="${tryArticleAssort.sequence}" placeholder="请输入排序"/>
						<p id='sequenceTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="类型">类型:</span>
						<select class="form-control" id="type" name="type" value="${tryArticleAssort.type}">
							<c:forEach items="${typeList}" var="item">
								<option value="${item.dictValue}" <c:if test="${item.dictValue eq tryArticleAssort.type}">selected="selected"</c:if> >${item.text }</option>
							</c:forEach>
							</select>
					</li>
				</ul>
			</form>
		</div>
	</div>
</body>