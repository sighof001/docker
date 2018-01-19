<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.allinpay.ets.client.*"%>
<% 
String postUrl = request.getParameter("postUrl");
String merchantId = request.getParameter("merchantId");
String signType = request.getParameter("signType");
String version = request.getParameter("version");
String key = request.getParameter("key");
String currency = request.getParameter("currency");

String signSrc="version="+version+"&merchantId="+merchantId+"&signType="+signType +"&key="+key+"&currency="+currency;
String signMsg=SecurityUtil.MD5Encode(signSrc);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>单个汇率查询</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css.css">
  </head>
  
  <body>
    <center><h2><strong>单个汇率查询</strong></h2></center>
   
    <form name="form1" action="singleExRateQueryPost.jsp" method="post"> 
    <table class="table_box" width="100%">
    <tr><td>提交地址：</td><td><%=postUrl %></td></tr>
    <tr><td>版本号 :</td><td><%=version %></td></tr>
    <tr><td>商户号 :</td><td><%=merchantId %></td></tr>
    <tr><td>签名类型 : </td><td><%=signType %></td></tr>
    <tr><td>币种 : </td><td><%=currency %></td></tr>
    <tr><td>签名信息： </td><td><%=signMsg %></td></tr>
    
    <input type="hidden" name="postUrl" value="<%=postUrl %>"/>
    <input type="hidden" name="version" value="<%=version %>"/> 
    <input type="hidden" name="merchantId" value="<%=merchantId %>"/>
    <input type="hidden" name="signType" value="<%=signType %>"/> 
    <input type="hidden" name="currency" value="<%=currency %>"/>
    <input type="hidden" name="signMsg" value="<%=signMsg %>"/> 
    
    <tr><td><input type="submit"  value="单个汇率查询，提交"/></td><td></td></tr>
    </table>                                                                                                                                                                                                                                                                                                                                                                                                                                                  
	</form> 
  </body>
</html>
