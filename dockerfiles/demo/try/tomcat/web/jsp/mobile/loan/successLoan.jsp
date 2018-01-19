<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>申请成功</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
</head>

<body>
<div data-role="page" class="page"  data-theme="i"> 
  <!-----header start----->
  <div data-role="header" data-position="fixed" class="inside-header"> <a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
    <h1>申请成功</h1>
    <a href="<%=request.getContextPath()%>/index/indexList.do" class="btnwordwhite btnnobg"  rel="external"><h3>完成</h3></a> </div>
  <!-----header end----->
  <div class="inside-main">
    <div class="wrap">
      <ul class="ul-list ul-list-height">
        <li><span class="color-grey">借款类型：</span><span>${loan.displayLoanType }</span></li>
        <li><span class="color-grey">拟借金额：</span><span>${loan.amount }</span></li>
        <li><span class="color-grey">借款期限(天)：</span><span>${loan.loanTerm }</span></li>
        <li><span class="color-grey">申请时间：</span><span>${loan.createDateStr }</span></li>
      </ul>
    </div>
  </div>
</div>
</body>
</html>
