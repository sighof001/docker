<%@page import="com.investfinancing.common.exceptions.BusinessException"%>
<%@page import="com.investfinancing.common.utils.StringUtils"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
Exception e = null;
try{
	e = (Exception)request.getAttribute("servlet.error.exception");
}catch(Exception ex){
	e = new BusinessException("null e");
}

String errorMessage = e == null ? "" : e.getMessage();
if(errorMessage != null){
	errorMessage = StringUtils.cutString(errorMessage, 200);
}
%>
<!DOCTYPE html>
<html>
<head>
<title>500</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery/jquery-1.12.4.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.try.js"></script>
<script type="text/javascript">
$(function(){
	alert($.yb.browser.userAgent);
	if($.yb.browser.isPc){
		location.href = '<%=request.getContextPath()%>/jsp/pc/error.jsp?errorMessage=<%=errorMessage%>';
	}else{
		location.href = '<%=request.getContextPath()%>/jsp/mobile/error.jsp?errorMessage=<%=errorMessage%>';
	}
});
</script>


</head>
<body>
<div class="container">


</div>
</body>
</html>