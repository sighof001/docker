<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>保险保障</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<script src="<%=request.getContextPath() %>/js/mobile/help/insurance.js"></script>
<style type="text/css">
</style>
<script type="text/javascript">
$(function(){
	$(".insurance-btn").on("click",function(){
		ybDialog.alert("该功能暂未开放");
	});
	
});
</script>
</head>

<body>
	<div data-role="page" class="page bgwhite" data-theme="i">
		<!-----header start----->
		<div data-role="header" data-position="fixed" class="inside-header">
			<a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
			<h1>保险保障</h1>
		</div>
		<!-----header end---->
		<!---内容start--->
		<div data-role="content" class="inside-main insurance-main">
			<div class="bgimag">
				<%-- <a href="${url}" class="insurance-btn" rel="external">查询保单</a> --%>
				<a class="insurance-btn" rel="external">查询保单</a>
				<div class="bgimagbottom"></div>
			</div>

		</div>

		<!---内容end--->
	</div>
</body>
</html>
