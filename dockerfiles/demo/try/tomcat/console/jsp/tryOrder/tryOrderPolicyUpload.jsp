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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/tryOrder/tryOrderPolicyUpload.js"></script>
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
			 <div class="theme_title">保单管理</div>
			</div>
			<a class="btn btn-danger btn-block floating-back" href="javascript:returnPage();">返回列表</a>
			<button id="save" type="button" class="btn btn-danger btn-block floating-back view-hidden">保存</button>
		</div>
		<div class="panel-body floating-content">
			<form id="edit-form" name="edit-form" class="row" method="post" enctype="multipart/form-data">
			<input id="id" name="id" type="hidden" value="${tryOrder.id}">
				<ul class="form-wrap formgroup_wrap">
				
					<li>
								<span class="form_span" title="上传保单">上传保单:</span>
								<input onchange="getPhotoSize(this)" accept="image/x-png,image/gif,image/jpeg,image/bmp" type="file" name="multiFile" class="form-control" value="${tryOrder.policyUpload}"/> 
					</li>
					<li>
						<span class="form_span" title="保单">保单文件名称:</span>
						<input type="text"  class="form-control" value="${tryOrder.policyUpload}" placeholder="无需输入,上传成功后自动生成文件名"/> 
						<%-- <img src="<%=request.getContextPath()%>/tryEntrust/viewImages.do?alaramPic=${tryOrder.policyUpload}"> --%>
					</li>
				</ul>
			</form>
		</div>
	</div>
</body>