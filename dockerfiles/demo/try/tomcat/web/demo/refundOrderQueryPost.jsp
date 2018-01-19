<%@page import="com.allinpay.ets.client.*,java.net.*,java.io.*,org.apache.commons.httpclient.methods.PostMethod,org.apache.commons.httpclient.*"%>
<%@page import="org.bouncycastle.util.encoders.Base64"%>
<%@page import="java.io.StringReader"%>
<%@page import="java.util.*"%>
<%@page import="org.apache.commons.io.IOUtils"%>
<%@page pageEncoding="UTF-8" %> 
<% 
String postUrl = request.getParameter("postUrl");
String signType = request.getParameter("signType");
String version = request.getParameter("version");

String merchantId = request.getParameter("merchantId");
String orderNo = request.getParameter("orderNo");
String refundAmount = request.getParameter("refundAmount");
String refundDatetime = request.getParameter("refundDatetime");
String mchtRefundOrderNo = request.getParameter("mchtRefundOrderNo");
String signMsg = request.getParameter("signMsg");
String key = request.getParameter("key");
// 提交查询请求
		String resultMsg = "";
		PostMethod postmethod=null;
		String viewMsg="";
		String fileMsg="";
		String signTypeMsg="";
		String reSingMsg ="";
		try{
			HttpClient httpclient=new HttpClient();
			System.out.println("=====================postUrl= 1 ======"+postUrl);
			if("http://ceshi.allinpay.com/mchtoq/refundQuery".equals(postUrl)){
				postUrl = "http://192.168.104.87:8080/mchtoq/refundQuery";
			}else{
				postUrl = postUrl;
			}
			System.out.println("=====================postUrl== 2 ====="+postUrl);
			postmethod=new PostMethod(postUrl);
			NameValuePair[] date = { new NameValuePair("merchantId",merchantId),
					new NameValuePair("version",version),
					new NameValuePair("signType",signType),
					new NameValuePair("orderNo",orderNo),
					new NameValuePair("refundAmount",refundAmount),
					new NameValuePair("refundDatetime",refundDatetime),
					new NameValuePair("mchtRefundOrderNo",mchtRefundOrderNo),
					new NameValuePair("signMsg",signMsg)};
			postmethod.setRequestBody(date);
			int responseCode=httpclient.executeMethod(postmethod);
			out.print("responseCode="+responseCode);		
			out.print("<hr>");
			if(responseCode == HttpURLConnection.HTTP_OK){
				resultMsg = IOUtils.toString(postmethod.getResponseBodyAsStream(), "utf-8");
				String fileAsString = ""; // 签名信息前的对账文件内容
				String fileSignMsg = ""; // 文件签名信息
				String lines;
				if(resultMsg.indexOf("ERRORCODE=")<0){
				  BufferedReader fileReader = new BufferedReader(new StringReader(resultMsg));
				// 读取交易结果
					StringBuffer fileBuf = new StringBuffer(); // 签名信息前的字符串	
					List<String> refundOrderList = new ArrayList<String>();
					while ((lines = fileReader.readLine()) != null) {
						if (lines.length() > 0) {
							//将数据放入List中
							refundOrderList.add(lines);
						} 
					}
					fileReader.close();
					//取签名源串 
					for(int i=0;i<refundOrderList.size()-2;i++){
							fileBuf.append(refundOrderList.get(i)+"\r\n");
					}
					fileBuf.append(refundOrderList.get(refundOrderList.size()-2));
					fileAsString = fileBuf.toString();
					//取签名信息 
					fileSignMsg = refundOrderList.get(refundOrderList.size()-1);
				
					signTypeMsg = String.valueOf(resultMsg.charAt(5));
					boolean isVerified = false; // 验证签名结果
					if("0".equals(signTypeMsg)){
							//用md5验证签名
							// 验证签名：先对文件内容计算MD5摘要，再将MD5摘要与返回的签名进行对比
							String sourceString = fileAsString+"|"+key;
							String fileMd5 = SecurityUtil.MD5Encode(sourceString);
							if(fileMd5.equals(fileSignMsg)){
								 // 验证签名通过，解析交易明细，开始对账
								System.out.println("验证签名通过");
								viewMsg=fileAsString+"\r\n"+fileSignMsg;
							}else{
								// 验证签名不通过，丢弃对账文件
								System.out.println("验证签名不通过");
								viewMsg="验证签名不通过";
							}
					}else if("1".equals(signTypeMsg)){
					        String fileMd5String = SecurityUtil.MD5Encode(fileAsString);
							String certPath="";
							if(postUrl.indexOf("service.allinpay.com")>0){
								certPath="/opt/conf/TLCert-prod.cer";//生产证书路径
							}else{
								certPath="/opt/conf/TLCert-test.cer"; //测试证书路径
							}
							isVerified = SecurityUtil.verifyByRSA(certPath, fileMd5String.getBytes(), Base64.decode(fileSignMsg));
							if (isVerified) {
								// 验证签名通过，解析交易明细，开始对账
								System.out.println("验证签名通过");
								viewMsg=fileAsString+"\r\n"+fileSignMsg;
							} else {
								// 验证签名不通过，丢弃对账文件
								System.out.println("验证签名不通过");
								viewMsg="验证签名不通过";
				
							}
					}else{
					  viewMsg = resultMsg;
					}
				}else{
				 viewMsg=resultMsg;
				}
				
			
		   }
		}catch(Exception e){
		 	out.print(e);
		}finally{
			postmethod.releaseConnection();
		}
		





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
         <%=viewMsg%>
  </body>
</html>
