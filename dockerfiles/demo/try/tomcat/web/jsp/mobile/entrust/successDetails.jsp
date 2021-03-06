<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>委托成功</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
</head>

<body>
<div data-role="page" class="page"  data-theme="i"> 
  <!-----header start----->
  <div data-role="header" data-position="fixed" class="inside-header"> <a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
    <h1>委托成功</h1>
    <a href="<%=request.getContextPath()%>/index/indexList.do" class="btnwordwhite btnnobg"  rel="external"><h3>完成</h3></a> </div>
  <!-----header end----->
  <div class="inside-main">
    <div class="wrap">
      <ul class="ul-list ul-list-height">
        <li><span class="color-grey">产品名称：</span><span>${order.goodsName }</span></li>
        <li><span class="color-grey">委托金额：</span><span>${order.amount }</span></li>
        <li><span class="color-grey">交易单号：</span><span>${order.payOrderId }</span></li>
        <li><span class="color-grey">交易时间：</span><span>${order.payTimeStr }</span></li>
      </ul>
    </div>
  </div>
</div>
</body>
</html>
