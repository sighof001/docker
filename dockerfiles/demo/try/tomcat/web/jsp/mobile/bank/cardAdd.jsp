<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>添加银行卡</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/citypiker.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dialog.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/citypiker.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/data.js"></script>
<script src="<%=request.getContextPath()%>/js/mobile/bank/cardAdd.js"></script>
</head>

<body>
	<div data-role="page" class="page" data-theme="i">
		<!-----header start----->
		<div data-role="header" data-position="fixed" class="inside-header">
			<a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
			<h1>添加银行卡</h1>
			<!-- <a href="###" class="btnwordwhite btnnobg icon-news" rel="external"></a> -->
		</div>
		<!-----header end----->
		<div class="inside-main">
			<div class="wrap">
				<form id="form" method="post"
					action="<%=request.getContextPath()%>/bank/cardInfo.do">
					<ul class="ul-formlist form-list">
					<p style="color:#3385ff;" align="center">目前支持银行:工行,农行,中行,建行,交行,民生,招商借记卡</p>
						<li><label>银行卡号</label> <input type="number"
							class="inputtxt inputtxt2" placeholder="请输入银行卡号" data-role="none"
							id="cardNumber" name="cardNumber" /></li>
						<li><label>银行名称</label> 
						<select id="bankCode" name="bankCode">
							<option value="">请选择银行卡</option>
							<c:forEach items="${queryBankTypeList}" var="item">
								<option value="${item.dictValue}">${item.text}</option>
							</c:forEach>
						</select>
						<!-- <input type="text"	class="inputtxt inputtxt2"  data-role="none" id="bankName" name="bankName" /> -->
						<!-- <input type="hidden"
							class="inputtxt inputtxt2"  data-role="none"
							 name="bankName" />
						<input type="hidden"
							class="inputtxt inputtxt2"  data-role="none"
							 name="bankCode" id="bankCode" /> -->
							</li>
						<li><label>手机号码</label> <input type="tel"
							placeholder="请输入银行预留手机号" class="inputtxt" data-role="none"
							id="mobile" name="mobile" disabled="disabled"  value="${tryCustInfo.mobile}"/>
							<input type="hidden"
							 class="inputtxt" data-role="none"
							name="mobile" value="${tryCustInfo.mobile}"/>
							</li>
						<li><label>短信验证码</label> <input type="number"
							placeholder="请输入验证码" class="inputtxt" data-role="none"
							name="checkCode" />
							<button type="button" value="获取验证码" class="getvalid"
								data-role="none">获取验证码</button></li>
						<!--错误提示，默认隐藏 -->
						<div id="desc" style="display: none;">
							<label style="color: red;"></label>
						</div>
						<!--错误提示，默认隐藏 -->
						<!-- <div id="descSuccess" style="display: none;">
							<label style="color: blue;"></label>
						</div> -->
					</ul>
					<input type="button" class="btn" data-role="none" value="添加" />
				</form>
			</div>
		</div>
		<!--底部start--->
	<jsp:include page="/jsp/mobile/buttons.jsp" flush="true"></jsp:include>
	<!---底部end-->
	</div>
	
</body>
</html>
