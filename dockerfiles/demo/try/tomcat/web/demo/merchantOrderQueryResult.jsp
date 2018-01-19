	<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" 
	import="java.util.*,com.allinpay.ets.client.SecurityUtil,java.net.*,java.io.*,com.allinpay.ets.client.SecurityUtil,com.allinpay.ets.client.StringUtil,org.apache.commons.httpclient.methods.PostMethod,org.apache.commons.httpclient.*,com.allinpay.ets.client.PaymentResult" errorPage="" %>
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml">
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
		<!-- 2. HTTPCLIENT方式提交查询请求 -->
		<hr/>
		<center> <font size=16><strong>查询结果</strong></font></center>
		<%
		String serverUrl=request.getParameter("serverUrl");
		String key=request.getParameter("key");
		String merchantId=request.getParameter("merchantId");	
		String version=request.getParameter("version");
		String signType=request.getParameter("signType");
		String orderNo=request.getParameter("orderNo");
		String orderDatetime=request.getParameter("orderDatetime");
		String queryDatetime=request.getParameter("queryDatetime");
		String signMsg=request.getParameter("signMsg");
	
		// 提交查询请求
		boolean isSuccess = false;
		String resultMsg = "";
		Map<String, String> result = new HashMap<String, String>();
		try{
			String listenUrl=serverUrl;
			HttpClient httpclient=new HttpClient();
			PostMethod postmethod=new PostMethod(listenUrl);
			NameValuePair[] date = { new NameValuePair("merchantId",merchantId),
					new NameValuePair("version",version),
					new NameValuePair("signType",signType),
					new NameValuePair("orderNo",orderNo),
					new NameValuePair("orderDatetime",orderDatetime),
					new NameValuePair("queryDatetime",queryDatetime),
					new NameValuePair("signMsg",signMsg)};
			postmethod.setRequestBody(date);
			int responseCode=httpclient.executeMethod(postmethod);
			out.print("responseCode="+responseCode);		
			
			if(responseCode == HttpURLConnection.HTTP_OK){
				String strResponse = postmethod.getResponseBodyAsString();
				
				// 解析查询返回结果
				strResponse = URLDecoder.decode(strResponse);
			//	Map<String, String> result = new HashMap<String, String>();
				String[] parameters = strResponse.split("&");
				for (int i = 0; i < parameters.length; i++) {
					String msg = parameters[i];
					int index = msg.indexOf('=');
					if (index > 0) {
						String name = msg.substring(0, index);
						String value = msg.substring(index + 1);
						result.put(name, value);
					}
				}
		
				// 查询结果会以Server方式通知商户(同支付返回)；
				// 若无法取得Server通知结果，可以通过解析查询返回结果，更新订单状态(参考如下).
				if (null != result.get("ERRORCODE")) {
					// 未查询到订单
					System.out.println("ERRORCODE=" + result.get("ERRORCODE"));
					System.out.println("ERRORMSG=" + result.get("ERRORMSG"));
					resultMsg = result.get("ERRORMSG");
		
				} else {
					// 查询到订单
					String payResult = result.get("payResult");
					if (payResult.equals("1")) {
						System.out.println("订单付款成功！");
		
						// 支付成功，验证签名
						PaymentResult paymentResult = new PaymentResult();
						paymentResult.setMerchantId(result.get("merchantId"));
						paymentResult.setVersion(result.get("version"));
						paymentResult.setLanguage(result.get("language"));
						paymentResult.setSignType(result.get("signType"));
						paymentResult.setPayType(result.get("payType"));
						paymentResult.setIssuerId(result.get("issuerId"));
						paymentResult.setPaymentOrderId(result
								.get("paymentOrderId"));
						paymentResult.setOrderNo(result.get("orderNo"));
						paymentResult.setOrderDatetime(result
								.get("orderDatetime"));
						paymentResult.setOrderAmount(result.get("orderAmount"));
						paymentResult.setPayAmount(result.get("payAmount"));
						paymentResult.setPayDatetime(result.get("payDatetime"));
						paymentResult.setExt1(result.get("ext1"));
						paymentResult.setExt2(result.get("ext2"));
						paymentResult.setPayResult(result.get("payResult"));
						paymentResult.setErrorCode(result.get("errorCode"));
						paymentResult.setReturnDatetime(result
								.get("returnDatetime"));
						paymentResult.setKey(key);
						paymentResult.setSignMsg(result.get("signMsg"));
						paymentResult.setCertPath("d:\\cert\\TLCert-test.cer");
		
						boolean verifyResult = paymentResult.verify();
		
						if (verifyResult) {
							System.out.println("验签成功！商户更新订单状态。");
							resultMsg = "订单支付成功，验签成功！商户更新订单状态。";
							isSuccess = true;
						} else {
							System.out.println("验签失败！");
							resultMsg = "订单支付成功，验签失败！";
						}
		
					} else {
							System.out.println("订单尚未付款！");
							resultMsg = "订单尚未付款！";
					}
				}
		
			}
		}catch(Exception e){
		 	out.print(e);
		}
		%>

		<div style="padding-left:40px;">
			<div>订单是否成功：<%=isSuccess %></div>
			<div>查询处理结果：<%=resultMsg %></div>
			<div>订单详细信息：<br/>
				 merchantId：<%=result.get("merchantId") %><br/>
				 payType：<%=result.get("payType") %><br/>
				 issuerId：<%=result.get("issuerId") %><br/>
				 paymentOrderId：<%=result.get("paymentOrderId") %><br/>
				 orderNo：<%=result.get("orderNo") %><br/>
				 orderDatetime：<%=result.get("orderDatetime") %><br/>
				 orderAmount：<%=result.get("orderAmount") %><br/>
				 payResult：<%=result.get("payResult") %><br/>
				 errorCode：<%=result.get("errorCode") %><br/>
		    </div>
		</div>

  </body>
	
</html>









