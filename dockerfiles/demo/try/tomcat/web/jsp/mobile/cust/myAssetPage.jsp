<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach items="${page.data}" var="data">
	<a class="inside-list inside-list2" rel="external">
		<div class="inside-listcon clearfix">
			<div class="clearfix" onclick="window.location.href= '<%=request.getContextPath()%>/webEntrust/entrustView/${data.id}.do';return false">
				<div class="fl list-title f32 fb">${data.goodsName }</div>
				<div class="fr list-info color-grey icon-rightarrow-1"></div>
			</div>
			<div class="ui-grid-a">
				<div class="ui-block-a" style="width:100%;">申请日期:${data.createDateText}</div>
			</div>
		</div>
		<div class="inside-listcon clearfix">
			<div class="fl list-title">资金(元)</div>
			<div class="fr list-info color-orange">${data.amount}</div>
		</div>
		<div class="inside-listcon clearfix">
			<div class="fl list-title">状态</div>
			<div class="fr list-info color-orange">${data.displayStatus}</div>
		</div> 
	</a>
</c:forEach>
