	<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" 
	import="java.util.*,com.allinpay.ets.client.SecurityUtil,java.net.*,java.io.*,com.allinpay.ets.client.SecurityUtil,com.allinpay.ets.client.StringUtil,org.apache.commons.httpclient.methods.PostMethod,org.apache.commons.httpclient.*,com.allinpay.ets.client.PaymentResult" errorPage="" %>
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml">
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta http-equiv="Content-Language" content="zh-CN"/>
		<meta http-equiv="Expires" content="0" />        
		<meta http-equiv="Cache-Control" content="no-cache" />        
		<meta http-equiv="Pragma" content="no-cache" />
		<title>通联网上支付平台-商户接口范例-单笔订单查询确认</title>
		<link href="css.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
	<center> <font size=16><strong>单笔订单查询确认</strong></font></center>
<%
	request.setCharacterEncoding("UTF-8");
	String signSrc="";
	String serverUrl=request.getParameter("serverUrl");
	String key=request.getParameter("key");
	String merchantId=request.getParameter("merchantId");	
	String version=request.getParameter("version");
	String signType=request.getParameter("signType");
	String orderNo=request.getParameter("orderNo");
	String orderDatetime=request.getParameter("orderDatetime");
	String queryDatetime=request.getParameter("queryDatetime");
	
	StringBuffer bufSignSrc=new StringBuffer();
	StringUtil.appendSignPara(bufSignSrc, "merchantId",merchantId);
	StringUtil.appendSignPara(bufSignSrc, "version", version);
	StringUtil.appendSignPara(bufSignSrc, "signType", signType);
	StringUtil.appendSignPara(bufSignSrc, "orderNo", orderNo);
	StringUtil.appendSignPara(bufSignSrc, "orderDatetime",orderDatetime);
	StringUtil.appendSignPara(bufSignSrc, "queryDatetime",queryDatetime);
	StringUtil.appendLastSignPara(bufSignSrc, "key", key);
	signSrc=bufSignSrc.toString();
	String sign="";
	sign= SecurityUtil.MD5Encode(bufSignSrc.toString());
%>	
		<table class="table_box" width="90%">
		   <tr class="tit_bar">
		      <td colspan="2" class="tit_bar">提交的查询表单参数</td>
		   </tr>
		   <tr>
		      <td width="100">1</td><td>商户号: <%=merchantId%></td>
		   </tr>  
		   <tr><td>2</td><td>接口版本号: <%=version%></td>
		   </tr>
		   <tr><td>3</td><td>签名方式: <%=signType%></td>
		   </tr>
		   <tr><td>4</td><td>商户订单号: <%=orderNo%></td>
		   </tr>
		   <tr><td>5</td><td>商户订单提交时间: <%=orderDatetime %></td>
		   </tr>
		   <tr><td>6</td><td>商户提交查询时间: <%=queryDatetime%></td>
		   </tr> 
		   <tr><td>7</td><td>密文: <%=sign%></td>
		   </tr>	   
		</table>
		<p> 签名字符串：</p>
		<p> <%=signSrc%></p>
		
		<!-- 1. 页面方式提交查询请求 -->
		<div>
			<form name="form1" action="merchantOrderQueryResult.jsp" method="post">
			<input type="hidden" name="serverUrl" value="<%=serverUrl%>" />
			<input type="hidden" name="merchantId" value="<%=merchantId%>" />
			<input type="hidden" name="version" value="<%=version%>" />
			<input type="hidden" name="signType" value="<%=signType%>" />
			<input type="hidden" name="orderNo" value="<%=orderNo%>" />
			<input type="hidden" name="orderDatetime" value="<%=orderDatetime %>" />
			<input type="hidden" name="queryDatetime" value="<%=queryDatetime%>" />
			<input type="hidden" name="signMsg" value="<%=sign%>" />
			<input type="submit" value="确认查询" />
			</form>
		</div>
  </body>
</html>