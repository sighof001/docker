<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>保单模板</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<style type="text/css">
div.news-detail img{width: 100%;}	
</style>
</head>

<body>
<div data-role="page" class="page"  data-theme="i"> 
  <!-----header start----->
  <div data-role="header" data-position="fixed" class="inside-header"> <a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
    <h1>保单模板</h1>
  </div>
  <!-----header end----->
  <div class="inside-main">
    <div class="wrap">
    <!-- <div class="news-detail-top">
     <h2 class="news-detailtitle">保单模板</h2>
     <p class="newslist-tip"><span></span><span>金达投融易</span></p>
    </div> -->
      <div class="news-detail"> 
	   <p></p>
	   <p>温馨提示: 只有5万以上的存款才有保单</p>
	   <p><br /></p>
	   <p><img src="<%=request.getContextPath() %>/images/templet/policy1.jpg" /></p>
	   <p><br /></p>
	   <p><img src="<%=request.getContextPath() %>/images/templet/policy2.jpg" /></p>
	   <p><img src="<%=request.getContextPath() %>/images/templet/policy3.jpg" /></p>
	   <p><img src="<%=request.getContextPath() %>/images/templet/policy4.jpg" /></p>
	   <p></p> 
  	</div>
    </div>
    </div>
  </div>
</div>
</body>
</html>
