<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/pcjs/pc/pager.js"></script>
<div class="text-center" id="showPage">
       <ul class="pagination">
       	<c:forEach var="num" begin="${page.beginPage }" end="${page.endPage }" step="1"> 
       		<c:if test="${num == page.beginPage }">
       			<li><a onclick="showPcPage(1);" title="首页">&laquo;</a></li>
        		<li><a onclick="showPcPage(${page.currentPage==1?1:page.currentPage -1});" title="上一页">&#139;</a></li>
       		</c:if>
       		
       		<li <c:if test="${num == page.currentPage}">class="active"</c:if> ><a onclick="showPcPage(${num})">${num}</a></li>
       		
       		<c:if test="${num == page.endPage }">
       			<li><a onclick="showPcPage(${page.currentPage==page.totalPage?page.totalPage:page.currentPage+1})" title="下一页">&#155;</a></li>
        		<li><a onclick="showPcPage(${page.totalPage})" title="尾页">&raquo;</a></li>
       		</c:if>
       	
       	</c:forEach>
       </ul>
       <input type="hidden" id="pageSize" value="${page.pageSize}"/>
</div>