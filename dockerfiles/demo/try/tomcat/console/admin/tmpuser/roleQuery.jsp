<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
<%@ include file="../../header/header.jsp"%>
<link href="<%=path%>/js/plugin/jqueryui/css/redmond/jquery-ui-1.10.4.custom.min.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="<%=path%>/js/plugin/jqueryui/js/jquery-ui-1.10.4.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/plugin/jqueryui/js/jquery.ui.datepicker-zh-CN.js"></script>
<%
	String name = URLDecoder.decode(request.getParameter("name"),"UTF-8");
    String userId = (String)request.getParameter("id");
	if (name == null) 
		name = "";
// 	else name = new String(name.getBytes("iso8859-1"),"utf-8");
	
%>
<style>
.file-upload {
	width: 500px;
	height: 32px;
	border-radius: 4px;
	/*background-color: red;*/
}
</style>

</head>
<body>
	<div class="panel panel-default no-border">
	<div class="panel-heading">
			<%-- <h4>
				<%=name%> <!--  <small>绑定信息</small> -->
			</h4> --%>
			
			<div id="query-form" class="row">
				<span class="query-label">角色:</span>
				<div class="col-xs-4">
					<select id="role" name="role" class="form-control framecombox" onchange="changeSelect(this,2);"
							data-url="role2/get_tmplateUserInfo_role.do">
					</select>
				</div> 
				<span class="query-label">机构:</span>
				<div class="col-xs-4" >
					<input id="org" type="text" class="form-control" placeholder="机构">
				</div>
				<div class="col-xs-1">
					<input id="query-btn" type="button" class="form-control btn-primary disabled" onclick="getQuery();"  value="查询">
				</div>
				<div class="col-xs-1">
					<input id="reset-btn" type="button" class="form-control btn-primary disabled" value="重置">
				</div>
				<div class="col-xs-1">
					<input id="back-btn" type="button" class="form-control btn-primary disabled" onclick="goBack();"  value="返回">
				</div>
			</div> 
			<%-- <a class="form-back" href="<%=path%>/admin/tmpuser/userFormwork.jsp">返回</a> --%>
			
	</div>
	</div>

		<div id="table" class="panel-body" style="dispaly:block;width:100%;overflow-x:auto;white-space:nowrap;">
		</div>
	</div>
</body>
<script src="<%=path%>/js/app/tree-ds.js"></script>
<script>

$(document).ready(function(){
	initAuthority();
	initCombox();
	getTable();
	$("#org").framedroptree({
		dataSource : new OrgDs({type:"1"}),
		"folder-icon-close": null,
		"folder-icon-open": null,		
		height: 300
	});
	
	$("#reset-btn").on("click", function() {
		formutil.setFields($("#query-form"), {org:"",role:"0"});
		getQuery();
	});

});

function getTable(){
	$("#table").frametable("destroy");
	
	$("#table").frametable({
		columns: [
		          {name:'id', text:'绑定ID', hidden: true},
		          {name:'userName', text:'域用户', sort: true, width: 150},
		          {name:'userCaption', text:'姓名', sort: true, width: 150},
		          {name:'roleCaption', text:'角色名称', sort: true, width: 150},
		          {name:'roleName', text:'角色', sort: true, width: 150},
	//		          {name:'f_org_code', text:'审核级别', sort: true, width: 150},
		          {name:'orgCode', text:'机构', sort: true, width: 150}
	//		          {name:'statusStr', text:'状态', sort: true}
		         ],
	  		op: [
	  		   	  {name:'edit', authority:'update', text:'编辑', type:'icon', clazz:'icon-edit', handler: doEdit, hidden: testAuthority},
				  {name:'delete', authority:'delete', text:'删除', type:'icon', clazz:'icon-trash', handler: doDelete, hidden: testAuthority}
				],	
		datatype: "server",
		tableClass: "table-bordered table-hover table-striped",
		url: 'user2/querytemplateUserInfo.do?userId='+"<%=userId%>",
		rowsurl: 'user2/queryTemplateUserInfoRow.do?userId='+"<%=userId%>",
		pageName: 'page',
		pageSizeName: 'limit'
	});
}
	

//	删除一条记录
function doDelete(data) {
	var btn = confirm("是否删除用户["+data.userName+"]的["+data.roleName+"]角色?");
	if (!btn) return false; 
	util.getServerData("/user2/deleteUserTemplateInfo.do", {id:data.id},function(o) {
		if (o.rs_code == 0) {
			$("#table").frametable("deleteRow", {name:"id", value:data.id});
			alert("用户角色["+data.roleName+"]删除成功！");
		}else
			alert(o.message);
	});
}

//	对选中的记录进行编辑
function doEdit(data){
	util.navigate("/admin/tmpuser/doTmpUserInfoEdit.jsp?op=update&tmpUserInfoId="+data.id);
}

function getQuery(){
	var params = formutil.getFields($("#query-form"));
	$("#table").frametable("query", params); 
}

function goBack(){
	util.navigate("/admin/tmpuser/userFormwork.jsp");
}

</script>