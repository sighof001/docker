<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>邮箱绑定情况</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<body>
	<div data-role="page" class="page" data-theme="i">
		<!-----header start----->
		<div data-role="header" data-position="fixed" class="inside-header">
			<!-- <a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a> -->
			<h1>邮箱绑定情况</h1>
			<a href="###" class="btnwordwhite btnnobg f24" rel="external"></a>
		</div>
		<!-----header end---->
		<!---提示信息start--->
		<div class="inside-main">
			<div class="wrap">
				<div class="wrap-tip">
					<c:choose>
						<c:when test="${result}">
							<p class="icon icon-big icon-hook"></p>
							<p>绑定成功</p>
						</c:when>
						<c:otherwise>
							<p class="icon icon-big icon-close-1"></p>
							<p>绑定失败,请重新绑定</p>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<!--底部start--->
		<jsp:include page="/jsp/mobile/buttons.jsp" flush="true"></jsp:include>
		<!---底部end-->
	</div>
</body>
</html>
