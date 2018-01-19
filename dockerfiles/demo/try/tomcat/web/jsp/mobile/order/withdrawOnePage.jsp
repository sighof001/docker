<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach items="${page.data}" var="order">
	<a class="inside-list inside-list2" rel="external">
		<div class="inside-listcon clearfix">
			<div class="clearfix"
				onclick="javascript:location.href='<%=request.getContextPath()%>/order/withdrawDetail.do?id=${order.id}'">
				<div class="fl list-title f32 fb">${order.id}</div>
			</div>
			<div class="ui-grid-a">
				<div class="ui-block-a" style="width:100%;">提现日期:${order.createTimeStr}</div>
			</div>
		</div>
		<div class="inside-listcon clearfix">
			<div class="fl list-title">提现金额</div>
			<div class="fr list-info color-orange">${order.amount }元</div>
		</div>
		<div class="inside-listcon clearfix">
			<div class="fl list-title">审核状态</div>
			<div class="fr list-info color-orange">${order.checkStatusText}</div>
		</div>
		<div class="inside-listcon clearfix">
			<div class="fl list-title">付款状态</div>
			<div class="fr list-info color-orange">${order.payStatusText}</div>
		</div> 
	</a>
</c:forEach>
