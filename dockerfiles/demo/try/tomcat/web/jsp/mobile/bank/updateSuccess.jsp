<%@page import="com.investfinancing.constants.DictValue"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>设置成功</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
</head>
<body>
	<div data-role="page" class="page" data-theme="i">
		<!-----header start----->
		<div data-role="header" data-position="fixed" class="inside-header">
			<a data-rel="back" class="btnwordwhite btnnobg"></a>
			<h1>设置成功</h1>
			<a href="###" class="btnwordwhite btnnobg f24" rel="external"></a>
		</div>
		<!-----header end---->
		<!---提示信息start--->
		<div class="inside-main">
			<div class="wrap">
				<div class="wrap-tip">
					<p class="icon icon-big icon-hook"></p>
					<p>
						提交成功<span id="show" />
					</p>
					<p class="padtop36">
						<a class="btn-submit2 bgorange btnlink" data-role="none"
							rel="external" href="<%=request.getContextPath() %>/webEntrust/productsList/<%=DictValue.GOODS_TYPE_NORMAL %>.do" />马上去委托</a>
					</p>
				</div>
			</div>
		</div>
		<!---提示信息end--->
		<!--底部start--->
		<jsp:include page="/jsp/mobile/buttons.jsp" flush="true"></jsp:include>
		<!---底部end-->
	</div>
</body>
</html>
