
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="../../header/header.jsp"%>

<%	
	request.setCharacterEncoding("utf-8");

	String templateId = request.getParameter("templateId"); 
// 	response.get
	String tmpname  = new String(request.getParameter("templateName").getBytes("iso-8859-1"), "utf-8");

%>

<title value="<%=tmpname%>"></title>

<meta http-equiv="Conten-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	.red{color:red;}
</style>
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
				<button id="query-btn" class="btn btn-primary" />
					<i class="icon-search"></i> 查询</button>
				<button id="add-btn" class="btn btn-danger " style="margin-left:15px;">
					<i class="icon-plus"></i> 增加</button>
				<div style="margin-left:15px;"><a href="<%=path%>/admin/tmpuser/tmpuser.jsp">模板:</a> >已授权用户列表</div>
			</div>
			<a class="form-back" href="<%=path%>/admin/tmpuser/tmpuser.jsp">返回</a>
		</div>
		<div id="table" class="panel-body">
		</div>
	</div>
</body>
<script>
$(document).ready(function(){
	initAuthority();
// 	var tmpid= tmpId;
	var tempId = "<%=templateId%>";
	var templateName = "<%=tmpname%>";
	$("#table").frametable({
		columns: [
		          {name:'f_user_id', text:'用户ID',hidden:true},
		          {name:'f_name', text:'域用户', sort: true, width: 200},
		          {name:'f_caption', text:'姓名', sort: true, width: 200},
		          {name:'f_mobile', text:'电话号码', sort: true, align: 'right', width: 200},
		          {name:'f_desc', text:'所属部门', sort: true, align: 'right', width: 200},
		          {name:'org_name', text:'授权机构', sort: true, align: 'right', width: 200},
		          {name:'f_group_id', text:'用户组编码', hidden: true}
		         ],
		op: [
				{name:'delete', authority:'delete', text:'删除', type:'icon', clazz:'icon-trash', handler: doDelete, hidden: testAuthority}
		    ],
		checkbox:true,
		datatype: "server",
		tableClass: "table-bordered table-hover table-striped",
// 		url: 'tempuser/get_users_in.do?tmpId='+tempId,
		url: 'tempuser/get_userorgs_in.do?tmpId='+tempId,
		rowsurl: 'tempuser/users_in_counts.do?tmpId='+tempId,
		pageName: 'page',
		pageSizeName: 'limit'
	});
	
	$("#query-btn").on("click", function() {
		var params = formutil.getFields($("#query-form"));
		$("#table").frametable("query", params); 
	});
	
	$("#add-btn").on("click", function() {
		util.navigate("/admin/tmpuser/edit.jsp?op=add&templateId="+tempId+"&templateName="+encodeURI(templateName));
	});
	
});


function doDelete(data) {
 	var btn = confirm("是否删除用户["+data.f_name+"]?");
 	if (btn){
 		util.getServerData("/tempuser/delete.do", {tmpId:'<%=templateId%>',userId:data.f_user_id}, function(o) {
 			if (o.rs_code == 0) {
 	  			$("#table").frametable("deleteRow", {name:"id", value:data.f_user_id});
 				alert("用户["+data.f_name+"]删除成功！");
 				document.location.reload();
 			}else
 				alert(o.message);
 		});
 		
 	}else{
 		return false; 
 	}
 
	
}





function destroy(){
	$("#table").frametable("destroy");
};

</script>