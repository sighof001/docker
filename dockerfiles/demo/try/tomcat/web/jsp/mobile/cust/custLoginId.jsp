<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>用户名</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<script
	src="<%=request.getContextPath()%>/js/mobile/cust/custLoginId.js">
	
</script>
</head>

<body>
	<div data-role="page" class="page bgwhite" data-theme="i">
		<!-----header start----->
		<div data-role="header" data-position="fixed" class="inside-header">
			<a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
			<h1>用户名</h1>
			<!-----header end---->
			<!---登录信息start--->
			<div>
				<div class="wrap">
					<form id="form">
						<input id="id" name="id" type="hidden" value="${tryCustInfo.id}">
						<ul class="form-list">
							<li><label>用户名</label> <input id="loginId" name="loginId"
								type="text" data-role="none" class="inputtxt"
								value="${tryCustInfo.loginId}" autofocus /></li>
							<!--错误提示，默认隐藏 -->
							<div id="desc" style="display: none;">
								<label style="color: red;"></label>
							</div>
						</ul>
						<input class="btn-submit2 bgorange" type="button" data-role="none"
							value="确定" />
					</form>
				</div>
			</div>
			<!---登录信息end--->
			<!--底部start--->
			<jsp:include page="/jsp/mobile/buttons.jsp" flush="true"></jsp:include>
			<!---底部end-->
		</div>
</body>
</html>