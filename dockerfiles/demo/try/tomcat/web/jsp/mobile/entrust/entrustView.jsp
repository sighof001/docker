<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>资产明细</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/mobile/entrust/entrustView.js"></script>
</head>

<body>
<div data-role="page" class="page"  data-theme="i">
  <!-----header start----->
  <div data-role="header" data-position="fixed" class="inside-header"> <a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
    <h1>资产明细</h1>
  </div>
  <input type ="hidden" id="orderId" name="orderId" value="${order.id}"/>
  <!-----header end---->
  <div class="inside-main">
  <!----委托头部 start--->
    <div class="product-sum-top delegatedetail-top">
    <div class="ui-grid-a delegatedetail-toplink"> 
     <div class="ui-block-a">
     </div>
     <div class="ui-block-b">
     <a href="<%=request.getContextPath()%>/webEntrust/returnDetails/${asset.id }.do" rel="external" >返息明细</a>
     </div>
     </div>  
      <div class="product-sum-topcon delegatedetail-sum-topcon">
        <p class="f24 ">您已委托了${interestDay} 天</p>
        <p class="f48 fb">${asset.amount }<span class="size-small">元</span></p>
      </div>
    </div>
    <!---委托头部 end--->
    <!----委托头部收益 start----->
    <div class="product-sum-bottom delegatedetail-sum-bottom ui-grid-a">
      <div class="ui-block-a">
        <div class="sum-bottom-left">
          <p class="f24 color-ligntblue">已返收益(元) </p>
          <p>${incomeAlready }</p>
        </div>
      </div>
      <div class="ui-block-b">
        <div class="sum-bottom-right">
          <p class="f24 color-ligntblue">到期收益(元)</p>
          <p>${incomeEnd }</p>
        </div>
      </div>
    </div>
    <!----委托头部收益 end----->
    <!----产品信息 start------>
    <div class="inside-list"> 
    <c:if test="${!asset.current }">
	     <a class="inside-listcon clearfix" >
		      <div class="fl list-title">到期时间</div>
		      <div class="fr list-info color-grey">${asset.endDateText }</div>
	      </a>
     </c:if>
       <a class="inside-listcon clearfix" >
      <div class="fl list-title">委托时间</div>
      <div class="fr list-info color-grey">${asset.beginDateText }</div>
      </a> 
       <!-- <a class="inside-listcon clearfix" >
      <div class="fl list-title">回款方式</div>
      <div class="fr list-info color-grey">按月返息</div>
      </a>  -->
    </div>
    <!-----产品信息 end---->
    
      <!----一个产品信息 start------>
    <div class="inside-list"> 
     <!-- <a class="inside-listcon clearfix" >
	      <div class="fl list-title">承保机构</div>
	      <div class="fr list-info color-grey">保险公司</div>
      </a> -->
       <a class="inside-listcon clearfix" >
	      <div class="fl list-title">保障方式</div>
	      <div class="fr list-info color-grey">保险本息全额承保</div>
      </a> 
    </div>
    <!-----一个产品信息 end---->

   <!----一个产品信息 start------>
    <%-- <div class="inside-list"> 
    <input type="hidden" id="policyUpload" value="${ order.policyUpload}">
    	<a class="inside-listcon clearfix" id='test' rel="external">
      		<div class="fl list-title">查看电子保单</div>
      		<div class="fr list-info color-grey icon-rightarrow-1"></div>
        </a>
    </div> --%>
    <!-----一个产品信息 end---->
 
  </div>
  
  <!----底部start------> 
  <div data-role="footer" data-position="fixed" class="footer">
    <div class="ui-grid-a f24 delegatedetail-footerbtn">
      <a class="ui-block-a"  rel="external">
      </a>
      <c:if test="${asset.status != '3' }">
	      <a class="ui-block-b extract" href="<%=request.getContextPath()%>/webEntrust/extract/${asset.id}.do" rel="external">
	      	 转出
	      </a>
      </c:if>
      <c:if test="${asset.status == '3' }">
	      <a class="ui-block-b" rel="external" style="background-color: #ddd;" >
	      	 转出
	      </a>
      </c:if>
      
      
     </div>
    </div>
  <!----底部end------>  
</div>
</body>
</html>
