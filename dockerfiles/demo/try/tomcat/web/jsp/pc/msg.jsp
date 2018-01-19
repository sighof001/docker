<%@ page language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>提示</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="/jsp/pc/pc_include.jsp" flush="true"></jsp:include>
<!--[if lt IE 9]>
<script src="js/html5shiv.min.js"></script>
<script src="js/respond.min.js"></script>
 <![endif]-->
 <script type="text/javascript">
 $(function(){
	 	var count = 3;
		var timer = window.setInterval(function(){
			count--;
			if(count>=0){
				$("#ed").text(count+"秒倒计时跳转");
			}else{
				//关闭定时器
				window.clearInterval(timer);
				window.location.href= cxt + "/index/pcIndexList.do";
			}
		},1000);
	 
	 
 });
 
 </script>

</head>

<body>
<!-----头部start------>
<jsp:include page="/jsp/pc/top_include.jsp" flush="true"></jsp:include>
<!-----头部end----------> 
<!------start--------->
<div class="bgwhite">
<div class="container error_container">
<div class="row text-center">

<div class="col-sm-12 opera-wrap">
	<h2 class="colorgreen"><img src="<%=request.getContextPath() %>/pcimages/success.png"/>操作成功</h2>
	<p style="font-size:25px;">${message }</p>
	<div>
		<p id="ed">3秒倒计时跳转</p>
		<a href="<%=request.getContextPath() %>/index/pcIndexList.do" >如果您的页面没有自动跳转，请点击这里</a>
	</div>
</div>
</div>
</div>
</div>
<!-------end--------> 

<!-----网站底部start-------->
<jsp:include page="/index/buttons.do" flush="true"></jsp:include>
<!------网站底部end------->
</div>
<!-- 登录弹出框start -->
<jsp:include page="/jsp/pc/login_include.jsp" flush="true"></jsp:include>
<!--弹出框start -->
</body>
</html>
