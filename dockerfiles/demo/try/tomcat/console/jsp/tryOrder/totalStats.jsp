<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="/header/header.jsp"%>
<%@ include file="/jsp/include.jsp"%>
<link href="<%=request.getContextPath()%>/css/edit.css" type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/progressbar.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/plugin/jquery.form.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/plugin/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/tryOrder/totalStats.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<div class="panel panel-default no-border">
		<div class="panel-heading floating-top">
			<!-- 头部步骤说明-->
			<div class="flow_container">
			<!---头部 start-->
			 <div class="theme_title">交易统计</div>
			</div>
		</div>
		<div class="panel-body floating-content">
			<form id="edit-form" name="edit-form" class="row" onSubmit="return false">
				<ul class="form-wrap formgroup_wrap">
					<li>
						<span class="form_span" title="总充值额">总充值额:</span>
						<input type="text" class="form-control" id="totalRecharge" name="totalRecharge"  value="${stats.totalRecharge}"/>
						<p id='amountTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="总委托额">总委托额:</span>
						<input type="text" class="form-control"  id="totalPayment" name="totalPayment"  value="${stats.totalEntrust}"/>
						<p id='loginIdTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="总付息额">总付息额:</span>
						<input type="text" class="form-control"  id="totalPayment" name="totalPayment"  value="${stats.totalPayment}"/>
						<p id='loginIdTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="总提现">总提现:</span>
						<input type="text" class="form-control"  id="totalWithdraw" name="totalWithdraw"  value="${stats.totalWithdraw}"/>
						<p id='loginIdTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="总注册用户数">总注册用户数:</span>
						<input type="text" class="form-control"  id="totalCustNumber" name="totalCustNumber"  value="${stats.totalCustNumber}"/>
						<p id='loginIdTip' class="form_tips formalert"></p>
					</li>
				</ul>
			</form>
		</div>
	</div>
</body>