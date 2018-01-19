<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>转出成功</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
</head>

<body>
<div data-role="page" class="page"  data-theme="i"> 
  <!-----header start----->
  <div data-role="header" data-position="fixed" class="inside-header"> 
  	<a href="<%=request.getContextPath()%>/order/myAssetList/all.do" data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
    <h1>转出成功</h1>
    <a href="<%=request.getContextPath()%>/order/myAssetList/all.do" class="btnwordwhite btnnobg"  rel="external"><h3>完成</h3></a></div>
  <!-----header end----> 
  <!---提示信息start--->
  <div class="inside-main">
    <div class="wrap">
      <div class="wrap-tip">
        <p class="icon icon-big icon-hook"></p>
        <p > 已申请转出<span class="color-orange">${tryOrder.amount }</span>元至余额，预计5分钟内到账</p>
      </div>
    </div>
  </div>
  <!---提示信息end---> 
</div>
</body>
</html>
