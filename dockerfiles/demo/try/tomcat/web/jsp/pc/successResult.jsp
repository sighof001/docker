<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>${title }</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="/jsp/pc/pc_include.jsp" flush="true"></jsp:include>
<script type="text/javascript">
$(document).ready(function(e) {
	locationIndex(tabView.locanTabView);//导航栏定位
});
</script>
</head>

<body>
	<!-----头部start------>
	<jsp:include page="/jsp/pc/top_include.jsp" flush="true"></jsp:include>
	<!-----头部end---------->

	<!------贷款内容start------->
	<div class="container martop30 clearfix" style="font-size:30px;color:navy;">
		${text }
	</div>
	<!---企业贷款end---------->
	<!-----网站底部start-------->
	<!------网站底部end------->
	<jsp:include page="/index/buttons.do" flush="true"></jsp:include>
	<!-- 登录弹出框start -->
	<jsp:include page="/jsp/pc/login_include.jsp" flush="true"></jsp:include>
	<!--弹出框start -->
</body>
</html>
