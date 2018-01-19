<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/pcjs/pc/message/messageList.js"></script>
    <!------个人中心右侧start-------->
    <div class="col-sm-9 personal_right ">
     
      <div class="p_rightBottom p_r_con bgwhite"> 
        <!-------内容start----->
        <div class="title_wrap clearfix">
          <div class="title pull-left">消息中心</div>
          </div>
        <form class="queryForm" >
        	
        </form>
        <div class="table_wrap">
          <div class="table_top"> 
          <a url="/notice/pcMessageList.do?messageType=2" <c:if test="${messageType == 2 }" >class="active"</c:if> >个人消息</a> 
          <a url="/notice/pcMessageList.do?messageType=0" <c:if test="${messageType == 0 }" >class="active"</c:if> >系统消息</a>
          </div>
          <a class="mark_read">标记为已读</a>
          <table class="table table-striped table_con" id="table" url="/notice/pcMessageList.do?messageType=${messageType}">
            <tr>
              <input type="hidden" name="messageType" id="messageType" value="${messageType}"/>
              <th><input type="checkbox" onclick = 'check();' id='check-all'/></th>
              <th>状态</th>
              <th>标题</th>
              <th style="width:26%;">时间</th>
            </tr>
            <c:forEach items="${page.data }" var="message">
            	<tr>
            	  <c:if test="${message.readStatus == 1}">
		              <td><input name="sqCheckbox" type="checkbox" value="${message.id}"/></td>
		              <td style="color:#999;">已读</td>
		              <td><a style="color:#999;" onclick="linkUrl('messageDetails','messageId=${message.id}')">${message.title }</a></td>
		              <td>${message.publishTime }</td>
	              </c:if>
	              
	              <c:if test="${message.readStatus == 0}">
	              	  <td><input name="sqCheckbox" type="checkbox" value="${message.id}"/></td>
		              <td>未读</td>
		              <td><a onclick="linkUrl('messageDetails','messageId=${message.id}')">${message.title }</a></td>
		              <td>${message.publishTime }</td>
	              </c:if>
	              
           		 </tr>
            </c:forEach>
          </table>
         
	      <jsp:include page="/jsp/pc/pager.jsp"></jsp:include>
        </div>
      
        <!-------内容end------> 
        
      </div>
    </div>
    <!-------个人中心右侧end------> 