<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>找回密码</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<script
	src="<%=request.getContextPath()%>/js/mobile/cust/retrievalPassword.js"></script>
</head>

<body>
	<div data-role="page" class="page bgwhite" data-theme="i">
		<!-----header start----->
		<div data-role="header" data-position="fixed" class="inside-header">
			<a href="<%=request.getContextPath()%>/login/loginView.do" rel="external" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
			<h1>找回密码</h1>
		</div>
		<!-----header end---->
		<div class="inside-main bgwhite">
			<div class="wrap">
				<form id="form" method="post"
					action="<%=request.getContextPath()%>/login/sumbit.do">
					<ul class="form-list">
						<li><label>手机号</label> <input type="tel" id="mobile"
							name="mobile" data-role="none" class="inputtxt"
							placeholder="请输入手机号" autofocus /></li>
						<li><label>短信验证码</label> <input type="number"
							placeholder="请输入验证码" class="inputtxt" data-role="none"
							name="checkCode" />
							<button type="button" value="获取验证码" class="getvalid"
								data-role="none">获取验证码</button></li>
						<li><label>新密码</label> <input type="password" id="password"
							name="password" data-role="none" class="inputtxt"
							placeholder="请设置6-18位密码" /></li>
						<li><label>确认密码</label> <input type="password"
							id="confirmPwd" name="confirmPwd" data-role="none"
							class="inputtxt" placeholder="请输入密码" /></li>

						<!--错误提示，默认隐藏 -->
						<div id="desc" style="display: none;">
							<label style="color: red;"></label>
						</div>
						<!--错误提示，默认隐藏 -->
						<!-- <div id="descSuccess" style="display: none;">
							<label style="color: blue;"></label>
						</div> -->

					</ul>
					<input class="btn-submit2 bgorange" type="button" data-role="none"
						value="确定" />
						<div><span><a href="<%=request.getContextPath()%>/login/retrievalPasswordByEmail.do" rel="external" class="color-blue">通过邮箱找回</a></span></div>
				</form>
			</div>
		</div>
		<!---注册信息end--->
	</div>
</body>
</html>
