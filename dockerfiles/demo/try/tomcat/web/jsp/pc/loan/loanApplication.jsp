<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>贷款申请</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="/jsp/pc/pc_include.jsp" flush="true"></jsp:include>
<link rel="stylesheet" href="<%=request.getContextPath() %>/pccss/pc/other.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/pcjs/pc/loan/loanApplication.js"></script>
<script>
	$(document).ready(function(e) {
		tab(".tab_content", ".tab_item", ".tabsNavUl ", "tabNavOn");

	});
</script>
</head>

<body>
	<!-----头部start------>
	<jsp:include page="/jsp/pc/top_include.jsp" flush="true"></jsp:include>
	<!-----头部end---------->

	<!------贷款内容start------->
	<div class="container martop30 bgwhite clearfix">
		<ul class="synewsNavUl loanapplication_NavUl tabsNavUl  clearfix">
			<li class="synewsNavOn tabNavOn">个人贷款申请</li>
			<li>公司贷款申请</li>
		</ul>
		<div class="submit-group-wrap loanapplication_con tab_content">
			<!--个人贷款start--->
			<div class=" tab_item">
				<form class="form-horizontal" role="form" id="person">
				<%-- <c:if test="${isRealAuth==false }">
						<div class="form-group">
							<p style="font-size:20px;" align="center"><a href="<%=request.getContextPath()%>/myView/pcMyAssetView.do?menuId=myRealAuth">请先进行实名认证<a></a></p>
						</div>
				</c:if>  --%>
					<div class="form-group">
						<label class="col-sm-2 control-label">贷款城市:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" placeholder="广州" disabled>
							<p style="font-size:12px;color:#999;">目前仅开放广州的借贷业务</p>
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">姓名:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control submit-group"
								placeholder="请输入姓名" id="name" name="name"
								value="${currentUser.realName}">
								<p id="nameText"></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">联系电话:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control submit-group"
								placeholder="请输入联系电话" id="tel" name="tel"
								value="${currentUser.mobile}" disabled="disabled">
							<input type="hidden" class="form-control submit-group"
								name="tel"
								value="${currentUser.mobile}">
								<p id="telText"></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label ">职业:</label>
						<div class="col-sm-10">
							<select class="form-control submit-group" id="job" name="job">
								<option value="">请选择</option>
								<c:forEach items="${jobType}" var="item">
									<option value="${item.dictValue}">${item.text}</option>
								</c:forEach>
							</select>
							<p id="jobText"></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">身份证地址:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control submit-group" placeholder="请输入身份证地址"
								id="idAddress" name="idAddress">
								<p id="idAddressText"></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">现居住地址:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control submit-group" placeholder="请输入现居住地址"
								id="nowAddress" name="nowAddress">
								<p id="nowAddressText"></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">年龄:</label>
						<div class="col-sm-10">
							<select class="form-control submit-group" id="age" name="age">
								<option value="">请选择</option>
								<c:forEach items="${ageRange}" var="item">
									<option value="${item.dictValue}">${item.text}</option>
								</c:forEach>
							</select>
							<p id="ageText"></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">拟借金额:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control submit-group" placeholder="请输入拟借金额"
								id="amount" name="amount">
								<p id="amountText"></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">借款用途:</label>
						<div class="col-sm-10">
							<select class="form-control submit-group" id="loanUse" name="loanUse">
								<option value="">请选择</option>
								<c:forEach items="${loanUseType}" var="item">
									<option value="${item.dictValue}">${item.text}</option>
								</c:forEach>
							</select>
							<p id="loanUseText"></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">借款期限(天):</label>
						<div class="col-sm-10">
							<input type="text" class="form-control submit-group" placeholder="请输入借款期限"
								id="loanTerm" name="loanTerm">
								<p id="loanTermText"></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">还款来源:</label>
						<div class="col-sm-10">
							<select class="form-control submit-group" id="repaymentSource"
								name="repaymentSource">
								<option value="">请选择</option>
								<c:forEach items="${repaymentSourceType}" var="item">
									<option value="${item.dictValue}">${item.text}</option>
								</c:forEach>
							</select>
							<p id="repaymentSourceText"></p>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">验证码：</label>
						<div class="valid_wrap clearfix col-sm-10">
							 <input type="text" class="form-control pull-left submit-group" id="checkCode"
								name="checkCode" placeholder="请输入验证码"> <img
								src="<%=request.getContextPath()%>/login/getCode.do?imgHeight=96&imgWidth=34&codeLen=4"
								class=" pull-left" id="loginCodeImg" onclick="changeImg(this);" />
							<p id="checkCodeText"></p>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-6">
							<button type="button"  class="btn btn-default btnorange register_btn submit-group" id="personSubmit">提交申请</button>
						</div>
					</div>
				</form>
			</div>
			<!----个人贷款end---->
			<!----企业贷款start-------->
			<div class=" tab_item">
				<form class="form-horizontal" role="form" id="company">
				<%-- <c:if test="${isRealAuth==false }">
						<div class="form-group">
							<p style="font-size:20px;" align="center"><a href="<%=request.getContextPath()%>/myView/pcMyAssetView.do?menuId=myRealAuth">请先进行实名认证<a></a></p>
						</div>
				</c:if> --%>
					<div class="form-group">
						<label class="col-sm-2 control-label">贷款城市:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" placeholder="广州" disabled>
							<p style="font-size:12px;color:#999;">目前仅开放广州的借贷业务</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">企业名称:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control submit-group" placeholder="请输入企业名称" id="companyName" name="companyName">
							<p id="companyNameText"></p>
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">姓名:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control submit-group"
								placeholder="请输入姓名" id="nameCompany" name="name"
								value="${currentUser.realName}">
								<p id="nameCompanyText"></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">联系电话:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control submit-group" placeholder="请输入联系电话"
								id="telCompany" name="tel" 
								value="${currentUser.mobile }" disabled="disabled">
							<input type="hidden" class="form-control submit-group"
								 name="tel" 
								value="${currentUser.mobile }">
								<p id="telCompanyText"></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">行业:</label>
						<div class="col-sm-10">
						
						<select class="form-control submit-group" id="industry" name="industry">
								<option value="">请选择</option>
								<c:forEach items="${industryType}" var="item">
									<option value="${item.dictValue}">${item.text}</option>
								</c:forEach>
						</select>
						<p id="industryText"></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">公司注册地址:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control submit-group" placeholder="请输入公司注册地址" id="registerAddress" name="registerAddress">
						<p id="registerAddressText"></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">公司办公地址:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control submit-group" placeholder="请输入公司办公地址" id="officeAddress" name="officeAddress">
						<p id="officeAddressText"></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">成立年限:</label>
						<div class="col-sm-10">
							<select class="form-control submit-group" id="years" name="years">
								<option value="">请选择</option>
								<c:forEach items="${yearsType}" var="item">
									<option value="${item.dictValue}">${item.text}</option>
								</c:forEach>
						</select>
						<p id="yearsText"></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">拟借金额:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control submit-group" placeholder="请输入拟借金额" id="amountCompany" name="amount">
						<p id="amountCompanyText"></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">借款用途:</label>
						<div class="col-sm-10">
							<select class="form-control submit-group" id="loanUseCompany" name="loanUse">
								<option value="">请选择</option>
								<c:forEach items="${loanUseType}" var="item">
									<option value="${item.dictValue}">${item.text}</option>
								</c:forEach>
							</select>
							<p id="loanUseCompanyText"></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">借款期限(天):</label>
						<div class="col-sm-10">
						<input type="text" class="form-control submit-group" placeholder="请输入借款期限" id="loanTermCompany" name="loanTerm">
						<p id="loanTermCompanyText"></p>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">还款来源:</label>
						<div class="col-sm-10">
							<select class="form-control submit-group" id="repaymentSourceCompany"
								name="repaymentSource">
								<option value="">请选择</option>
								<c:forEach items="${repaymentSourceType}" var="item">
									<option value="${item.dictValue}">${item.text}</option>
								</c:forEach>
							</select>
							<p id="repaymentSourceCompanyText"></p>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">验证码：</label>
						<div class="valid_wrap clearfix col-sm-10">
							<input type="text" class="form-control pull-left submit-group" id="checkCodeCompany"
								name="checkCode" placeholder="请输入验证码"> <img
								src="<%=request.getContextPath()%>/login/getCode.do?imgHeight=96&imgWidth=34&codeLen=4"
								class=" pull-left" id="loginCodeImgCompany" onclick="changeImg(this);" />
								<p id="checkCodeCompanyText"></p>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-6">
							<button type="button"  class="btn btn-default btnorange register_btn submit-group" id="companySubmit">提交申请</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!---企业贷款end---------->
	<!-----网站底部start-------->
	<!------网站底部end------->
	</div>
	<jsp:include page="/index/buttons.do" flush="true"></jsp:include>
	<!-- 登录弹出框start -->
	</div>
	<jsp:include page="/jsp/pc/login_include.jsp" flush="true"></jsp:include>
	<!--弹出框start -->
</body>
</html>
