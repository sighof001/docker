<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="../../header/header.jsp"%>
<style>
.adjust {
	padding: 0px 2px 3px;
	margin-top: 5px;
}
.panel-body-ad {
	padding: 0px;
}
.btn-pos {
	position: relative;
	margin-top: -35px;
	margin-left: 170px;
}
</style>
</head>
<body class="overflow-hidden">
	<div>
		<div class="col-xs-4 adjust">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3>用户组&用户</h3>
				<div class="btn-pos">
					<button id="delete-btn" class="btn btn-danger disabled" disabled>移除用户</button>
				</div>
			</div>
			<div class="panel-body">
				<div id="l-tree" class="tree"></div>
			</div>
		</div>
		</div>
		<div class="col-xs-8 adjust">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3>可选用户</h3>
				<div class="btn-pos">
					<button id="add-btn" class="btn btn-primary disabled" disabled>关联用户组</button>
				</div>
				<a class="form-back" href="<%=path%>/admin/group/list.jsp">返回</a>
			</div>
			<div id="r-panel" class="panel-body panel-body-ad">
			</div>
		</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="<%=path%>/js/plugin/jquery-validate.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/app/tree-ds.js"></script>
<script>
$(document).ready(function(){
	var height = Browser.ViewPort.height() - 125;
	$(".panel-body").height(height);
	$(".panel-body-ad").height(height + 30);

	$("#l-tree").slimscroll({
    	size: '3px',
    	height: height - 4 
  	});
	resetGroupTree();
	initRightList(height - 40);
	initAuthority();
	
	$("#delete-btn").on("click", function() {
		var ns = $('#l-tree').frametree("selectedItems");
		var n = null;
		if (ns.length>0)
			n = ns[0];
		
		if (n == null || n.type == "folder") {
			alert("请选择需要移除的用户！");
			return;
		}
		
		util.getServerData("/user/remove_group_users.do", {groupId: "", userIds: buildIds(ns)}, function(data) {
			$('#l-tree').frametree("deleteNode", n.id);
		});
	});
	
	$("#add-btn").on("click", function() {
		var ns = $('#l-tree').frametree("selectedItems");
		var n = null;
		if (ns.length>0)
			n = ns[0];
		
		if (n == null || n.type == "item") {
			alert("请选择需要关联的用户组！");
			return;
		}
		
		var us = $('#r-panel .tree').frametree("selectedItems");
		if (us.length == 0) {
			alert("请选择需要关联的用户！");
			return;
		}
		
		util.getServerData("/user/add_group_users.do", {groupId: n.id, userIds: buildIds(us)}, function(data) {
			$.each(us, function(i, o) {
				o.icon = "icon-user orange";
				var ii = o.name.indexOf("[");
				if (ii > 0)
					o.name = o.name.substring(0, ii);
			});
			$('#l-tree').frametree("moveNode", {pid: n.id, data: us});
		});
	});
});

var dataSource = new GroupUserDs2();
function resetGroupTree() {
	$('#l-tree').frametree("destroy");
	$('#l-tree').frametree({
		dataSource: dataSource ,
		multiSelect: false,
		loadingHTML:'<div class="tree-loading"><i class="icon-refresh icon-spin blue"></i></div>',
		'open-icon' : 'icon-minus',
		'close-icon' : 'icon-plus',
		'selectable' : true,
		'selected-icon' : null,
		'unselected-icon' : null,
		"icon-color": "blue2",
		"folder-icon-close": null,
		dblclickHandler: itemSelect
	});
}

function itemSelect(node, type) {
	var d = $(node).data();
	formutil.setFields($("#edit-form"), d);
	
	var p = $('.tree').frametree("getParentNode", d.id);
	if (p!=null && p.length>0) {
		$("#pid").children("option").val(p.data("id"));
		$("#pid").children("option").text(p.data("name"));
	}
	op = "update";
}

function initRightList(height) {
	$("#r-panel").frameslist({
		tree_height: height,
		url: "user/queryuser3.do",
		count_url: "user/queryuser2rows.do",
		query_str_name: "text",
		query_order_name: "orderby",
		query_page_name: "page",
		query_limit_name: "limit",
		orderby: "f_path",
		ext_field: "desc",
		limit: 13,
		multiSelect: true,
		'open-icon' : null,
		'close-icon' : null,
		'selectable' : true,
		'selected-icon' : null,
		'unselected-icon' : null,
		"icon-color": "blue2",
		"folder-icon-close": null,
		"item-icon": "icon-user",
		show_pages: 8
	});
}

function buildIds(ns) {
	var ids = "";
	var len = ns.length;
	for (var i in ns) 
		ids = ids + ns[i].id + (i!=len-1?",":"");
	return ids;
}
</script>