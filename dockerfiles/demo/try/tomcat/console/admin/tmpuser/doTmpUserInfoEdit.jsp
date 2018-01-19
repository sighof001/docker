<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@  taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %> 

<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="../../header/header.jsp"%>
<%
	String title = "编辑";
	String op = request.getParameter("op");
	if (op == null || op.equals("add")) {
		title = "编辑";
	}else {
		title = "用户修改";
	}
	String tmpUserInfoId = request.getParameter("tmpUserInfoId");
// 	String templateId = request.getParameter("templateId");
// 	String date = request.getParameter("date");
// 	String org = request.getParameter("org");
%>

</head>
<body>
	<div class="panel panel-default no-border">
		<div class="panel-heading">
			<h3><%=title%>    <small id="title-name"></small></h3>
			<a class="form-back" href="javascript:history.go(-1)">返回</a>
		</div>
		<div class="panel-body">
			<form id="edit-form" class="row" onSubmit="return false">
<!-- 				<input id="id" type="hidden"> -->
<!-- 				<input id="old_pwd" type="hidden"> -->
<!-- 				<input id="status" type="hidden"> -->
<!-- 				<input id="groupId" type="hidden"> -->
					<div class="col-xs-6">
						<div class="form-group">
							<label>域用户<span class="red"></span></label> 
							<div class="form-validate-desc" id="name-desc"></div>
							<input
								type="text" class="form-control" id="userName" data-required="true" 
								data-describedby="userName-desc" data-description="name" disabled="disabled"/>
						</div>
					</div>	
					
					<div class="col-xs-6">
						<div class="form-group">
							<label>姓名<span class="red"></span></label> 
							<div class="form-validate-desc" id="name-desc"></div>
							<input
								type="text" class="form-control" id="userCaption" data-required="true" 
								data-describedby="userCaption-desc" data-description="name" disabled="disabled" />
						</div>
					</div>
					
					
					<div class="col-xs-6">
						<div class="form-group">
							<label>角色名称<span class="red"></span></label> 
							<div class="form-validate-desc" id="name-desc"></div>
							<input
								type="text" class="form-control" id="roleCaption" data-required="true" 
								data-describedby="roleCaption-desc" data-description="name" disabled="disabled"/>
						</div>
					</div>
					
					<div class="col-xs-6">
						<div class="form-group">
							<label>角色<span class="red">*</span></label> 
							<div class="form-validate-desc" id="roleName"></div>
							<input
								type="text" class="form-control" id="role_Name" data-required="true" 
								onchange="changeSelect(this,2);" data-url="role2/get_tmplateUserInfo_role.do"/>
<!-- 								data-describedby="roleName-desc" data-description="name" -->
						</div>
					</div>
					
					<div class="col-xs-6">
						<div class="form-group">
							<label>机构<span class="red">*</span></label> 
							<div class="form-validate-desc" id="name-desc"></div>
							<input
								type="text" class="form-control" id="orgText" data-required="true" 
								data-describedby="orgCode-desc" data-description="name" />
						</div>
					</div>
					
			</form>
				<div class="col-xs-2 pull-right">
					<button id="form-save-btn" class="btn btn-danger btn-block">保存</button>
				</div>
			<br>
			<div id="success-hint" class="alert alert-info hidden">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				保存成功！
			</div>
			<div id="error-hint" class="alert alert-danger hidden">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			</div>
		</div>
	</div>
</body>
<script src="<%=path%>/js/plugin/jquery-validate.min.js"></script>
<script>
$(function(){

 	$("#orgText").framedroptree({
 		dataSource : new OrgDs({type:"1"}),
 		"folder-icon-close": null,
		"folder-icon-open": null,		
 		height: 300
 	});

 	$("#role_Name").framedroptree({
 		dataSource : new NotUserRoles(),
 		"folder-icon-close": null,
		"folder-icon-open": null,		
 		height: 300
 	});
});


$(document).ready(function() {
	
	initUpdateModel();
});

function initUpdateModel() {
	if ("<%=op%>" == "update") {
		util.getServerData("/user2/update_tmpuserInfo.do", {tmpUserInfoId: "<%=tmpUserInfoId%>"}, function(data) {
			$("#userName").val(data.userMess.userName);
			$("#userCaption").val(data.userMess.userCaption);
			$("#roleCaption").val(data.userMess.roleCaption);
			$("#role_Name").val(data.userMess.roleName);
			$("#orgText").val(data.userMess.orgCode);
		});
	}
}

// 保存
$("#form-save-btn").on("click",function(){
	var roleName = $("#role_Name").val();
	var orgText = $("#orgText").val();
	var url = "/user2/update_user_templateInfo.do";
	util.getServerData(url,{tmpUserInfoId:"<%=tmpUserInfoId%>",roleName:roleName,orgText:orgText},function(o){
		if(o.rs_code == 0){
			$("#success-hint").removeClass("hidden");
		}else{
			$("#error-hint").append(o.message);
			$("#error-hint").removeClass("hidden");
		}
	});
});
</script>

<script>
// 显示所有角色源
	var NotUserRoles = function(options) {
		this.url = "/role2/get_roleAll_name.do";
//		this.userId = options.userId;
	}
	
	NotUserRoles.prototype = {
		data: function(node, callback) {
			this.getDataFrmSvr(callback);
		}
		,getDataFrmSvr: function(callback) {
			util.getServerData(this.url, {}, function(data) {
				var len = data.length;
				for (var i=0;i<len;i++) {
					var d = data[i];
					d.type = "item";
				}
				callback({data: data});
			});
		} 
	}
</script>