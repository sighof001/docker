<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="../../header/header.jsp"%>

<%	
	request.setCharacterEncoding("utf-8");

	String tmpId = request.getParameter("tmpId"); 
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
				<span class="query-label">角色名：</span>
				<div class="col-xs-2">
					<input id="name" type="text" class="form-control" placeholder="查询帐号">
				</div>
				<span class="query-label">中文名：</span>
				<div class="col-xs-2">
					<input id="caption" type="text" class="form-control" placeholder="查询姓名">
				</div>
				<button id="query-btn" class="btn btn-primary" />
					<i class="icon-search"></i> 查询</button>
				<button id="add-btn" class="btn btn-danger " style="margin-left:15px;">
					<i class="icon-plus"></i> 增加</button>
				<div style="margin-left:15px;"><a href="<%=path%>/admin/tmpuser/tmpRole.jsp">模板:</a> >已授权用户列表</div>
			</div>
			<a class="form-back" href="<%=path%>/admin/tmpuser/tmpRole.jsp">返回</a>
		</div>
		<div id="table" class="panel-body">
		</div>
	</div>
</body>
<script>
$(document).ready(function(){
	initAuthority();
// 	var tmpid= tmpId;
	var tempId = "<%=tmpId%>";	
	$("#table").frametable({
		columns: [
		          {name:'id', text:'ID',hidden:true},
		          {name:'name', text:'角色名', sort: true, width: 200},
		          {name:'caption', text:'中文名', sort: true, width: 200},
		          {name:'desc', text:'描述'}
		         ],
		op: [
				{name: 'delete', text:'删除', type:'icon', clazz:'icon-trash', handler: doDelete, authority:'delete', hidden: testAuthority},
				{name: 'purview', text:'授权', type:'icon', clazz:'icon-user-md', handler: doPurview, authority:'update', hidden: testAuthority},
				{name: 'user', text:'所属用户', type:'icon', clazz:'icon-user', handler: doUser, authority:'update', hidden: testAuthority}
		    ],					
		datatype: "server",
		tableClass: "table-bordered table-hover table-striped",
		url: 'tempuser/get_roles_in.do?tmpId='+tempId,
		rowsurl: 'tempuser/roles_in_counts.do?tmpId='+tempId,
		pageName: 'page',
		pageSizeName: 'limit'
	});
	
	$("#query-btn").on("click", function() {
		var params = formutil.getFields($("#query-form"));
		$("#table").frametable("query", params); 
	});
	
	$("#add-btn").on("click", function() {
		util.navigate("/admin/tmpuser/edit.jsp?op=add&tmpId=<%=tmpId%>&templateName=<%=tmpname%>");
	});
	
});


function doDelete(data) {
 	var btn = confirm("是否删除用户["+data.name+"]?");
 	if (btn){
 		util.getServerData("/tempuser/delete.do", {tmpId:'<%=tmpId%>',userId:data.id}, function(o) {
 			if (o.rs_code == 0) {
 	  			$("#table").frametable("deleteRow", {name:"id", value:data.id});
 				alert("用户["+data.name+"]删除成功！");
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
