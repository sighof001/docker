<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="/header/header.jsp"%>
<%@ include file="/jsp/include.jsp"%>
<link href="<%=request.getContextPath()%>/css/edit.css" type="text/css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/progressbar.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/plugin/jquery-2.0.3.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/plugin/jquery.form.js"></script>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/css/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/plugin/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/tryCustLoan/tryCustLoanEdit.js"></script>
<script type="text/javascript">
	var op = '${op}';
	var returnType = '${returnType}';
</script>
</head>
<body>
	<div class="panel panel-default no-border">
		<div class="panel-heading floating-top">
			<!-- 头部步骤说明-->
			<div class="flow_container">
				<!---头部 start-->
				<div class="theme_title">${title}</div>
			</div>
			<a class="btn btn-danger btn-block floating-back"
				href="javascript:returnPage();"><li id="back2Index">返回列表</li></a>
			<button id="save" type="button"
				class="btn btn-danger btn-block floating-back view-hidden">保存</button>
			<button id="auditPass" type="button"
				class="btn btn-danger btn-block floating-back btn_audit">审核通过</button>
			<button id="auditFail" type="button"
				class="btn btn-danger btn-block floating-back btn_audit">审核拒绝</button>
		</div>
		<div class="panel-body floating-content">
			<form id="edit-form" name="edit-form" class="row"
				onSubmit="return false">
				<input id="id" name="id" type="hidden" value="${tryCustLoan.id}">
				<ul class="form-wrap formgroup_wrap">
					<%-- <li>
						<span class="form_span" title="客户id">客户id:</span>
						<input type="text" class="form-control" id="custId" name="custId"  value="${tryCustLoan.custId}" placeholder="请输入客户id"/>
						<p id='custIdTip' class="form_tips formalert"></p>
					</li> --%>
					<li><span class="form_span" title="姓名">姓名:</span> <input
						type="text" class="form-control" id="name" name="name"
						value="${tryCustLoan.name}" placeholder="请输入姓名" />
						<p id='nameTip' class="form_tips formalert"></p></li>
					<li><span class="form_span" title="联系电话">联系电话:</span> <input
						type="text" class="form-control" id="tel" name="tel"
						value="${tryCustLoan.tel}" placeholder="请输入联系电话" />
						<p id='telTip' class="form_tips formalert"></p></li>
					<li><span class="form_span" title="职业">职业:</span> <input
						type="text" class="form-control" id="job" name="job"
						value="${tryCustLoan.displayJob}" placeholder="请输入职业" />
						<p id='jobTip' class="form_tips formalert"></p></li>
					<li><span class="form_span" title="身份证地址">身份证地址:</span> <input
						type="text" class="form-control" id="idAddress" name="idAddress"
						value="${tryCustLoan.idAddress}" placeholder="请输入身份证地址" />
						<p id='idAddressTip' class="form_tips formalert"></p></li>
					<li><span class="form_span" title="现居住地址">现居住地址:</span> <input
						type="text" class="form-control" id="nowAddress" name="nowAddress"
						value="${tryCustLoan.nowAddress}" placeholder="请输入现居住地址" />
						<p id='nowAddressTip' class="form_tips formalert"></p></li>
					<li><span class="form_span" title="年龄">年龄:</span> <input
						type="text" class="form-control" id="age" name="age"
						value="${tryCustLoan.displayAge}" placeholder="请输入年龄" />
						<p id='ageTip' class="form_tips formalert"></p></li>
					<li><span class="form_span" title="拟借金额">拟借金额:</span> <input
						type="text" class="form-control" id="amount" name="amount"
						value="${tryCustLoan.amount}" placeholder="请输入拟借金额" />
						<p id='amountTip' class="form_tips formalert"></p></li>
					<li><span class="form_span" title="企业名称">企业名称:</span> <input
						type="text" class="form-control" id="companyName"
						name="companyName" value="${tryCustLoan.companyName}"
						placeholder="请输入企业名称" />
						<p id='companyNameTip' class="form_tips formalert"></p></li>
					<li><span class="form_span" title="行业">行业:</span> <input
						type="text" class="form-control" id="industry" name="industry"
						value="${tryCustLoan.displayIndustry}" placeholder="请输入行业" />
						<p id='industryTip' class="form_tips formalert"></p></li>
					<li><span class="form_span" title="公司注册地址">公司注册地址:</span> <input
						type="text" class="form-control" id="registerAddress"
						name="registerAddress" value="${tryCustLoan.registerAddress}"
						placeholder="请输入公司注册地址" />
						<p id='registerAddressTip' class="form_tips formalert"></p></li>
					<li><span class="form_span" title="公司办公地址">公司办公地址:</span> <input
						type="text" class="form-control" id="officeAddress"
						name="officeAddress" value="${tryCustLoan.officeAddress}"
						placeholder="请输入公司办公地址" />
						<p id='officeAddressTip' class="form_tips formalert"></p></li>
					<li><span class="form_span" title="成立年限">成立年限:</span> <input
						type="text" class="form-control" id="years" name="years"
						value="${tryCustLoan.displayYears}" placeholder="请输入成立年限" />
						<p id='yearsTip' class="form_tips formalert"></p></li>
					<li><span class="form_span" title="贷款用途">贷款用途:</span> <input
						type="text" class="form-control" id="loanUse" name="loanUse"
						value="${tryCustLoan.displayLoanUse}" placeholder="请输入贷款用途" />
						<p id='loanUseTip' class="form_tips formalert"></p></li>
					<li><span class="form_span" title="借款期限(天)">借款期限(天):</span> <input
						type="text" class="form-control" id="loanTerm" name="loanTerm"
						value="${tryCustLoan.loanTerm}" placeholder="请输入借款期限(天)" />
						<p id='loanTermTip' class="form_tips formalert"></p></li>
					<li><span class="form_span" title="还款来源">还款来源:</span> <input
						type="text" class="form-control" id="repaymentSource"
						name="repaymentSource" value="${tryCustLoan.displayRepaymentSource}"
						placeholder="请输入还款来源" />
						<p id='repaymentSourceTip' class="form_tips formalert"></p></li>
					<li><span class="form_span" title="借款类型">借款类型:</span> <select
						class="form-control" id="loanType" name="loanType"
						value="${tryCustLoan.loanType}">
							<c:forEach items="${loanTypeList}" var="item">
								<option value="${item.dictValue}"
									<c:if test="${item.dictValue eq tryCustLoan.loanType}">selected="selected"</c:if>>${item.text }</option>
							</c:forEach>
					</select> <%-- <input type="text" class="form-control" id="loanType" name="loanType"  value="${tryCustLoan.loanType}" placeholder="请输入借款类型,1:个人借款,2:公司借款,3:扶贫借款"/> --%>
						<p id='loanTypeTip' class="form_tips formalert"></p></li>
					<li><span class="form_span" title="审核状态">审核状态:</span> <select
						class="form-control" id="checkStatus" name="checkStatus"
						value="${tryCustLoan.checkStatus}">
							<c:forEach items="${checkStatusTypeList}" var="item">
								<option value="${item.dictValue}"
									<c:if test="${item.dictValue eq tryCustLoan.checkStatus}">selected="selected"</c:if>>${item.text }</option>
							</c:forEach>
					</select> <%-- <input type="text" class="form-control" id="checkStatus" name="checkStatus"  value="${tryCustLoan.checkStatus}" placeholder="请输入审核状态,0,未提交,1:待审核,2:审核通过,3:审核拒绝"/> --%>
						<p id='checkStatusTip' class="form_tips formalert"></p></li>
					<%-- <li><span class="form_span" title="创建人">创建人:</span> <input
						type="text" class="form-control" id="createUserId"
						name="createUserId" value="${tryCustLoan.createUserId}"
						placeholder="请输入创建人" />
						<p id='createUserIdTip' class="form_tips formalert"></p></li> --%>
				</ul>
			</form>
			<!-- 模态框  -->
			<%@ include file="/jsp/tryCustLoan/auditFailCommon.jsp"%>
			<!-- 模态框 -->
		</div>
	</div>
</body>