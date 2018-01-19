<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>金达投融易产品展示</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/mobile/entrust/entrustDetails.js"></script>
</head>
<style>
.enable_icon{
background-color: #ff6d22;

}


</style>

<body>
<div data-role="page" class="page"  data-theme="i"> 

  <!-----header start----->
  <div data-role="header" data-position="fixed" class="inside-header"> <a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
		<h1>${goods.goodsName}</h1>
     </div>
  <!-----header end---->
  <div class="inside-main"> 
    <!----16% start--->
    <div class="product-sum-top">
      <div class="product-sum-topcon">
      	<c:if test="${goods.fp}">
        <%-- <p class="f36 color-ligntblue"><a href="<%=request.getContextPath() %>/fp/fpRateList.do" rel="external">查看收益率</a></p> --%>
      <a href="<%=request.getContextPath() %>/fp/fpRateList.do" rel="external">  <p class="f36 color-ligntblue">查看收益率</p></a>
        <%-- <p class="f48 fb">
        	<fmt:formatNumber value="${maxRate * 100}" pattern="#.00" type="number"/>%
        </p> --%>
      	</c:if>
      	<c:if test="${!goods.fp}">
      	<p class="f24 color-ligntblue">预期年化率</p>
        <p class="f48 fb">
        	<fmt:formatNumber value="${goods.rate * 100}" pattern="#" type="number"/>%
        	<input type="hidden" id="rate" name="rate" value="${ goods.rate}">
        </p>
        </c:if>
      </div>
    </div>
    <!---16% end---> 
    <!----委托等信息 start----->
    <div class="product-sum-bottom ui-grid-a">
      <div class="ui-block-a">
        <div class="sum-bottom-left">
          <p class="f24 color-ligntblue">委托期限</p>
          <p>${goods.termStr}</p>
        </div>
      </div>
      <div class="ui-block-b">
        <div class="sum-bottom-right">
          <p class="f24 color-ligntblue">起投金额(元)</p>
          <p id="startAmount">${goods.startAmount }</p>
        </div>
      </div>
    </div>
    <!----委托等信息 end-----> 
    <!----一个产品信息 start------>
    <div class="inside-list"> <a class="inside-listcon clearfix" >
      <div class="fl list-title">返息方式</div>
      <div class="fr list-info color-grey">${goods.payInterestTypeStr}</div>
      </a> 
     </div>
    <!-----一个产品信息 end----> 
    
    <div class="inside-list"> 
     <a class="inside-listcon clearfix" href="<%=request.getContextPath() %>/webEntrust/policyTmplet.do" rel="external">
      		<div class="fl list-title">保险保单模板</div>
      		<div class="fr list-info color-grey icon-rightarrow-1"></div>
      </a> 
      <a class="inside-listcon clearfix" href="<%=request.getContextPath() %>/webEntrust/entrustContract.do" rel="external">
      		<div class="fl list-title">产品委托合同</div>
      		<div class="fr list-info color-grey icon-rightarrow-1"></div>
      </a> 
      <a class="inside-listcon clearfix" >
	      <div class="fl list-title">保障方式</div>
	      <div class="fr list-info color-grey">保险本息全额承保</div>
      </a> 
      </div>

	<div class="inside-list">
		<a class="inside-listcon clearfix">
			<div class="fl list-title" style='height:auto; line-height: 0.7rem !important;'>${goods.description }</div>
		</a>
	</div>
			<!--
    <div class="inside-list"> <a class="inside-listcon clearfix" href="###">
      <div class="fl list-title">委托记录</div>
      <div class="fr list-info color-grey icon-rightarrow-1">
        <div class="fr">已有<span class="color-orange">2300</span>人次委托</div>
      </div>
      </a> </div>
    
    
    <div class="buy-tip f20 color-orange"><span>15点前到账当天计息，15点后到账次日计息</span></div>
    -->
  </div>
  
  <!----底部start------>
  <div data-role="footer" data-position="fixed" class="inside-detail-footer"> 
     <!---投资额计算start--->
     <form id="form" name="form">
  		<input type="hidden" id ="id" name="id" value="${goods.id}" />
  		<input type="hidden" id="term" name="term" value="${goods.term}" />
  		<input type="hidden" id="goodsType" name="goodsType" value="${goods.goodsType}" />
  		<input type="hidden" id="increaseAmount" name="increaseAmount" value="${goods.increaseAmount }">
	    <div class="ui-grid-a f24">
		     <div class="ui-block-a txtleft">
		       <p class="color-lightgray">账户余额(元)</p>
		       <p class="color-grey" id="amount" >${custInfo.custAmount }</p>
		     </div>
		     <div class="ui-block-b txtright">
		       <c:if test="${goods.current }">
		     		<p class="color-lightgray">预计每日可收益(元)</p>
		       </c:if>
		       <c:if test="${!goods.current }">
		     		<p class="color-lightgray">预计总收益(元)</p>
		       </c:if>
		       <p class="color-orange" id="receipts">0.00</p>
		     </div>
		</div>
		<div class="inside-detail-count clearfix">
			<a class="detail-minus  icon-minus" href="###"></a>
			<div class="detail-input f32">
				<p>
					<input type="number" id="money" name="money" value="${goods.startAmount }"
						class="inputtxt" data-role="none" />
				</p>
			</div>
			<a class="detail-add icon-add" href="###"></a>
		</div>
		<sapn style="color:red;display:none" id="entrustErrer"></sapn>
	</form>
    <!---投资额计算end--->
   
    <a  id="btn-submit"  class="btn-submit btnnobg bgorange btnwordwhite" >立即委托</a>
    <!--弹出窗口start---->
    <div data-role="popup" id="pwdPopup" data-overlay-theme="b" data-position-to="window" class="popup-wrap" >
		<a href="#" data-rel="back"
			class="popup-close ui-btn-right icon-close-1"></a>
		<div class="pop-title">请输入支付密码</div>
		<div class="pop-con">
				<ul class="ul-list">
					<li>
						<input id="orderId" name="orderId" type="hidden">
						<input id="payPassword" name="payPassword" type="password"class="inputtxt" /> 
						<sapn style="color:red;display:none" id="error"></sapn>
					</li>
				</ul>
			<input type="button" value="确定" class=" btn" id="payBtn" data-role="none" />

		</div>
	</div>
    <!----弹出窗口end-----> 
   </div>

  <!----底部end------> 
</div>
  
</body>
</html>
