<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>委托投资</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
</head>

<body>
<div data-role="page" class="page"  data-theme="i"> 
  <!-----header start----->
  <div data-role="header" data-position="fixed" class="inside-header"> <a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
    <h1>委托投资</h1>
    </div>
  <div class="inside-main"> 
    
    
    <!--one products item start---> 
	<c:forEach items="${tryGoods}" var="goods">
	<a rel="external" class="card-wrap">
		<div class="productlist-title clearfix">
					<h3 class="fl color-black fborder">${goods.goodsName}</h3>
			<c:if test="${!goods.current }">
			<div class="fr color-grey f24">
				每万元到期收益<span class="color-orange"><fmt:formatNumber value="${goods.rate*100*100}" pattern="#" type="number"/></span>元
			</div>
			</c:if>
		</div>
		<div class="ui-grid-b productlist-con borderbt-grey">
			<div class="ui-block-a">
				<p class="f48 color-orange fb"><fmt:formatNumber value="${goods.rate*100}" pattern="#" type="number"/>%</p>
				<p class="f20 color-grey">年化收益率</p>
			</div>
			<div class="ui-block-b">
				<c:if test="${goods.term > 0}">
					<p>定期${goods.term}天</p>
				</c:if>
				<c:if test="${goods.term == 0}">
					<p>活期</p>
				</c:if>
				<p class="f20 color-grey">${ goods.startAmount}元起投</p>
			</div>
			<div class="ui-block-c">
				<div class="btn-submit-small" onClick="window.location.href='<%=request.getContextPath() %>/webEntrust/entrustDetails/${goods.id }.do'" >立即委托</div>
			</div>
		</div>
		<div class="clearfix productlist-tip">
			<div class="fl">保障方式：保险本息全额承保</div>
		</div>
	</a>
	</c:forEach>
	<!--one products item end---> 
   
 
    
  </div>
  <!--底部start--->
 <jsp:include page="/jsp/mobile/buttons.jsp" flush="true"></jsp:include>
  <!---底部end--> 
</div>
</body>
</html>
