<%@page import="com.investfinancing.constants.DictValue"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>首页</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="/jsp/pc/pc_include.jsp" flush="true"></jsp:include>
<script src="<%=request.getContextPath() %>/pcjs/pc/index.js"></script>
<script>
$(document).ready(function(e) {
	locationIndex(tabView.indexTabView);//导航栏定位
    $('#myCarousel').carousel('cycle');
	 tab(".tab_content",".tab_item",".tabsNavUl ","tabNavOn");
});
</script>
</head>

<body>
<!-----头部start------>
<jsp:include page="/jsp/pc/top_include.jsp" flush="true"></jsp:include>
<!-----头部end----------> 
<!----banner start------>
<div class="banner">
  <div id="myCarousel" class="carousel slide" data-interval="3000" > 
    <!-----右侧登录start------->
    <div class="container sy_login_wrap">
      <div class="sy_login_con">
      		<c:if test="${custInfo == null }">
	      		<p>年化收益率高达<span class="bigdata"><fmt:formatNumber value="${maxRate*100}" pattern="#" type="number"/><em>%</em></span></p>
		        <p>每万元年化收益<span class="colororange"><fmt:formatNumber value="${maxRate*10000}" pattern="#.00" type="number"/></span>元</p>
	        	<a  href="<%=request.getContextPath()%>/register/pcRegisterView.do" class="sy_login_link">注册</a> 
	        	<a href="###" class="sy_login_link" data-toggle="modal" data-target="#gologin">登录</a>
      		</c:if>
	       	<c:if test="${custInfo != null }">
		        	<p class="sy_headpic">
		        		<c:choose>
		        		<c:when test="${custInfo.headerImage==null}">
		        			<img src="<%=request.getContextPath() %>/pcimages/defaulthead.jpg"/>
		        		</c:when>
		        		<c:otherwise>
		        			<img src="<%=request.getContextPath()%>/myView/viewHeaderImages.do?alaramPic=${custInfo.headerImage}"/>
		        		</c:otherwise>
		        		</c:choose>
		        	</p>
	     		<a href="<%=request.getContextPath()%>/myView/pcMyAssetView.do" class="sy_login_link"> 查看个人中心</a>
     		</c:if>
        </div>
      <div class="sy_login"> </div>
    </div>
    <!-----右侧登录end---------> 
    <!-- 轮播（Carousel）指标 -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <!-- 轮播（Carousel）项目 -->
    <div class="carousel-inner">
    <%-- <c:forEach items="${trySysConfigImageKeyList}" var="items" varStatus="i">
    <c:if test="${i.index==0}">
    <div class="item active">
       <img src="${picPath}/${fileName}/${items.sysValue}"> 
       </div>
    </c:if>
    <c:if test="${i.index!=0}">
      <div class="item">
       <img src="${picPath}/${fileName}/${items.sysValue}"> 
       </div>
      </c:if>
    </c:forEach> --%>
      <div class="item active"> <img src="${start}/${fileName}/${relativePath}/${image1}" > </div>
      <div class="item "> <img src="${start}/${fileName}/${relativePath}/${image2}" > </div>
      <div class="item "> <img src="${start}/${fileName}/${relativePath}/${image3}" > </div>
    </div>
  </div>
</div>
<!----banner end------> 
<!---通知start----->
<div class="sy_notice">
  <div class="container">
    <div class="row sy_notice_con">
     	<h5>通知公告:</h5>
     	<div class="notice_active">
			<ul>
				<c:forEach items="${articleAssortListNotice}" var="article" varStatus="i">
			         <li class="notice_active_ch">
				         <a href="<%=request.getContextPath()%>/index/news/${article.id}.do">
					         <span class="colororange">${article.title}         
					         <em class="colorlightgrey">${article.createDate}</em></span>
				         </a>
			         </li>
		         </c:forEach>
			</ul>   
		</div>
      <div class="more"> 
      	<a href="<%=request.getContextPath()%>/news/pcNoticeMain.do" class="sy_notice_more">更多</a> 
      </div>
    </div>
  </div>
</div>
<!---通知end-----> 

<!-----交易额等start------>
<div class="bgwhite borderbottomline">
  <div class="container container_trade_wrap">
    <div class="row trade_wrap">
      <div class="col-sm-4">已加入金达的投资人：<span>${count}<em>位</em> </span> </div>
      <div class="col-sm-4 text-center">累计交易额： <span>${totalAmount }<em>元</em></span></div>
      <div class="col-sm-4 text-right">累计创造收益：<span>${totalInterest }<em>元</em></span></div>
    </div>
  </div>
</div>
<!----交易额等start------> 

<!-------保障等start--------->
<div class="bgwhite">
  <div class="container container_ensure">
    <div class="row">
      <div class="col-sm-4 ensure_theme1">
        <h4>安全有保障</h4>
        <p>与保险公司合作更放心</p>
      </div>
      <div class="col-sm-4 ensure_theme2">
        <h4>资金更灵活</h4>
        <p>起步投资仅100元起</p>
      </div>
      <div class="col-sm-4 ensure_theme3">
        <h4>稳定高收益</h4>
        <p>年化收益高轻松赚钱</p>
      </div>
    </div>
  </div>
</div>
<!----保障等end-------> 
<div class="container">
	<div class="row sy_notice_con">
		<div class="col-xs-10">
		</div>
		<div class="col-xs-2"> 
		</div>
	</div>
</div>

