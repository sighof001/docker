<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>404</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="/jsp/pc/pc_include.jsp" flush="true"></jsp:include>
</head>

<body>
<!-----头部start------>
<jsp:include page="/jsp/pc/top_include.jsp" flush="true"></jsp:include>
<!-----头部end----------> 
<!------404start--------->
<div class="bgwhite">
<div class="container error_container">
<div class="row">
	<div class=" col-sm-6 text-center">
		<img src="<%=request.getContextPath() %>/pcimages/404.png"/>
	</div>
	<div class="col-sm-6 error_wrap"><h2>糟糕!页面找不到了!</h2>
		<h4>实在抱歉，您所访问的页面迷路了...</h4>
		<div>
			<a href="<%=request.getContextPath() %>/" class="error_btn">返回首页</a>
		</div>
	</div>
</div>
</div>
</div>
<!-------404end--------> 

<!-----网站底部start-------->
<jsp:include page="/index/buttons.do" flush="true"></jsp:include>
<!------网站底部end------->
</div>
<!-- 登录弹出框start -->
<jsp:include page="/jsp/pc/login_include.jsp" flush="true"></jsp:include>
<!--弹出框start -->
</body>
</html>
