<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

      <c:forEach items="${page.data }" var="data">
	     <a class="inside-listcon autoheight-list clearfix" >
		      <div class="fl">
			      <p class="maintitle">
				      <span>${data.createTimeStr }</span>
				    <%--   <span>${data.availableBalance }</span> --%>
			      </p>
			      <p class="explain">余额:${data.availableBalance}</p>
		      </div>
		      <div class="fr  color-grey">
			     <c:choose>
				     <c:when test="${data.directionFlag == '1'}">
				     	<p class="price color-yellow">+${data.amount }</p> 
				     </c:when>
			     	 <c:when test="${data.directionFlag == '0'}">
			     	 	<p class="price color-green">-${data.amount }</p> 
			     	 </c:when>
			     	<c:otherwise>
			     		<p class="price color-orange">+${data.amount }</p> 
			     	</c:otherwise>
			     </c:choose>
			     
			      <p class="explain  txtcenter">${data.showOrderType}</p>
		      </div>
		 </a> 
	   </c:forEach>