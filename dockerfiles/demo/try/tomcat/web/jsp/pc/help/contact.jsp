<%@ page language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>联系我们</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="/jsp/pc/pc_include.jsp" flush="true"></jsp:include>
<!--[if lt IE 9]>
<script src="js/html5shiv.min.js"></script>
<script src="js/respond.min.js"></script>
 <![endif]-->

</head>

<body>
<!-----头部start------>
<jsp:include page="/jsp/pc/top_include.jsp" flush="true"></jsp:include>
<!-----头部end----------> 
<!----导航栏start----->
<!----导航栏end-----> 
<!------新闻内容start------->
<div class="container martop30 bgwhite clearfix">
  <div class=" news_wrap">
    <div class="news_con_head ">
      <h3>${comanyName }</h3>
    </div>
   </div class="news_con">
   		<p></p>
		<p>地址：${address }</p>
		<p>电话：${tel }</p>
		<p>传真：${fax }</p>
		<p>金达官网：${officialUrl }</p>
		<p>平台网址：${platformUrl }</p>
   
   </div>
  </div>
</div>
<!--------新闻内容start---------> 
<!-----网站底部start-------->
<!------网站底部end------->
</div>
<jsp:include page="/index/buttons.do" flush="true"></jsp:include>
<!-- 登录弹出框start -->
</div>
<jsp:include page="/jsp/pc/login_include.jsp" flush="true"></jsp:include>
<!--弹出框start -->
</body>
</html>
