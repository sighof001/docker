<%@ page language="java" pageEncoding="utf-8"%>
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
  <br>
    <a href="merchant.html">返回接口测试首页</a><br>
    <center><h2><strong>退款订单查询</strong></h2></center>
    <form name="form1" action="refundOrderSign.jsp" method="post">   
    <table class="table_box" width="100%">
    <tr><td>提交地址：</td><td>
   <select id ="selectpostUrl" onchange="javascript:this.form.postUrl.value=this.value;">
      <option value="http://192.168.101.41/mchtoq/refundQuery">开发环境192.168.101.41</option>
	  <option value="http://192.168.103.51/mchtoq/refundQuery">测试环境192.168.103.51</option>
	  <option value="http://service.allinpay.com/mchtoq/refundQuery">生产环境</option>
    </select>
    <input type="text" name="postUrl" id ="postUrl" value="http://192.168.101.41/mchtoq/refundQuery" maxlength="100" size="60"/></td></tr>
    <tr><td>版本号 :</td><td><input type="text" name="version" value="v2.4"/> </td></tr>
    <tr><td>md5key :</td><td><input type="text" name="key" value="1234567890"/></td></tr>
    <tr><td>商户号 :</td><td><input type="text" name="merchantId" value="100020141104001"/></td></tr>
    <tr><td>商户订单号 :</td><td><input type="text" name="orderNo" value="NO20141106155618"/></td></tr>
    <tr><td>退款金额 :</td><td><input type="text" name="refundAmount" value="100"/></td></tr>
    <tr><td>退款受理时间 :</td><td><input type="text" name="refundDatetime" value="20141106155727"/></td></tr>
    <tr><td>商户退款订单号 :</td><td><input type="text" name="mchtRefundOrderNo" value=""/></td></tr>
    <tr><td>签名类型 : </td><td><input type="text" name="signType" value="1"/> </td></tr>
    <tr><td><input type="submit"  value="退款订单查询，提交"/></td><td></td></tr>
    </table>                                                                                                                                                                                                                                                                                                                                                                                                                                                  
</form>   
</body>
</html>
