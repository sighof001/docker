<%@ page language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>提现成功</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/mobile/order/withdrawSuccess.js"></script>
</head>

<body>
<div data-role="page" class="page"  data-theme="i"> 
  <!-----header start----->
  <div data-role="header" data-position="fixed" class="inside-header"> <a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
    <h1>提现成功</h1>
    <a href="###" class="btnwordwhite btnnobg f24"  rel="external"></a> </div>
  <!-----header end----> 
  <!---充值start--->
  <div class="inside-main ">
    <div class="wrap">
        <ul class="form-list takeout-list">
          <li class="takeout-list-tip">提现申请已提交，请等待审核</li>
          <li>
            <label >提现金额</label>
            <a href="javascript:void(0)" data-rel="popup"  class="bank-txt " data-position-to="#demo">${order.amount}</a>
          </li>
          <li>
            <label class="error"></label>
          </li>
        </ul>
        
        <input class="btn-submit2 bgorange viewList" type="button" data-role="none" value="查看记录"  />
    </div>
  </div>
  <!---充值end---> 
</div>
</body>
</html>
