<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="../../header/header.jsp"%>
<%
	String name = URLDecoder.decode(request.getParameter("name"),"UTF-8");
	String id = request.getParameter("id");
	if (name == null) 
		name = "";
%>
</head>
<body>
	<div class="panel panel-default no-border">
		<div class="panel-heading">
			<h3>
				 <small>将角色和机构授权给用户</small>  <%=name%>
			</h3>
			<a class="form-back" href="<%=path%>/admin/tmpuser/userFormwork.jsp">返回</a>
		</div>
		<div class="panel-body">
			<div class="col-xs-12">
				<div class="col-xs-5">
					<div class="panel panel-default tree-panel">
						<div class="panel-heading">
							<h3 class="panel-title">系统角色</h3>
						</div>
						<div class="panel-body">
							<div id="left-role" class="tree"></div>
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

				<div class="col-xs-4">
					<div class="panel panel-default tree-panel">
						<div class="panel-heading">
							<h3 class="panel-title">用户模板角色</h3>
						</div>
						<div class="panel-body">
							<div id="right-role" class="tree"></div>
						</div>
					</div>
				</div>
				
				<div class="col-xs-5">
					<div class="panel panel-default tree-panel">
						<div class="panel-heading">
							<h3 class="panel-title">机构列表</h3>
						</div>
						<div class="panel-body">
							<div id="left-org" class="tree"></div>
						</div> 
					</div>
				</div>
				
				<div class="col-xs-1 btn-panel">
					<button class="btn btn-primary" onclick="pullRightOrg()">
						<i class="icon-chevron-right"></i>
					</button>
					<p>&nbsp;</p>
					<button class="btn btn-primary" onclick="pullLeftOrg()">
						<i class="icon-chevron-left"></i>
					</button>
				</div>
				
				<div class="col-xs-4">
					<div class="panel panel-default tree-panel">
						<div class="panel-heading">
							<h3 class="panel-title">用户模板机构</h3>
						</div>
						<div class="panel-body">
							<div id="right-org" class="tree"></div>
						</div>
					</div>
				</div>
								
			</div>
			
			<div class="col-xs-12">
				<div class="col-xs-1 pull-right">&nbsp;</div>
				<div class="col-xs-2 pull-right">
					<button id="save-btn" class="btn btn-danger btn-block" onclick="save()">保存</button>
				</div>
				<br>
				<div id="success-hint" class="alert alert-info hidden">
					<button type="button" class="close" onclick="buttonclose1();" aria-hidden="true">&times;</button>
					用户授权成功！
				</div>
				<div id="error-hint" class="alert alert-danger hidden">
					<button type="button" class="close" onclick="buttonclose2();" aria-hidden="true">&times;</button>
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
		resetMenuTree();
		UserInfoOrgLeft();
	});
	
