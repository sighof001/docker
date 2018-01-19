
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="../../header/header.jsp"%>
<%
	String title = "用户机构授权";
// 	String op = request.getParameter("op");
// 	if (op == null || op.equals("add")) {
// 		title = "用户新增";
// 	}else {
// 		title = "用户修改";
// 	}
	String id = request.getParameter("id");
	String templateId = request.getParameter("templateId");
	String templateName = request.getParameter("templateName");
	String userName = request.getParameter("userName");
	String userId = request.getParameter("userId");
%>

</head>
<body>
	<div class="panel panel-default no-border">
		<div class="panel-heading">
			<h3><%=title%><small id="title-name"></small></h3>
			<a class="form-back" href="<%=path%>/admin/tmpuser/edit.jsp?op=add&templateId=<%=templateId%>&templateName=<%=templateName%>">返回</a>
		</div>
		<div class="panel-body">
			<form id="edit-form" class="row" >
				<input id="id" type="hidden">
				<input type='hidden' id='userId' value="<%=userId%>">
			    <input type='hidden' id='userName' value="<%=userName%>">
			    <input type='hidden' id='templateId' value="<%=templateId%>">
				<div class="col-xs-6">
					<div class="form-group">
						<label>域账号</label> 
						<div class="form-validate-desc" id="f_name-desc"></div>
						<input type="text" class="form-control" id="f_name" readonly="readonly"/>
					</div>
				</div>
				<div class="col-xs-6">
					<div class="form-group">
						<label>姓名</label>
						<div class="form-validate-desc" id="f_caption-desc"></div> 
						<input type="text" class="form-control" id="f_caption" readonly="readonly"/>
					</div>
				</div>
				
				<div class="col-xs-6">
					<div class="form-group">
						<label>电话号码</label> 
						<div class="form-validate-desc" id="f_mobile-desc"></div>
						<input type="text" class="form-control" id="f_mobile" readonly="readonly"/>
					</div>
				</div>
				<div class="col-xs-6">
					<div class="form-group">
						<label>机构</label> 
						<div class="form-validate-desc" id="f_org-desc"></div>
						<input id="org" type="text" class="form-control" placeholder="查询授权机构">
					</div>
				</div>
			</form>
			<div class="col-xs-2 pull-right">
					<button id="form-save-btn" class="btn btn-danger btn-block" onclick="submit();">授权</button>
			</div>
			<br>
			<div id="success-hint" class="alert alert-info hidden">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				<%=title%>成功！
			</div>
			<div id="error-hint" class="alert alert-danger hidden">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="<%=path%>/js/plugin/jquery-validate.min.js"></script>
<script>
$(document).ready(function() {
	initAuthority();
	$("#org").framedroptree({
		dataSource : new OrgDs({type:"1"}),
		"folder-icon-close": null,
		"folder-icon-open": null,		
		height: 300
	});
	initUpdateModel();
});

function submit(){
	$("#f_org-desc").html("");
	var orgCode =$("#org").attr("value2");
	var data = formutil.getFields($("#edit-form"));
	var url = "/tempuser/add.do?tmpId="+data.templateId+"&userId2="+data.userId+"&orgCode="+orgCode;
	if("undefined"==typeof(orgCode))
	{
		$("#f_org-desc").html("授权机构不能为空");
		return;
	}
	util.getServerData(url, data, function(o) {
		var mes = o.message;
		if("undefined"==typeof(mes)){
			$("#success-hint").removeClass("hidden");
			$("#error-hint").addClass("hidden");
		}else{
			$("#success-hint").addClass("hidden");
			$("#error-hint").removeClass("hidden");
			$("#error-hint").html(mes);
		}
	}, function(err, status) {
		var text = err;
		if (err.rs_code != null)
			text = err.message;
		$("#success-hint").addClass("hidden");
		$("#error-hint").removeClass("hidden");
		$("#error-hint").html(text);
	});
}

function initUpdateModel() {
		util.getServerData("/tempuser/get_org_user.do", {userId: "<%=userId%>", name: "<%= userName%>",tmpId:"<%= templateId%>"}, function(data) {
			formutil.setFields($("#edit-form"), data);
			$("#org").val(data.org_code);
		});
}

//
function back(){
	var tempId =$("#templateId").val();
	util.navigate("/admin/tmpuser/edit.jsp?op=add&templateId=<%=templateId%>");
}
</script>
