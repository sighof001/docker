<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach items="${page.data}" var="order">
	<a class="inside-list inside-list2" rel="external">
		<div class="inside-listcon clearfix">
			<div class="clearfix"
				onclick="return false;">
				<div class="fl list-title f32 fb">${order.id}</div>
			</div>
			<div class="ui-grid-a">
				<div class="ui-block-a" style="width:100%;">充值日期:${order.createTimeStr}</div>
			</div>
		</div>
		<div class="inside-listcon clearfix">
			<div class="fl list-title">充值金额</div>
			<div class="fr list-info color-orange">${order.amount }元</div>
		</div>
		<div class="inside-listcon clearfix">
			<div class="fl list-title">支付状态</div>
			<div class="fr list-info color-orange">${order.payStatusText}</div>
		</div> 
		<c:if test="${order.canPay}">
			<div class="inside-listcon clearfix">
				<div class="fr list-info color-orange">
					<input type="button" value="继续支付" class="but-pay" id="pay"
						onclick="javascript:location.href='<%=request.getContextPath()%>/order/payEdit.do?orderId=${order.id}';" />
				</div>
			</div>
		</c:if>
	</a>
</c:forEach>
