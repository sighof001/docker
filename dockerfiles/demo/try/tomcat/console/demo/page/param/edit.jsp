<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="../../../header/header.jsp"%>
<%
	String title = "参数新增";
	String op = request.getParameter("op");
	if (op == null || op.equals("add")) {
		title = "参数新增";
	}else {
		title = "参数修改";
	}
	String id = request.getParameter("id");
%>
</head>
<body>
	<div class="panel panel-default no-border">
		<div class="panel-heading">
			<h3><%=title%>    <small id="title-name"></small></h3>
			<a class="form-back" href="<%=path%>/demo/page/param/list.jsp">返回</a>
		</div>
		<div class="panel-body">
			<form id="edit-form" class="row" onSubmit="return false">
				<div class="col-xs-6">
					<div class="form-group">
						<label>编码<span class="red">*</span></label> 
						<div class="form-validate-desc" id="id-desc"></div>
						<input
							type="text" class="form-control" id="id"
							placeholder="输入参数编码" data-required="true" 
							data-pattern="^[a-zA-Z0-9][a-zA-Z0-9_]{1,30}$" 
							data-describedby="id-desc" data-description="id">
					</div>
					<div class="form-group">
						<label>父节点<span class="red">*</span></label> 
						<div class="form-validate-desc" id="pid-desc"></div>
						<div>
						<input id="pid" type="text" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label>是否叶子<span class="red">*</span></label> 
						<div class="form-validate-desc" id="id-desc"></div>
						<select id="isLeaf" class="form-control framecombox">
							<option value="0">否</option>
							<option value="1">是</option>
						</select>
					</div>
				</div>
				<div class="col-xs-6">
					<div class="form-group">
						<label>名称<span class="red">*</span></label>
						<div class="form-validate-desc" id="name-desc"></div> 
						<input
							type="text" class="form-control" id="name"
							placeholder="输入参数名称" data-required="true" 
							data-pattern="^[a-zA-Z\u4e00-\u9fa5][a-zA-Z0-9_\u4E00-\u9FA5]{1,30}$" 
							data-describedby="name-desc" data-description="name">
					</div>
					<div class="form-group">
						<label>类型</label> 
						<div class="form-validate-desc" id="type-desc"></div> 
						<input
							type="text" class="form-control" id="type"
							placeholder="输入类型" >
					</div>
				</div>
				<div class="col-xs-12">
					<div class="form-group">
						<label>备注</label> 
						<textarea cols="50" rows="3" type="text" class="form-control" id="memo"></textarea>
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
<script src="<%=path%>/demo/js/tree-ds.js"></script>
<script>
$(document).ready(function() {
	$("#pid").framedroptree({
		dataSource : new ParamDs("get_by_pid_no_leaf.do"),
		"item-icon" : "icon-tasks",
		"icon-color" : "blue2",
		height: 300
	});
	
	$("#isLeaf").selectpicker({});
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
			id: {
				required: '请输入编码！',
				pattern: '用编码不合法！请重新输入！'
			},
			name: {
				required: '请输入名称！',
				pattern: '用户名不合法！请重新输入！'
			}
		},
		valid: function(form) {
			var data = formutil.getFields($("#edit-form"));
			
			var url = "/demo/param/insert.do";
			if ("<%=op%>" == "update")
				url = "/demo/param/update.do";
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
			})
		}
	});
	
	initUpdateModel();
});

function initUpdateModel() {
	if ("<%=op%>" == "update") {
		$("#id").prop("readonly", true);
		util.getServerData("/demo/param/get_byId.do", {id: "<%=id%>"}, function(data) {
			formutil.setFields($("#edit-form"), data);
			$("#pid").framedroptree("setValue", [{id: data.pid, name: data.pname}]);
		})
	}
}
</script>