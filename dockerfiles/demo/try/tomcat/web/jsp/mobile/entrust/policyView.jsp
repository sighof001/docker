<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>保单</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
</head>

<body>
	<div data-role="page" class="page" data-theme="i">
		<!-----header start----->
		<div data-role="header" data-position="fixed" class="inside-header">
			<a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
			<h1>保单</h1>
			<!-- <a href="###" class="btnwordwhite btnnobg icon-news" rel="external"></a> -->
		</div>
		<!-----header end----->
		<!----认证信息start-->
		<div class="inside-main">
					<!-- <div class="panel-body">
						<h3>实名认证</h3>
						<p class="text-info">实名认证资料已经提交，等待业务员审核，请耐心等待；如果急需审核请联系客服!</p>
					</div> -->
						<table style="width: 100%; height: 100px;">
							<!-- <tr>
								<td><span>真实姓名：</span></td>
							</tr>
							<tr>
								<td><span>证件号码： </span></td>
							</tr>
							<tr>
								<td align="center"><span>身份证反面： </span></td>
							</tr> -->
							<tr>
								<td align="center">
								<img
									src="<%=request.getContextPath()%>/webEntrust/viewImages.do?alaramPic=${tryOrder.policyUpload}"
									id="policyUpload" name="policyUpload" style="width: 100%; height: 100%">
								</td>
							
							</tr>
						</table>
		</div>
		<!--底部start--->
	<%-- <jsp:include page="/jsp/mobile/buttons.jsp" flush="true"></jsp:include> --%>
	<!---底部end-->
	<!--认证信息end---->
	</div>
	
	</div>
</body>
</html>
