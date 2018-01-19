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
.save-btn-pos {
	position: relative;
	margin-top: -70px;
}
</style>
</head>
<body class="overflow-hidden" onunload="destroy()">
	<div>
		<div class="col-xs-4 adjust">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3>菜单列表</h3>
			</div>
			<div class="panel-body">
				<div class="tree"></div>
			</div>
		</div>
		</div>
		<div class="col-xs-8 adjust">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3>菜单设置 <small>双击菜单为修改菜单，点击新增按钮为新增菜单。设置完成后点击保存按钮！</small></h3>
			</div>
			<div class="panel-body overflow-auto">
				<div>
					<button id="add-btn" onclick="newMenu()" class="btn btn-primary disabled" disabled>新增</button>
					<button id="delete-btn" onclick="deleteMenu()" class="btn btn-danger disabled" disabled>删除</button>
				</div>
				<hr>
				<form id="edit-form" class="col-sm-11" onSubmit="return false">
					<button id="save-btn" class="btn btn-success pull-right save-btn-pos  disabled" disabled>保存</button>
					<input type="hidden" id="id">
					<div class="form-group form-inline">
						<label class="col-sm-3">菜单名称<span class="red">*</span>:</label> 
						<input
							type="text" class="form-control" id="name"
							placeholder="输入菜单名称" data-required="true" 
							data-pattern="^[a-zA-Z\u4e00-\u9fa5][a-zA-Z0-9_\u4E00-\u9FA5_\-]{0,30}$" 
							data-describedby="name-desc" data-description="name">
						<div class="form-validate-desc" id="name-desc"></div>
					</div>
					<div class="form-group form-inline">
						<label class="col-sm-3">菜单类型<span class="red">*</span>:</label> 
						<select class="form-control" id="isFolder">
							<option value="1" selected>文件夹</option>
							<option value="0">菜单</option>
						</select>	
					</div>
					<div>
						<label class="col-sm-3"></label> 
						<div class="green">内部连接首字母不要为/，外部连接以http://开头</div>
					</div>
					<div class="form-group form-inline">
						<label class="col-sm-3">菜单路径:</label> 
						<textarea
							class="form-control" id="url" cols=50 rows=2 ></textarea>
					</div>
					
					<div class="form-group form-inline">
						<label class="col-sm-3">是否隐藏<span class="red">*</span>:</label> 
						<select class="form-control" id="hidden">
							<option value="0" selected>显示</option>
							<option value="1">隐藏</option>
						</select>
					</div>
					<div class="form-group form-inline">
						<label class="col-sm-3">上级菜单<span class="red">*</span>:</label> 
						<select class="form-control" id="pId">
							<option value="0">根节点</option>
						</select>
					</div>
					<div class="form-group form-inline">
						<label class="col-sm-3">描述:</label> 
						<textarea
							class="form-control" id="desc" cols=50 rows=2></textarea>
					</div>
					<div class="form-group form-inline">
						<label class="col-sm-3">同级序号<span class="red">*</span>:</label> 
						<input type="number" class="form-control" id="order" value=1
							data-required="true" 
							data-pattern="^\d.*$"
							data-describedby="order-desc" data-description="order">
						<div class="form-validate-desc" id="order-desc"></div>
					</div>
				<!-- tangxioping modify <div class="form-group form-inline">
						<label class="col-sm-3">特殊操作:</label> 
						<div id="operate"></div>
					</div>
					-->
				</form>
			</div>
		</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="<%=path%>/js/plugin/jquery-validate.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/app/tree-ds.js"></script>
<script>
var op = "add";
$(document).ready(function(){
	$(".panel-body").height(Browser.ViewPort.height() - 125);

	$(".tree").slimscroll({
    	size: '3px',
    	height: $(".panel-body").height() - 4 
  	});
	resetMenuTree();
	
	initValidate();
	initAuthority();
	initSaveAuthority();
	initOperate();
});

function initSaveAuthority() {
	var o = util.getObjectFromArray("name", authority.au_add, au_cache);
	if (o == null) {
		o = util.getObjectFromArray("name", authority.au_update, au_cache);
	}
	if (o != null) {
		$("#save-btn").removeClass("disabled");
		$("#save-btn").prop("disabled", false);
	}
}

/**
 * 初始化操作列表 -- 该菜单有哪些特殊操作权限
 */
function initOperate() {
	util.getServerData("/operate/get_by_type.do", {type: "1"}, function(data) {
		var html = [];
		$.each(data, function(i, o) {
			html.push(o.caption);
			html.push("<input type='checkbox' name='"+o.id+"'>&nbsp;&nbsp;");
		});
		$("#operate").html(html.join(""));		
	});
}

