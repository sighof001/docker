<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach items="${page.data}" var="loan">
	<a class="inside-list inside-list2" rel="external">
		<div class="inside-listcon clearfix">
			<%-- <div class="clearfix"
				onclick="return false;">
				<div class="fl list-title f32 fb">${loan.id}</div>
				<div class="fr list-info color-grey icon-rightarrow-1"></div>
			</div> --%>
			<div class="ui-grid-a">
				<div class="ui-block-a" style="width:100%;">申请日期:${loan.createTimeStr}</div>
			</div>
		</div>
		<div class="inside-listcon clearfix">
			<div class="fl list-title">贷款金额</div>
			<div class="fr list-info color-orange">${loan.amount }元</div>
		</div>
		<div class="inside-listcon clearfix">
			<div class="fl list-title">贷款类型</div>
			<div class="fr list-info color-orange">${loan.displayLoanType}</div>
		</div>
		<div class="inside-listcon clearfix">
			<div class="fl list-title">审核状态</div>
			<div class="fr list-info color-orange">${loan.displayCheckStatus}</div>
		</div> 
	</a>
</c:forEach>
