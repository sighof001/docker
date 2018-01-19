<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

      <c:forEach items="${page.data }" var="data" varStatus="i">
	     <a class="inside-listcon autoheight-list clearfix" >
		      <div class="fl">
			      <p class="maintitle">
				      <span>第${page.resultSize - page.rowNum + 1 - i.count }期</span>
				      <span>${data.orderTypeText }</span>
			      </p>
			      <p class="explain">${data.createTimeStr }</p>
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
			     
			      <p class="explain  txtcenter">已返息</p>
		      </div>
		 </a> 
	   </c:forEach>