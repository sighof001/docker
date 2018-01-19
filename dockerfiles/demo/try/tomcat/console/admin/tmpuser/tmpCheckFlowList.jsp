<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="../../header/header.jsp"%>
<%request.setCharacterEncoding("utf-8");%>
<style type="text/css">
.checkRow {
	padding-top:10px;
}
</style>
</head>
<body onunload="destroy()">
	<div class="panel panel-default no-border">
	<div id="query-form" class="panel-heading"  method="post">
		<div class="panel-heading">
			<div class="row checkRow">
				<span class="query-label">模&nbsp;&nbsp;版<span style="color: red; font-weight: bold">*</span>：</span>
				<div class="col-xs-2">
					<select id="templ" name="templ" class="form-control framecombox" data-url="input/get_setcheck_templ.do">
					</select>
				</div>
				<span class="query-label">审核人姓名：</span>
				<div class="col-xs-2">
					<input id="userName" type="text" class="form-control" placeholder="审核人姓名">
				</div>
				<span class="query-label">机构名称：</span>
				<div class="col-xs-2">
					<input id="orgName" type="text" class="form-control" placeholder="机构名称">
				</div>
				<div class="col-xs-1">
					<input id="query-btn" type="button" class="form-control btn-primary disabled" disabled=true value="查询">
				</div>
				<div class="col-xs-1">
					<input id="add" type="button" onclick="addCheck()" class="form-control btn-primary disabled" value="添加">
				</div>
			</div>
		</div>
		</div>
	 </div>
	<div id="table" class="panel-body">
   </div>
</body>

<script>
$(document).ready(function(){
	initAuthority();
	initCombox();
	$("#table").frametable({
		columns: [
		          {name:'id', text:'ID', hidden: true},
		          {name:'templateID', text:'模板ID', hidden: true},
		          {name:'templateName', text:'模板名称', sort: true, width: 200},
		          {name:'checkLevel', text:'审核级别', sort: true, width: 150},
		          {name:'userName', text:'审核人姓名', sort: true, width: 120},
		          {name:'orgName', text:'机构名称', sort: true, width: 350},
		          {name:'status', text:'状态', sort: true,width: 80}
		         ],
				
		datatype: "server",
		tableClass: "table-bordered table-hover table-striped",
		url: 'inputQuery/get_tmpcheck_list.do',
		rowsurl: 'inputQuery/get_tmpcheck_list_rows.do',
		pageName: 'page',
		pageSizeName: 'limit',
		//refresh_at_once: false
	});
	
	$("#query-btn").on("click", function() {
		var templ = $("#templ option:selected").attr("value");
		//if (templ == 0 || templ == null){
			///alert("请选择模板！");
			//return;
		//}
		var params = formutil.getFields($("#query-form"));
		$("#table").frametable("query", params); 
	});
	
	//$("#reset-btn").on("click", function() {
	//	formutil.setFields($("#query-form"), {date:"",org:""});
	//});
});

function addCheck(){
	util.navigate("/admin/tmpuser/tmpCheckFlow.jsp?");
}

function saveCheck(){ // 保存按钮功能
	
	if($("#templ").val()=="0"){
		alert("请选择模板！");	
		return;
	}
	
	util.getServerData("/tmpCheck/check_count.do",{tempId:tempId},function(count){
		var flag = true;
		if(count>0){
			//已经保存，新增
			
			if(!RowVlidate()){
				return;
			}
			alert($("#firCheckUser").attr("value2"));
		 	util.getServerData("/tmpCheck/save_add.do",{tempId:tempId, firUser:$("#firCheckUser").attr("value2"), secUser:$("#secCheckUser").attr("value2"), thiUser:$("#thiCheckUser").attr("value2"), firOrg:$("#firCheckOrg").attr("value2"),
		 		secOrg:$("#secCheckOrg").attr("value2"), thiOrg:$("#thiCheckOrg").attr("value2") },function(val){
		 			
		 		if(val==-1){
		 			alert("数据已经存在，保存失败！");
		 		}else if(val==0){
		 			alert("保存成功！");
		 		}
		 	});
			
			
		}else if(count==0) {
			// 非空验证
			$("input[id*='User']").each(function(){
				if($(this).val()==""){
					$(this).focus();
					alert("请将数据填充完整！");
					flag = false;
					return false;
				}
			});
			if(flag){
				$("input[id*='Org']").each(function(){
					if(this.getAttribute("value2")==""){
						$(this).focus();
						alert("请将数据填充完整！");
						flag=false;
						return flag;
					}
				});
			}
			if(flag){
				util.getServerData("/tmpCheck/save_check.do",{tempId:tempId, firUser:$("#firCheckUser").attr("value2"), secUser:$("#secCheckUser").attr("value2"), thiUser:$("#thiCheckUser").attr("value2"), firOrg:$("#firCheckOrg").attr("value2"), secOrg:$("#secCheckOrg").attr("value2"), thiOrg:$("#thiCheckOrg").attr("value2") },function(val){
					if(val){
						alert("保存成功");
					}
				});
			}
			
		}else{
			// 异常判断
			//alert();
		}
	});

	function RowVlidate(){
		if($("#firCheck")!=undefined){
			if($("#firCheckUser").val()!=""){
				if($("#firCheckOrg").attr("value2")==undefined){
					alert("请将一级审核机构数据补充完整！");
					$("#firCheckOrg").focus;
					return false;
				}
			}else{
				if($("#firCheckOrg").attr("value2")!=undefined){
					alert("请将一级审核用户数据补充完整！");
					$("#firCheckUser").focus;
					return false;
				}
			}
		}
		
		if($("#secCheck")!=undefined){
			if($("#secCheckUser").val()!=""){
				if($("#secCheckOrg").attr("value2")==undefined){
					alert("请将二级审核机构数据补充完整！");
					$("#secCheckOrg").focus;
					return false;
				}
			}else{
				if($("#secCheckOrg").attr("value2")!=undefined){
					alert("请将二级审核用户数据补充完整！");
					$("#secCheckUser").focus;
					return false;
				}
			}
			
		}
		
		if($("#thiCheck")!=undefined){
			if($("#thiCheckUser").val()!=""){
				if($("#thiCheckOrg").attr("value2")==undefined){
					alert("请将三级审核机构数据补充完整！");
					$("#thiCheckOrg").focus;
					return false;
				}
			}else{
				if($("#thiCheckOrg").attr("value2")!=undefined){
					alert("请将三级审核用户数据补充完整！");
					$("#thiCheckUser").focus;
					return false;
				}
			}
		}
		return true;
	}
	
}

function destroy(){
	$("#table").frametable("destroy");
};




</script>