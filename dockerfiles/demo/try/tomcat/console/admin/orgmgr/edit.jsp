<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="../../header/header.jsp"%>
<%
	String title = "机构新增";
	String op = request.getParameter("op");
	if (op == null || op.equals("add")) {
		title = "机构新增";
	}else {
		title = "机构修改";
	}
	String id = request.getParameter("id");
%>
</head>
<body>
	<div class="panel panel-default no-border">
		<div class="panel-heading">
			<h3><%=title%>    <small id="title-name"></small></h3>
			<a class="form-back" href="<%=path%>/admin/orgmgr/orgmgr.jsp">返回</a>
		</div>
		<div class="panel-body">
			<form id="edit-form" class="row" onSubmit="return false">
				<input id="id" type="hidden">
				<input id="old_pwd" type="hidden">
				<div class="col-xs-6">
					<div class="form-group">
						<label>机构名<span class="red">*</span></label> 
						<div class="form-validate-desc" id="name-desc"></div>
						<input
							type="text" class="form-control" id="name"
							placeholder="输入机构名" data-required="true" 
							data-describedby="name-desc" data-description="name"/>
					</div>
					<div class="form-group">
						<label>机构类型</label> 
						<input
							type="text" class="form-control" id="type"
							placeholder="机构类型">
					</div>
					<div class="form-group">
						<label>机构码</label> <input
							type="text" class="form-control" id="orgCode"
							placeholder="机构码">
					</div>
				</div>
				<div class="col-xs-6">
					<div class="form-group">
						<label>上级机构码</label> 
						<input
							type="text" class="form-control" id="orgPCode"
							placeholder="机构码p">
					</div>
					<div class="form-group">
						<label>机构层级<span class="red">*</span></label> 
						<div class="form-validate-desc" id="confirm-desc"></div> 
						<input
							type="text" class="form-control" id="level"
							placeholder="机构层级" data-required data-conditional="confirm"
							data-describedby="level-desc" data-description="level">
					</div>
				</div>
				<div class="col-xs-2 pull-right">
					<button id="form-save-btn" class="btn btn-danger btn-block">保存</button>
				</div>
			</form>
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
<script src="<%=path%>/js/plugin/jquery-validate.min.js"></script>
<script>
// var default_pwd = "********";

$(document).ready(function() {

	$('form').validate({
		onKeyup : true,
		eachValidField : function() {
			$(this).closest('div').removeClass('has-error').addClass('has-success');
			$("#"+$(this).attr("data-describedby")).html("");
		},
		eachInvalidField : function() {
			$(this).closest('div').removeClass('has-success').addClass('has-error');
		},
		description : {
			name: {
				required: '请输入机构名！',
				pattern: '机构名不合法！请重新输入！'
			},
			type: {
				required: '请输入机构类型！'
			},
			orgCode: {
				required: '机构码'
			}
		},
		
		valid: function(form) {
			var data = formutil.getFields($("#edit-form"));

			var url = "/orgmgr/add_orgmgr.do";
			if ("<%=op%>" == "update")
				url = "/orgmgr/update_orgmgr.do";
			util.getServerData(url, data, function() {
				$("#success-hint").removeClass("hidden");
				$("#error-hint").addClass("hidden");
			}, function(err, status) {
				var text = err;
				if (err.rs_code != null)
					text = err.message;
				$("#success-hint").addClass("hidden");
				$("#error-hint").removeClass("hidden");
				$("#error-hint").html(text);
			});
		}
	});
	
	initUpdateModel();
	
// 	$("#name").on("focus", passwordFocus);
// 	$("#type").on("focus", passwordFocus);
});

function passwordFocus(e) {
	if ($(this).val() == default_pwd) 
		$(this).val("");
}

function initUpdateModel() {
	if ("<%=op%>" == "update") {
		util.getServerData("/orgmgr/get_orgmgr.do", {id: "<%=id%>"}, function(data) {
			formutil.setFields($("#edit-form"), data);
// 			$("[type=password]").val(default_pwd);
// 			$("#old_pwd").val(data.password);
		})
	}
}
</script>