/**
 * 获取选择的操作
 */
function getSelectOperate() {
	var ops = [];
	$("#operate>input[type=checkbox]").each(function() {
		if ($(this).prop("checked"))
			ops.push($(this).attr("name"));
	});
	return ops.join(",");
}

function resetSelectOperate() {
	$("#operate>input[type=checkbox]").each(function() {
		$(this).prop("checked" ,false);
	}) 
}
/**
 * 更新状态时 -- 初始化已经选择的操作
 */
function initSelectOperate(id) {
	resetSelectOperate();
	util.getServerData("/operate/get_by_menu.do", {menuId:id}, function(data) {
		if (data && data.length > 0) {
			$.each(data, function(i, o) {
				if (o.type != "0")
					$("#operate>input[type=checkbox][name="+o.id+"]").prop("checked" ,"checked");
			});
		}
	});
}

var dataSource = new MenuDs();
function resetMenuTree() {
	$('.tree').frametree("destroy");
	$('.tree').frametree({
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
		dblclickHandler: itemSelect
	});
}

function itemSelect(node, type) {
	var d = $(node).data();
	initSelectOperate(d.id);
	formutil.setFields($("#edit-form"), d);
	
	var p = $('.tree').frametree("getParentNode", d.id);
	if (p!=null && p.length>0) {
		$("#pId").children("option").val(p.data("id"));
		$("#pId").children("option").text(p.data("name"));
	}
	op = "update";
}

function newMenu() {
	$("#id").val("");
	$("#name").val("");
	$("#url").val("");
	$("#desc").val("");
	op = "add";
	
	var d = null;
	var n = $('.tree').frametree("selectedItems");
	if (n.length == 0) {
		return;
	}
	n = n[0];
	if (n.type == "folder") {
		$("#pId").children("option").val(n.id);
		$("#pId").children("option").text(n.name);
	}else {
		var p = $('.tree').frametree("getParentNode", n.id);
		if (p!=null && p.length>0) {
			$("#pId").children("option").val(p.data("id"));
			$("#pId").children("option").text(p.data("name"));
		}
	}
}

function deleteMenu() {
	function doDelete() {
		var btn = confirm("是否删除菜单["+n.name+"]?");
		if (!btn) return;
		util.getServerData("/menu/delete_menu.do", {id:n.id}, function(o) {
			if (o.rs_code == 0) {
				$('.tree').frametree("deleteNode", n.id);
				alert("菜单["+n.name+"]删除成功！");
			}else
				alert(o.message);
		});
	}
	
	var n = $('.tree').frametree("selectedItems");
	if (n.length == 0) {
		alert("请先选择需要删除的菜单！");
		return;
	}
	n = n[0];
	if (n.type == "folder") {
		util.getServerData("/menu/get_sub_menus.do", {pId:n.id}, function(data) {
			var len = data.length;
			if (len > 0)
				alert("该节点含有子菜单，请先删除子菜单再删除该节点！");
			else
				doDelete();
		})
	}else {
		doDelete();
	}
}

function saveMenu() {
	var url = "/menu/insert_menu_op.do";
	if (op == "update")
		url = "/menu/update_menu_op.do";
		
	var d = formutil.getFields($("#edit-form"));	
	var ops = getSelectOperate();
// 	alert(d.pid);
// 	alert(d.pId);
	
// 	alert($("#id").val());
	if($("#id").val()==0){
		d.pId=$("#pId").children("option").val();
// 		alert(d.pId);
	}
	d.ops = ops;
	util.getServerData(url, d, function(o) {
		if (o.rs_code == 0) {
			resetMenuTree();
			alert("菜单["+d.name+"]保存成功！");
		}else
			alert(o.message);
	})
}

function initValidate() {
	$('form').validate({
		onKeyup : true,
		eachValidField : function() {
			$(this).closest('div').removeClass('has-error').addClass('has-success');
			$("#"+$(this).attr("data-describedby")).html("");
		},
		eachInvalidField : function() {
			$(this).closest('div').removeClass('has-success').addClass('has-error');
		},
		description : {
			name: {
				required: '请输入菜单名！',
				pattern: '菜单名不合法！请重新输入！'
			},
			order: {
				required: '请输入序号！',
				pattern: '序号只能是数字！请重新输入！'
			}
		},
		valid: function(form) {
			saveMenu();
		}
	});
}

function destroy() {
	$('.tree').frametree("destroy");
}
</script>