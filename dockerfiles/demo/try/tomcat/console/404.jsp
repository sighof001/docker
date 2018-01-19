<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<TITLE>404错误页面</TITLE>
<%
	String path = request.getContextPath();
%>	
<link rel="stylesheet" type="text/css" href="<%=path%>/css/frame.css" />
</head>
<body>
	<DIV class="container wordwrap clearfix center">
		<IMG class=img-notfound src="<%=path%>/image/notfound.gif">
		<P style="FONT-SIZE: 24px; LINE-HEIGHT: 70px">啊~哦~ 您要查看的页面不存在或已删除！</P>
		<P style="MARGIN-BOTTOM: 30px">请检查您输入的网址是否正确，或者点击链接继续浏览空间</P>
		<P style="FONT-SIZE: 14px; LINE-HEIGHT: 20px">
			您可以回到 <A href="<%=path%>/">网站首页</A> 或到<A
				href="<%=path%>/help.html"
				target=_blank>帮助中心</A><BR>如若不能解决您的问题，请进入<A
				href="#" target=_blank>投诉中心</A>或者<A
				href="#" target=_blank>客服</A>提出建议^_^
		</P>
	</DIV>
</body>
</html>