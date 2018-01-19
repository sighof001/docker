<%@ page language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>提现</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<script src="<%=request.getContextPath() %>/js/mobile/order/withdrawEdit.js"></script>
</head>

<body>
<form action="#" name="mainForm" method="post">
<div data-role="page" class="page"  data-theme="i"> 
  <!-----header start----->
  <div data-role="header" data-position="fixed" class="inside-header"> <a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
    <h1>提现</h1>
    <a href="###" class="btnwordwhite btnnobg f24"  rel="external"></a> </div>
  <!-----header end----> 
  <!---充值start--->
  <div class="inside-main ">
    <div class="wrap">
        <ul class="form-list takeout-list">
          <li class="takeout-list-tip">当前帐户余额${banlance }元</li>
          <input type="hidden" id="banlance" name="banlance" value="${banlance }">
          <li>
            <label >提现金额</label>
            <input type="number" data-role="none" name="amount" class="inputtxt" placeholder="请输入金额(元)" />
          </li>
          <li>
            <label >支付密码</label>
            <input  type="password" data-role="none" name="payPassword" class="inputtxt" placeholder="请输入支付密码" />
          </li>
          <li>
            <label class="error"></label>
          </li>
        </ul>
        <input class="btn-submit2 bgorange ok" type="button" data-role="none" value="申请提现"  />
    </div>
  </div>
  <!---充值end---> 
</div>
</form>
</body>
</html>
