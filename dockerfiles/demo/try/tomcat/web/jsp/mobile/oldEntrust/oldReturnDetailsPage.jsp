<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

      <c:forEach items="${page.data}" var="data" >
	     <a class="inside-listcon autoheight-list clearfix" >
		      <div class="fl">
		       <p class="maintitle">付息</p>
			      <p class="explain">${data.tradeDateText}</p>
		      </div>
		      <div class="fr  color-grey">
				  <p class="price color-yellow">+${data.amount}</p> 
				    <p class="explain  txtcenter">已返息</p>
		      </div>
		 </a> 
	   </c:forEach>