  <%@ page language="java" pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="<%=request.getContextPath() %>/pcjs/pc/entrust/entrustOrderView.js"></script>
 <!------个人中心右侧start-------->
    <div class="col-sm-9 personal_right  ">
      <div class="rd_top">
      <div class=" container-fluid  bgwhite">
    <div class="row">
    <div class="col-sm-12 entrustdetail_left ">
      <div class="row">
      <%-- <a class="pull-right" href="<%=request.getContextPath()%>/myView/pcMyAssetView.do?menuId=myentrust">返回</a> --%>
      	<input type="hidden" id="orderId" value="${order.id }"/>
      	<input type="hidden" id="assetTerm" value="${order.term }"/>
      	<input type="hidden" id="goodsId" name="goodsId" value="${order.goodsId }"/>
      	<input type="hidden" id="amount" name="amount" value="${order.amount }"/>
      	<input type="hidden" id="goodsType" name="goodsType" value="${order.goodsType }"/>
        <div class="col-sm-12 entrustdetail_name"><span>${order.goodsName }</span></div>
        <div class="col-sm-12 borderbtline mar10"></div>
        <div class="col-sm-4">委托金额：<span>${order.amountText} 元</span></div>
        
        <c:if test="${order.term != 0 }">
        	<div class="col-sm-4">委托期限：<span>${order.term }天</span></div>
        </c:if>
        <div class="col-sm-4">委托时间：<span>${order.createDateText}</span></div>
        <div class="col-sm-4">保障方式：<span>保险本息全额承保</span></div>
        <c:if test="${!order.fp}">
        	<div class="col-sm-4">电子保单：<a class="downloadPolicy">点击下载</a></div>
        	<div class="col-sm-4">年化收益率：<span>${order.rateText }</span></div>
        </c:if>
        <c:if test="${order.fp}">
        	<div class="col-sm-4">电子保单：<a class="downloadPolicyFp">点击下载</a></div>
        </c:if>
        <!-- <div class="col-sm-4">委托合同：<a href="###">点击下载</a></div> -->
      </div>
    </div>
 
  </div>
</div>
</div>
 
</div>