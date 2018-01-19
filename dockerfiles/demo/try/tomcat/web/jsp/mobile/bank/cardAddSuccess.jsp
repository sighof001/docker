<%@page import="com.investfinancing.constants.DictValue"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>添加银行卡成功</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
</head>

<body>
<div data-role="page" class="page"  data-theme="i"> 
  <!-----header start----->
  <div data-role="header" data-position="fixed" class="inside-header"> 
  <a rel="external" href="<%=request.getContextPath()%>/myView/myViewMain.do" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
    <h1>添加银行卡成功</h1>
    <a href="###" class="btnwordwhite btnnobg f24"  rel="external"></a> </div>
  <!-----header end----> 
  <!---提示信息start--->
  <div class="inside-main">
    <div class="wrap">
      <div class="wrap-tip">
       <p class="padtop10" align="right">
       <c:if test="${isAlreadyOrder==false}">
       <a class="btn-submit2 bgblue btn-linebord btnwordwhite"  data-role="none" rel="external" href="<%=request.getContextPath()%>/bank/cardAdd.do" />修改绑定</a>
       </c:if>
       </p>
        <p class="icon icon-big icon-hook"></p>
        <p>成功添加银行卡，已绑定银行卡</p>
        <p><span class="color-orange">${tryCustInfo.bankName}(${tryCustInfo.anonymousCardNumber})</span></p>
        <p class="padtop36"><a class="btn-submit2 bgorange btnlink"  data-role="none" rel="external" href="<%=request.getContextPath() %>/webEntrust/productsList/<%=DictValue.GOODS_TYPE_NORMAL %>.do" />马上去委托</a></p>
      </div>
    </div>
  </div>
  <!---提示信息end---> 
     <!--底部start--->
 <jsp:include page="/jsp/mobile/buttons.jsp" flush="true"></jsp:include>
  <!---底部end--> 
</div>
</body>
</html>
