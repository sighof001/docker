<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

      <c:forEach items="${page.data }" var="data">
	     <a class="inside-listcon autoheight-list clearfix" >
		      <div class="fl">
			      <p class="maintitle">
				      <span>${data.createTimeStr }</span>
				      <span>${data.orderTypeText }</span>
			      </p>
			      <p class="explain">${data.id }</p>
		      </div>
		      <div class="fr  color-grey">
			     <c:choose>
				     <c:when test="${data.orderType == '1'}">
				     	<p class="price color-yellow">+${data.amount }</p> 
				     </c:when>
			     	 <c:when test="${data.orderType == '3'}">
			     	 	<p class="price color-green">-${data.amount }</p> 
			     	 </c:when>
			     	<c:otherwise>
			     		<p class="price color-orange">+${data.amount }</p> 
			     	</c:otherwise>
			     </c:choose>
			     
			      <p class="explain  txtcenter">完成</p>
		      </div>
		 </a> 
	   </c:forEach>