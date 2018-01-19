<%@ page language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<%-- <meta http-equiv="refresh" content="3;url=<%=request.getContextPath()%>/login/loginView.do" />  --%>
<title>修改密码成功</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<script src="<%=request.getContextPath()%>/js/mobile/cust/passwordUpdateSuccess.js"></script>
</head>
<body>
<div data-role="page" class="page"  data-theme="i"> 
  <!-----header start----->
  <div data-role="header" data-position="fixed" class="inside-header"> <a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
    <h1>修改密码成功</h1>
    <a href="###" class="btnwordwhite btnnobg f24"  rel="external"></a> </div>
  <!-----header end----> 
  <!---提示信息start--->
  <div class="inside-main">
    <div class="wrap">
      <div class="wrap-tip">
        <p class="icon icon-big icon-hook"></p>
        <p><span id="show"/></p>
        <!-- <p class="padtop36"><a class="btn-submit2 bgorange btnlink"  data-role="none" rel="external" href="productslist.html" />马上去委托</a></p> -->
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
