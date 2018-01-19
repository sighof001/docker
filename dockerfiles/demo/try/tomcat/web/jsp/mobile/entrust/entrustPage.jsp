<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
     <c:forEach items="${page.data}" var="order">
     <a class="inside-list inside-list2" rel="external">
       <div class="inside-listcon clearfix">
       		<div class="ui-grid-a" onclick="window.location.href= '<%=request.getContextPath()%>/webEntrust/entrustOrderView/${order.id}.do';return false">
      			<div class="fl list-title">${order.goodsName }</div>
      			<div class="fr list-info color-grey icon-rightarrow-1"></div>
			</div>
			
			<div class="ui-grid-a">
				<div class="ui-block-a">起息日:${order.beginDateText } </div>
				<c:if test="${order.endDateText != '' }">
					<div class="ui-block-b txtright">到期日:${order.endDateText }</div>
				</c:if>
			</div>
			
		</div>
		<c:if test="${!order.fp}">
		<div class="inside-listcon clearfix" >
      		<div class="fl list-title">年利率</div>
      		<div class="fr list-info color-grey">${order.rateText }</div>
      	</div>
      	</c:if>
      	<div class="inside-listcon clearfix" >
      		<div class="fl list-title">委托资金</div>
      		<div class="fr list-info color-orange">${order.amount }元</div>
      	</div>
       <div class="inside-listcon clearfix" >
      		<div class="fl list-title">状态</div>
      		<div class="fr list-info color-orange">${order.payStatusText} </div>
      </div>
      <div class="inside-listcon clearfix" >
      	<div class="fl list-title">委托日期</div>
      	<div class="fr list-info color-grey">${order.payTimeStr }</div>
      </div>
     </a>
     </c:forEach>
