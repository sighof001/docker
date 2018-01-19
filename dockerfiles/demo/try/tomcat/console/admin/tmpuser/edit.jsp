<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="../../header/header.jsp"%>
<%	
	String templateId = request.getParameter("templateId");
	request.setCharacterEncoding("utf-8");
	String tmpname  = new String(request.getParameter("templateName").getBytes("iso-8859-1"), "utf-8");
%>
</head>
<body onunload="destroy()">
	<div class="panel panel-default no-border">
		<div class="panel-heading">
			
			<div id="query-form" class="row">
				<span class="query-label">域用户：</span>
				<div class="col-xs-2">
					<input id="name" type="text" class="form-control" placeholder="域用户">
				</div>
				<span class="query-label">姓名：</span>
				<div class="col-xs-2">
					<input id="caption" type="text" class="form-control" placeholder="姓名">
				</div>
				<button id="query-btn" class="btn btn-primary disabled" />
					<i class="icon-search"></i> 查询</button>
				<div style="margin-left:15px;"><a href="<%=path%>/admin/tmpuser/tmpuser.jsp">模板:</a> >未授权用户列表</div>
			</div>
				<a class="form-back" id="back_to_in" href="<%=path%>/admin/tmpuser/purview.jsp?templateId=<%=templateId %>&templateName=encodeURI(<%=tmpname%>)">返回</a>
		</div>
		<div id="table" class="panel-body"></div>
		<div id="table2" class="panel-body"></div>
	</div>
</body>
<script>
$(document).ready(function(){
	initAuthority();
	var templateId = '<%=templateId%>';
	$("#table").frametable({
		columns: [
					{name:'f_user_id', text:'用户ID',hidden:true},
					{name:'f_name', text:'域用户', sort: true, width: 200},
					{name:'f_caption', text:'姓名', sort: true, width: 200},
					{name:'f_mobile', text:'电话号码', sort: true, align: 'right', width: 200},
					{name:'f_desc', text:'所属部门', sort: true, align: 'right', width: 200},
// 					{name:'org_name', text:'所属机构', sort: true, align: 'right', width: 200},
					{name:'f_group_id', text:'用户组编码', hidden: true}
				],
		op: [
			{name:'edit', authority:'update', text:'授权用户', type:'icon', clazz:'icon-edit', handler: doEdit, hidden: testAuthority}
			],
		datatype: "server",
		tableClass: "table-bordered table-hover table-striped",
		url: 'tempuser/get_nouserorgs_in.do?tmpId='+templateId,		
		rowsurl: 'tempuser/users_no_in_counts.do?tmpId='+templateId,
		pageName: 'page',
		pageSizeName: 'limit'
	});
	
	$("#query-btn").on("click", function() {
		var params = formutil.getFields($("#query-form"));
		$("#table").frametable("query", params); 
	});
	
// 	$("#back_to_in").on("click",function(){
// 		util.navigate("/admin/tmpuser/purview.jsp");
// 	});
	
	$("#add-btn").on("click", function() {
		util.navigate("/admin/tmpuser/edit.jsp?op=add");
	});

});
// 	授权跳转页面 
	function doEdit(data) {
// 		var doname = $("#table table tbody").children().eq(0).text();
		util.navigate("/admin/tmpuser/addEdit.jsp?op=update&userId="+data.f_user_id+"&userName="+data.f_name+"&templateId=<%=templateId%>&templateName=<%=tmpname%>");
	}



function destroy(){
	$("#table").frametable("destroy");
};

</script>