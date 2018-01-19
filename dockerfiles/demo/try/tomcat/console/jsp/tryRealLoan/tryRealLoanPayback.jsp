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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/tryRealLoan/tryRealLoanPayback.js"></script>
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
			<a class="btn btn-danger btn-block floating-back" href="javascript:returnPage();">返回列表</a>
			<button id="save" type="button" class="btn btn-danger btn-block floating-back view-hidden">保存</button>
		</div>
		<div class="panel-body floating-content">
			<form id="edit-form" name="edit-form" class="row" onSubmit="return false">
				<input id="id" name="id" type="hidden" value="${tryRealLoan.id}">
				<ul class="form-wrap formgroup_wrap">
					<%-- <li>
						<span class="form_span" title="客户id">客户id:</span>
						<input type="text" class="form-control" id="custId" name="custId"  value="${tryRealLoan.custId}" placeholder="请输入客户id"/>
						<p id='custIdTip' class="form_tips formalert"></p>
					</li> --%>
					<%-- <li>
						<span class="form_span" title="姓名">姓名:</span>
						<input type="text" class="form-control" id="name" name="name"  value="${tryRealLoan.name}" placeholder="请输入姓名"/>
						<p id='nameTip' class="form_tips formalert"></p>
					</li> --%>
					<%-- <li>
						<span class="form_span" title="联系电话">联系电话:</span>
						<input type="text" class="form-control" id="tel" name="tel"  value="${tryRealLoan.tel}" placeholder="请输入联系电话"/>
						<p id='telTip' class="form_tips formalert"></p>
					</li> --%>
					<%-- <li>
						<span class="form_span" title="贷款金额">贷款金额:</span>
						<input type="text" class="form-control" id="amount" name="amount"  value="${tryRealLoan.amount}" placeholder="请输入贷款金额"/>
						<p id='amountTip' class="form_tips formalert"></p>
					</li> --%>
					<%-- <li>
						<span class="form_span" title="贷款天数">贷款天数:</span>
						<input type="text" class="form-control" id="loanDays" name="loanDays"  value="${tryRealLoan.loanDays}" placeholder="请输入贷款天数"/>
						<p id='loanDaysTip' class="form_tips formalert"></p>
					</li> --%>
					<%-- <li>
						<span class="form_span" title="贷款利息">贷款利息:</span>
						<input type="text" class="form-control" id="loanRate" name="loanRate"  value="${tryRealLoan.loanRate}" placeholder="请输入贷款利息"/>
						<p id='loanRateTip' class="form_tips formalert"></p>
					</li> --%>
					<%-- <li>
						<span class="form_span" title="贷款类型">贷款类型:</span>
						<select class="form-control" id="loanType" name="loanType" value="${tryRealLoan.loanType}">
							<c:forEach items="${loanTypeList}" var="item">
							<option value="${item.dictValue}" <c:if test="${item.dictValue eq tryRealLoan.loanType}">selected="selected"</c:if> >${item.text}</option>
							</c:forEach>
							</select>
						<p id='loanTypeTip' class="form_tips formalert"></p>
					</li> --%>
					<%-- <li>
						<span class="form_span" title="贷款日期">贷款日期:</span>
						<input type="text" class="form-control" id="loanDate" name="loanDate" data-type="datetime" onclick="WdatePicker({'dateFmt':'yyyy-MM-dd'})"  value="${tryRealLoan.loanDateText}" placeholder="请输入贷款日期"/>
						<p id='loanDateTip' class="form_tips formalert"></p>
					</li> --%>
					<li>
						<span class="form_span" title="还款金额">还款金额:</span>
						<input type="text" class="form-control" id="paybackAmount" name="paybackAmount"  value="${tryRealLoan.paybackAmount}" placeholder="请输入还款金额"/>
						<p id='paybackAmountTip' class="form_tips formalert"></p>
					</li> 
					<li>
						<span class="form_span" title="还款日期">还款日期:</span>
						<input type="text" class="form-control" id="paybackDate" name="paybackDate" data-type="datetime" onclick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" value="${tryRealLoan.paybackDate}" placeholder="请输入还款日期"/>
						<p id='paybackDateTip' class="form_tips formalert"></p>
					</li> 
					<%-- <li>
						<span class="form_span" title="结束日期">结束日期:</span>
						<input type="text" class="form-control" id="closeDate" name="closeDate"  value="${tryRealLoan.closeDate}" placeholder="请输入结束日期"/>
						<p id='closeDateTip' class="form_tips formalert"></p>
					</li> --%>
					<%-- <li>
						<span class="form_span" title="结束时间">结束时间:</span>
						<input type="text" class="form-control" id="closeTime" name="closeTime"  value="${tryRealLoan.closeTime}" placeholder="请输入结束时间"/>
						<p id='closeTimeTip' class="form_tips formalert"></p>
					</li> --%>
					<%-- <li>
						<span class="form_span" title="状态,0正常,1删除">状态,0正常,1删除:</span>
						<input type="text" class="form-control" id="status" name="status"  value="${tryRealLoan.status}" placeholder="请输入状态,0正常,1删除"/>
						<p id='statusTip' class="form_tips formalert"></p>
					</li> --%>
					<li>
						<span class="form_span" title="说明">说明:</span>
						<input type="text" class="form-control" id="remark" name="remark"  value="${tryRealLoan.remark}" placeholder="请输入说明"/>
						<p id='remarkTip' class="form_tips formalert"></p>
					</li> 
				</ul>
			</form>
		</div>
	</div>
</body>