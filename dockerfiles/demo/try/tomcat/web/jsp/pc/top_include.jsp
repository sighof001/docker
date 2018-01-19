<%@page import="com.investfinancing.constants.DictValue"%>
<%@page import="com.investfinancing.pojo.TryCustInfo"%>
<%@page import="com.investfinancing.constants.SessionKeys"%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%
	TryCustInfo cust = (TryCustInfo) session.getAttribute(SessionKeys.LOGINED_USER);
	boolean isLogined = cust == null;
%>

<div class="bottom_header_wrap">
	<div class="container bottom_header">
		<div class="row">
			<a href="<%=request.getContextPath()%>/index/pcIndexList.do"
				class="col-sm-6"> <img
				src="<%=request.getContextPath()%>/pcimages/logo.png" /></a>
			<ul class="col-sm-6 textright">
				<%if (isLogined) {%>
					<li class="banner_link" ><a href="<%=request.getContextPath()%>/register/pcRegisterView.do" class="col-xs-3">注册</a></li>
					<li class="banner_link" ><a href="###" class="col-xs-3" data-toggle="modal" data-target="#gologin">登录</a></li> 
				<%} else {%>
					<li class="banner_link" ><a class="col-xs-3" href="<%=request.getContextPath()%>/login/pcLogout.do">退出</a></li>
					<li class="banner_link" ><a class="col-xs-3" href="<%=request.getContextPath()%>/myView/pcMyAssetView.do">个人中心</a></li>
					<li class="banner_link" ><%=cust.getLoginId()%></li> 
				<%}%>
			</ul>
		</div>
	</div>
</div>

<!----导航栏start----->
<nav class="navbar_wrap" role="navigation">
	<div class="container">
		<ul class="ul_horizontal ul_nav clearfix" id="menu">
			<li><a
				href="<%=request.getContextPath()%>/index/pcIndexList.do">网站首页</a></li>
			<li><a class="login"
				href="<%=request.getContextPath()%>/webEntrust/pcProductsListView/<%=DictValue.GOODS_TYPE_NORMAL %>.do">委托投资</a></li>
			<li><a class="login"
				href="<%=request.getContextPath()%>/loanApplication/pcLoanApplicationView.do">贷款申请</a></li>
			<%-- <li><a class="login" href="<%=request.getContextPath()%>/loanApplication/pcLoanApplicationViewFP.do">公益金融</a></li> --%>
			<li><a href="<%=request.getContextPath()%>/fp/publicFinance.do">公益金融</a></li>
			<li id="learning"><a href="<%=request.getContextPath()%>/news/pcNewsList.do">财富学堂</a></li>
			<li><a href="<%=request.getContextPath()%>/help/pcInsurance.do">安全保障</a></li>
			<!-- <li><a href="#">下载金达APP</a></li> -->
		</ul>
	</div>
</nav>
<!----导航栏end----->

