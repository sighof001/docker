<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>帮助中心</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="/jsp/pc/pc_include.jsp" flush="true"></jsp:include>
<script
	src="<%=request.getContextPath()%>/pcjs/pc/news/helpCenterList.js"></script>
<script type="text/javascript">
	
</script>
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
	<!------新闻列表start------->
	<div class="container martop30 clearfix">
		<div class="row">
			<div class="col-sm-3">
				<form action="" class="queryForm">
					<input type="hidden" name="assortId">
				</form>
				<div class="news_listleft_head">帮助中心</div>
				<ul class="news_listleft_con" id="test">
					<li id="${helpCenter.id}"><a class="focus"
						id="${helpCenter.themeName}">${helpCenter.themeName}</a></li>
				</ul>
			</div>
			<div class="col-sm-9 news_listright">
				<div class="news_listright_head" id="firstTitle">${helpCenter.themeName}</div>
				<ul class="news_listright_con" id="table"
					url="/news/pcHelpCenterMain.do">
					<c:forEach items="${articleList}" var="article">
						<li><a
							href="<%=request.getContextPath()%>/index/news/${article.id}.do">
								<div class="news_listtitle clearfix">
									<span class="pull-left">${article.title}</span><em
										class="pull-right">${article.createDate}</em>
								</div>
						</a></li>
					</c:forEach>
				</ul>
				<jsp:include page="/jsp/pc/pager.jsp"></jsp:include>
			</div>
		</div>
	</div>
	<!--------新闻列表start--------->
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
