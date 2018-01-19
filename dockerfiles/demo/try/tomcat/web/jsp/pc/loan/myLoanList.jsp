<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/pccss/pc/other.css">
<script
	src="<%=request.getContextPath()%>/pcjs/pc/loan/myloanList.js"></script>

<!------个人中心右侧start-------->
<div class="col-sm-9 personal_right  ">
	<jsp:include page="/myView/pcMyAssetTopView.do" flush="true"></jsp:include>
	<div class="p_rightBottom martop30 bgwhite">
		<!-------资金明细start----->
		<div class="title_wrap clearfix">
			<div class="title pull-left">贷款申请</div>
		</div>
		<div class="search_wrap clearfix">
			<form class="queryForm">
			<div class="pull-right">
				日期： <input type="text" class="Wdate" data-type="datetime" onclick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" id="beginDate" name="beginDate" />
				&nbsp;至&nbsp; 
					<input type="text" class="Wdate" data-type="datetime" onclick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" id="endDate" name="endDate" /> 
					<!-- <input type="hidden" name="time" id="time" value=""/>  -->
					<input type="button" value="查询"class="btn btn-default" id="querySubmit"/>
					
			</div>
			</form>
		</div>
		<div class="table_wrap">
			<div class="table_top select-button">
				<a url="/loanApplication/pcMyLoan/all.do" class="active">全部</a>
				<a url="/loanApplication/pcMyLoan/1.do">待审核</a> 
				<a url="/loanApplication/pcMyLoan/2.do">审核通过</a> 
				<a url="/loanApplication/pcMyLoan/3.do">审核拒绝</a> 
			</div>
			<table class="table table-striped table_con" id="table" url="/loanApplication/pcMyLoan/all.do">
				<tr>
					<th>时间</th>
					<!-- <th>贷款编号</th> -->
					<th>贷款类型</th>
					<th>贷款金额(元)</th>
					<th>审核状态</th>
				</tr>
				<c:forEach items="${myLoanList}" var="loans" varStatus="i">
					<tr>
						<td>${ loans.createTimeStr}</td>
						<%-- <td>${ loans.id}</td> --%>
						<%-- <td>${ loans.orderTypeText}</td> --%>
						<td>${ loans.displayLoanType}</td>
						<td>${ loans.amount}</td>
						<td>${ loans.displayCheckStatus}</td>
					</tr>
				</c:forEach>

			</table>
			<jsp:include page="/jsp/pc/pager.jsp"></jsp:include>
		</div>

		<!-------资金明细end------>

	</div>
</div>
<!-------个人中心右侧end------>
