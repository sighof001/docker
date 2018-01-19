<%@page import="com.allinpay.ets.client.*,java.net.*,java.io.*,org.apache.commons.httpclient.methods.PostMethod,org.apache.commons.httpclient.*"%>
<%@page import="org.bouncycastle.util.encoders.Base64"%>
<%@page import="java.io.StringReader"%>
<%@page import="java.util.*"%>
<%@page import="org.apache.commons.io.IOUtils"%>
<%@page pageEncoding="UTF-8" %> 
<% 
String postUrl = request.getParameter("postUrl");
String merchantId = request.getParameter("merchantId");
String signType = request.getParameter("signType");
String version = request.getParameter("version");
String currency = request.getParameter("currency");
String signMsg = request.getParameter("signMsg");
// 提交查询请求
		String resultMsg = "";
		PostMethod postmethod=null;
		String viewMsg="";
		try{
			HttpClient httpclient=new HttpClient();
			postmethod=new PostMethod(postUrl);
			NameValuePair[] date = { new NameValuePair("merchantId",merchantId),
					new NameValuePair("version",version),
					new NameValuePair("signType",signType),
					new NameValuePair("currency",currency),
					new NameValuePair("signMsg",signMsg)};
			postmethod.setRequestBody(date);
			int responseCode=httpclient.executeMethod(postmethod);
			out.print("responseCode="+responseCode);		
			out.print("<hr>");
			if(responseCode == HttpURLConnection.HTTP_OK){
			resultMsg = IOUtils.toString(postmethod.getResponseBodyAsStream(), "utf-8");
			System.out.println("批量查询响应的原始报文："+resultMsg);
			String fileAsString = ""; // 签名信息前的对账文件内容
			String fileSignMsg = ""; // 文件签名信息
			boolean isVerified = false; // 验证签名结果			
			String ENCODING = "UTF-8";			
			byte[] data = Base64.decode(resultMsg);
			String tempStr = new String(data, ENCODING);
			System.out.println(tempStr);
			if(tempStr.indexOf("ERRORCODE=")<0){
				BufferedReader fileReader = new BufferedReader(new StringReader(tempStr));
				// 读取交易结果
				String lines;
				StringBuffer fileBuf = new StringBuffer(); // 签名信息前的字符串				String lines;
				List<String> mchtExchangeRateList = new ArrayList<String>();
				
				while ((lines = fileReader.readLine()) != null) {
					if (lines.length() > 0) {
					    mchtExchangeRateList.add(lines);
					}
				}
				fileReader.close();
				//取签名源串
				for(int i = 0;i<mchtExchangeRateList.size()-2;i++){
						fileBuf.append(mchtExchangeRateList.get(i)+"\r\n");
				}
				fileBuf.append(mchtExchangeRateList.get(mchtExchangeRateList.size()-2));
				fileAsString = fileBuf.toString();
				//取签名信息
				fileSignMsg = mchtExchangeRateList.get(mchtExchangeRateList.size()-1);
				
				System.out.println("File: \n" + fileAsString);
				System.out.println("Sign: \n" + fileSignMsg);
				// 验证签名：先对文件内容计算MD5摘要，再将MD5摘要作为明文进行验证签名
				String fileMd5 = SecurityUtil.MD5Encode(fileAsString);
				String certPath="";
				if(postUrl.indexOf("service.allinpay.com")>0){
					certPath="/opt/conf/TLCert-prod.cer";//生产证书路径
				}else{
					certPath="/opt/conf/TLCert-test.cer"; //测试证书路径
				}
				isVerified = SecurityUtil.verifyByRSA(certPath, fileMd5.getBytes(), Base64.decode(fileSignMsg));
				if (isVerified) {
					// 验证签名通过，解析交易明细，开始对账
					System.out.println("验证签名通过");
					viewMsg=fileAsString+"\r\n"+fileSignMsg;
				} else {
					// 验证签名不通过，丢弃对账文件
					System.out.println("验证签名不通过");
	
				}
			}else{
				viewMsg=tempStr;
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
    <title>汇率查询</title>
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
