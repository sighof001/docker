<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>资讯详情</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<style type="text/css">
div.news-detail img{width: 100%;}	
</style>
</head>

<body>
<div data-role="page" class="page"  data-theme="i"> 
  <!-----header start----->
  <div data-role="header" data-position="fixed" class="inside-header"> <a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
    <h1>资讯详情</h1>
  </div>
  <!-----header end----->
  <div class="inside-main">
    <div class="wrap">
    <div class="news-detail-top">
     <h2 class="news-detailtitle">${article.title }</h2>
     <p class="newslist-tip"><span>${article.createDate } ${article.createTime }</span><span>${article.createUserId }</span></p>
    </div>
    <div class="news-detail">
    <p>${article.content }</p>
    </div>
    </div>
  </div>
</div>
</body>
</html>
