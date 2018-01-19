<%@page import="com.investfinancing.constants.DictValue"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>充值成功</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<script src="<%=request.getContextPath() %>/js/mobile/order/payResult.js"></script>
</head>

<body>
	<div data-role="page" class="page" data-theme="i">
		<!-----header start----->
		<div data-role="header" data-position="fixed" class="inside-header">
			<a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
			<h1>充值成功</h1>
			<a href="<%=request.getContextPath() %>/myView/myViewMain.do" class="btnwordwhite btnnobg f24" rel="external">完成</a>
		</div>
		<!-----header end---->
		<!---提示信息start--->
		<div class="inside-main">
			<div class="wrap">
				<div class="wrap-tip txtcenter">

					<p>充值成功，充值金额为</p>
					<p class="color-orange">
						<span class="f48">${order.amount}</span><span>元</span>
					</p>
					<a href="<%=request.getContextPath() %>/webEntrust/productsList/<%=DictValue.GOODS_TYPE_NORMAL %>.do" class=" color-blue f28" rel="external">马上去委托</a>
				</div>
			</div>
		</div>
		<!---提示信息end--->
	</div>
</body>
</html>
