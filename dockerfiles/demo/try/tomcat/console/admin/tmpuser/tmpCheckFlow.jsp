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
<body >
	<div class="panel panel-default no-border">
		<div class="panel-heading">
			<div class="row checkRow">
				<span class="query-label">模&nbsp;&nbsp;版<span style="color: red; font-weight: bold">*</span>：</span>
				<div class="col-xs-4">
					<select id="templ" name="templ" class="form-control framecombox" data-url="input/get_setcheck_templ.do">
					</select>
				</div>
				<div class="col-xs-1">
					<input id="query-btn" type="button" onclick="saveCheck()" class="form-control btn-primary disabled" disabled=true value="保存">
				</div>
				<div class="col-xs-1">
					<input id="query-btn" type="button" onclick="reSet()" class="form-control btn-primary disabled"  value="重置">
				</div>
				<div class="col-xs-1">
					<input id="query-btn" type="button" onclick="goBack()" class="form-control btn-primary disabled"  value="返回">
				</div>
			</div>
				<div id="addform">
					
				</div>
		</div>
			
	</div>
</body>
<script>
var tempId = "";
var orgArr = new Array();
$(document).ready(function(){
	initAuthority();
	initCombox();
	orgArr = new OrgDs({type:"1"});
});

var flow = 0;
$("#templ").change( function() {
	//var showVal = 3;
	//alert($("#templ").val()); 
	tempId = $("#templ").val();
	if(tempId=="0"){
		addContent(0);
	}else{
		 
		util.getServerData("/tmpCheck/get_check_flow.do",{tempId:tempId},function(showVal){
			flow = 0;
			flow = showVal;
			if(showVal=="1" || showVal=="2" || showVal=="3"){
				   addContent(showVal);
				} else if(showVal=="-1"){
					addContent(0);
					alert("审核流程查询异常,请联系开发人员！");
				} else{
					addContent(0);
					alert("未设置审核流程编码,请完成相关操作！");
				}
			
		});
	}

});

function addContent(vals){

	if(vals==1){
		$("#addform").empty();
		$("#addform").append(content1);
	}else if(vals==2){
		$("#addform").empty();
		$("#addform").append(content1);
		$("#addform").append(content2);
		
	}else if(vals==3){
		$("#addform").empty();
		$("#addform").append(content1);
		$("#addform").append(content2);
		$("#addform").append(content3);
		
	}else if(vals==0||vals==5){
		$("#addform").empty();
	} else{
		alert("添加审核行出错，请联系开发人员！");
	}
	
	/* $("input[id*='User']").each(function(){
		$(this).framedroptree({
			dataSource : new OrgDsUser({type:"1"}),
			"folder-icon-close": null,
			"folder-icon-open": null,		
			height: 300,
			changeVal: true
		});
	}); */
	$("input[id*='Org']").each(function(){
		$(this).framedroptree({
			dataSource : orgArr,
			"folder-icon-close": null,
			"folder-icon-open": null,		
			height: 300
		});
	});
}


