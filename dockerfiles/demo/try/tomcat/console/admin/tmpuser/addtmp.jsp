<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="../../header/header.jsp"%>
<%
	String title = "模板新增";
	String op = request.getParameter("op");
	if (op == null || op.equals("add")) {
		title = "模板新增";
	}else {
		title = "模板修改";
	}
	String id = request.getParameter("id");
%>
</head>
<body>
	<div class="panel panel-default no-border">
		<div class="panel-heading">
			<h3><%=title%>    <small id="title-name"></small></h3>
			<a class="form-back" href="<%=path%>/admin/tmpuser/tmpuser.jsp">返回</a>
		</div>
		<div class="panel-body">
			<form id="edit-form" class="row" onSubmit="return false">
				<input id="id" type="hidden">
				<div class="col-xs-6">
					<div class="form-group">
						<label>模板名<span class="red">*</span></label> 
						<div class="form-validate-desc" id="name-desc"></div>
						<input
							type="text" class="form-control" id="name"
							onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5 A-Za-z0-9_]/g,'')"
							data-describedby="name-desc" data-description="name">
					</div>
					<div class="form-group">
						<label>开始列号<span class="red">*</span><span class="red"></span></label> 
						<div class="form-validate-desc" id="startCol-desc"></div>
						<input type="number" class="form-control" id="startCol" data-describedby="name-desc"
							onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"
						/>
					</div>
					<div class="form-group">
						<label>结束列号<span class="red">*</span></label> 
						<div class="form-validate-desc" id="endCol-desc"></div>
						<input type="number"  class="form-control" id="endCol" data-describedby="name-desc"
							onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"
						/>
					</div>
					<div class="form-group">
						<label>对应表名<span class="red">*</span></label> 
						<div class="form-validate-desc" id="tableNamel-desc"></div>
						<input type="text"  class="form-control" id="tableName" data-describedby="name-desc"
							onkeyup="this.value=this.value.replace(/[^A-Za-z_0-9]/g,'')"
						/>
					</div>
					<div class="form-group">
						<label>模板路径<span class="red">*</span></label> 
						<div class="form-validate-desc" id="path-desc"></div>
						<input type="text"  class="form-control" id="path" data-describedby="name-desc"
						  value="/indicator/template/"  disabled=disabled/>
<!-- 							onkeyup="this.value=this.value.replace(/[^A-Za-z/.0-9]/g,'')" -->
						
					</div>
				</div>
				<div class="col-xs-6">
					<div class="form-group">
						<label>数据开始行<span class="red">*</span></label> 
						<div class="form-validate-desc" id="startRow-desc"></div>
						<input type="number"  class="form-control" id="startRow" data-describedby="name-desc"
							onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"
						 />
					</div>
					<div class="form-group">
<!-- 						<label>数据结束行<span class="red">*</span></label>  -->
<!-- 						<div class="form-validate-desc" id="endRow-desc"></div> -->
						<input type="hidden" value="9" class="form-control" id="endRow" data-describedby="name-desc"
							onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"
						/>
					</div>
					<div class="form-group">
						<label>数据开结束标记<span class="red">*</span></label> 
						<div class="form-validate-desc" id="endText-desc"></div>
						<input type="text"  class="form-control" id="endText" data-describedby="name-desc"/>
					</div>
					<div class="form-group">
						<label>数据所在工作表页号<span class="red">*</span></label> 
						<div class="form-validate-desc" id="sheet-desc"></div>
						<input type="text"  class="form-control" id="sheet" data-describedby="name-desc"
							onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"
						/>
					</div>
					<div class="form-group">
						<label>数据存储库<span class="red">*</span></label> 
						<div class="form-validate-desc" id="endText-desc"></div>
						<input type="text"  class="form-control" value="总行库" data-describedby="name-desc" disabled=disabled />
					</div>
					<div class="form-group">
						<div class="form-validate-desc" ></div>
						<input type="hidden" id="schema" value="MySQL默认"/>
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
var default_pwd = "********";

$(document).ready(function() {

// 	$('form').validate({
// 		onKeyup : true,
// 		eachValidField : function() {
// 			$(this).closest('div').removeClass('has-error').addClass('has-success');
// 			$("#"+$(this).attr("data-describedby")).html("");
// 		},
// 		eachInvalidField : function() {
// 			$(this).closest('div').removeClass('has-success').addClass('has-error');
// 		},
// 		description : {
// 			name: {
// 				required: '请输入用户名！',
// 				pattern: '用户名不合法！请重新输入！'
// 			},
// 			password: {
// 				required: '请输入密码！'
// 			},
// 			confirm: {
// 				required: '请再次输入密码！',
// 				conditional: '两次输入的密码不一致！请重新输入！'
// 			},
// 			caption: {
// 				required: '请输入姓名！',
// 				pattern: '姓名不合法！请重新输入！'
// 			}
// 		},
// 		conditional : {
// 			confirm : function() {
// 				return $(this).val() == $('#password').val();
// 			}
// 		},
// 		valid: function(form) {
// 			var data = formutil.getFields($("#edit-form"));
// 			if (data.password == default_pwd)
// 				data.password = $("#old_pwd").val();
// 			data.path = data.path+data.name+".xls";
			
// 			var url = "/tempuser/addTemplate.do";
<%-- <%-- 			if ("<%=op%>" == "update") --%> --%>
// // 				url = "/user/updateuser.do";
// 			util.getServerData(url, data, function() {
// 				$("#success-hint").removeClass("hidden");
// 				$("#error-hint").addClass("hidden");
// 				alert("保存成功！");
// 				util.navigate("/admin/tmpuser/tmpuser.jsp");
// 			}, function(err, status) {
// 				var text = err;
// 				if (err.rs_code != null)
// 					text = err.message;
// 				$("#success-hint").addClass("hidden");
// 				$("#error-hint").removeClass("hidden");
// 				$("#error-hint").html(text);
// 			})
// 		}
// 	});
	
	initUpdateModel();
	
// 	$("#confirm").on("focus", passwordFocus);
// 	$("#password").on("focus", passwordFocus);
});



function initUpdateModel() {
	if ("<%=op%>" == "update") {
		util.getServerData("/user/getuser.do", {userId: "<%=id%>"}, function(data) {
			formutil.setFields($("#edit-form"), data);
			alert(data);
			$("[type=password]").val(default_pwd);
			$("#old_pwd").val(data.password);
		})
	}
}
</script>