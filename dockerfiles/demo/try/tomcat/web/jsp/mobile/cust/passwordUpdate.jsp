<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>账户密码</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<script
	src="<%=request.getContextPath()%>/js/mobile/cust/passwordUpdate.js"></script>
</head>

<body>
	<div data-role="page" id="pageone" class="page" data-theme="i">
		<!-----header start----->
		<div data-role="header" data-position="fixed" class="inside-header">
			<a rel="external" href="<%=request.getContextPath()%>/myView/myViewMain.do" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
			<h1>账户密码</h1>
			<a href="###" class="btnwordwhite btnnobg" rel="external"></a>
		</div>
		<!-----header end---->
		<div class="inside-main">
			<div class="select_content">
				<!-----全部明细内容start------>
				<!----用户消息 start------>

				<div class="select_item inside-list nomarin">
					<a rel="external" href="<%=request.getContextPath()%>/myAccountPwd/updateLoginId.do" class="inside-listcon autoheight-list clearfix">
						<div class="clearfix">
							<div class="fl">
								<p class="maintitle">
									<span>账户名</span>
								</p>
							</div>
							<div class="fr  color-grey">
								<p class="price color-lightgray f24 icon-rightarrow-1r">${tryCustInfo.loginId}</p>
							</div>
						</div>
						<p class="explain f24">您的登录账户</p>

					</a> <a rel="external" class="inside-listcon autoheight-list clearfix"
						href="<%=request.getContextPath()%>/myAccountPwd/custPasswordUpdate.do">
						<div class="clearfix">
							<div class="fl">
								<p class="maintitle">
									<span>账户密码</span>
								</p>
							</div>
							<div class="fr  color-grey">
								<p class="price color-lightgray f24 icon-rightarrow-1r">修改</p>
							</div>
						</div>
						<p class="explain f24">保障用户信息和登录安全</p>
					</a>
					<c:choose>
						<c:when test="${tryCustInfo.bindPayPwd}">
							<a rel="external" class="inside-listcon autoheight-list clearfix"
								href="<%=request.getContextPath()%>/myAccountPwd/payPasswordUpdate.do">
								<div class="clearfix">
									<div class="fl">
										<p class="maintitle">
											<span>支付密码</span>
										</p>
									</div>
									<div class="fr  color-grey">
										<p class="price color-lightgray f24 icon-rightarrow-1r">修改</p>
									</div>
								</div>
								<p class="explain f24">保障资金安全</p>
							</a>
						</c:when>
						<c:otherwise>
							<a rel="external" class="inside-listcon autoheight-list clearfix"
								href="<%=request.getContextPath()%>/myView/tradeCode.do">
								<div class="clearfix">
									<div class="fl">
										<p class="maintitle">
											<span>支付密码</span>
										</p>
									</div>
									<div class="fr  color-grey">
										<p class="price color-lightgray f24 icon-rightarrow-1r">设置</p>
									</div>
								</div>
								<p class="explain f24">保障资金安全</p>
							</a>
						</c:otherwise>
					</c:choose>

					<a rel="external" class="inside-listcon autoheight-list clearfix"
						href="<%=request.getContextPath()%>/myAccountPwd/custMobileUpdate.do">
						<div class="clearfix">
							<div class="fl">
								<p class="maintitle">
									<span>手机号码</span>
								</p>
							</div>
							<div class="fr  color-grey">
								<p class="price color-lightgray f24 icon-rightarrow-1r">${tryCustInfo.anonymousMobile}</p>
							</div>
						</div>
						<p class="explain f24">身份凭证，获取账户资金变动通知</p>
					</a>
					<c:choose>
						<c:when test="${bindSuccess==false}">
							<a rel="external" class="inside-listcon autoheight-list clearfix"
								href="<%=request.getContextPath()%>/myAccountPwd/custEmailBind.do">
								<div class="clearfix">
									<div class="fl">
										<p class="maintitle">
											<span>电子邮箱</span>
										</p>
									</div>
									<div class="fr  color-grey">
									<p class="price color-lightgray f24 icon-rightarrow-1r">立即绑定</p>
										
									</div>
								</div>
								<p class="explain f24">获取账户资金变动通知</p>
							</a>
						</c:when>
						<c:otherwise>
							<a rel="external" class="inside-listcon autoheight-list clearfix"
								href="<%=request.getContextPath()%>/myAccountPwd/custEmailBind.do">
								<div class="clearfix">
									<div class="fl">
										<p class="maintitle">
											<span>电子邮箱</span>
										</p>
									</div>
									<div class="fr  color-grey">
										<p class="price color-lightgray f24 icon-rightarrow-1r">${tryCustInfo.anonymousEmail}</p>
									</div>
								</div>
								<p class="explain f24">获取账户资金变动通知</p>
							</a>
						</c:otherwise>
					</c:choose>
				</div>
				<!-----用户消息 end---->
			</div>
			<!-----全部明细内容end------>
		</div>


	</div>

	<!--底部start--->
	<jsp:include page="/jsp/mobile/buttons.jsp" flush="true"></jsp:include>
	<!---底部end-->
	</div>
</body>
</html>
