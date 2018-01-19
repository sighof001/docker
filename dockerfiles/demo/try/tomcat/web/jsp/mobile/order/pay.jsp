<%@ page language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>充值</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<script src="<%=request.getContextPath() %>/js/mobile/order/pay.js"></script>
</head>

<body>
<form action="${serviceUrl}" name="mainForm" method="post">
<input type="hidden" name="inputCharset" value="${requestOrder.inputCharset }"/>
<input type="hidden" name="pickupUrl" value="${requestOrder.pickupUrl }"/>
<input type="hidden" name="receiveUrl" value="${requestOrder.receiveUrl }" />
<input type="hidden" name="version" value="${requestOrder.version  }"/>
<input type="hidden" name="language" value="${requestOrder.language  }" />
<input type="hidden" name="signType" value="${requestOrder.signType }"/>
<input type="hidden" name="merchantId" value="${requestOrder.merchantId }" />
<input type="hidden" name="payerName" value="${requestOrder.payerName }"/>
<input type="hidden" name="payerEmail" value="${requestOrder.payerEmail }" />
<input type="hidden" name="payerTelephone" value="${requestOrder.payerTelephone  }" />
<input type="hidden" name="payerIDCard" value="${requestOrder.payerIDCard  }" />
<input type="hidden" name="pid" value="${requestOrder.pid }"/>
<input type="hidden" name="orderNo" value="${requestOrder.orderNo }" />
<input type="hidden" name="orderAmount" value="${requestOrder.orderAmount  }"/>
<input type="hidden" name="orderCurrency" value="${requestOrder.orderCurrency }" />
<input type="hidden" name="orderDatetime" value="${requestOrder.orderDatetime }" />
<input type="hidden" name="orderExpireDatetime" value="${requestOrder.orderExpireDatetime  }"/>
<input type="hidden" name="productName" value="${requestOrder.productName }" />
<input type="hidden" name="productPrice" value="${requestOrder.productPrice }" />
<input type="hidden" name="productNum" value="${requestOrder.productNum  }"/>
<input type="hidden" name="productId" value="${requestOrder.productId }" />
<input type="hidden" name="productDesc" value="${requestOrder.productDesc }" />
<input type="hidden" name="ext1" value="${requestOrder.ext1 }" />
<input type="hidden" name="ext2" value="${requestOrder.ext2 }" />
<input type="hidden" name="payType" value="${requestOrder.payType }" />
<input type="hidden" name="issuerId" value="${requestOrder.issuerId }" />
<input type="hidden" name="pan" value="${requestOrder.pan  }" />
<input type="hidden" name="tradeNature" value="${requestOrder.tradeNature}" />
<input type="hidden" name="signMsg" value="${strSignMsg}" />
<div data-role="page" class="page"  data-theme="i"> 
  <!-----header start----->
  <div data-role="header" data-position="fixed" class="inside-header"> <a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
    <h1>充值</h1>
    <a href="###" class="btnwordwhite btnnobg f24"  rel="external"></a> </div>
  <!-----header end----> 
  <!---充值start--->
  <div class="inside-main ">
    <div class="wrap">
        <ul class="form-list takeout-list">
          <li class="takeout-list-tip">当前帐户余额${banlance}元</li>
          <li>
            <label >充值金额</label>
            <a href="javascript:void(0)" data-rel="popup"  class="bank-txt " data-position-to="#demo">${requestOrder.orderAmount}</a>
          </li>
          <li>
            <label class="error"></label>
          </li>
        </ul>
        <input class="btn-submit2 bgorange ok" type="submit" data-role="none" value="确定"  />
    </div>
  </div>
  <!---充值end---> 
</div>
</form>
</body>
</html>
