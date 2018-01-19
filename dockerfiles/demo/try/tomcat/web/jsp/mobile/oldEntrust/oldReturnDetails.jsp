<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>返息明细</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<script src="<%=request.getContextPath()%>/js/mobile/oldEntrust/oldReturnDetails.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/js/dropload/dist/dropload.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/dropload/dist/dropload.min.js"></script>
<script>
$(document).ready(function(e) {
 /* fixtop(".inside-header","selectNavUl");   */ 
});

</script>
</head>

<body>
<div data-role="page" id="pageone" class="page"  data-theme="i"> 
  <!-----header start----->
   <div data-role="header" data-position="fixed" class="inside-header"> <a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
    <h1>返息明细</h1>
    <a href="###" class="btnwordwhite btnnobg"  rel="external"></a>
  </div>
  <!-----header end---->
  <div class="inside-main"> 
    
  	<form class="queryForm">
  		<input type="hidden" name="id" id="id" value="${id }"/>
  	</form>
  	
    <div class="select_content data-container">
    	<div class="select_item">
      <!----一个月份信息 start------>
     <!--  <div class="sperate"><span class="select_span"></span></div>  -->  
      <div class="inside-list lists"> 
      
      </div>
  	  <!----一个月份信息 end------>
    </div>
    
   
  </div>
  

</div>
</body>
</html>
