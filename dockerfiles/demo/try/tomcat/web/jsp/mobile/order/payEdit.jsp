<%@ page language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>支付</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<script src="<%=request.getContextPath() %>/js/mobile/order/payEdit.js"></script>
</head>

<body>
<form action="#" name="mainForm" method="post">
<input type="hidden" name="orderId" value="${order.id}" />
<div data-role="page" class="page"  data-theme="i"> 
  <!-----header start----->
  <div data-role="header" data-position="fixed" class="inside-header"> <a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
    <h1>支付</h1>
    <a href="###" class="btnwordwhite btnnobg f24"  rel="external"></a> </div>
  <!-----header end----> 
  <!---充值start--->
  <div class="inside-main ">
    <div class="wrap">
        <ul class="form-list takeout-list">
          <li>
            <label >支付金额</label>
            <a href="javascript:void(0)" data-rel="popup"  class="bank-txt " data-position-to="#demo">${order.amount}</a>
          </li>
          <li class="verLi">
            <label>手机验证</label>
            <input type="text" id="verCode" name="verCode" data-role="none"  class="inputtxt" placeholder="请输入验证码"/>
            <button type="button" id="btnVerCode" value="获取验证码" class="getvalid" data-role="none" style="width:280px;" />获取验证码</button>
          </li>
          <li>
            <label class="error"></label>
          </li>
        </ul>
        <input class="btn-submit2 bgorange ok" type="button" data-role="none" value="充值"  />
    </div>
  </div>
  <!---充值end---> 
</div>
</form>
</body>
</html>
