<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>我的</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<script src="<%=request.getContextPath()%>/js/mobile/cust/myView.js"></script>
<style type="text/css">
.notice {
	width: 40px;
	height: 40px;
	line-height: 40px;
	font-size: 25px;
	color: #fff;
	text-align: center;
	background-color: #f00;
	border-radius: 50%;
	right: -10px;
	top: -10px;
}
</style>
</head>

<body>
	<div data-role="page" class="page" data-theme="i">
		<!-----header start----->
		<div data-role="header" data-position="fixed" class="inside-header">
			<a href="<%=request.getContextPath()%>/index/indexList.do" class="btnwordwhite btnnobg icon-leftarrow-1" rel="external"></a>
			<h1>我的</h1>
			<a href="<%=request.getContextPath()%>/notice/noticeList/2.do"
				class="btnwordwhite btnnobg icon-news" rel="external"></a>
		</div>
		<div class="inside-main">
			<!----总资金start--->
			<div class="product-sum-top me-sum-top">
				<!---头像修改start-->
				<a href="<%=request.getContextPath()%>/personal/personalInfo.do"
					class="product-sum-topcon" rel="external">
					<p class="mehead">
					<c:choose>
					<c:when test="${custInfo.headerImage==null}">
						<img src="<%=request.getContextPath()%>/images/defaulthead.jpg" />
					</c:when>
					<c:otherwise>
						<img src="<%=request.getContextPath()%>/myView/viewHeaderImages.do?alaramPic=${custInfo.headerImage}"/>
					</c:otherwise>
					</c:choose>
					</p>
					<p class="menickname">${custInfo.nickName}</p>
				</a>
				<!---头像修改start-->
				<!-- <div class="product-sum-topcon">
        <p class="f24 color-lightgray">总资金(元)</p>
        <p class="f48 fb color-orange">101.23</p>
      </div> -->
			</div>
			<!---总资金 end--->
			<!----总收益等 start----->
			<div class="product-sum-bottom me-sum-bottom ui-grid-b">
				<div class="ui-block-a" onclick="javascript:window.location.href='<%=request.getContextPath()%>/order/myAssetList/all.do'">
					<div class="sum-bottom-left">
					  <p class="f24 color-lightgray">总资产(元)</p>
			          <p>${assetAmount + custInfo.custAmount}</p>
					</div>
				</div>

				<div class="ui-block-b">
				<div class="sum-bottom-right">
			          <p class="f24 color-lightgray">总收益(元)</p>
					  <p>${total }</p>
       		 	</div>
				</div>

				<div class="ui-block-c">
					<div class="sum-bottom-right">
						<p class="f24 color-lightgray">
						<a href="<%=request.getContextPath()%>/tryCustRunningAccount/myRunningAccount/all.do" rel="external">余额(元)</a></p>
						<p>${custInfo.custAmount}</p>
					</div>
				</div>
			</div>
			<!----总收益等 end----->

			<!----一个列表信息 start------>
			<div class="inside-list me-list">
				<a class="inside-listcon clearfix recharge"
					href="<%=request.getContextPath()%>/order/rechargeEdit.do"
					rel="external">
					<div class="fl list-title icon-chart">充值</div>
					<div class="fr list-info color-grey icon-rightarrow-1"></div>
				</a> 
				<a class="inside-listcon clearfix withdraw" href="<%=request.getContextPath()%>/order/withdrawEdit.do"
					rel="external">
					<div class="fl list-title icon-page">提现申请</div>
					<div class="fr list-info color-grey icon-rightarrow-1"></div>
				</a> 
				<a class="inside-listcon clearfix" href="<%=request.getContextPath()%>/order/rechargeList/all.do"
					rel="external">
					<div class="fl list-title icon-page">充值记录</div>
					<div class="fr list-info color-grey icon-rightarrow-1"></div>
				</a>
				<a class="inside-listcon clearfix" href="<%=request.getContextPath()%>/order/withdrawList/all.do"
					rel="external">
					<div class="fl list-title icon-page">提现记录</div>
					<div class="fr list-info color-grey icon-rightarrow-1"></div>
				</a>
				<a class="inside-listcon clearfix" href="<%=request.getContextPath()%>/order/extractList/all.do"
					rel="external">
					<div class="fl list-title icon-page">转出记录</div>
					<div class="fr list-info color-grey icon-rightarrow-1"></div>
				</a>
				<a class="inside-listcon clearfix" href="<%=request.getContextPath()%>/loanApplication/myLoan/all.do"
					rel="external">
					<div class="fl list-title icon-page">贷款记录</div>
					<div class="fr list-info color-grey icon-rightarrow-1"></div>
				</a>
			</div>
			<!-----一个列表信息 end---->
			<!----一个列表信息 start------>
			<div class="inside-list me-list">
				<a class="inside-listcon clearfix" href="<%=request.getContextPath()%>/order/myAssetList/all.do" rel="external">
					<div class="fl list-title icon-money-1">资产列表</div>
					<div class="fr list-info color-grey icon-rightarrow-1"></div>
				</a>
				<a class="inside-listcon clearfix" href="<%=request.getContextPath()%>/oldEntrust/myOldEntrustList/all.do" rel="external">
					<div class="fl list-title icon-money-1">历史委托列表</div>
					<div class="fr list-info color-grey icon-rightarrow-1"></div>
				</a>
				<a class="inside-listcon clearfix" href="<%=request.getContextPath()%>/order/fundDetailsView.do" rel="external">
					<div class="fl list-title icon-money-1">资金明细</div>
					<div class="fr list-info color-grey icon-rightarrow-1"></div>
				</a> <a class="inside-listcon clearfix"
					href="<%=request.getContextPath()%>/webEntrust/myEntrust/all.do"
					rel="external">
					<div class="fl list-title icon-list">我的委托</div>
					<div class="fr list-info color-grey icon-rightarrow-1"></div>
				</a> <!-- <a class="inside-listcon clearfix" href="###" rel="external">
					<div class="fl list-title icon-list-1">我的保单</div>
					<div class="fr list-info color-grey icon-rightarrow-1"></div>
				</a>  --><a class="inside-listcon clearfix"
					href="<%=request.getContextPath()%>/myView/card.do" rel="external">
					<div class="fl list-title icon-card">我的银行卡</div>
					<div class="fr list-info color-grey icon-rightarrow-1"></div>
				</a>
			</div>
			<!-----一个列表信息 end---->
			<!----一个列表信息 start------>
			<div class="inside-list me-list">
				<a class="inside-listcon clearfix"
					href="<%=request.getContextPath()%>/myView/realAuth.do"
					rel="external">
					<div class="fl list-title  icon-hook">实名认证</div>
					<div class="fr list-info color-grey icon-rightarrow-1"></div>
				</a> <a class="inside-listcon clearfix"
					href="<%=request.getContextPath()%>/myView/passwordUpdate.do"
					rel="external">
					<div class="fl list-title icon-lock">账户密码</div>
					<div class="fr list-info color-grey icon-rightarrow-1"></div>
				</a>
			</div>
			<!-----一个列表信息 end---->
			<!----一个列表信息 start------>
			<div class="inside-list me-list">
				<a class="inside-listcon clearfix"
					href="<%=request.getContextPath()%>/notice/noticeList/2.do"
					rel="external">
					<div class="fl list-title   icon-news-1">消息中心</div>
						<%-- <div class="fr notice ">${messageCount }</div> --%>
					<div class="fr list-info color-grey icon-rightarrow-1"></div>
				</a> 
				<a class="inside-listcon clearfix" href="<%=request.getContextPath()%>/news/helpCenterMain.do" rel="external">
					<div class="fl list-title icon-book-3">帮助中心</div>
					<div class="fr list-info color-grey icon-rightarrow-1"></div>
				</a>
			</div>
			<!-----一个列表信息 end---->
			
			<!----一个列表信息 start------>
			<div class="inside-list me-list">
				<a class="inside-listcon clearfix" href="<%=request.getContextPath()%>/login/logout.do"
					rel="external">
					<div class="fl list-title icon-lock">退出 </div>
					<div class="fr list-info color-grey icon-rightarrow-1"></div>
				</a>
			</div>

		</div>
		<!--底部start--->
		<jsp:include page="/jsp/mobile/buttons.jsp" flush="true"></jsp:include>
		<!---底部end-->
	</div>
</body>
</html>
