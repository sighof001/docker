<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>资讯</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<script src="<%=request.getContextPath() %>/js/mobile/news/newsMain.js"></script>
</head>
<script>
var flag = "${flag}";

</script>
<body>
<div data-role="page" class="page"  data-theme="i"> 
  <!-----header start----->
  <div data-role="header" data-position="fixed" class="inside-header"><a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
    <h1>资讯</h1>
  </div>
  <!-----header end----->
  <div class="inside-main">
   <!--资讯图片start--> <div class="new-pic"></div> <!--资讯图片end--> 
    <div class="wrap">
    <!------新闻类别导航start------>
      <div data-role="navbar" class="news-navbar">
        <ul>
        	<c:forEach items="${articleAssortList}" var="article">
        		<li><a rel="external" id="${article.id}" href="<%=request.getContextPath() %>/news/newsMain.do?key=${article.id}">${article.themeName}</a></li>
        	</c:forEach>
        </ul>
      </div>
    <!------新闻类别导航end------>
      <div class="main-con">
      <!---新闻列表start----->
        <ul class="news-list">
        <!-----一条新闻信息 start------>
        <c:forEach items="${articleList }" var="article">
          <li> 
          <a href="<%=request.getContextPath() %>/news/newsDetail/${article.id}.do" rel="external">
            <h3 class="newslist-title">${article.title }</h3>
            <%-- <div class="newslist-con">
            		${article.content}
            </div> --%>
            <p class="newslist-tip"><span>${article.createDate} ${article.createTime}</span></p>
            </a>
          </li>
          </c:forEach>
        <!-----一条新闻信息 end------>
        </ul>
        <!---新闻列表end----->
      </div>
    </div>
  </div>
</div>
</body>
</html>
