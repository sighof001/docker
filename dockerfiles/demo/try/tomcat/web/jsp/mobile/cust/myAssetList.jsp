<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>资产列表</title>
<!-- UC强制全屏 -->
<meta name="full-screen" content="yes">
<!-- QQ强制全屏 -->
<meta name="x5-fullscreen" content="true">
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/js/dropload/dist/dropload.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dropload/dist/dropload.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/mobile/cust/myAssetList.js"></script>
<script type="text/javascript">
var type = '${type}';
</script>
<style type="text/css">
.entrust-block {
	width: 33.1%;
	border-right: 1px solid #e5e5e5;
}

.but-pay {
	line-height: 0.3;
}
</style>

</head>

<body>
	<div data-role="page" id="pageone" class="page" data-theme="i">
		<!-----header start----->
		<div data-role="header" data-position="fixed" class="inside-header">
			<a data-rel="back" href=""
				class="btnwordwhite btnnobg icon-leftarrow-1"></a>
			<h1>资产列表</h1>
			<a href="###" class="btnwordwhite btnnobg" rel="external"></a>
			<input type="hidden" id="type" name="type" value="${type }">
		</div>
		
		<!-----header end---->
		<div class="inside-main data-container content">
			<div class="selectNavUl ui-grid-c clearfix">
			    <a class="entrust-block" id="all" onclick="turnPage('all')" >全部</a>
			    <a class="entrust-block" id="no" onclick="turnPage(2)" >委托中</a>
			    <a class="entrust-block" id="yes" onclick="turnPage(3)" >已结束</a>
		    </div>
			<div class=" lists"></div>
		</div>
	</div>
</body>
</html>
