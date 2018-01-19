<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>委托投资</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="/jsp/pc/pc_include.jsp" flush="true"></jsp:include>
</head>
<script>
$(document).ready(function(e) {
	locationIndex(1);//导航栏定位
}); 
</script>
<body>
<!-----头部start------>
<jsp:include page="/jsp/pc/top_include.jsp" flush="true"></jsp:include>
<!-----头部end----------> 

<c:forEach items="${tryGoods}" var="goods" varStatus="i">
<!------委托投资一个产品start--------->
<div class="container entrust_wrap" <c:if test="${i.index != 0 }">style="margin-top: 5px"</c:if>>
	<div class="panel panel-default entrust_panel">
	    <div class="panel-heading">
	        <h2 class="panel-title">${goods.goodsName }</h2>
	    </div>
	    <div class="panel-body container">
	     <div class="row entrust_con">
		     <div class="col-lg-2 bigdta_wrap">
			     <p class="bigdata"><fmt:formatNumber value="${goods.rate*100}" pattern="#" type="number"/><em>%</em></p>
			     <p>年化收益率</p>
		     </div>
		     <div class="col-lg-2">
		     	<p>委托期限</p>
		     	<c:if test="${goods.term != 0}">
			     	<p>${goods.term}天</p>
			    </c:if>
			    <c:if test="${goods.term == 0}">
			     	<p>随时取</p>
			    </c:if>
		     </div>
		     <div class="col-lg-2">
		     	<p>返息方式</p>
		     	<c:if test="${goods.term != 0}">
		     		<!-- <p>按月返息</p> -->
		     		<p>${goods.payInterestTypeStr}</p>
		     	</c:if>
			    <c:if test="${goods.term == 0}">
		     		<p>按日返息</p>
		     	</c:if>
		     </div>
		     <div class="col-lg-2">
		     	 <p>万元年收益</p>
			     <p><fmt:formatNumber value="${goods.rate*10000}" pattern="#.00" type="number"/>元</p>
		     </div>
		     <div class="col-lg-4">
		     	<a href="<%=request.getContextPath() %>/webEntrust/pcEntrustDetail/${goods.id}.do" class="customize_btn login">立即委托</a>
		     </div>
	     </div>
	    </div>
	    <div class="panel-footer">保障方式：保险本息全额承保</div>
	</div>
</div>
<!-------委托投资一个产品end--------> 
</c:forEach>

<!-----网站底部start-------->
<jsp:include page="/index/buttons.do" flush="true"></jsp:include>
<!------网站底部end------->
<!-- 登录弹出框start -->
<jsp:include page="/jsp/pc/login_include.jsp" flush="true"></jsp:include>
<!--弹出框start -->
</body>
</html>
