<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/pccss/pc/other.css">
<script
	src="<%=request.getContextPath()%>/pcjs/pc/cust/myRunningAccountPage.js"></script>

<!------个人中心右侧start-------->
<div class="col-sm-9 personal_right  ">
	<jsp:include page="/myView/pcMyAssetTopView.do" flush="true"></jsp:include>
	<div class="p_rightBottom martop30 bgwhite">
		<!-------余额明细start----->
		<div class="title_wrap clearfix">
			<div class="title pull-left">余额明细</div>
			<a class="pull-right auth-status-btn auth-status-cla" id="export-btn" href="<%=request.getContextPath() %>/order/pcRechargeEdit.do">充值</a> 
          <a class="pull-right auth-status-btn auth-status-cla" id="export-btn" href="javascript:linkUrl('withdrawEdit');">提现</a> 
		</div>
		<div class="search_wrap clearfix">
			<div class="pull-left times">
				<a class="active" time="all">全部</a>
				<a time="-30" >最近一个月</a>
				<a time="-90">3个月</a>
			</div>
			<form class="queryForm">
			<div class="pull-right">
				日期： <input type="text" class="Wdate" data-type="datetime" onclick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" id="beginDate" name="beginDate" />
				&nbsp;至&nbsp; 
					<input type="text" class="Wdate" data-type="datetime" onclick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" id="endDate" name="endDate" /> 
					<input type="hidden" name="time" id="time" value=""/> 
					<input type="button" value="查询"class="btn btn-default" id="querySubmit"/>
					
			</div>
			</form>
		</div>
		<div class="table_wrap">
			 <div class="table_top select-button">
				<a url="/tryCustRunningAccount/pcMyRunningAccountPage/all.do" class="active"></a>
				<!-- <a url="/order/pcFundDetailsPage/3.do">委托</a> 
				<a url="/order/pcFundDetailsPage/5.do">返息</a> 
				<a url="/order/pcFundDetailsPage/4.do">转出</a> 
				<a url="/order/pcFundDetailsPage/1.do">充值</a> 
				<a url="/order/pcFundDetailsPage/2.do">提现</a> -->
			</div>
			<table class="table table-striped table_con" id="table" url="/tryCustRunningAccount/pcMyRunningAccountPage/all.do">
				<tr>
					<th>时间</th>
					<th>交易金额(元)</th>
					<th>余额(元)</th>
					<th>交易类型</th>
				</tr>
				<c:forEach items="${queryMyRunningAccount}" var="orders" varStatus="i">
					<tr>
						<td>${ orders.createTimeStr}</td>
				<c:choose>
				     <c:when test="${orders.directionFlag == '1'}">
				     	<td>+${ orders.amount}</td>
				     </c:when>
			     	 <c:when test="${orders.directionFlag == '0'}">
			     	 	<td>-${ orders.amount}</td>
			     	 </c:when>
			     </c:choose>
						<td>${ orders.availableBalance}</td>
						<td>${ orders.showOrderType}</td>
					</tr>
				</c:forEach>

			</table>
			<jsp:include page="/jsp/pc/pager.jsp"></jsp:include>
		</div>

		<!-------资金明细end------>

	</div>
</div>
<!-------个人中心右侧end------>
