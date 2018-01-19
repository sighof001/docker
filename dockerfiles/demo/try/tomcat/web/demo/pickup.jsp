	<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"  errorPage="" %>
	<%
			request.setCharacterEncoding("UTF-8");
	
			String merchantId=request.getParameter("merchantId");
			String version=request.getParameter("version");
			String language=request.getParameter("language");
			String signType=request.getParameter("signType");
			String payType=request.getParameter("payType");
			String issuerId=request.getParameter("issuerId");
			String paymentOrderId=request.getParameter("paymentOrderId");
			String orderNo=request.getParameter("orderNo");
			String orderDatetime=request.getParameter("orderDatetime");
			String orderAmount=request.getParameter("orderAmount");
			String payDatetime=request.getParameter("payDatetime");
			String payAmount=request.getParameter("payAmount");
			String ext1=request.getParameter("ext1");
			String ext2=request.getParameter("ext2");
			String payResult=request.getParameter("payResult");
			String errorCode=request.getParameter("errorCode");
			String returnDatetime=request.getParameter("returnDatetime");
			String signMsg=request.getParameter("signMsg");
		
			//验签是商户为了验证接收到的报文数据确实是支付网关发送的。
			//构造订单结果对象，验证签名。
			com.allinpay.ets.client.PaymentResult paymentResult = new com.allinpay.ets.client.PaymentResult();
			paymentResult.setMerchantId(merchantId);
			paymentResult.setVersion(version);
			paymentResult.setLanguage(language);
			paymentResult.setSignType(signType);
			paymentResult.setPayType(payType);
			paymentResult.setIssuerId(issuerId);
			paymentResult.setPaymentOrderId(paymentOrderId);
			paymentResult.setOrderNo(orderNo);
			paymentResult.setOrderDatetime(orderDatetime);
			paymentResult.setOrderAmount(orderAmount);
			paymentResult.setPayDatetime(payDatetime);
			paymentResult.setPayAmount(payAmount);
			paymentResult.setExt1(ext1);
			paymentResult.setExt2(ext2);
			paymentResult.setPayResult(payResult);
			paymentResult.setErrorCode(errorCode);
			paymentResult.setReturnDatetime(returnDatetime);
			
			//signMsg为服务器端返回的签名值。
			paymentResult.setSignMsg(signMsg); 
			//signType为"1"时，必须设置证书路径。
			paymentResult.setCertPath("/opt/conf/TLCert-test.cer"); 
			
			//验证签名：返回true代表验签成功；否则验签失败。
			boolean verifyResult = paymentResult.verify();
			
			//验签成功，还需要判断订单状态，为"1"表示支付成功。
			boolean paySuccess = verifyResult && payResult.equals("1");

			if(paySuccess){
				//TODO 商户订单处理，显示客户订单付款成功页面
			}
	 %>

	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml">
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta http-equiv="Content-Language" content="zh-CN"/>
		<meta http-equiv="Expires" content="0" />        
		<meta http-equiv="Cache-Control" content="no-cache" />        
		<meta http-equiv="Pragma" content="no-cache" />
		<title>网上支付平台-商户接口范例-支付结果</title>
		<link href="css.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
	<center> <h2>接收页面返回的支付结果，显示客户订单支付结果</h2><hr/>
	<div style="padding-left:40px;">
	 		<h2>验签结果：<%=verifyResult%> </h2>
			<h2>支付结果：<%=paySuccess %></h2>
	</div>	
 </body>
</html>
