<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="/header/header.jsp"%>
<%@ include file="/jsp/include.jsp"%>
<link href="<%=request.getContextPath()%>/css/edit.css" type="text/css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/progressbar.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/plugin/jquery.form.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/plugin/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/tryArticleList/tryArticleListEdit.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/ueditor/ueditor.all.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/ueditor/lang/zh-cn/zh-cn.js"></script>
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
			<a class="btn btn-danger btn-block floating-back"
				href="javascript:returnPage();">返回列表</a>
			<button id="save" type="button"
				class="btn btn-danger btn-block floating-back view-hidden">保存</button>
		</div>
		<div class="panel-body floating-content">
			<form id="edit-form" name="edit-form" class="row"
				onSubmit="return false">
				<input id="id" name="id" type="hidden" value="${tryArticleList.id}">
				<%-- <input id="content" name="content" type="hidden" value="${tryArticleList.content}">  --%>
					<input id="ChangeFlag" type="hidden" value="" />
				<ul class="form-wrap formgroup_wrap">
					<li><span class="form_span" title="标题">标题:</span> <input
						type="text" class="form-control" id="title" name="title"
						value="${tryArticleList.title}" placeholder="请输入标题" />
						<p id='titleTip' class="form_tips formalert"></p></li>
					<li><span class="form_span" title="分类id">分类:</span> <select
						class="form-control" id="assortId" name="assortId"
						value="${tryArticleList.assortId}">
							<c:forEach items="${tryArticleAssortList}" var="item">
								<option value="${item.id}"
									<c:if test="${item.id eq tryArticleList.assortId}">selected="selected"</c:if>>${item.themeName}</option>
							</c:forEach>
					</select> <%-- <input
						type="text" class="form-control" id="assortId" name="assortId"
						value="${tryArticleList.assortId}" placeholder="请输入分类id" /> --%>
						<p id='assortIdTip' class="form_tips formalert"></p></li>
						<li><span class="form_span" title="序号">序号:</span> 
						
						
						<c:if test="${tryArticleList==null}">
						<input type="text" class="form-control"  name="sequence"
						value="0" placeholder="请输入序号,数字越大越靠前显示" id="newSequence"/>
						<p id='newSequenceTip' class="form_tips formalert"></p></li>
						</c:if>
						<c:if test="${tryArticleList!=null}">
						<input type="text" class="form-control" id="sequence" name="sequence"
						value="${tryArticleList.sequence}" placeholder="请输入序号,数字越大越靠前显示" />
						<p id='sequenceTip' class="form_tips formalert"></p></li>
						</c:if>
				</ul>

				<!-- 加载编辑器的容器 -->
				<script id="editor" name="editor" type="text/plain"
					style="position: relative; left: 10px;">
					
   				 </script>
				<!-- 实例化编辑器 -->
				<script type="text/javascript">
					var ue = UE.getEditor('editor',{
						initialFrameHeight:450,
					});
					ue.ready(function() {
						initialFrameHeight:250
						var CheckF = $('#ChangeFlag').val();
						ue.setContent('${tryArticleList.content}');
						if (CheckF == '1') {
							ue.setDisabled();
						}
					});
				</script>

			</form>
		</div>
	</div>
</body>