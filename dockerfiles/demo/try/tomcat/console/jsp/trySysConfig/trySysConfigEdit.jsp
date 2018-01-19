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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/trySysConfig/trySysConfigEdit.js"></script>
<script type="text/javascript">
var op = '${op}';
var returnType = '${returnType}';
var flag = '${flag}'
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
			<form id="edit-form" name="edit-form" class="row" method="post" enctype="multipart/form-data">
				<input id="id" name="id" type="hidden" value="${trySysConfig.id}">
				<ul class="form-wrap formgroup_wrap">
					<li>
						<span class="form_span" title="键名称">键名称:</span>
						<input type="text" class="form-control" id="keyName" name="keyName"  value="${trySysConfig.keyName}" placeholder="请输入键名称"/>
						<p id='keyNameTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="说明">说明:</span>
						<input type="text" class="form-control" id="note" name="note"  value="${trySysConfig.note}" placeholder="请输入说明"/>
						<p id='noteTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="键">键:</span>
						<input readonly="readonly" type="text" class="form-control" id="sysKey" name="sysKey"  value="${trySysConfig.sysKey}" placeholder="请输入键"/>
						<p id='sysKeyTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="类型,0:单行文本,1:多行文本,2:图片">类型:</span>
						<select  class="form-control" id="type" name="type" value="${trySysConfig.type}">
							<c:forEach items="${sysTypeList}" var="item">
							<option value="${item.dictValue}" <c:if test="${item.dictValue eq trySysConfig.type}">selected="selected"</c:if> >${item.text}</option>
							</c:forEach>
							</select>
						<%-- <input type="text" class="form-control" id="type" name="type"  value="${trySysConfig.type}" placeholder="请输入类型,0:单行文本,1:多行文本,2:图片"/> --%>
						<p id='typeTip' class="form_tips formalert"></p>
					</li>
					<li id="sysValueLi">
						<span class="form_span" title="值">值:</span>
						<input type="text" class="form-control" id="sysValue" name="sysValue"  value="${trySysConfig.sysValue}" placeholder="请输入值"/>
						<p id='sysValueTip' class="form_tips formalert"></p>
					</li>
					<li class='file' style="display: none;">
								<span class="form_span" title="上传图片">上传图片:</span>
								<input type="file" name="multiFile" class="form-control" value="请选择图片" accept="image/x-png,image/gif,image/jpeg,image/bmp" onchange="getPhotoSize(this)"/> 
					</li>
					<%-- <li>
						<span class="form_span" title="创建人">创建人:</span>
						<input type="text" class="form-control" id="createUserId" name="createUserId"  value="${trySysConfig.createUserId}" placeholder="请输入创建人"/>
						<p id='createUserIdTip' class="form_tips formalert"></p>
					</li> --%>
				</ul>
			</form>
		</div>
	</div>
</body>