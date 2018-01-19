<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>404错误</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
</head>

<body>
<div data-role="page" id="pageone" class="page "  data-theme="i"> 
  <!-----header start----->
  <div data-role="header" data-position="fixed" class="inside-header"> <a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
    <h1>404错误</h1>
    <a href="###" class="btnwordwhite btnnobg"  rel="external"></a> </div>
  <!-----header end----> 
  <!----404错误 start------>
  <div data-role="content"  class="inside-main bgwhite">
    <div class="select_content txtcenter">
      <div class="error_wrap"> </div>
      <h2 class="error_title">哎呀...您访问的页面不存在</h2>
      <a href="<%=request.getContextPath() %>/index/indexList.do" class="error_btn" rel="external">返回网站首页</a> </div>
  </div>
  <!-----404错误 end----> 
</div>
</div>
</body>
</html>
