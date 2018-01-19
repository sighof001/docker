<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="header/header.jsp"%>
<link rel="stylesheet" href="<%=path%>/js/plugin/ace/css/frame_ace.css" />
<!--dan-修改start--->	
<link type="text/css" rel="stylesheet" href="<%=path%>/theme/<%=themePath%>/css/frame.css"  />	
<!--dan-修改end--->	

</head>
<body class="overflow-hidden" onunload="unloadPage()">
	<%@ include file="header/top.jsp"%>
	 
	<div class="after-header">
		<div id="main" >
			<div id="left-div" class="pull-left">
				<div class="panel panel-default">
					<div class="panel-heading no-padding-right"  style="height:39px;">
						<span class="menu-header">菜单名字</span>
						<div class="widget-toolbar toolbar-border-header">
				    		<i id="toggle-menu" class="icon-double-angle-left bigger-150"></i>
				    	</div>
					</div>
					<div id="toggle-menu-mask" class="bg-light-gray" style="display:none;width:30px;"></div>
					<div id="left-menu" class="panel-body no-padding">
						<div class="main-left-menu" id="sidebar"></div>
					</div>
				</div>
			</div>
			<div id="main-tabs" class="pull-left" style="margin-left:2px">
				
			</div>
		</div>
	</div>
</body>

<script type="text/javascript" src="<%=path%>/js/plugin/ace/js/ace.js" ></script>
<script>
var left_min_width = 120;

$(document).ready(function() {
	resetWidth();
	indexPage.setMainHeight();
	indexPage.initTabs();
	indexPage.bindToggleMenuEvent();
	$("#sidebar").slimscroll({
    	size: '3px',
    	height: 'auto'
  	});
	
	var mtop = parseInt($(".after-header").css("margin-top"));
	$(".after-header").css("margin-top", mtop-3);
	$(window).resize(resetWidth);
	header.hideLeftSideMenu(true);
})

function resetWidth() {
	var ww = Browser.Window.width();
	var w = Math.max((ww / 5.5), left_min_width);
	
	if ($("#sidebar:visible").length>0) {
		$("#left-div").width(w);
		$("#sidebar").width(w - 1);
		$("#main-tabs").width(ww - w - 4);
	}else {
		$("#sidebar").width(ww - 32);
		$("#main-tabs").width(ww - 36);
	}
	indexPage.setMainHeight();
	
	//$(".menu-header").text($("#sidebar").height());
	
	$("#sidebar").slimscroll({
		size: '3px',
    	setHeight: $("#sidebar").height() - 2
  	});

	$("#left-menu").height($("#left-div").height() - 50);

}

function unloadPage() {
	header.destroy();
}
</script>

</html>