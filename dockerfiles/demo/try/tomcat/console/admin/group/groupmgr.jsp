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
<body class="overflow-hidden">
	<div>
		<div class="col-xs-4 adjust">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3>用户组列表</h3>
			</div>
			<div class="panel-body">
				<div class="tree"></div>
			</div>
		</div>
		</div>
		<div class="col-xs-8 adjust">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3>用户组设置 <small>双击组为修改组，点击新增按钮为新增用户组。设置完成后点击保存按钮！</small></h3>
				<a class="form-back" href="<%=path%>/admin/group/list.jsp">返回</a>
			</div>
			<div class="panel-body">
				<div>
					<button id="add-btn" onclick="newGroup()" class="btn btn-primary disabled" disabled>新增</button>
					<!-- <button id="delete-btn" onclick="deleteGroup()" class="btn btn-danger disabled" disabled>删除</button> -->
				</div>
				<hr>
				<form id="edit-form" class="col-sm-11" onSubmit="return false">
					<button id="save-btn" class="btn btn-success pull-right save-btn-pos disabled" disabled>保存</button>
					<input type="hidden" id="id">
					<div class="form-group form-inline">
						<label class="col-sm-3">组名称<span class="red">*</span>:</label> 
						<div class="form-validate-desc" id="name-desc"></div>
						<input
							type="text" class="form-control" id="name"
							placeholder="输入用户组名称" data-required="true" 
							data-pattern="^[a-zA-Z\u4e00-\u9fa5][a-zA-Z0-9_\u4E00-\u9FA5_\-]{0,30}$" 
							data-describedby="name-desc" data-description="name">
					</div>
					<div class="form-group form-inline">
						<label class="col-sm-3">上级组<span class="red">*</span>:</label> 
						<select class="form-control" id="pid">
							<option value="root">根组
						</select>
					</div>
					<div class="form-group form-inline">
						<label class="col-sm-3">机构编码<span class="red">*</span>:</label> 
						<div class="form-validate-desc" id="org-desc"></div>
						<input
							type="text" class="form-control" id="org"
							placeholder="输入机构编码" data-required="true"
							data-pattern="^[a-zA-Z0-9_-]{0,30}$" 
							data-describedby="org-desc" data-description="org">
					</div>
					<div class="form-group form-inline">
						<label class="col-sm-3">描述:</label> 
						<textarea
							class="form-control" id="desc" cols=50 rows=2></textarea>
					</div>
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

var dataSource = new GroupDs();
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

function newGroup() {
	$("#id").val("");
	$("#name").val("");
	$("#desc").val("");
	op = "add";
	
	var d = null;
	var n = $('.tree').frametree("selectedItems");
	if (n.length == 0) {
		return;
	}
	n = n[0];
	if (n.type == "folder") {
		$("#pid").children("option").val(n.id);
		$("#pid").children("option").text(n.name);
	}else {
		var p = $('.tree').frametree("getParentNode", n.id);
		if (p!=null && p.length>0) {
			$("#pid").children("option").val(p.data("id"));
			$("#pid").children("option").text(p.data("name"));
		}
	}
}

function deleteGroup() {
	function doDelete() {
		var btn = confirm("是否删除用户组["+n.name+"]?");
		if (!btn) return;
		util.getServerData("/group/delete_group.do", {id:n.id}, function(o) {
			if (o.rs_code == 0) {
				$('.tree').frametree("deleteNode", n.id);
				alert("用户组["+n.name+"]删除成功！");
			}else
				alert(o.message);
		});
	}
	
	var n = $('.tree').frametree("selectedItems");
	if (n.length == 0) {
		alert("请先选择需要删除的用户组！");
		return;
	}
	n = n[0];
	if (n.type == "folder") {
		util.getServerData("/group/get_subgroup.do", {pid:n.id}, function(data) {
			var len = data.length;
			if (len > 0)
				alert("该节点含有子节点，请先删除子节点再删除该节点！");
			else
				doDelete();
		})
	}else {
		doDelete();
	}
}

function saveGroup() {
	var url = "/group/insert_group.do";
	if (op == "update")
		url = "/group/update_group.do";
		
	var d = formutil.getFields($("#edit-form"));	
	util.getServerData(url, d, function(o) {
		if (o.rs_code == 0) {
			resetMenuTree();
			alert("用户组["+d.name+"]保存成功！");
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
				required: '请输入组名称！',
				pattern: '用户组名称不合法！请重新输入！'
			},
			org: {
				required: '请输入机构编码！',
				pattern: '用户机构编码不合法！请重新输入！'
			}
		},
		valid: function(form) {
			saveGroup();
		}
	});
}

</script>