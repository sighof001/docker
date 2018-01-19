<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach items="${page.data}" var="order">
	<a class="inside-list inside-list2" rel="external">
		<div class="inside-listcon clearfix">
			<div class="clearfix">
				<div class="fl list-title f32 fb">${order.goodsName}</div>
			</div>
			<div class="ui-grid-a">
				<div class="ui-block-a" style="width:100%;">转出日期:${order.createTimeStr}</div>
			</div>
		</div>
		<div class="inside-listcon clearfix">
			<div class="fl list-title">本金</div>
			<div class="fr list-info color-orange">${order.priceText }元</div>
		</div>
		<div class="inside-listcon clearfix">
			<div class="fl list-title">利息差</div>
			<div class="fr list-info color-orange">${order.interestText }元</div>
		</div>
		<div class="inside-listcon clearfix">
			<div class="fl list-title">手续费</div>
			<div class="fr list-info color-orange">${order.poundageText }元</div>
		</div>
		<div class="inside-listcon clearfix">
			<div class="fl list-title">转出总额</div>
			<div class="fr list-info color-orange">${order.amountText }元</div>
		</div>
		<%-- <div class="inside-listcon clearfix">
			<div class="fl list-title">审核状态</div>
			<div class="fr list-info color-orange">${order.checkStatusText}</div>
		</div>
		<div class="inside-listcon clearfix">
			<div class="fl list-title">付款状态</div>
			<div class="fr list-info color-orange">${order.payStatusText}</div>
		</div>  --%>
	</a>
</c:forEach>
