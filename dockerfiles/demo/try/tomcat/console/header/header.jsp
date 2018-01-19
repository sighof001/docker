<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.dplatform.framework.util.WebUtil" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	
	String error = null; 
	if (request.getAttribute("error") != null) {
		error = (String)request.getAttribute("error");
	}
	String menuId = "";
	if (request.getParameter("menuId") != null) {
		menuId = (String)request.getParameter("menuId");
	}else if (request.getAttribute("menuId") != null) {
		menuId = (String)request.getAttribute("menuId");
	}
	if (!"".equals(menuId))
		request.setAttribute("menuId", menuId);
	
	String themePath = WebUtil.getThemePath();
%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=8,Chrome=1" />
<meta name="renderer" content="webkit">
<meta name="description" content="">
<meta name="author" content="">
<LINK rel="shortcut icon" href="<%=path%>/image/favicon/favicon1.png">
<title>金达投融易后台管理系统</title>
<link href="<%=path%>/css/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet">
<link href="<%=path%>/js/plugin/bootstrap-select/bootstrap-select.min.css" type="text/css" rel="stylesheet">
<link href="<%=path%>/js/plugin/jquery-autocomplete/jquery.autocomplete.css" type="text/css" rel="stylesheet"/>
<link href="<%=path%>/css/frame.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/constants.js"></script>
<!--dan-修改start--->	
<link type="text/css" rel="stylesheet" href="<%=path%>/theme/<%=themePath%>/css/frame-select.css" />	
<!--dan-修改end--->	
<%-- jstl taglib --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jstl/xml" %>

<script type="text/javascript">
function isIE() {
	explorer = window.navigator.userAgent ;
	return (explorer.indexOf("MSIE") > 0);
}

function getIEVersion() {
	explorer = window.navigator.userAgent ;
	if (isIE()) {
		var len = explorer.length;
		var i1 = explorer.indexOf("MSIE");
		var s1 = explorer.substr(i1, len - i1);
		
		var i2 = s1.indexOf(";");
		var s2 = s1.substring(5, i2);
		return parseInt(s2);
	} else
		return 100;
}
if (isIE() && getIEVersion() < 9) {
	document.write("<link href='<%=path%>/theme/<%=themePath%>/css/font-awesome-ie7.css' type='text/css' rel='stylesheet'>");
}else {
	document.write("<link href='<%=path%>/css/font-awesome.min.css' type='text/css' rel='stylesheet'>");
}

var cxt = '<%=request.getContextPath()%>';
var themePath="<%=themePath%>";
</script>

<style id="holderjs-style" type="text/css"></style>

<script type="text/javascript" src="<%=path%>/js/plugin/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/css/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/plugin/bootstrap-select/bootstrap-select.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/plugin/ace/js/jquery.slimscroll.min.js" ></script>
<script type="text/javascript" src="<%=path%>/js/plugin/jquery-autocomplete/jquery.autocomplete.js"></script>
<script type="text/javascript" src="<%=path%>/js/plugin/fuelux/fuelux.tree.js" ></script>
<script type="text/javascript" src="<%=path%>/js/frame/page.js"></script>
<script type="text/javascript" src="<%=path%>/js/frame/frame.js"></script>
<script type="text/javascript" src="<%=path%>/js/frame/frame.ui.js"></script>
<script type="text/javascript" src="<%=path%>/js/app/tree-ds.js"></script>
<!-- 弹出窗控件 -->
<link rel="stylesheet" href="<%=path%>/js/artDialog/skins/blue.css" type="text/css" />
<script src="<%=path%>/js/artDialog/artDialog.js"></script>
<script src="<%=path%>/js/artDialog/plugins/iframeTools.js"></script>
<!-- 表单校验控件 -->
<script src="<%=path%>/js/formvalidator/formValidator-4.1.3.js" type="text/javascript" charset="UTF-8"></script>
<script src="<%=path%>/js/formvalidator/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>


<!--[if lt IE 9]>
  <script type="text/javascript" src="<%=path%>/css/bootstrap/js/html5shiv.min.js"></script>
  <script type="text/javascript" src="<%=path%>/js/plugin/excanvas.compiled.js"></script>
<![endif]-->
<basepath href="<%=path%>"></basepath>
<script>
authority.menuId = "<%=menuId%>";

/**
 * 初始化界面权限
 */
var au_cache = [];

function initAuthority() {
	au_cache = [];
	authority.getAuthority(authority.getMenuId(), function(data) {
		if(!data){return;}
		$.each(data.operates, function(i, o) {
			var id = o.name + "-btn";
			$("#"+id).removeClass("disabled");
			$("#"+id).prop("disabled", false);
			au_cache.push(o);
		});
	});
}

function testAuthority(name) {
	var o = util.getObjectFromArray("name", name, au_cache);
	return (o == null);
}

//注销该方法
function initSelectPicker() {
	$('.selectpicker').selectpicker();
}

function initCombox(config) {
	var conf = config ? config: {};
	$(".framecombox").each(function() {
		if (conf.width==null) {
			conf.width = $(this).width();			
		}
		$(this).framecombox(conf);
	})
	
}
</script>