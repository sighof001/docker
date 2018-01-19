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
</head>
<body>
	<div class="panel panel-default no-border">
		<div class="panel-heading">
			<h3>
				用户授权 <small>将角色授权给用户</small>
			</h3>
			<a class="form-back" href="javascript:history.go(-1)">返回</a>
		</div>
		<div class="panel-body">
			<div class="col-xs-10">
				<div class="col-xs-5">
					<div class="panel panel-default tree-panel">
						<div class="panel-heading">
							<h3 class="panel-title">系统角色</h3>
						</div>
						<div class="panel-body">
							<div id="left-tree" class="tree"></div>
						</div>
					</div>
				</div>

				<div class="col-xs-1 btn-panel">
					<button class="btn btn-primary" onclick="pullRight()">
						<i class="icon-chevron-right"></i>
					</button>
					<p>&nbsp;</p>
					<button class="btn btn-primary" onclick="pullLeft()">
						<i class="icon-chevron-left"></i>
					</button>
				</div>

				<div class="col-xs-5">
					<div class="panel panel-default tree-panel">
						<div class="panel-heading">
							<h3 class="panel-title">模板角色</h3>
						</div>
						<div class="panel-body">
							<div id="right-tree" class="tree"></div>
						</div>
					</div>
				</div>
				
			</div>
			<div class="col-xs-10">
				<div class="col-xs-1 pull-right">&nbsp;</div>
				<div class="col-xs-2 pull-right">
					<button id="save-btn" class="btn btn-danger btn-block" onclick="save()">保存</button>
				</div>
				<br>
				<div id="success-hint" class="alert alert-info hidden">
					<button type="button" class="close" data-dismiss="alert"
						aria-hidden="true">&times;</button>
					用户授权成功！
				</div>
				<div id="error-hint" class="alert alert-danger hidden">
					<button type="button" class="close" data-dismiss="alert"
						aria-hidden="true">&times;</button>
				</div>
			</div>

		</div>
	</div>
</body>
<script type="text/javascript" src="<%=path%>/js/app/tree-ds.js"></script>
<script>
	$(document).ready(function() {
		var height = Browser.ViewPort.height() - 210;
		$(".tree-panel").height(height);
		$(".btn-panel").height(height / 2);
		$(".btn-panel").css("margin-top", height/2 - 40);

		$(".tree").slimscroll({
	    	size: '3px',
	    	height: height - 55 
	  	});
		
		initRoles();
		initUserRoles();
	});

	function initRoles() {
		$('#left-tree').frametree({
			dataSource: new NotUserRoleDs({userId:'<%=id%>'}),
			multiSelect: true,
			loadingHTML:'<div class="tree-loading"><i class="icon-refresh icon-spin blue"></i></div>',
			'open-icon' : null,
			'close-icon' : null,
			'selectable' : true,
			'selected-icon' : null,
			'unselected-icon' : null,
			"icon-color": "blue2",
			"folder-icon-close": null,
			"item-icon": "icon-user-md",
			dblclickHandler: pullRight
		});
	}

	function initUserRoles() {
		$('#right-tree').frametree({
			dataSource: new UserRoleDs({userId:'<%=id%>'}),
			multiSelect: true,
			loadingHTML:'<div class="tree-loading"><i class="icon-refresh icon-spin blue"></i></div>',
			'open-icon' : null,
			'close-icon' : null,
			'selectable' : true,
			'selected-icon' : null,
			'unselected-icon' : null,
			"icon-color": "blue2",
			"folder-icon-close": null,
			"item-icon": "icon-user-md",
			dblclickHandler: pullLeft
		});
	}
	
	
	 
	
	function save() {
		var ns = $('#right-tree').frametree("getChildren", "");
		var ids = "";
		var len = ns.length;
		for (var i in ns) 
			ids = ids + ns[i].id + (i!=len-1?",":"");
		util.getServerData("/user/save_user_role.do", {userId:'<%=id%>', roleIds: ids}, function(o) { 
		//util.getServerData("/user2/saveOrUpdateRole.do", {userId:'<%=id%>', roleIds: ids}, function(o) {
			if (o.rs_code == 0) {
				$("#success-hint").removeClass("hidden");
			}else {
				$("#error-hint").append(o.message);
				$("#error-hint").removeClass("hidden");
			}
		});
	}
	
	function pullLeft(node) {
		var n = $('#right-tree').frametree("selectedItems");
		if (node && n.length ==0)
			n.push($(node).data());
		if (n.length > 0) {
			$('#left-tree').frametree("addNode", {pid:"", data:n});
			$('#right-tree').frametree("deleteNodes", n);
		}
	}
	
	function pullRight(node) {
		var n = $('#left-tree').frametree("selectedItems");
		if (node && n.length ==0)
			n.push($(node).data());
		if (n.length > 0) {
			$('#right-tree').frametree("addNode", {pid:"", data:n});
			$('#left-tree').frametree("deleteNodes", n);
		}
	}
</script>