function saveCheck(){ // 保存按钮功能
	if($("#firCheck").attr("id")==undefined){
		return;
	}
	var i=0;
	var j=0;
	$("input[id*='Check']").each(function(){
		
		if($(this).attr("value2")==undefined || $(this).attr("value2")==""){
			j++;
		}
		i++;
	});
	if(i==j){
		return;
	} 
	
	if($("#templ").val()=="0"){
		alert("请选择模板！");	
		return;
	}
	
	util.getServerData("/tmpCheck/check_count.do",{tempId:tempId},function(count){
		var flag = true;
		if(count>0){
			//已经完成用户的审核流程,新增或更新
			
			if(!RowVlidate()){
				return;
			}
			
		 	util.getServerData("/tmpCheck/save_update.do",{first:'N',tempId:tempId, firUser:$("#firCheckUser").attr("value2"), secUser:$("#secCheckUser").attr("value2"), thiUser:$("#thiCheckUser").attr("value2"), firOrg:$("#firCheckOrg").attr("value2"),
		 		secOrg:$("#secCheckOrg").attr("value2"), thiOrg:$("#thiCheckOrg").attr("value2") },function(val){
		 			
		 		if(val==-1){
		 			alert("保存失败！");
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
				/* util.getServerData("/tmpCheck/save_check.do",{flow:flow, tempId:tempId, firUser:$("#firCheckUser").attr("value2"), secUser:$("#secCheckUser").attr("value2"), thiUser:$("#thiCheckUser").attr("value2"), firOrg:$("#firCheckOrg").attr("value2"), secOrg:$("#secCheckOrg").attr("value2"), thiOrg:$("#thiCheckOrg").attr("value2") },function(val){
					if(val){
						alert("保存成功");
					}
				}); */
				util.getServerData("/tmpCheck/save_update.do",{first:'Y',tempId:tempId, firUser:$("#firCheckUser").attr("value2"), secUser:$("#secCheckUser").attr("value2"), thiUser:$("#thiCheckUser").attr("value2"), firOrg:$("#firCheckOrg").attr("value2"),
			 		secOrg:$("#secCheckOrg").attr("value2"), thiOrg:$("#thiCheckOrg").attr("value2") },function(val){
			 			
			 		if(val==-1){
			 			alert("保存失败！");
			 		}else if(val==0){
			 			alert("保存成功！");
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
			if($("#firCheckUser").attr("value2")!="" && $("#firCheckUser").attr("value2")!=undefined){
				if($("#firCheckOrg").attr("value2")==undefined || $("#firCheckOrg").attr("value2")==""){
					alert("请将一级审核机构数据补充完整！");
					$("#firCheckOrg").focus;
					return false;
				}
			}else if($("#firCheckUser").attr("value2")=="" || $("#firCheckUser").attr("value2")==undefined){
				if($("#firCheckOrg").attr("value2")!=undefined && $("#firCheckOrg").attr("value2")!=""){
					alert("请将一级审核用户数据补充完整！");
					$("#firCheckUser").focus;
					return false;
				}
			}
		}
		
		if($("#secCheck")!=undefined){
			if($("#secCheckUser").attr("value2")!="" && $("#secCheckUser").attr("value2")!=undefined){
				if($("#secCheckOrg").attr("value2")==undefined || $("#secCheckOrg").attr("value2")==""){
					alert("请将二级审核机构数据补充完整！");
					$("#secCheckOrg").focus;
					return false;
				}
			}else{
				if($("#secCheckOrg").attr("value2")!=undefined && $("#secCheckOrg").attr("value2")!=""){
					alert("请将二级审核用户数据补充完整！");
					$("#secCheckUser").focus;
					return false;
				}
			}
			
		}
		
		if($("#thiCheck")!=undefined){
			if($("#thiCheckUser").attr("value2")!=undefined && $("#thiCheckUser").attr("value2")!=""){
				if($("#thiCheckOrg").attr("value2")==undefined || $("#thiCheckOrg").attr("value2")==""){
					alert("请将三级审核机构数据补充完整！");
					$("#thiCheckOrg").focus;
					return false;
				}
			}else{
				if($("#thiCheckOrg").attr("value2")!=undefined && $("#thiCheckOrg").attr("value2")!=""){
					alert("请将三级审核用户数据补充完整！");
					$("#thiCheckUser").focus;
					return false;
				}
			}
		}
		return true;
	}
	
}

/* 下拉机构选择用户 */
var OrgDsUser = function(options){
	this.type = options.type;
	this.url = "/orgmgr/get_sub_orgUser.do";	
};

OrgDsUser.prototype = {
		data: function(node, callback) {
			//第一层节点--options 返回空对象
			if (!node.type) {
				this.getDataFrmSvr("0", callback);
			}else {
				this.getDataFrmSvr(node.id, callback);
			}
		}
		,getDataFrmSvr: function(pid, callback) {
			var $this = this;
			util.getServerData(this.url, {type:this.type,pcode:pid}, function(data) {
				var len = data.length;
				for (var i=0;i<len;i++) {
					var d = data[i];
//					var m = d.menu;
					data[i].utype = data[i].type;
					data[i].id = data[i].orgCode;
					data[i].pid = data[i].orgPCode;
					data[i].chil = data[i].children;
					data[i].type = "folder";
					data[i].type = (d.chil=="1")?"folder":"item";
//						alert(data[i].name);
//						$("#tree-item-name").attr("title",data[i].name);
//						alert($(".tree-item-name").content());
				}
				callback({data: data});
			});
		} 
	};

function reSet(){
	
	$("input[id*='CheckOrg']").each(function(){
		$(this).attr("value2", "");
		//$(this).attr("value", "");
		$(this).val("");
		
	});
	$("input[id*='CheckUser']").each(function(){
		$(this).attr("value2", "");
		$(this).attr("value", "");
		//$(this).val("");
		
	});
	
}

function goBack(){
	util.navigate("/admin/tmpuser/tmpCheckFlowList.jsp?");
}

function addDialog(val){
	var returnValue;
	returnValue = window.showModalDialog("addDialog.jsp",val,"dialogWidth:800px;dialogHeight:700px;center:yes;status:yes");
	if(typeof(returnValue[0])!=undefined&&typeof(returnValue[1])!=undefined){
		if(val=="1"){
			$("#firCheckUser").attr("value2", returnValue[0]);
			$("#firCheckUser").attr("value", returnValue[1]);
			$("#firCheckUser").blur();
		}else if(val=="2"){
			$("#secCheckUser").attr("value2", returnValue[0]);
			$("#secCheckUser").attr("value", returnValue[1]);
			$("#secCheckUser").blur();
		}else if(val=="3"){
			$("#thiCheckUser").attr("value2", returnValue[0]);
			$("#thiCheckUser").attr("value", returnValue[1]);
			$("#thiCheckUser").blur();
		}else{
			alert("选择用户操作发生异常，请联系开发人员！");
		}
	}
	
	
	//window.open("addDialog.jsp",'newWindow', 'height=600', 'width=300');
}

var content1 = '<div class="row"  id="firCheck" style="padding-top:10px;" >'+
	'<span class="query-label">一级审核：</span>'+
	'<div class="col-xs-4">'+
		'<input id="firCheckUser" type="text" onclick="addDialog(1)" style="cursor:pointer"  class="form-control" placeholder="用户" >'+
	'</div>'+
	'<div class="col-xs-6">'+
	'<input id="firCheckOrg" type="text" class="form-control" placeholder="机构">'+
	'</div>'+
	'</div>';

var content2 ='<div class="row" id="secCheck" style="padding-top:10px;" >'+
	'<span class="query-label">二级审核：</span>'+
	'<div class="col-xs-4">'+
		'<input id="secCheckUser" type="text" onclick="addDialog(2)" style="cursor:pointer" class="form-control" placeholder="用户" >'+
	'</div>'+
	'<div class="col-xs-6">'+
	'<input id="secCheckOrg" type="text" class="form-control" placeholder="机构">'+
	'</div>'+
	'</div>';

var content3 ='<div class="row" id="thiCheck" style="padding-top:10px;" >'+
	'<span class="query-label">三级审核：</span>'+
	'<div class="col-xs-4">'+
		'<input id="thiCheckUser" type="text" onclick="addDialog(3)" style="cursor:pointer" class="form-control" placeholder="用户" >'+
	'</div>'+
	'<div class="col-xs-6">'+
	'<input id="thiCheckOrg" type="text" class="form-control" placeholder="机构">'+
	'</div>'+
	'</div>';

	
/* function doEdit(data) {
	util.navigate("/admin/user/edit.jsp?op=update&id="+data.id);
} */

</script>