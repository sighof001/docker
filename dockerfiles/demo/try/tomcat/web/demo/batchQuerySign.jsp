<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.allinpay.ets.client.*"%>
<% 
String postUrl = request.getParameter("postUrl");
String merchantId = request.getParameter("merchantId");
String beginDateTime = request.getParameter("beginDateTime");
String endDateTime = request.getParameter("endDateTime");
String pageNo = request.getParameter("pageNo");
String signType = request.getParameter("signType");
String version = request.getParameter("version");
String key = request.getParameter("key");

String signSrc="version="+version+"&merchantId="+merchantId+"&beginDateTime="+beginDateTime +"&endDateTime="+ endDateTime+"&pageNo="+pageNo +"&signType="+signType +"&key="+key;
String signMsg=SecurityUtil.MD5Encode(signSrc);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
    This is my JSP page. <br>
    <form name="form1" action="batchQueryPost.jsp" method="post">    
    	提交地址：<input type="text" name="postUrl" size="60" value="<%=postUrl %>"/>   </br>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
		版本号：<input type="text" name="version" value="<%=version %>"/>   </br>
		商户号：<input type="text" name="merchantId" value="<%=merchantId %>"/>   </br>
		订单开始时间:  <input type="text" name="beginDateTime" value="<%=beginDateTime %>"/>   </br>
		订单结束时间:  <input type="text" name="endDateTime" value="<%=endDateTime %>"/>  </br> 
		页码：  <input type="text" name="pageNo" value="<%=pageNo %>"/>   </br>
		签名类型：  <input type="text" name="signType" value="<%=signType %>"/>   </br>
		签名信息：  <input type="text" name="signMsg" value="<%=signMsg %>"/>   </br>
		 <input type="submit"  value="确定查询"/>                                                                                                                                                                                                                                                                                                                                                                                                                                                 
</form>         
  </body>
</html>
