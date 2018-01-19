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
		<div class="col-xs-5 adjust">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3>机构列表</h3>
			</div>
			<div class="panel-body " >
					<div id="orgText" class="tree"></div>
				</div> 
		</div>
		</div>
		<div class="col-xs-7 adjust">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3>机构管理 <small>双击菜单为修改机构，选中后点新增按钮为新增机构。编辑完成后点击保存按钮！</small></h3>
			</div>
			<div class="panel-body overflow-auto">
				<div>
					<button id="add-btn" class="btn btn-primary " onclick="newOrg();">新增</button>
					<button id="delete-btn" onclick="deleteOrg()" class="btn btn-danger">删除</button>
<!-- 					<button id="orgUser" class="btn">机构用户管理</button> -->
				</div>
				<hr>
				<form id="edit-form" class="col-sm-11" onSubmit="return false">
					<button id="save-btn" class="btn btn-success pull-right save-btn-pos ">保存</button>
					<input type="hidden" id="id" />
					<div class="form-group form-inline">
<!-- 						<input type="hidden" id="id" /> -->
						<label class="col-sm-2">机构名称<span class="red">*</span>:</label> 
						<input type="text" id="name" class="form-control"  
						onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5 A-Za-z0-9_]/g,'')"/>
						
						<div class="form-validate-desc" id="name-desc"></div>
					</div>
					<div class="form-group form-inline">
						<label class="col-sm-2">机构类型<span class="red">*</span>:</label> 
						<select class="form-control" id="type" name="type" required >
							<option value="1" selected>数据机构</option>
							<option value="2">管理机构</option>
						</select>	
					</div>
					
					<div class="form-group form-inline">
						<label class="col-sm-2">机构代码<span class="red">*</span>:</label> 
						<input type="text" id="orgCode" class="form-control"  maxlength="50" onkeyup="this.value=this.value.replace(/[^A-Za-z0-9_]/g,'')" required/>
					</div>
					<div class="form-group form-inline">
						<label class="col-sm-2">上级机构<span class="red">*</span>:</label> 
						<input type="text" id="orgPName" class="form-control" disabled=disabled />
						<input type="hidden" id="orgPCode" />
					</div>
					<div class="form-group form-inline">
						<label class="col-sm-2">机构层级 :</label> 
						<input type="text" id="level" class="form-control" disabled=disabled  />
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
	$("#orgUser").on("click",function(){
		util.navigate("/admin/orgmgr/orguser.jsp");
	});
	
	
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
	}); 
}


var dataSource = new OrgDs({type:''});
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
		dblclickHandler: itemSelect,
		"folder-icon-close": null
	});
}

function itemSelect(node, type) {

	var d = $(node).data();
// 	initSelectOperate(d.id);
	formutil.setFields($("#edit-form"), d);
	util.getServerData("/orgmgr/get_org_by_code.do",{code:d.id},function(data){
		$("#orgName").val(data.name);//当前机构数据设置
		$("#type").val(data.type);
		$("#level").val(data.level);
		$("#id").val(data.id);
		$("#orgCode").attr("disabled",true);//修改模式下不能修改机构码
	});
		if(d.orgPCode=="0"){
			$("#orgPName").val("根");
			return;
		}
	util.getServerData("/orgmgr/get_org_by_code.do",{code:d.orgPCode},function(data){
// 		if(0==data.orgPCode||"0"==data.orgPCode){//父级机构数据设置
			
// 			$("#orgPCode").val(data.orgPCode);
// 		}else{
			$("#orgPName").val(data.name);
			$("#orgPCode").val(data.orgCode);
			
// 		}
	});
	
	op = "update";
}

function newOrg() {
	var d = $("#orgCode").val();
	$("#id").val("");
	$("#name").val("");
	$("#type").attr("disabled",false);
	$("#orgCode").val("");
	$("#orgCode").attr("disabled",false);
	$("#orgPName").val()==""||$("#orgPName").val()==null?alert("请先选择父机构！"):"";
	util.getServerData("/org/get_org_by_code.do",{code:d},function(data){//获取机构实体
		$("#edit-form input").val("");
		$("#type").val(data.type);
// 		alert(data.level);
		data.level!=undefined&&null!=data.level&&data.level!=""? $("#level").val(data.level+1):null;//新增层级默认为父机构层级加1
		$("#orgPName").val(data.name);
		$("#orgPCode").val(data.orgCode);
				
});
	op = "add";
	
}

function deleteOrg() {
	function doDelete() {
		var btn = confirm("是否删除机构["+n.name+"]?");
		if (!btn) return;
		util.getServerData("/orgmgr/del_org_by_code.do", {code:n.orgCode}, function(o) {
			if (o.rs_code == 0) {
				$('.tree').frametree("deleteNode", n.id);
				$("#edit-form input").val("");
				alert("机构["+n.name+"]删除成功！");
			}else
				alert(o.message);
		});
	}
	
	var n = $('.tree').frametree("selectedItems");
	if (n.length == 0) {
		alert("请先选择需要删除的机构！");
		return;
	}
	n = n[0];
	if (n.type == "folder") {
		util.getServerData("/orgmgr/get_sub_org.do", {pId:n.id}, function(data) {
			var len = data.length;
			if (len > 0)
				alert("该机构含有子机构，请先删除子机构再删除该节点");
			else
				doDelete();
		});
	}else {
		doDelete();
	}
}

function saveOrg() {
	var url = "/orgmgr/save_org.do";
	if (op == "update")
		url = "/orgmgr/update_org.do";
		
	var d = formutil.getFields($("#edit-form"));	
	var ops = getSelectOperate();
	d.ops = ops;
	util.getServerData(url, d, function(o) {
		if (o.rs_code == 0) {
			resetMenuTree();
			$("#orgCode").attr("disabled",true);
			alert("机构["+d.name+"]保存成功！");
		}else
			alert(o.message);
	});
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
				required: '请输入机构名！',
				pattern: '机构名不合法！请重新输入！'
			},
			orgCode: {
				required: '请输入机构号！',
				pattern: '序号只能是数字！请重新输入！'
			}
		},
		valid: function(form) {
			saveOrg();
		}
	});
}

function destroy() {
	$('.tree').frametree("destroy");
}
</script>