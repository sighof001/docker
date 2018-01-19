<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%


String postUrl  = request.getParameter("");
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
    <form name="form1" action="batchQuerySign.jsp" method="post">     
    	 提交地址： <input type="text" name="postUrl" value="http://ceshi.allinpay.com/mchtoq/index.do" maxlength="100" size="60"/>   </br>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
		版本号 : <input type="text" name="version" value="v1.6"/>   </br>
	    md5key : <input type="text" name="key" value="1234567890"/>   </br>
		商户号:<input type="text" name="merchantId" value="100020091218001"/>   </br>
		订单开始时间:  <input type="text" name="beginDateTime" value="2013011400"/>   </br>
		订单结束时间 : <input type="text" name="endDateTime" value="2013011423"/>  </br> 
		页码 : <input type="text" name="pageNo" value="1"/>   </br>
		签名类型 : <input type="text" name="signType" value="1"/>   </br>
		 
		 <input type="submit"  value="提交"/>                                                                                                                                                                                                                                                                                                                                                                                                                                                 
		                                                                                                                                                                                                                                                                                                                                                                                                                                                      
</form>         
  </body>
</html>
