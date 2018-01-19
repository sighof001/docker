<%@ page language="java" pageEncoding="utf-8"%>
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
  <br>
    <a href="merchant.html">返回接口测试首页</a><br>
    <center><h2><strong>单个汇率查询</strong></h2></center>
    <form name="form1" action="singleExRateSign.jsp" method="post">   
    <table class="table_box" width="100%">
    <tr><td>提交地址：</td><td><input type="text" name="postUrl" value="http://192.168.103.51/mchtoq/mchtRate" maxlength="100" size="60"/></td></tr>
    <tr><td>版本号 :</td><td><input type="text" name="version" value="v1.6"/> </td></tr>
    <tr><td>md5key :</td><td><input type="text" name="key" value="1234567"/></td></tr>
    <tr><td>商户号 :</td><td><input type="text" name="merchantId" value="100020003000"/></td></tr>
    <tr><td>币种 :</td><td><input type="text" name="currency" value="978"/></td></tr>
    <tr><td>签名类型 : </td><td><input type="text" name="signType" value="1"/> </td></tr>
    <tr><td><input type="submit"  value="单个汇率查询，提交"/></td><td></td></tr>
    </table>                                                                                                                                                                                                                                                                                                                                                                                                                                                  
</form>   
</body>
</html>
