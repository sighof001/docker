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
	<div class="panel panel-default no-border tree-panel">
		<div class="panel-heading">
<%-- 			<h3>角色授权    <small>将菜单和操作授权给角色[<%=name%>]</small></h3> --%>
			<h3>角色授权    <small>将菜单和操作授权给角色</small></h3>
			<a class="form-back" href="<%=path%>/admin/role/list.jsp">返回</a>
		</div>
		<div class="panel-body">
			<div class="col-xs-8">
				<div id="success-hint" class="alert alert-info hidden">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
					角色授权成功！
				</div>
				<div id="error-hint" class="alert alert-danger hidden">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				</div>
			</div>
			<div class="col-xs-2 pull-right">
				<button id="save-btn" class="btn btn-danger btn-block" onclick="save()">保存</button>
			</div>
			
			<div class="col-xs-10">
				<div class="tree"></div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="<%=path%>/js/plugin/jquery.json-2.4.js" ></script>
<script type="text/javascript" src="<%=path%>/js/app/tree-ds.js"></script>
<script>
$(document).ready(function() {
	var height = Browser.ViewPort.height() - 150;
	$(".tree-panel").height(height);
	$(".tree").slimscroll({
    	size: '3px',
    	height: height - 55 
  	});
	
	initPage();
});

function initPage() {
	$('.tree').frametree({
		dataSource: new MenuOpDs({roleId: '<%=id%>',tree: $('.tree')}),
		multiSelect: false,
		loadingHTML:'<div class="tree-loading"><i class="icon-refresh icon-spin blue"></i></div>',
		'open-icon' : 'icon-minus',
		'close-icon' : 'icon-plus',
		'selectable' : true,
		'selected-icon' : null,
		'unselected-icon' : null,
		"item-icon": "icon-tasks",
		"icon-color": "blue2", 
		clickHandler: itemClick
	});
}

function itemClick(node, type, event) {
	var d = $(node).data();
	var children = $('.tree').frametree("getChildren", d.id);
	var len = children?children.length:-1;
	var e = $(event.target); 
	//展开下级节点
	if (type == "folder" && e.prop("tagName").toLowerCase() != "i") {
		console.info(type, e.prop("tagName").toLowerCase(), len);
		if (len == 0){
			$('.tree').frametree("populate", $(node));
		}
		console.info(e.siblings('.icon-folder-close').length, e.siblings('.icon-folder-open').length)
		//判断处于关闭还是打开
		if(e.siblings('.icon-folder-close').length>0){
			e.siblings('.icon-folder-close').removeClass("icon-folder-close").addClass("icon-folder-open");
			e.parent().siblings('.icon-plus').removeClass("icon-plus").addClass("icon-minus");
			$(node).parent().find(".tree-folder-content:eq(0)").show();
		}else if(e.siblings('.icon-folder-open').length>0){
			e.siblings('.icon-folder-open').removeClass("icon-folder-open").addClass("icon-folder-close");
			e.parent().siblings('.icon-minus').removeClass("icon-minus").addClass("icon-plus");
			$(node).parent().find(".tree-folder-content:eq(0)").hide();
		}
	}
	if (e.attr("type")=="checkbox") {
		//自动选择下级节点相同操作
		var op = e.attr("name");
		var ch = e.prop("checked");
		$(node).parent().find(".tree-folder-content:eq(0)").find("input[name='"+op+"']").prop("checked", ch);

		//默认选中只读
		if (e.attr("name") != "1" && e.prop("checked") == true) {
			e.parent().children("input[name='1']").prop("checked", true);
			$(node).parent().find(".tree-folder-content:eq(0)").find("input[name='1']").prop("checked", true);
		}
	}
	
}

function save() {
	var tmp = [];
	$(".tree").find("input[type=checkbox]").each(function() {
		var o = $(this).closest(".tree-folder-header");
		if (o.length == 0)
			o = $(this).closest(".tree-item");
		if (o.length == 0) return;
		var mId = o.attr("id");
		var c = this.checked;
		var n = {menuId: mId, opId: ""};
		if (c == true || c == "checked") {
			n.opId = $(this).attr("name");
		}
		tmp.push(n);
	});

	var data = [];
	$.each(tmp, function(i, o) {
		var t = util.getObjectFromArray("menuId", o.menuId, data);
		if (t == null) {
			t = {menuId: o.menuId, opIds: []};
			data.push(t);
		}
		if (o.opId != "")
			t.opIds.push(o.opId);
	});
	
	util.getServerData("/privilege/save_menu_op.do", {roleId: '<%=id%>', json: $.toJSON(data)}, function(data) {
		$("#success-hint").removeClass("hidden");
	}, function(data) {
		$("#error-hint").append(data.message).removeClass("hidden");
	});
}
</script>