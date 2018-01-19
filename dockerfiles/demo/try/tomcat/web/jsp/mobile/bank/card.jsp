<%@ page language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>我的银行卡</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
</head>

<body>
<div data-role="page" class="page"  data-theme="i"> 
  <!-----header start----->
  <div data-role="header" data-position="fixed" class="inside-header"> <a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
    <h1>我的银行卡</h1>
    <a href="###" class="btnwordwhite btnnobg f24"  rel="external"></a> </div>
  <!-----header end---->
  <!---添加银行卡信息start--->
  <div class="inside-main">
    <div class="wrap">
    <div class="mycard icon-card2"></div>
    <div class="mycard-tip"> <p>添加银行卡</p>
    <p>即可享受高回报的存款体验</p>
    </div>
    <div class="btn-linebord"> <a href="<%=request.getContextPath() %>/bank/cardAdd.do" class="color-blue" rel="external">马上添加银行卡</a></div>
    </div>
  </div>
   <!---添加银行卡信息end--->
</div>
</body>
</html>
