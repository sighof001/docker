<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>转出记录</title>
<!-- UC强制全屏 -->
<meta name="full-screen" content="yes">
<!-- QQ强制全屏 -->
<meta name="x5-fullscreen" content="true">
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<link rel="stylesheet" href="<%=request.getContextPath() %>/js/dropload/dist/dropload.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/dropload/dist/dropload.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/mobile/order/extractList.js"></script>
<style type="text/css">
.entrust-block{
    width: 33.1%;
    border-right:1px solid #e5e5e5;
}

.but-pay{
	    line-height: 0.3;
}
</style>

</head>

<body>
<div data-role="page" id="pageone" class="page"  data-theme="i"> 
  <!-----header start----->
   <div data-role="header" data-position="fixed" class="inside-header"> 
   <a data-rel="back" href="" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
    <h1>转出记录</h1>
   <a href="###" class="btnwordwhite btnnobg"  rel="external"></a>
  </div>
  <input type="hidden" id="time" name="time" value="${time }">
  <!-----header end---->
  <div class="inside-main data-container content"> 
  	<div class="selectNavUl ui-grid-c clearfix">
		<a class="ui-block-a" style="width: 33%;" id="all" onclick="turnPage('all')">全部</a> 
		<a class="ui-block-b" style="width: 33%;" id="oneMonth" onclick="turnPage('-30')">最近1个月</a> 
		<a class="ui-block-c" style="width: 33%;" id="threeMonth" onclick="turnPage('-90')">最近3个月</a>
	</div>
  
  	<div class="lists"></div>   
  </div>
</body>
</html>
