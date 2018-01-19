<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>联系我们</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<style type="text/css">
</style>
<script type="text/javascript">
</script>
<script src="<%=request.getContextPath() %>/js/mobile/help/contact.js"></script>
</head>

<body>
<div data-role="page" class="page" data-theme="i">
	<!-----header start----->
	<div data-role="header" data-position="fixed" class="inside-header">
		<a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
		<h1>联系我们</h1>
		<a href="###" class="btnwordwhite btnnobg icon-news" rel="external"></a>
	</div>
	<!-----header end----->
	<div class="inside-main">
		<div class="wrap">
			<div class="news-detail-top">
				<h2 class="news-detailtitle">${comanyName }</h2>
			</div>

			<div class="news-detail">
				<p>地址：${address }</p>
				<p>电话：${tel }</p>
				<p>传真：${fax }</p>
				<p>官网网址：${officialUrl }</p>
				<p>平台网址：${platformUrl }</p>
			</div>
		</div>
	</div>
	<!--底部start--->
	<jsp:include page="/jsp/mobile/buttons.jsp" flush="true"></jsp:include>
	<!---底部end-->
</div>

</body>
</html>
