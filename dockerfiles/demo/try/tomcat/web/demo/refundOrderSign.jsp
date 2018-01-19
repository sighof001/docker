<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.allinpay.ets.client.*"%>
<% 
String postUrl = request.getParameter("postUrl");

String version = request.getParameter("version");
String merchantId = request.getParameter("merchantId");
String signType = request.getParameter("signType");

String key = request.getParameter("key");
String orderNo = request.getParameter("orderNo");
String refundAmount = request.getParameter("refundAmount");
String refundDatetime = request.getParameter("refundDatetime");
String mchtRefundOrderNo = request.getParameter("mchtRefundOrderNo");

StringBuffer buffer = new StringBuffer();
StringUtil.appendSignPara(buffer,"version",version);
StringUtil.appendSignPara(buffer,"signType",signType);
StringUtil.appendSignPara(buffer,"merchantId",merchantId);
StringUtil.appendSignPara(buffer,"orderNo",orderNo);
StringUtil.appendSignPara(buffer,"refundAmount",refundAmount);
StringUtil.appendSignPara(buffer,"refundDatetime",refundDatetime);
StringUtil.appendSignPara(buffer,"mchtRefundOrderNo",mchtRefundOrderNo);
StringUtil.appendLastSignPara(buffer,"key",key);

String signSrc=buffer.toString();

String signMsg=SecurityUtil.MD5Encode(signSrc);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>退款订单查询</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css.css">
  </head>
  
  <body>
    <center><h2><strong>退款订单查询</strong></h2></center>
   
    <form name="form1" action="refundOrderQueryPost.jsp" method="post"> 
    <table class="table_box" width="100%">
    <tr><td>提交地址：</td><td><%=postUrl %></td></tr>
    <tr><td>版本号 :</td><td><%=version %></td></tr>
    <tr><td>商户号 :</td><td><%=merchantId %></td></tr>
    <tr><td>签名类型 : </td><td><%=signType %></td></tr>
    <tr><td>订单号 : </td><td><%=orderNo %></td></tr>
    <tr><td>退款金额: </td><td><%=refundAmount %></td></tr>
    <tr><td>退款受理时间 : </td><td><%=refundDatetime %></td></tr>
    <tr><td>商户退款订单号 : </td><td><%=mchtRefundOrderNo %></td></tr>
    <tr><td>签名信息： </td><td><%=signMsg %></td></tr>
    
	
	
    <input type="hidden" name="postUrl" value="<%=postUrl %>"/>
    <input type="hidden" name="version" value="<%=version %>"/> 
     <input type="hidden" name="signType" value="<%=signType %>"/> 
     
    <input type="hidden" name="merchantId" value="<%=merchantId %>"/>
    <input type="hidden" name="orderNo" value="<%=orderNo %>"/>
    <input type="hidden" name="refundAmount" value="<%=refundAmount %>"/>
    <input type="hidden" name="refundDatetime" value="<%=refundDatetime %>"/>
    <input type="hidden" name="mchtRefundOrderNo" value="<%=mchtRefundOrderNo %>"/>
    <input type="hidden" name="signMsg" value="<%=signMsg %>"/> 
    <input type="hidden" name="key" value="<%=key %>"/> 
    <tr><td><input type="submit"  value="退款订单查询，提交"/></td><td></td></tr>
    </table>  
    <div>&nbsp;</div>
	<div>明文: <textarea cols="100" rows="4"><%=signSrc %></textarea></div>	
	</form> 
  </body>
</html>
