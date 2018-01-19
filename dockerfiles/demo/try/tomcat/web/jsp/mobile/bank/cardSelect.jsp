<%@ page language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>添加银行卡</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>

</head>

<body>
<div data-role="page" class="page"  data-theme="i"> 
  <!-----header start----->
  <div data-role="header" data-position="fixed" class="inside-header"> <a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
    <h1>添加银行卡</h1>
    <a href="###" class="btnwordwhite btnnobg "  rel="external"></a>
     </div>
   <!-----header end----->
  <div class="inside-main"> 
  <div class="wrap">
   <form method="post" action="<%=request.getContextPath() %>/bank/cardAdd.do">
   <ul class="ul-formlist form-list card-list">
  
   <li><a href="<%=request.getContextPath() %>/bank/cardAdd.do?bankName=中国建设银行" rel="external" data-role="none" class="icon icon1">中国建设银行</a></li>
   <li><a href="<%=request.getContextPath() %>/bank/cardAdd.do?bankName=中国工商银行" rel="external" data-role="none" class="icon icon2">中国工商银行</a></li>
   <li><a href="<%=request.getContextPath() %>/bank/cardAdd.do?bankName=中国农业银行" rel="external" data-role="none" class="icon icon3">中国农业银行</a></li>
   <li><a href="<%=request.getContextPath() %>/bank/cardAdd.do?bankName=中国银行" rel="external" data-role="none" class="icon icon4">中国银行</a></li>
   <li><a href="<%=request.getContextPath() %>/bank/cardAdd.do?bankName=招商银行" rel="external" data-role="none" class="icon icon5">招商银行</a></li>
   <li><a href="<%=request.getContextPath() %>/bank/cardAdd.do?bankName=交通银行" rel="external" data-role="none" class="icon icon6">交通银行</a></li>
   <li><a href="<%=request.getContextPath() %>/bank/cardAdd.do?bankName=中国民生银行"" rel="external" data-role="none" class="icon icon7">中国民生银行</a></li>
   </ul>
   </form>
   </div>
    
  </div>
  
</div>
</body>

</html>
