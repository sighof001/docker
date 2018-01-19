<%@page import="com.investfinancing.constants.DictValue"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>金达投融易首页</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/swiper.min.css">
<script src="<%=request.getContextPath() %>/js/swiper.jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/js/mobile/index.js">
</script>
<script>
$(document).ready(function(e) {
    var swiper = new Swiper('.swiper-container', {
           pagination: '.swiper-pagination',
            paginationClickable: true,
            speed: 2000,
            loop: true,
            observer:true,
            observeParents:true,
            autoplayDisableOnInteraction : false,
            autoplay:1500
    }); 
});

</script>
<style type="text/css">
.home-top-nav span{ display:block; text-align:center; font-size:31px; color:#333;}

</style>
</head>

<body>
<div data-role="page" class="page"  data-theme="i">
   <!---header start---->
  <div data-role="header"  class="home-header clearfix">
  <c:if test="${custInfo == null }">
   		<a href="<%=request.getContextPath() %>/login/loginView.do" class="fl icon icon-user-2" rel="external"></a>
  </c:if>
  <c:if test="${custInfo != null }">
   		<a href="<%=request.getContextPath() %>/myView/myViewMain.do" class="fl icon icon-user-2" rel="external"></a>
   </c:if>
  <a href="<%=request.getContextPath() %>/notice/noticeList/2.do" class="fr icon icon-news" rel="external"></a> 
   	 
  </div>
  <!-----header end------>
  
  <div data-role="main" class="main">
    <!-- banner start-->
    <div class="swiper-container banner">
      <div class="swiper-wrapper">
       <c:forEach items="${trySysConfigImageKeyList}" var="item">
        <div class="swiper-slide" style="background-image:url(<%=request.getContextPath()%>/index/pic.do?sys_value=${item.sysValue})"></div>
        <%-- <div class="swiper-slide" style="background-image:url(<%=request.getContextPath() %>/images/banner2.jpg)"></div>
        <div class="swiper-slide" style="background-image:url(<%=request.getContextPath() %>/images/banner3.jpg)"></div> --%>
    </c:forEach>
      </div>
      <div class="swiper-pagination"></div>
    </div>
    <!-- banner end -->
    <!---topimage nav start--->
    <div class="ui-grid-c home-top-nav">
	    <a href="<%=request.getContextPath() %>/loanApplication/loanApplicationView.do" class="ui-block-a ui-link" rel="external">
	    <span class="home-top-nav-icon home-top-nav-pink icon-wallet"></span>
	    <span class="span">贷款申请</span>
	    </a>
	    <a href="<%=request.getContextPath() %>/webEntrust/productsList/<%=DictValue.GOODS_TYPE_NORMAL %>.do" class="ui-block-b" rel="external">
	    	<span class="home-top-nav-icon home-top-nav-cyan icon-money"></span>
	    	<span  class="span">委托投资</span>
	    </a>
	      <a href="<%=request.getContextPath() %>/fp/publicFinanceList.do" class="ui-block-c" rel="external" >
    <span class="home-top-nav-icon home-top-nav-orange icon-heart"></span>
    <span  class="span">公益金融</span>
    </a>
	    <a href="<%=request.getContextPath() %>/help/insurance.do" class="ui-block-d" rel="external" >
	    	<span class="home-top-nav-icon home-top-nav-blue icon-shield"></span>
	    	<span  class="span">保险保障</span>
	    </a>
    </div>
    <!---topimage nav end--->
    
    <!----notice start------->
   <div class="home-notice">
    <span class="icon icon-notice-1"></span>
    <a class="home-notice-title f24">年化收益率高达<fmt:formatNumber value="${maxRate*100}" pattern="#" type="number"/>%</a>
    </div>
    <!----notice end------->
    
    <!----products start---->
    <div class="home-products">
    <!----products title start---->
      <div class="home-products-title  borderbt-grey clearfix">
        <h2 class="fl">
        	各期存款
        </h2>
        <span class="title-tip fr">已有${count}人在投</span>
      </div>
     <!----products title end---->
     
   <!-- 遍历产品-->
   <c:forEach items="${tryGoods}" var="goods" varStatus="i">
   	<c:if test="${i.count<=4}">
     <!--one products item start--->
      <a class="products-item" href="<%=request.getContextPath() %>/webEntrust/entrustDetails/${goods.id }.do" rel="external">
      <div class="products-item-top">
        <div class=" products-item-con investment-interest">
          <p class="color-orange f48 fb"><fmt:formatNumber value="${goods.rate*100}" pattern="#" type="number"/>%</p>
          <p class="color-grey f24">年化收益率</p>
        </div>
        <div class="products-item-con investment-type">
        <p><span class="color-black">${goods.goodsName}</span>
        <c:if test="${goods.term==0}">
        <span class="color-gray f20">【按日返息】</span>
        </c:if>
        <c:if test="${goods.term!=0}">
        <span class="color-gray f20">【${goods.payInterestTypeStr}】</span>
        </c:if>
        </p>
        <p class="color-gray f24">每万元年收益<span class="color-orange f28"><fmt:formatNumber value="${goods.rate*10000}" pattern="#" type="number"/></span>元</p>
        </div>
        <div class="products-item-con investment-go icon-rightarrow-1"></div>
      </div>
      <div class="mtop12 color-lightgray f24">保障方式：保险本息全额承保</div>
      </a>
     <!--one products item end---> 
     </c:if>
     </c:forEach>
     </div>
      <!----products end---->
     <!----products start---->
    <!----products end---->
  </div>
  <!--底部start--->
 <jsp:include page="/jsp/mobile/buttons.jsp" flush="true"></jsp:include>
 <!---底部end--> 
</div>
</body>
</html>