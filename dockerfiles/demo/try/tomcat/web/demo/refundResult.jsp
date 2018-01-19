	<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" 
	import="org.apache.commons.httpclient.protocol.Protocol,
	org.apache.commons.httpclient.HttpClient,
	org.apache.commons.httpclient.methods.PostMethod,
	org.apache.commons.httpclient.NameValuePair,
	java.net.HttpURLConnection,
	java.util.Map,
	java.util.HashMap" 
	errorPage="" %>
<%@page import="com.allinpay.ets.client.util.MySecureProtocolSocketFactory;"%>
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta http-equiv="Content-Language" content="zh-CN"/>
		<meta http-equiv="Expires" CONTENT="0">        
		<meta http-equiv="Cache-Control" CONTENT="no-cache">        
		<meta http-equiv="Pragma" CONTENT="no-cache">
		<title>通联网上支付平台-商户接口范例-单笔退款接口</title>
	</head>
	<body>
	<center> <h2>单笔退款接口结果返回信息</h2></center>	
	<%
			request.setCharacterEncoding("UTF-8");
			//接收Server返回的支付结果
			String merchantId=request.getParameter("merchantId");
			String version=request.getParameter("version");
			String signType=request.getParameter("signType");
			String orderNo=request.getParameter("orderNo");
			String orderDatetime=request.getParameter("orderDatetime");
			String refundAmount=request.getParameter("refundAmount");			
			String signMsg=request.getParameter("signMsg");
			String listenUrl=request.getParameter("postUrl");
			String key=request.getParameter("key");
			PostMethod postMethod = null;
			Map map = new HashMap();
			try{
			Protocol myhttps = new Protocol("https",new MySecureProtocolSocketFactory(), 443);
			Protocol.registerProtocol("https", myhttps);
			HttpClient httpclient = new HttpClient();
			postMethod = new PostMethod(listenUrl);
			NameValuePair[] datas = {
					new NameValuePair("merchantId", merchantId),
					new NameValuePair("version", version),
					new NameValuePair("signType", signType),
					new NameValuePair("orderNo", orderNo),
					new NameValuePair("orderDatetime", orderDatetime),
					new NameValuePair("refundAmount", refundAmount),
					new NameValuePair("signMsg", signMsg) };
			postMethod.setRequestBody(datas);		
			int responseCode = httpclient.executeMethod(postMethod);		
			// 取得查询交易结果
			if (responseCode == HttpURLConnection.HTTP_OK) {
				String trxXML = postMethod.getResponseBodyAsString();
				String[] msg =trxXML.split("&");
				String [] paramPair=null;
				for(int i=0;i<msg.length;i++){
					paramPair=msg[i].split("=");
		        	map.put(paramPair[0], paramPair[1]); 
		        	System.out.println(paramPair[0]+":"+map.get(paramPair[0]));
				}					
			}	
			}catch(Exception e){
			System.out.println(e);
			}		
			//验签是商户为了验证接收到的报文数据确实是支付网关发送的。
			//构造订单结果对象，验证签名。
			com.allinpay.ets.client.PaymentResult paymentResult = new com.allinpay.ets.client.PaymentResult();
			if("".equals(map.get("ERRORCODE"))||null==map.get("ERRORCODE")){
			//如果errorCode为空，说明返回正确退款报文信息，接下来对报文进行解析验签
			paymentResult.setMerchantId(map.get("merchantId").toString());
			paymentResult.setVersion(map.get("version").toString());
			paymentResult.setSignType(map.get("signType").toString());
			paymentResult.setOrderNo(map.get("orderNo").toString());
			paymentResult.setOrderDatetime(map.get("orderDatetime").toString());
			paymentResult.setOrderAmount(map.get("orderAmount").toString());
			paymentResult.setErrorCode(null==map.get("errorCode")?"":map.get("errorCode").toString());
			paymentResult.setRefundAmount(map.get("refundAmount").toString());
			paymentResult.setRefundDatetime(map.get("refundDatetime").toString());
			paymentResult.setRefundResult(map.get("refundResult").toString());
			paymentResult.setReturnDatetime(map.get("returnDatetime").toString());
			//signMsg为服务器端返回的签名值。
			paymentResult.setSignMsg(map.get("signMsg").toString()); 
			paymentResult.setKey(key);
			//验证签名：返回true代表验签成功；否则验签失败。
			boolean verifyResult = paymentResult.verify();
			
			if(verifyResult){
				
	%>	
	<table border="1" cellpadding="1" cellspacing="1" width="580" align="center">
			<!-- 报文参数 -->
			<tr>
				<td>1. 报文版本号:</td>
				<td> <%=map.get("version").toString()%></td>
			</tr>			
			<tr>
				<td>2. 签名方式:</td>
				<td><%=map.get("signType").toString()%></td>
			</tr>
			<!-- 买卖双方信息参数 -->
			<tr>
				<td>3. 商户号:</td>
				<td> <%=map.get("merchantId").toString()%></td>
			</tr>		
			<!-- 业务参数 -->
			<tr>
				<td>4. 商户系统订单号:</td>
				<td> <%=map.get("orderNo").toString() %></td>
			</tr>
			<tr>
				<td>5. 商户系统订单金额:</td>
				<td> <%=map.get("orderAmount").toString() %></td>
			</tr>
			<tr>
				<td>6. 商户的订单创建时间:</td>
				<td> <%=map.get("orderDatetime").toString()%></td>
			</tr>
			<tr>
				<td>7. 退款金额:</td>
				<td> <%=map.get("refundAmount").toString()%></td>
			</tr>		
			<tr>
				<td>8. 退款申请受理时间:</td>
				<td> <%=map.get("refundDatetime").toString()%></td>
			</tr>
			<tr>
				<td>9. 退款申请结果:</td>
				<td> <%=map.get("refundResult").toString()%></td>
			</tr>
			<tr>
				<td>10. 结果返回时间:</td>
				<td> <%=map.get("returnDatetime").toString()%></td>
			</tr>
			<tr>
				<td>11. 错误编码:</td>
				<td> <%=null==map.get("errorCode")?"":map.get("errorCode").toString()%></td>
			</tr>
			<tr>
				<td colspan="2"><font color="red">PS:返回金额单位为十分之一厘，即1元用10000表示，请商户根据需要转换单位</font></td>
			</tr>
	</table>
	
	<%	
		}else{
	 %>
	 <table border="0" cellpadding="1" cellspacing="1" width="580" align="center">
			<tr>
				<td>返回结果验签失败.</td>
			</tr>	
	</table>
	<%
	}
		}else{
		//否则返回异常信息errorCode和errorMsg
		String errorCode = map.get("ERRORCODE").toString();
		String errorMsg = new String(map.get("ERRORMSG").toString().getBytes("iso8859-1"),"utf-8");
		%>
		<table border="0" cellpadding="1" cellspacing="1" width="580" align="center">
			<tr>
				<td>errorCode:<%=errorCode %></td>
			</tr>	
			<tr>
				<td>errorMsg:<%=errorMsg %></td>
			</tr>
	</table>
		<%
		}
	%>
	 </body>
	</html>
	 
