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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/trySysMessage/trySysMessageEdit.js"></script>
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
				<input id="id" name="id" type="hidden" value="${trySysMessage.id}">
				<div id="tableTradeInfo" title="${title}" class="form_box_item">
					<div class="edit-title">
						<span>${title}</span>
					</div>
				<ul class="form-wrap formgroup_wrap ulcla">
					<li>
						<span class="form_span" title="标题">*标题:</span>
						<input type="text" class="form-control" id="title" name="title"  value="${trySysMessage.title}" placeholder="请输入标题"/>
						<p id='titleTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="状态">*状态:</span>
						<select class="form-control" id="status" name="status"  placeholder="请输入状态">
								<!-- <option value="">请选择</option>  -->
								<c:forEach items="${messageStatusList}" var="item" varStatus="i">	
									<option value="${item.dictValue}" data='${item}' <c:if test="${item.dictValue == trySysMessage.status}">selected="selected"</c:if>>${item.text}</option>
								</c:forEach>
						</select>
						<p id='statusTip' class="form_tips formalert"></p>
					</li>
					
					
					<li>
						<span class="form_span" title="类型">*类型:</span>
						<select class="form-control" id="messageType" name="messageType"  placeholder="请输入类型">
							
							<c:if test="${op == 'add'}">
								<option value="0">系统消息</option>
							</c:if>
							<c:if test="${op != 'add'}">
								<c:forEach items="${messageTypeList}" var="item" varStatus="i">	
											<option value="${item.dictValue}" data='${item}' <c:if test="${item.dictValue == trySysMessage.messageType}">selected="selected"</c:if>>${item.text}</option>
								</c:forEach>
							</c:if>
						</select>
						<p id='messageTypeTip' class="form_tips formalert"></p>
					</li>
					
					
					
					<%-- <li>
						<span class="form_span" title="接收类型">接收类型:</span>
						<select class="form-control" id="receiveType" name="receiveType"  placeholder="请输入接收类型">
							<c:forEach items="${receiveTypeList}" var="item" varStatus="i">	
										<option value="${item.dictValue}" data='${item}' <c:if test="${item.dictValue == trySysMessage.receiveType}">selected="selected"</c:if>>${item.text}</option>
							</c:forEach>
						</select>
						<p id='receiveTypeTip' class="form_tips formalert"></p>
					</li> --%>
					
					
				</ul>
				<ul class="form-wrap formgroup_wrap">
						<li class="textarea">
							<span class="form_span" title="内容">*内容:</span>
							<textarea class="form-control" id="content" name="content" placeholder="请输入内容">${trySysMessage.content}</textarea>
							<p id='contentTip' class="form_tips formalert"></p>
						</li>
				</ul>
				</div>
			</form>
		</div>
	</div>
</body>