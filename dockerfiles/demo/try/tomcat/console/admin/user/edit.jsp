<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="../../header/header.jsp"%>

<%
	String title = "用户新增";
	String op = request.getParameter("op");
	if (op == null || op.equals("add")) {
		title = "用户新增";
	}else {
		title = "用户修改";
	}
	String id = request.getParameter("id");
	/* String templateId = request.getParameter("templateId");
	String templateName = request.getParameter("templateName");
	String userName = request.getParameter("userName");
	String userId = request.getParameter("userId"); */
%>

</head>
<body>
	<div class="panel panel-default no-border">
		<div class="panel-heading">
			<h3><%=title%>    <small id="title-name"></small></h3>
			<a class="form-back" href="<%=path%>/admin/user/list.jsp">返回</a>
		</div>
		<div class="panel-body">
			<form id="edit-form" class="row" onSubmit="return false">
				<input id="id" type="hidden">
				<input id="old_pwd" type="hidden">
				<input id="status" type="hidden">
				<input id="groupId" type="hidden">
				<div class="col-xs-6">
					<div class="form-group">
						<label>登录名<span class="red">*</span></label> 
						<div class="form-validate-desc" id="name-desc"></div>
						<input
							type="text" class="form-control" id="name"
							placeholder="输入登录名" data-required="true" 
							data-describedby="name-desc" data-description="name" />
<!-- 							onkeyup="this.value=this.value.replace(/[^A-Za-z0-9]/g,'')" -->
<!--							 data-pattern="^[A-Za-z0-9]+$"  -->
						
					</div>
					<div class="form-group">
						<label>密码<span class="red"></span></label> 
						<div class="form-validate-desc" id="password-desc"></div>
						<input
							type="password" class="form-control" id="password"
							placeholder="输入至少6位密码" data-required 
							data-describedby="password-desc" data-description="password"  
						data-required="true" data-pattern="^[0-9A-Za-z]{6,}$">
					</div>
					<div class="form-group">
						<label>电话号码</label> <input
							type="text" class="form-control" id="mobile"
							placeholder="输入电话号码" />
					</div>
				</div>
				<div class="col-xs-6">
					<div class="form-group">
						<label>姓名<span class="red"></span></label>
						<div class="form-validate-desc" id="caption-desc"></div> 
						<input
							type="text" class="form-control" id="caption"
							onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5A-Za-z0-9_]{30}/g,'')"
							placeholder="输入姓名"> <!-- data-required="true" 
							data-pattern="^[a-zA-Z\u4e00-\u9fa5][a-zA-Z0-9_\u4E00-\u9FA5]{2,30}$" 
							data-describedby="caption-desc" data-description="caption" -->
					</div>
					<div class="form-group">
						<label>重复密码<span class="red"></span></label> 
						<div class="form-validate-desc" id="confirm-desc"></div> 
						<input
							type="password" class="form-control" id="confirm"
							 placeholder="重复密码"  data-conditional="confirm"
							 data-pattern="^[0-9A-Za-z]{6,}$"
							  data-describedby="confirm-desc" data-description="confirm">
							<!-- data-required --> 
					</div>
					
					<!-- <div class="form-group">
						<label>所属机构/部门<span class="red">*</span></label> 
						 type="text" class="form-control" id="desc" 
						<div class="form-validate-desc" id="orgText-desc"></div> 
						<input id="orgText" type="text" class="form-control"
						  data-required="true" placeholder="所属部门" data-describedby="orgText-desc" data-description="orgText"/>
						  <input id="org" name="org" type="hidden">
					</div>  -->
					
					<div class="form-group">
						<label>邮件地址<span class="red"></span></label>
						<div class="form-validate-desc" id="email-desc"></div>
						 <input
							type="email" class="form-control" id="email"
							placeholder="输入邮件地址" data-describedby="email-desc" data-conditional="email" data-pattern="^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]{2,3}){1,2}$" data-description="email" >
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
				<%=title%>该用户已存在！
			</div>
		</div>
	</div>
