<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="../../../header/header.jsp"%>
<%
	String title = "数据新增";
	String op = request.getParameter("op");
	if (op == null || op.equals("add")) {
		title = "数据新增";
	}else {
		title = "数据修改";
	}
	String id = request.getParameter("id");
%>
</head>
<body>
	<div class="panel panel-default no-border">
		<div class="panel-heading">
			<h3><%=title%>    <small id="title-name"></small></h3>
			<a class="form-back" href="<%=path%>/demo/page/fact01/list.jsp">返回</a>
		</div>
		<div class="panel-body">
			<form id="edit-form" class="row" onSubmit="return false">
				<input type="hidden" id="id">
				<div class="col-xs-6">
					<div class="form-group">
						<label>日期<span class="red">*</span></label> 
						<div class="form-validate-desc" id="date-desc"></div>
						<input
							type="text" id="dateCode" class="form-control" 
							placeholder="需要日期控件" data-required="true" 
							data-describedby="date-desc" data-description="date">
					</div>
					<div class="form-group">
						<label>企业规模</label> 
						<select id="qygmCode" class="form-control framecombox" 
							data-url="demo/param/get_by_pid.do?pid=5000">
						</select>
					</div>
					<div class="form-group">
						<label>票据贴现</label> 
						<select id="pjtxCode" class="form-control framecombox" 
							data-url="demo/param/get_by_pid.do?pid=4000">
						</select>
					</div>
					<div class="form-group">
						<label>票据风险</label> 
						<select id="pjfxCode" class="form-control framecombox" 
							data-url="demo/param/get_by_pid.do?pid=1000">
						</select>
					</div>
					<div class="form-group">
						<label>发生额<span class="red">*</span></label> 
						<div class="form-validate-desc" id="fse-desc"></div>
						<input
							type="text" id="fse" class="form-control" 
							placeholder="0.00" data-required="true" 
							data-pattern="^-?\d+(\.\d+)?$" 
							data-describedby="fse-desc" data-description="fse">
					</div>
				</div>
				<div class="col-xs-6">
					<div class="form-group">
						<label>机构<span class="red">*</span></label>
						<div class="form-validate-desc" id="org-desc"></div> 
						<input id="orgCode" type="text" class="form-control">
					</div>
					<div class="form-group">
						<label>票据形式</label> 
						<select id="pjxsCode" class="form-control framecombox" 
							data-url="demo/param/get_by_pid.do?pid=3000">
						</select>
					</div>
					<div class="form-group">
						<label>票据种类</label> 
						<select id="pjzlCode" class="form-control framecombox" 
							data-url="demo/param/get_by_pid.do?pid=6000">
						</select>
					</div>
					<div class="form-group">
						<label>余额<span class="red">*</span></label> 
						<div class="form-validate-desc" id="ye-desc"></div>
						<input
							type="text" id="ye" class="form-control" 
							placeholder="0.00" data-required="true" 
							data-pattern="^-?\d+(\.\d+)?$" 
							data-describedby="ye-desc" data-description="ye">
					</div>
					<div class="form-group">
						<label>当月余额<span class="red">*</span></label> 
						<div class="form-validate-desc" id="dyye-desc"></div>
						<input
							type="text" id="dyye" class="form-control" 
							placeholder="0.00" data-required="true" 
							data-pattern="^-?\d+(\.\d+)?$" 
							data-describedby="dyye-desc" data-description="dyye">
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
	initCombox();
	$("#dateCode").datepicker({
		showOtherMonths: true,
		selectOtherMonths: true
	});
	$("#orgCode").framedroptree({
		dataSource : new ParamDs("", "ORG"),
		"item-icon" : "icon-tasks",
		"icon-color" : "blue2",
		height: 300
	});
	
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
			ye: {
				required: '请输入余额！',
				pattern: '余额不合法！请重新输入！'
			},
			fse: {
				required: '请输入发生额！',
				pattern: '发生额不合法！请重新输入！'
			},
			dyye: {
				required: '请输入当月余额！',
				pattern: '当月余额不合法！请重新输入！'
			}
		},
		valid: function(form) {
			var data = formutil.getFields($("#edit-form"));
			
			var url = "/demo/fact01/insert.do";
			if ("<%=op%>" == "update")
				url = "/demo/fact01/update.do";
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
		util.getServerData("/demo/fact01/get_by_id.do", {id: "<%=id%>"}, function(data) {
			formutil.setFields($("#edit-form"), data);
			$("#orgCode").framedroptree("setValue", [{id: data.orgCode, name: data.orgName}]);
		})
	}
}
</script>