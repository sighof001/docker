<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>消息通知</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<script type="text/javascript">

$(function(){
	$(".btnwordwhite").on("tap",function(){
		location.href = cxt+"/notice/noticeList/${messageType}.do";
		return false;
	});
	
});

</script>
</head>

<body>
<div data-role="page" class="page"  data-theme="i"> 
  <!-----header start----->
  <div data-role="header" data-position="fixed" class="inside-header"> 
  		<a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1" ></a>
    <h1>消息通知</h1>
  </div>
  <!-----header end----->
  <div class="inside-main">
    <div class="wrap">
    <div class="news-detail-top">
     <h2 class="news-detailtitle">${trySysMessage.title}</h2>
     <p class="newslist-tip"><span>${trySysMessage.publishTime }</span><span>金达投融易</span></p>
    </div>
    <div class="news-detail">
    	<p>${trySysMessage.content}</p>
    </div>
    </div>
  </div>
</div>
</body>
</html>
