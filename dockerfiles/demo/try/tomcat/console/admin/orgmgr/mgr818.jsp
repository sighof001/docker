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
				<h3>机构列表</h3>
			</div>
			<div class="panel-body"  >
			
					<input id="orgText" type="text" class="form-control" placeholder="机构" oninput="changeValue();">
					<input id="org" name="org" type="hidden">
<!-- 					<input id="orgText" type="text" class="form-control" placeholder="机构"> -->
<!-- 					<input id="test"  type="button" class="form-control btn-primary"  value="确定" style="width: 50px;position:absolute; right:0;"> -->
<!-- 					<input id="org" name="org" type="hidden"> -->
				
				</div> 
		</div>
		</div>
		<div class="col-xs-8 adjust">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3>机构管理 <small>双击菜单为修改机构，选中后点新增按钮为新增机构。编辑完成后点击保存按钮！</small></h3>
			</div>
			<div class="panel-body overflow-auto">
				<div>
					<button id="add-btn" class="btn btn-primary disabled" disabled>新增</button>
					<button id="delete-btn" onclick="deleteOrg()" class="btn btn-danger">删除</button>
				</div>
				<hr>
				<form id="edit-form" class="col-sm-11" onSubmit="return false">
					<button id="save-btn" class="btn btn-success pull-right save-btn-pos ">保存</button>
					<input type="hidden" id="id" />
					<div class="form-group form-inline">
<!-- 						<input type="hidden" id="id" /> -->
						<label class="col-sm-3">机构名称<span class="red">*</span>:</label> 
						<input type="text" id="name" class="form-control"  
						onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5A-Za-z0-9_]/g,'')" data-required="true"  maxlenth="30" />
						
						<div class="form-validate-desc" id="name-desc"></div>
					</div>
					<div class="form-group form-inline">
						<label class="col-sm-3">机构类型<span class="red">*</span>:</label> 
						<select class="form-control" id="type" name="type" required >
							<option value="1" selected>数据机构</option>
							<option value="2">管理机构</option>
						</select>	
					</div>
					
					<div class="form-group form-inline">
						<label class="col-sm-3">机构代码:</label> 
						<input type="text" id="orgCode" class="form-control"  maxlength="50" onkeyup="this.value=this.value.replace(/^[A-Za-z0-9_]/g,'')" required/>
					</div>
					<div class="form-group form-inline">
						<label class="col-sm-3">上级机构<span class="red">*</span>:</label> 
						<input type="text" id="orgPName" class="form-control" readonly=readonly />
						<input type="hidden" id="orgPCode" />
					</div>
					<div class="form-group form-inline">
						<label class="col-sm-3">机构层级:</label> 
						<input type="text" id="level" class="form-control" readonly=readonly />
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

$(document).ready(function(){
	initAuthority();
	
	$("#add-btn").on("click", function() {
		$("#orgCode").removeAttr("readonly");
		$("#type").attr("readonly","readonly");
		var d = $("#orgText").attr("value2");
		
		if(typeof(d)=="undefined"){
			alert("请先选择父机构！")		;
			return;
		}
		util.getServerData("/org/get_org_by_code.do",{code:d},function(data){//获取机构实体
				$("#edit-form input").val("");
				$("#type").val(data.type);
				$("#level").val(data.level+1);//新增层级默认为父机构层级加1
				$("#orgPName").val(data.name);
				$("#orgPCode").val(data.orgCode);
						
		});
		
// 		var flag = validate();
// 		if(!flag)
// 			return false;
// 		else {
// 			$(this).prop("disabled", true);
// 			$(this).addClass("disabled");
// 			$("form").submit();
// 		}
	});
	op = "add";
});
 
$("#save-btn").click(function(){
	saveOrg();
});

$("#orgText").framedroptree({
	dataSource : new OrgDs({type:"1"}),
	loadingHTML:'<div class="tree-loading"><i class="icon-refresh icon-spin blue"></i></div>',
	"folder-icon-close": null,
	"folder-icon-open": null,
// 	'selectable' : true,
	dblclickHandler: itemSelect,
	height: 300
});

function itemSelect(node, type) {
	var d = $(node).data();
	initSelectOperate(d.id);
	formutil.setFields($("#edit-form"), d);
	util.getServerData("/org/get_org_by_code.do",{code:d.id},function(data){
		$("#orgName").val(data.name);//当前机构数据设置
		$("#type").val(data.type);
		$("#level").val(data.level);
		$("#id").val(data.id);
		$("#orgCode").attr("readonly","readonly");//修改模式下不能修改机构码
	});
		if(d.orgPCode=="0"){
			$("#orgPName").val("根");
			return;
		}
	util.getServerData("/org/get_org_by_code.do",{code:d.orgPCode},function(data){
// 		if(0==data.orgPCode||"0"==data.orgPCode){//父级机构数据设置
			
// 			$("#orgPCode").val(data.orgPCode);
// 		}else{
			$("#orgPName").val(data.name);
			$("#orgPCode").val(data.orgCode);
			
// 		}
	});
	
	op = "update";
}
/**
 * //删除操作
 */
function deleteOrg() {
	
	var n = $('#orgText').val();
	var n2 =  $('#orgText').attr("value2");
	var t = $('#type').val();
	if(typeof(n)=="undefined"||""==n||null==n){
		alert("请选择需要删除的机构！");
		return;
	}
// 	if (n.length == 0) {
// 		alert("请先选择需要删除的机构！");
// 		return;
// 	}
// 	n = n[0];
	
// 	function doDelete() {
		var btn = confirm("是否删除机构["+n+"]?");
		if (!btn) return;
		util.getServerData("/org/del_org_by_code.do", {code:n2,type:t}, function(o) {
			if (o.rs_code == 0) {
				alert("机构["+n+"]删除成功！");
				resetOrgTree();
// 				document.location.reload();
			}else
				alert(o.message);
		});
// 	}
	
	
}


/**
 * 保存机构
 */
 function saveOrg() {
		var url = "/org/save_org.do";
		if (op == "update")
			url = "/org/update_org.do";
		var d = formutil.getFields($("#edit-form"));	
// 		var ops = getSelectOperate();
// 		d.ops = ops;
		util.getServerData(url, d, function(o) {
			if (o.rs_code == 0) {
// 				resetMenuTree();
				resetSelectOperate();
				alert("机构["+d.name+"]保存成功！");
// 				document.location.reload();
				resetOrgTree();
			}else
				alert(o.message);
		});
	}
	
/**
 * 根据机构码查询
 */
function initSelectOperate(id) {
	resetSelectOperate();
	util.getServerData("/org/get_org_by_code.do", {code: id}, function(data) {
		if (data && data.length > 0) {
			$.each(data, function(i, o) {
				if (o.type != "0")
					$("#operate>input[type=checkbox][name="+o.id+"]").prop("checked" ,true);
			})
		}
	});
}

function resetOrgTree(){
	$('#orgText').frametree("destroy");
	$('#orgText').frametree({
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

/**
 * 重置
 */
function resetSelectOperate() {
	$("#operate>input[type=checkbox]").each(function() {
		$(this).prop("checked" ,false);
	}) ;
}

function test(){
	var flag = validate();
	return flag;
}
function validate() {

	var o = $("#name").val();
	if ($.trim(o)=="") {
		alert("请输入机构名！");
		resetSubmit();
		return false;
	}

	return true;
}

function destroy() {
	$('.tree').frametree("destroy");
}
</script>