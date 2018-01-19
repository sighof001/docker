<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>修改绑定</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<script
	src="<%=request.getContextPath()%>/js/mobile/cust/custMobileUpdate.js"></script>
</head>

<body>
	<div data-role="page" class="page bgwhite" data-theme="i">
		<!-----header start----->
		<div data-role="header" data-position="fixed" class="inside-header">
			<a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
			<h1>修改绑定</h1>
		</div>
		<!-----header end---->
		<div class="inside-main bgwhite">
			<div class="wrap">
				<form id="form" method="post"
					action="">
					<ul class="form-list">
						<li><label>原手机号</label> 
						<input type="hidden" name="mobile" value="${tryCustInfo.mobile}" >
						<input type="tel" id="mobile" disabled="disabled" 
							name="mobile" data-role="none" class="inputtxt"
							placeholder="请输入原手机号" autofocus value="${tryCustInfo.mobile}" /></li>
						<!-- <li><label>新手机号</label> <input type="tel" id="mobile"
							name="mobile" data-role="none" class="inputtxt"
							placeholder="请输入新手机号"/></li> -->
						<li><label>短信验证码</label> <input type="number"
							placeholder="请输入验证码" class="inputtxt" data-role="none"
							name="checkCode" />
							<button type="button" value="获取验证码" class="getvalid"
								data-role="none">获取验证码</button></li>

						<!--错误提示，默认隐藏 -->
						<div id="desc" style="display: none;">
							<label style="color: red;"></label>
						</div>
					</ul>
					<input class="btn-submit2 bgorange" type="button" data-role="none"
						value="确定" />
				</form>
			</div>
		</div>
		<!---注册信息end--->
	</div>
</body>
</html>