</body>
<script src="<%=path%>/js/plugin/jquery-validate.min.js"></script>
<script>
$(function(){
	//alert("1234");
	$("#name").blur(function(){
		
		var _this = $(this);
		
		var value = $(this).val();//获取文本框的值
		
		$(".myText").empty().show();
		if(value==""){
		return;
		}
		else{
		$.ajax({
			type:"POST",
			url:"../../user2/check.do?name="+value,
			success:function(data){
				/* var arr = eval(data);
				//alert(data);
				for(var i = 0; i<arr.length; i++){
					$(".myText").append("<div>"+arr[i]+"<div>");
				} */
			}
	});
		}
		});
});

//hjw add 20150820
// jQuery.validator.addMethod("isPhone", function(value,element) { 
// 	  var length = value.length; 
// 	  var mobile = /^(((13[0-9]{1})|(15[0-9]{1}))+\d{8})$/; 
// 	  var tel = /^\d{3,4}-?\d{7,9}$/; 
// 	  return this.optional(element) || (tel.test(value) || mobile.test(value)); 

// 	}, "请正确填写您的联系电话"); 

var default_pwd = "";

$(document).ready(function() {
	if ("<%=op%>" == "update")
	{
			$("#name").attr("disabled",true);
	}

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
				required: '请输入用户名！',
				pattern: '用户名不合法！请重新输入！'
			},
			password: {
				required: '请输入密码！',
				pattern: '您输入的密码不合法！密码不能少于6位数,请重新输入！'
			},
			confirm: {
				required: '请再次输入密码！',
				conditional: '两次输入的密码不一致！请重新输入！'
			},
			mobile:{
				required:'请输入电话号码！', 
				isMobile:'电话号码不合法！' 
			},
			orgText: {
				required: '请选择部门！',
				pattern: '请选择部门！'
			},
			caption: {
				required: '请输入姓名！',
				pattern: '姓名不合法！请重新输入！'
			},
			email:{
				pattern: '邮件格式不正确！请重新输入！'
			}
		},
		conditional : {
			confirm : function() {
				return $(this).val() == $('#password').val();
			}
		},
		valid: function(form) {
			var data = formutil.getFields($("#edit-form"));
			$("#org").val($("#orgText").attr("value2"));
			if (data.password == default_pwd)
				data.password = $("#old_pwd").val();
			//data.desc = $(".tree-selected").find("div").text();
			data.desc =$("#org").val();
			$(".tree-selected").children("div").text();
			//var url = "/user/insertuser.do";
			var url = "/user2/insertuser.do";
			if ("<%=op%>" == "update"){
				//url = "/user/updateuser.do";
				url = "/user/updateuser.do";
				requestData(url,data);
			}else{
				var url2 ="/user2/checkuser.do";
				util.getServerData(url2, data, function(o) {
					var mes = o.message;
					if("undefined"==typeof(mes)){
						requestData(url,data);
					}else{
						$("#success-hint").addClass("hidden");
						$("#error-hint").removeClass("hidden");
						$("#error-hint").html(mes);
					}
				}, function(err, status){
					var text = err;
					if (err.rs_code != null)
						text = err.message;
					$("#success-hint").addClass("hidden");
					$("#error-hint").removeClass("hidden");
					$("#error-hint").html(text);
				});
			}
			
		}
	});
	
	
	
	initUpdateModel();
	
	$("#confirm").on("focus", passwordFocus);
	$("#password").on("focus", passwordFocus);
	
	// 选择机构部门
	$("#orgText").framedroptree({
		dataSource : new OrgDs({type:"1"}),
		"folder-icon-close": null,
		"folder-icon-open": null,		
		height: 300
	});
});


function requestData(url,data){
	util.getServerData(url, data,function() {
		$("#success-hint").removeClass("hidden");
		$("#error-hint").addClass("hidden");
	}, function(err, status){
		var text = err;
		if (err.rs_code != null)
			text = err.message;
		$("#success-hint").addClass("hidden");
		$("#error-hint").removeClass("hidden");
		$("#error-hint").html(text);
	});
}

function passwordFocus(e) {
	if ($(this).val() == default_pwd) 
		$(this).val("");
}

function initUpdateModel() {
	if ("<%=op%>" == "update") {
		util.getServerData("/user/getuser.do", {userId: "<%=id%>"}, function(data) {
			formutil.setFields($("#edit-form"), data);
			$("[type=password]").val(default_pwd);
			$("#old_pwd").val(data.password);
			$("#status").val(data.status);
			$("#groupId").val(data.groupId);
		//	$("#desc").val(data.desc);
		});
	}
}


</script>