<!-------首页产品start------>
<div class="sy_products_wrap" style="padding-top: 0px;">
  <div class="container container_products">
    <div class="row"> 
      <!-----一个产品信息start--->
      <c:forEach items="${tryGoods}" var="goods" varStatus="i">
      <div class="col-sm-3">
        <div class="sy_products_bgwhite">
          <div class="sy_products_head 
          	<c:if test="${i.count%2==0}">bgorange</c:if>
          	<c:if test="${i.count%2!=0}">bgblue</c:if>
          	 ">${goods.goodsName}</div>
          <div class="sy_products_con">
            <div class=" sy_products_con_rate">
              <div class="rate_theme_wrap1">
                <p class="rate_theme1"><fmt:formatNumber value="${goods.rate*100}" pattern="#" type="number"/><em>%</em></p>
                <p>年化收益率</p>
              </div>
              <div class="borderline"></div>
              <div class="rate_theme_wrap2">
              <c:if test="${goods.term==0}">
              <p class="rate_theme2"><em>随时取</em></p>
              </c:if>
              <c:if test="${goods.term!=0}">
                <p class="rate_theme2"><fmt:formatNumber value="${goods.term}" pattern="#" type="number"/><em>天</em></p>
               </c:if>
                <p>委托期限</p>
              </div>
            </div>
            <a class="sy_products_con_btn" href="<%=request.getContextPath() %>/webEntrust/pcEntrustDetail/${goods.id}.do">立即抢购</a>
            <div class="sy_products_wanyuan colorgrey">每万元年收益<em class="colororange"><fmt:formatNumber value="${goods.rate*10000}" pattern="#.00" type="number"/></em>元</div>
            <div class="sy_products_bottom clearfix">
            <c:if test="${goods.term==0}">
            <div class="pull-left">按日返息</div>
              </c:if>
              <c:if test="${goods.term!=0}">
              <div class="pull-left">${goods.payInterestTypeStr}</div>
               </c:if>
              <div class="pull-right">保险本息全额承保</div>
            </div>
          </div>
        </div>
      </div>
      </c:forEach>
      <!----一个产品信息end------> 
    </div>
  </div>
</div>
<!-----首页产品end------> 
<!----首页流程图start---->
<div class="container flow_wrap"> </div>
<!----首页流程图end----> 
<!-----首页新闻等start------->
<div class="container sy_conton_bottom">
  <div class="row"> 
    <!------新闻中心start----->
    <div class="col-sm-5 sy_news">
      <ul class="synewsNavUl tabsNavUl  clearfix">
      <c:forEach items="${articleAssortList}" var="article" varStatus="i">
       <c:if test="${i.index==0}">
       <li class="synewsNavOn tabNavOn" id="${article.id}" onclick="getId(this)">${article.themeName}</a></li>
       </c:if>
       <c:if test="${i.index!=0}">
       <li id="${article.id}"  onclick="getId(this)">${article.themeName}</a></li>
       </c:if>
       </c:forEach>
      </ul>
      <a href="<%=request.getContextPath()%>/news/pcNewsList.do" class="sy_more">更多</a>
      <div class="synews_content tab_content ">
      <!-- 第一个  -->
        <ul class="synews_item tab_item" id="ul_art">
         <c:forEach items="${articleList}" var="article"  varStatus="i">
         <c:if test="${i.count<=5 }">
        <li class="test"><a href="<%=request.getContextPath()%>/index/news/${article.id}.do">${article.title}</a><span>${article.createDate}</span></li>
      	 </c:if>
        </c:forEach>
        </ul>
      </div>
    </div>
    <!----新闻中心end------> 
    <!-----帮助中心start---->
    <div class="col-sm-4 sy_news">
      <ul class="synewsNavUl clearfix">
        <li class="synewsNavOn">帮助中心</li>
      </ul>
      <a href="<%=request.getContextPath()%>/news/pcHelpCenterMain.do" class="sy_more">更多</a>
      <div class="synews_content">
        <ul class="synews_item">
        <c:forEach items="${articleAssortListHelp}" var="article" varStatus="i">
        <c:if test="${i.count<=5}">
        <li class="test"><a href="<%=request.getContextPath()%>/index/news/${article.id}.do">${article.title}</a></li>
        </c:if>
       </c:forEach>
        </ul>
      </div>
    </div>
    <!-----帮助中心end----->
    <div class="col-sm-3">
      <div class="rankicon"></div>
      <ul class="synewsNavUl syhelpUl clearfix">
        <li class="synewsNavOn">最新交易</li>
      </ul>
      <div class="synews_content syhelp_content">
        <ul class="synews_item syhelp_item">
        <c:if test="${tryOrderOrderByAmount!=null}">
        <c:forEach items="${tryOrderOrderByAmount}" var="tryOrder" varStatus="i">
        <c:if test="${i.count<=6}">
        <li>
        <i>${i.count}</i>
        <em style="width: 85.84px">￥${tryOrder.amount}</em>
        <span> ${tryOrder.anonymousCreateUserId}</span>
        </li>
        </c:if>
        </c:forEach>
        </c:if>
        
        </ul>
      </div>
    </div>
  </div>
</div>
<!------首页新闻等end------> 
<!-----网站底部start-------->
<jsp:include page="/index/buttons.do" flush="true"></jsp:include>
<!------网站底部end------->
</div>
<!-- 登录弹出框start -->
<jsp:include page="/jsp/pc/login_include.jsp" flush="true"></jsp:include>
<!--弹出框start -->
<jsp:include page="/tool/pcToolMain.do" flush="true"></jsp:include>
</body>
</html>
