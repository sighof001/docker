  <%@ page language="java" pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="<%=request.getContextPath() %>/pcjs/pc/entrust/entrustOrderView.js"></script>
<style>
.sm_top{
    padding-left: 30px;
	margin-top: 60px;
}


</style>
 <!------个人中心右侧start-------->
    <div class="col-sm-9 personal_right  ">
      <div class="rd_top">
      <div class=" container-fluid  bgwhite">
    <div class="row">
    <div class="col-sm-12 entrustdetail_left ">
      <div class="row">
      <%-- <a class="pull-right" href="<%=request.getContextPath()%>/myView/pcMyAssetView.do?menuId=myentrust">返回</a> --%>
      	<input type="hidden" id="orderId" value="${order.id }"/>
        <div class="col-sm-12 entrustdetail_name"><span>${order.goodsName }</span></div>
        <div class="col-sm-12 borderbtline mar10"></div>
        <div class="col-sm-4">委托金额：<span>${order.amountText} 元</span></div>
        
        <c:if test="${order.term != 0 }">
        	<div class="col-sm-4">委托期限：<span>${order.term }年</span></div>
        </c:if>
        <div class="col-sm-4">委托时间：<span>${order.entrustDateText}</span></div>
        <div class="col-sm-4">到期时间：<span>${order.dueDateText}</span></div>
        <div class="col-sm-4">保障方式：<span>保险本息全额承保</span></div>
        <!-- <div class="col-sm-4">委托合同：<a href="###">点击下载</a></div> -->
        
        <div class="col-sm-10 sm_top" style="color:red;">温馨提示：<span>历史委托,如需转出,请联系客服人员!</span></div>
        
      </div>
    </div>
  </div>
   <!-------资金明细start----->
        <div class="title_wrap clearfix martop30">
          <div class="title pull-left">返息明细</div> </div>
        
        <div class="table_wrap">
          <table class="table table-striped table_con" id="table" url="/oldEntrust/pcEntrustOrderView.do?id=${order.id }">
            <tr>
              <!-- <th>期数</th> -->
              <th>返息时间</th>
              <th>返息金额（元）</th>
              <th>状态</th>
            </tr>
            <c:forEach items="${page.data}" var="pay" varStatus="i">
            	<tr>
	              <%-- <td>第${page.resultSize - page.rowNum + 1 - i.count }期</td> --%>
	              <td>${pay.tradeDateText }</td>
	              <td>${pay.amountText }</td>
	              <td>已返息</td>
            	</tr>
            </c:forEach>
              
          </table>
         
           <jsp:include page="/jsp/pc/pager.jsp"></jsp:include>
        </div>
      
        <!-------资金明细end------> 
</div>
</div>
 
</div>