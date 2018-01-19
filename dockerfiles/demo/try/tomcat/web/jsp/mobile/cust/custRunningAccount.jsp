<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>余额明细</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<script
	src="<%=request.getContextPath()%>/js/mobile/cust/custRunningAccount.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/js/dropload/dist/dropload.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dropload/dist/dropload.min.js"></script>
<script>
var type = '${type}';
	/* $(document).ready(function(e) {
		fixtop(".inside-header", "selectNavUl");
	}); */
</script>
</head>

<body>
	<div data-role="page" id="pageone" class="page" data-theme="i">
		<!-----header start----->
		<div data-role="header" data-position="fixed" class="inside-header">
			<a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
			<h1>余额明细</h1>
			<a href="###" class="btnwordwhite btnnobg" rel="external"></a>
		</div>
		<!-----header end---->
		<div class="inside-main data-container content">
			<!----累计充值等信息 start----->
			<!----累计充值等信息 end----->
				<div class="selectNavUl ui-grid-c clearfix">
					<a class="ui-block-a" style="width: 33%;" id="all"
						onclick="turnPage('all')">全部</a> <a class="ui-block-b"
						style="width: 33%;" id="oneMonth" onclick="turnPage('-30')">最近1个月</a>
					<a class="ui-block-c" style="width: 33%;" id="threeMonth"
						onclick="turnPage('-90')">最近3个月</a>
				</div>
				<div class=" inside-list lists"></div>
			</div>
		</div>
</body>
</html>
