<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" import="com.allinpay.ets.client.StringUtil, com.allinpay.ets.client.SecurityUtil" errorPage="" %>
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml">
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta http-equiv="Content-Language" content="zh-CN"/>
		<meta http-equiv="Expires" CONTENT="0">        
		<meta http-equiv="Cache-Control" CONTENT="no-cache">        
		<meta http-equiv="Pragma" CONTENT="no-cache">
		<title>通联网上支付平台-商户接口范例-支付请求信息签名</title>
	</head>
	<body>
	<center> <h2>支付请求信息签名</h2></center>	
	<%	
	//页面编码要与参数inputCharset一致，否则服务器收到参数值中的汉字为乱码而导致验证签名失败。
	String myServerIp=request.getParameter("myServerIp");
	request.setCharacterEncoding("UTF-8"); 
	String key=request.getParameter("key");
	String version=request.getParameter("version");
	String merchantId=request.getParameter("merchantId");
	String signType=request.getParameter("signType");
	String orderNo=request.getParameter("orderNo");
	String refundAmount=request.getParameter("refundAmount");
	String orderDatetime=request.getParameter("orderDatetime");	
	//构造订单请求对象，生成signMsg。
	com.allinpay.ets.client.RequestOrder requestOrder = new com.allinpay.ets.client.RequestOrder();
	requestOrder.setVersion(version);
	requestOrder.setSignType(Integer.parseInt(signType));
	requestOrder.setMerchantId(merchantId);
	requestOrder.setOrderNo(orderNo);
	requestOrder.setRefundAmount(Long.parseLong(refundAmount));
	requestOrder.setOrderDatetime(orderDatetime);
	requestOrder.setKey(key); //key为MD5密钥，密钥是在通联支付网关会员服务网站上设置。
	String strSrcMsg = requestOrder.getSrc(); // 此方法用于debug，测试通过后可注释。
	String strSignMsg = requestOrder.doSign(); // 签名，设为signMsg字段值。
	%>
	
	<!--
		1、订单可以通过post方式或get方式提交，建议使用post方式；
		   提交支付请求可以使用http或https方式，建议使用https方式。
		2、通联支付网关地址、商户号及key值，在接入测试时由通联提供；
		   通联支付网关地址、商户号，在接入生产时由通联提供，key值在通联支付网关会员服务网站上设置。
	-->
	<center>
	<!--================= post 方式提交支付请求 start =====================-->
    <!--================= 测试地址为 http://ceshi.allinpay.com/gateway/index.do =====================-->
	<!--================= 生产地址请在测试环境下通过后从业务人员获取 (https://domain/gateway/index.do)=====================-->
	<!-- 通联支付网关地址 -->
	<form name="form2" action="refundResult.jsp" method="post">
		<input type="hidden" name="version" value="<%=version %>"/>
		<input type="hidden" name="signType" value="<%=signType%>"/>
		<input type="hidden" name="merchantId" value="<%=merchantId%>" />
		<input type="hidden" name="orderNo" value="<%=orderNo%>" />
		<input type="hidden" name="refundAmount" value="<%=refundAmount %>"/>
		<input type="hidden" name="orderDatetime" value="<%=orderDatetime%>" />
		<input type="hidden" name="signMsg" value="<%=strSignMsg %>" />
		<input type="hidden" name="key" value="<%=key %>" />
		<input type="hidden" name="postUrl" value="<%=myServerIp %>" />
	    <input type="submit" value="确认付款，到通联支付去啦"/>
	 </form>
	<!--================= post 方式提交支付请求 end =====================-->
	</center>
	<table border="1" cellpadding="1" cellspacing="1" width="580" align="center">
			<!-- 报文参数 -->
			<tr>
				<td>1. 报文版本号:</td>
				<td> <%=version%></td>
			</tr>			
			<tr>
				<td>2. 签名方式:</td>
				<td><%=signType%></td>
			</tr>
			<!-- 买卖双方信息参数 -->
			<tr>
				<td>3. 商户号:</td>
				<td> <%=merchantId%></td>
			</tr>		
			<!-- 业务参数 -->
			<tr>
				<td>4. 商户系统订单号:</td>
				<td> <%=orderNo %></td>
			</tr>
			<tr>
				<td>5. 退款金额(单位分):</td>
				<td> <%=refundAmount%></td>
			</tr>		
			<tr>
				<td>6. 商户的订单创建时间:</td>
				<td> <%=orderDatetime%></td>
			</tr>
			<tr>
				<td>7. 报文签名后内容:</td>
				<td> <%=strSignMsg %></td>
			</tr>
	</table>
	<center>
	<div>&nbsp;</div>
	<div>明文: <textarea cols="100" rows="4"><%=strSrcMsg %></textarea></div>
	</center>
	</body>
	</html>
