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
.panel-body-ad {
	padding: 0px;
}

</style>
</head>
<body>
	<div class="panel panel-default no-border">
		<div class="panel-heading">
			<h3>
<%-- 				设置用户组所属用户 <small>设置用户组 [<%=name%>] 关联的用户</small> --%>
					设置用户 <small id="small"></small>
			</h3>
				<input id="query-btn" type="button" onclick="saveCheck()" class="form-control btn-primary " value="保存">
			</div>		
		</div>
		<div class="panel-body">
			<div class="col-xs-10">
				<div class="col-xs-5">
					<div class="panel panel-default tree-panel">
						<div class="panel-heading">
							<h3 class="panel-title">系统用户</h3>
						</div>
						<div id="l-panel" class="panel-body panel-body-ad">
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
							<h3 class="panel-title">已选择用户</h3>
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

		initRightList();
		$(".tree").slimscroll({
	    	size: '3px',
	    	height: height - 60 
	  	});

		initLeftList(height - 110);
		
		$("#small").text("设置"+argu+"级审核用户");
	});

	var argu = window.dialogArguments;
	
	
	function initLeftList(height) {
		$("#l-panel").frameslist({
			tree_height: height,
			url: "user/queryuser3.do",
			count_url: "user/queryuser2rows.do",
			query_str_name: "text",
			query_order_name: "orderby",
			query_page_name: "page",
			query_limit_name: "limit",
			orderby: "f_path",
			ext_field: "desc",
			multiSelect: false,
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
			dataSource: new GroupUserDs({groupId:'<%=id%>'}),
			multiSelect: false,
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
	
	function pullLeft() {
		$("#right-tree").children().last().remove();
	}
	
	var arr = new Array();
	var userId = "";
	var userName = "";
	function pullRight(node) {
		var tree = $("#l-panel").find(".tree");
		var n = tree.frametree("selectedItems");
		if (node && n.length==0)
			n.push($(node).data());
		if($("#right-tree").children().last().attr("obj")==1){
			$("#right-tree").children().last().remove();
		}
		$('#right-tree').frametree("addNode", {pid:"", data:n});
		
		// 获取用户名和id
		userId = "";
		userName = "";
		userId = $("#right-tree").children().last().attr("id");
		var htmlStr = $("#right-tree").children().last().html();
		userName = getUserName(htmlStr);
		arr[0] = userId;
		arr[1] = userName;
		
	}
	
	function getUserName(str){
		
		var i = str.indexOf("</I>");
		if(i!="-1"){
			str = str.split("</I>");
		}else{
			str = str.split("</i>");
		}

		str = str[1];
		str = str.split("[");
		str = str[0];
		//str = str.replace(/^\s+|\s+$/g, " "); // 清除左右空格
		return str;
	}
	
	function saveCheck(){
		window.returnValue = arr;
		window.opener = null;
		window.close();
	}
		
	
</script>