// 	用户角色显示
	function initRoles() {
		$('#left-role').frametree({
			dataSource: new NotUserRoles(),
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

// 	用户已绑定角色显示
	function initUserRoles() {
		$('#right-role').frametree({
			dataSource: new UserInfoDs({userId:'<%=id%>'}),
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
	
	// 	机构下拉框
	var dataSource = new OrgDs({type:'1'});
	function resetMenuTree() {
// 		$('#left-org').frametree("destroy");
		$('#left-org').frametree({
			dataSource: dataSource ,
			multiSelect:false,
			loadingHTML:'<div class="tree-loading"><i class="icon-refresh icon-spin blue"></i></div>',
			'open-icon' : 'icon-minus',
			'close-icon' : 'icon-plus',
			'selectable' : true,
			'selected-icon' : null,
			'unselected-icon' : null,
			"item-icon": "icon-tasks",
			"icon-color": "blue2",
			"folder-icon-close": null,
			dblclickHandler: pullRightOrg
		});
	}	

// 	用户角色已绑定机构显示
	function UserInfoOrgLeft() {
		$('#right-org').frametree({
			dataSource: new UserInfoLeft({userId:'<%=id%>'}),
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
			dblclickHandler: pullLeftOrg
		});
	}
	
// 	双击leftRole对userInfo进行角色添加，如果已有则提示用户
	 function pullRight(node) {
		 var n = $('#left-role').frametree("selectedItems");
		if (node && n.length ==0)
			n.push($(node).data());
		if (n.length > 0) {
				$('#right-role').frametree("addNode", {pid:"", data:n});
				$('#left-role').frametree("deleteNodes", n);
			} 
		} 
 
// 	双击rightRole对userInfo进行角色删除，
	function pullLeft(node) {
		var n = $('#right-role').frametree("selectedItems");
		if (node && n.length ==0)
			n.push($(node).data());
		if (n.length > 0) {
				$('#left-role').frametree("addNode", {pid:"", data:n});
				$('#right-role').frametree("deleteNodes", n);
		}
	}
	
// 	双击pullRightOrg对userInfo进行机构添加，
	function pullRightOrg(node) {
		var n = $('#left-org').frametree("selectedItems");
		if (node && n.length ==0)
			n.push($(node).data());
		if (n.length > 0) {
				$('#right-org').frametree("addNode", {pid:"", data:n});
// 				$('#left-org').frametree("deleteNodes", n);
			}
	}
	
// 	双击pullLeftOrg对userInfo进行机构添加，
	function pullLeftOrg(node) {
		var n = $('#right-org').frametree("selectedItems");
		if (node && n.length ==0)
			n.push($(node).data());
		if (n.length > 0) {
				$('#left-org').frametree("addNode", {pid:"", data:n});
				$('#right-org').frametree("deleteNodes", n);
			}
	}
	
	
// 	授权保存
	function save() {
// 		获取所有角色ID
		var rolens = $('#right-role').frametree("getChildren", "");
		var roleId = "";
		var rolelen = rolens.length;
// 		获取所有机构ID
		var orgns = $("#right-org").frametree("getChildren","");
		var orgId = "";
		var orglen = orgns.length;
		
		for (var i in rolens) 
			roleId = roleId + rolens[i].id + (i!=rolelen-1?",":"");
		for (var i in orgns)
			orgId = orgId + orgns[i].id + (i!=orglen-1?",":"");

		    util.getServerData("/user2/updateUserInfo.do", {userId:'<%=id%>', roleId: roleId, orgId: orgId}, function(o){
			if (o.rs_code == 0) {
				$("#success-hint").removeClass("hidden");
				$("#error-hint").addClass("hidden");
			}else {
				$("#error-hint").append(o.message);
				$("#error-hint").removeClass("hidden");
			}
		});
		    $("#success-hint").addClass("hidden");
	}
	function buttonclose1(){
		$("#success-hint").addClass("hidden");
	}
	function buttonclose2(){
		$("#error-hint").empty();
		$("#error-hint").append("<button type='button' class='close' aria-hidden='true' onclick='buttonclose2();'>&times;</button>");
		$("#error-hint").addClass("hidden");
	}
</script>

<script>
	/**
	 * 显示所有角色数据源
	 */
	var NotUserRoles = function(options) {
		this.url = "/role2/get_roleAll_name.do";
// 		this.userId = options.userId;
	}
	
	NotUserRoles.prototype = {
		data: function(node, callback) {
			this.getDataFrmSvr(callback);
		}
		,getDataFrmSvr: function(callback) {
			util.getServerData(this.url, {}, function(data) {
				var len = data.length;
				for (var i=0;i<len;i++) {
					var d = data[i];
					d.type = "item";
				}
				callback({data: data});
			});
		} 
	}

// 	显示leftrole用户所属角色
	var UserInfoDs = function(options) {
		this.url = "/role2/get_userinfo_roles.do";
		this.userId = options.userId;
	}
	
	UserInfoDs.prototype = {
		data: function(node, callback) {
			this.getDataFrmSvr(callback);
		}
		,getDataFrmSvr: function(callback) {
			util.getServerData(this.url, {userId: this.userId}, function(data) {
// 				var len = data.length;
// 				for (var i=0;i<len;i++) {
// 					var d = data[i];
// 					d.type = "item";
// 				}
// 				将用户已存在的角色不进行显示
				callback({data: data});
			});
		} 
	}
	
// 	显示leftorg用户所属机构
	var UserInfoLeft = function(options) {
		this.url = "/orgmgr/get_info_leftorg.do";
		this.userId = options.userId;
	}
	
	UserInfoLeft.prototype = {
		data: function(node,callback) {
			this.getDataFrmSvr(callback);
		}
		,getDataFrmSvr: function(callback) {
			util.getServerData(this.url, {userId: this.userId}, function(data) {
// 				var len = data.length;
// 				for (var i=0;i<len;i++) {
// 					var d = data[i];
// 					d.type = "item";
// 				}
// 				将用户已存在的角色不进行显示
				callback({data: data});
			});
		} 
	}
</script>