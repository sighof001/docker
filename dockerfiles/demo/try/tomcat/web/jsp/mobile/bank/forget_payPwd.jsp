<%@ page language="java" pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>忘记支付密码</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<script src="<%=request.getContextPath()%>/js/mobile/bank/forget_payPwd.js"></script>
</head>

<body>
	<div data-role="page" class="page" data-theme="i">
		<!-----header start----->
		<div data-role="header" data-position="fixed" class="inside-header">
			<a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
			<h1>忘记支付密码</h1>
			<!-- <a href="###" class="btnwordwhite btnnobg icon-news" rel="external"></a> -->
		</div>
		<!-----header end----->
		<div class="inside-main">
			<div class="wrap">
				<form id="form" method="post">
				<input type="hidden" 
							name="id" data-role="none" class="inputtxt"
							value="${tryCustInfo.id}" />
					<ul class="ul-formlist form-list">
						<li><label>手机号</label> <input type="tel" id="mobile"
							name="mobile" data-role="none" class="inputtxt"
							value="${tryCustInfo.mobile}" disabled/>
							<input type="hidden"
							name="mobile" data-role="none" class="inputtxt"
							value="${tryCustInfo.mobile}" />
							</li>
						<li><label>短信验证码</label> <input type="number"
							placeholder="请输入验证码" class="inputtxt" data-role="none"
							name="smsCode" autofocus/>
							<button type="button" value="获取验证码" class="getvalid"
								data-role="none">获取验证码</button></li>
						<li><label>新支付密码</label> <input type="password"
							id="payPassword" name="payPassword" class="inputtxt inputtxt2"
							placeholder="请输入新支付密码" data-role="none" /></li>
						<li><label>密码确认</label> <input type="password"
							id="rePayPassword" name="rePayPassword" placeholder="请再次输入新支付密码"
							class="inputtxt" data-role="none" /></li>
						<!--错误提示，默认隐藏 -->
						<div id="desc" style="display: none;">
							<label style="color: red;"></label>
						</div>
					</ul>
					<input type="button" class="btn" data-role="none" value="确定" />
				</form>
			</div>
		</div>
		<!--底部start--->
		<jsp:include page="/jsp/mobile/buttons.jsp" flush="true"></jsp:include>
		<!---底部end-->
	</div>
</body>
</html>
