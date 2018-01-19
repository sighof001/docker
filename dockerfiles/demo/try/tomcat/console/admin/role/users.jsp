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
%>
<style>
.panel-body_ad {
	padding: 0px;
}

</style>
</head>
<body>
	<div class="panel panel-default no-border">
		<div class="panel-heading">
			<h3>
<%-- 				设置角色所属用户 <small>设置角色 [<%=name%>] 关联的用户</small> --%>
				设置角色所属用户 <small>设置角色关联的用户</small>
			</h3>
			<a class="form-back" href="<%=request.getContextPath() %>/admin/role/list.jsp">返回</a>
		</div>
		<div class="panel-body">
			<div class="col-xs-10">
				<div class="col-xs-5">
					<div class="panel panel-default tree-panel">
						<div class="panel-heading">
							<h3 class="panel-title">系统用户</h3>
						</div>
						<div id="l-panel" class="panel-body panel-body_ad">
						</div>
					</div>
				</div>

				<div class="col-xs-1 btn-panel">
					<button class="btn btn-primary" onclick="pullRight()">
						<b class="icon-chevron-right_bak">&gt;</b>
					</button>
					<p>&nbsp;</p>
					<button class="btn btn-primary" onclick="pullLeft()">
						<b class="icon-chevron-left_bak">&lt;</b>
					</button>
				</div>

				<div class="col-xs-5">
					<div class="panel panel-default tree-panel">
						<div class="panel-heading">
							<h3 class="panel-title">角色用户</h3>
						</div>
						<div id="r-panel" class="panel-body panel-body_ad">
							<div id="right-tree" class="tree"></div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="panel log-panel"></div>
			
		</div>
	</div>
</body>
<script type="text/javascript" src="<%=path%>/js/app/tree-ds.js"></script>
<script>
	$(document).ready(function() {
		var height = Browser.ViewPort.height() - 160;
		$(".tree-panel").height(height);
		$(".btn-panel").height(height / 2);
		$(".btn-panel").css("margin-top", height/2 - 40);
		
		var w = $(".col-xs-10").width();

		$(".log-panel").framelog({
			panel_class: "panel-info",
			title: "操作记录",
			width: $("body").width() - w - 20,
			height: height
		});

		initRightList();
		$(".tree").slimscroll({
	    	size: '3px',
	    	height: height - 60 
	  	});

		initLeftList(height - 110);
	});

	function initLeftList(height) {
		$("#l-panel").frameslist({
			tree_height: height,
			url: "user/queryuser2.do",
			count_url: "user/queryuser2rows.do",
			query_str_name: "text",
			query_order_name: "orderby",
			query_page_name: "page",
			query_limit_name: "limit",
			orderby: "caption",
			ext_field: "name",
			multiSelect: true,
			'open-icon' : null,
			'close-icon' : null,
			'selectable' : true,
			'selected-icon' : null,
			'unselected-icon' : null,
			"icon-color": "blue2",
			"folder-icon-close": null,
			"item-icon": "icon-user",
			show_pages: 5,
			dblclickHandler: pullRight
		});
	}
	
	function initRightList() {
		$('#right-tree').frametree({
			dataSource: new RoleUserDs({roleId:'<%=id%>'}),
			multiSelect: true,
			'open-icon' : null,
			'close-icon' : null,
			'selectable' : true,
			'selected-icon' : null,
			'unselected-icon' : null,
			"icon-color": "blue2",
			"folder-icon-close": null,
			"item-icon": "icon-user",
			dblclickHandler: pullLeft
		});
	}
	
	function pullLeft(node) {
		var n = $('#right-tree').frametree("selectedItems");
		if (node && n.length ==0)
			n.push($(node).data());
		if (n.length > 0) {
			util.getServerData("role2/remove_role_users.do", {roleId: '<%=id%>', userIds: buildIds(n)}, function(data) {
				if (data.rs_code == "0") {
					$('#right-tree').frametree("deleteNodes", n);
					$.each(n, function(i, o) {
						$(".log-panel").framelog("log", {text:"移除关联用户：<strong>"+o.name+"</strong>", color:"purple"});	
					});
				}else {
					$(".log-panel").framelog("log", {text:data.message, color:"red"});	
				}
			}, function(data) {
				if (data.message)
					$(".log-panel").framelog("log", {text:data.message, color:"red"});
				else
					$(".log-panel").framelog("log", {text:data, color:"red"});
			});
		}
	}
	
	function pullRight(node) {
		var tree = $("#l-panel").find(".tree");
		var n = tree.frametree("selectedItems");
		if (node && n.length ==0)
			n.push($(node).data());
		
		//过滤掉已经关联该角色的用户
		skipInRight(n);
				
		if (n.length > 0) {
			util.getServerData("role2/add_role_users.do", {roleId: '<%=id%>', userIds: buildIds(n)}, function(data) {
				if (data.rs_code == "0") {
					$('#right-tree').frametree("addNode", {pid:"", data:n});
					$.each(n, function(i, o) {
						$(".log-panel").framelog("log", {text:"添加关联用户：<strong>"+o.name+"</strong>", color:"green"});	
					});
				}else {
					$(".log-panel").framelog("log", {text:data.message, color:"red"});	
				}
			}, function(data) {
				if (data.message)
					$(".log-panel").framelog("log", {text:data.message, color:"red"});
				else
					$(".log-panel").framelog("log", {text:data, color:"red"});
			});
		}
	}
	
	function buildIds(ns) {
		var ids = "";
		var len = ns.length;
		for (var i in ns) 
			ids = ids + ns[i].id + (i!=len-1?",":"");
		return ids;
	}
	
	/**
	 * 过滤掉已经关联该角色的用户
	 */
	function skipInRight(ns) {
		var len = ns.length;
		for (i=len-1;i>=0;i--) {
			var n = ns[i];
			var e = $('#right-tree').frametree("getElementById", n.id);
			if (e != null)
				ns.splice(i, 1);
		}
		
	}
</script>