<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>绑定银行卡</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="/jsp/pc/pc_include.jsp" flush="true"></jsp:include>
<script src="<%=request.getContextPath()%>/pcjs/pc/bank/cardAdd.js"></script>
<!--[if lt IE 9]>
<script src="js/html5shiv.min.js"></script>
<script src="js/respond.min.js"></script>
 <![endif]-->
</head>

<body>
	<!------个人中心start--------->
	<div class="col-sm-9 personal_right ">
		<div class="p_r_con bgwhite">
			<div class="p_r_con_title">
				<h3>绑定银行卡</h3>
				<p class="lead">绑定银行卡，方便交易操作</p>
			</div>
			<!-----表单start-------->
			<form class="form-horizontal r_form" role="form" id="form">
				<p style="color: #3385ff;" align="center">目前支持银行:工行,农行,中行,建行,交行,民生,招商,广发借记卡</p>
				<div class="form-group">
					<label class="col-sm-3 control-label">银行卡号：</label>
					<div class="col-sm-9">
						<input id="cardNumber" name="cardNumber" type="number"
							class="form-control" placeholder="请输入银行卡号" />
						<p id="cardNumberText" style="font-size: 12px; color: #ff352b;">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">银行名称：</label>
					<div class="col-sm-9">
						<select class="form-control" id="bankCode" name="bankCode">
							<option value="">请选择银行卡</option>
							<c:forEach items="${queryBankTypeList}" var="item">
								<option value="${item.dictValue}">${item.text}</option>
							</c:forEach>
						</select>
						<p id="cardNameText" style="font-size: 12px; color: #ff352b;">
					</div>
					<!-- <div class="col-sm-9">
						<input id="bankName" name="bankName" type="text" class="form-control" /> 
						<input  name="bankName" type="hidden" class="form-control" /> 
							<input id="bankCode" name="bankCode" type="hidden" class="form-control"/>
					</div> -->
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">手机号：</label>
					<div class="col-sm-9">
						<input id="mobile" name="mobile" type="text" class="form-control"
							placeholder="请输入注册手机号" value="${tryCustInfo.mobile}" disabled="disabled"/>
						<input  name="mobile" type="hidden" class="form-control"
							 value="${tryCustInfo.mobile}"/>
						<p id="mobileText" style="font-size: 12px; color: #ff352b;">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">短信验证码：</label>
					<div class="valid_wrap clearfix col-sm-9">
						<input type="text" class="form-control  pull-left"
							placeholder="请输入短信验证码" id="checkCode" name="checkCode" /> <a
							class="telvalid pull-left" id="smsCode">
							获取验证码 </a>
						<p id="checkCodeText" style="font-size: 12px; color: #ff352b;">
					</div>
				</div>
				<div class="form-group ID_btn_wrap">
					<div class="col-sm-offset-3 col-sm-2">
						<input type="button" class="btn  f_btn" value="绑定银行卡" id="submit" />
					</div>
					<div class="col-sm-offset-1 col-sm-2">
						<input type="button" class="btn  f_btn grybtn"
							onClick="javascript:window.location.href='<%=request.getContextPath()%>/myView/pcMyAssetView.do?menuId=mySet'"
							value="返回" />
					</div>
				</div>
			</form>
			<!------表单end------>
		</div>
	</div>
	</div>
	</div>
	<!-------个人中心end-------->
</body>
</html>
