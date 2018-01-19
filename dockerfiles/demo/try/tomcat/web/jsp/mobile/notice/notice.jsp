<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>消息中心</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/mobile/notice/notice.js"></script>
</head>
<script type="text/javascript">
var messageType= "${messageType}"
</script>
<style>
.dot-red{
  display:block;
  background:#f00;
  border-radius:50%;
  width: 20px;
  height: 20px;
  top: -20px;
  right: -20px;
  position:absolute;
}
</style>

<body>
<div data-role="page" id="pageone" class="page"  data-theme="i"> 
  <!-----header start----->
   <div data-role="header" data-position="fixed" class="inside-header"> 
   <a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1" href="<%=request.getContextPath()%>/myView/myViewMain.do" rel="external"></a>
    <h1>消息中心</h1>
    <a href="###" class="btnwordwhite btnnobg"  rel="external"></a>
  </div>
  <!-----header end---->
  <div class="inside-main"> 
      <div class="selectNavUl ui-grid-a clearfix">
    <li class="ui-block-a" onclick="javascript:location.href='<%=request.getContextPath()%>/notice/noticeList/2.do'">用户消息</li>
    <li class="ui-block-b" onclick="javascript:location.href='<%=request.getContextPath()%>/notice/noticeList/0.do'">系统消息</li>
   
    </div>
  
    <div class="select_content">
    <!-----全部明细内容start------> 
    <!----用户消息 start------>

			
				<div class="select_item inside-list nomarin">
					<!-- 系统消息 -->
					<c:forEach items="${messageList}" var="message">
					<a  rel="external" href="<%=request.getContextPath() %>/notice/noticeDetail/${messageType}.do?messageId=${message.id}" class="inside-listcon autoheight-list clearfix">
						<div class="clearfix">
							<div class="fl">
								<p class="maintitle">
									<span>${message.title }</span>
								</p>
							</div>
							<div class="fr  color-grey">
								<p class="price color-lightgray f24 icon-rightarrow-1r">
									<span style="position:relative;">${message.publishTime }
										<!-- 未读显示小红点 -->
										<c:if test="${message.readStatus != '1'}">
											<i class="dot-red"></i>
										</c:if>
									
									</span>
								</p>
							</div>
						</div>
						
						<p class="explain f24">${message.content }</p>
						
					</a> 
					</c:forEach>
					
					
					
				</div>
  

       </div>
   <!-----全部明细内容end------>


  
    </div>
    	
   
  </div>
  

</div>
</body>
</html>
