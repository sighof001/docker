<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="../../header/header.jsp"%>
<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	if (name == null) name = "";
	else name = new String(name.getBytes("iso8859-1"),"utf-8");
	String groupId = request.getParameter("groupid");
	if (groupId == null) groupId = "";
%>
<style>
#group{
	height: 300px;
}
</style>
</head>
<body>
	<div class="panel panel-default no-border">
		<div class="panel-heading">
<%-- 			<h3>用户分组    <small>给角色设置分组[<%=name%>]。 双击左边的树为添加，双击右边的列表框为删除</small></h3> --%>
				<h3>用户分组    <small>给角色设置分组 双击左边的树为添加，双击右边的列表框为删除</small></h3>
			<a class="form-back" href="<%=path%>/admin/role/list.jsp">返回</a>
		</div>
		<div class="panel-body">
			<div class="row">
				<div class="col-xs-8">
					<div class="tree"></div>
				</div>
				<div class="col-xs-4">
					<select id="group" multiple class="form-control" >
					</select>
					<br>
					<div class="col-xs-8 no-padding-left">
						<button class="btn btn-success btn-block" onclick="doSave()">保存</button>
					</div>
				</div>
			</div>
			<div>
				<div id="success-hint" class="alert alert-info hidden">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
					角色设置分组成功！
				</div>
				<div id="error-hint" class="alert alert-danger hidden">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="<%=path%>/js/app/tree-ds.js"></script>
<script>
$(document).ready(function() {
	$(".panel-body").height(Browser.ViewPort.height() - 150);

	$(".tree").slimscroll({
    	size: '3px',
    	height: $(".panel-body").height() - 4 
  	});
	
	resetMenuTree();
	initUpdate();
	
	$("#group").on("dblclick", function() {
		$(this).children().each(function() {
			if ($(this).prop("selected") == true) 
				$(this).remove();
		})
	})
});

var dataSource = new GroupDs({"ex_icon":"icon-remove red border-1"});
function resetMenuTree() {
	$('.tree').frametree("destroy");
	$('.tree').frametree({
		dataSource: dataSource ,
		multiSelect:false,
		loadingHTML:'<div class="tree-loading"><i class="icon-refresh icon-spin blue"></i></div>',
		'open-icon' : 'icon-minus',
		'close-icon' : 'icon-plus',
		'selectable' : true,
		'selected-icon' : "icon-ok",
		'unselected-icon' : "icon-remove",
		"icon-color": "blue2",
		"folder-icon-close": null,
		dblclickHandler: itemClick
	});
}

function itemClick(e, type, event) {
	var n = $(e).data();
	addSelectGroup(n);
}

function addSelectGroup(n) {
	var h = '<option value="'+n.id+'">'+n.path+'</option>';
	if (n.id == "root") return;
	if ($("#group option[value='"+n.id+"']").length == 0)
		$("#group").append(h);	
}

function doSave() {
	var len = $("#group option").length;
	if (len == 0) {
		alert("请先设置用户组！");
		return;
	}
	
	util.getServerData("role/save_role_groups.do", {roleId: '<%=id%>', groupIds: getIds()}, function(data) {
		$("#success-hint").removeClass("hidden");
	}, function(data) {
		$("#error-hint").append(data.message);
		$("#error-hint").removeClass("hidden");
	});
}

function getIds() {
	var ids = "";
	$("#group option").each(function() {
		ids = ids + "," + $(this).val();
	});
	len = ids.length;
	return ids.substr(1);
}

function initUpdate() {
	//修改
	util.getServerData("group/get_rolegroup.do", {roleId: '<%=id%>'}, 
		function(data) {
			$.each(data, function(i, o) {
				addSelectGroup(o);				
			})
		}
	);
}
</script>