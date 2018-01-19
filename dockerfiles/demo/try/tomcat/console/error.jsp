<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<%@ include file="header/header.jsp" %>
	<TITLE>错误页面</TITLE>
</head>
<body>
	<DIV class="container wordwrap clearfix">
		<IMG class=img-notfound src="<%=path%>/image/error.jpg">
		<P style="FONT-SIZE: 24px; LINE-HEIGHT: 70px">您访问的页面出现错误</P>
		<P class="text-center" style="MARGIN-BOTTOM: 30px"><strong><%=error%></strong></P>
		<P style="FONT-SIZE: 14px; LINE-HEIGHT: 20px">
			您可以回到 <A href="<%=path%>/index.html">网站首页</A> 或到<A
				href="<%=path%>/help.html"
				target=_blank>帮助中心</A><BR>如若不能解决您的问题，请进入<A
				href="#" target=_blank>投诉中心</A>或者<A
				href="#" target=_blank>空间客服</A>提出建议^_^
		</P>
	</DIV>
</body>
</html>