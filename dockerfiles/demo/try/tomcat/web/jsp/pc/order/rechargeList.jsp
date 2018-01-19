<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/pccss/pc/other.css">
<script src="<%=request.getContextPath()%>/pcjs/pc/order/rechargeList.js"></script>

<!------个人中心右侧start-------->
<div class="col-sm-9 personal_right  ">
	<jsp:include page="/myView/pcMyAssetTopView.do" flush="true"></jsp:include>
	<div class="p_rightBottom martop30 bgwhite">
		<!-------提现记录start----->
		<div class="title_wrap clearfix">
			<div class="title pull-left">充值记录</div>
			<a class="pull-right gowt auth-status-btn auth-status-cla" href="<%=request.getContextPath()%>/order/pcRechargeEdit.do">充值</a>
		</div>
		<div class="table_wrap">
			<div class="table_top select-button">
				<a url="/order/pcRechargeList.do" class="active">全部</a>
			</div>
			<table class="table table-striped table_con" id="table" url="/order/pcRechargeList.do">
				<tr>
					<th>时间</th>
					<th>交易编号</th>
					<th>交易金额(元)</th>
					<th>支付状态</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${page.data}" var="order" varStatus="i">
					<tr>
						<td>${ order.createTimeStr}</td>
						<td>${ order.id}</td>
						<td>${ order.amount}</td>
						<td>${order.payStatusText}</td>
						<td>
							<c:if test="${order.canPay }"><a class='pay' href='<%=request.getContextPath()%>/order/pcPayEdit.do?orderId=${order.id}'>继续支付</a></c:if>
						</td>
					</tr>
				</c:forEach>

			</table>
			<jsp:include page="/jsp/pc/pager.jsp"></jsp:include>
		</div>

		<!-------资金明细end------>

	</div>
</div>
<!-------个人中心右侧end------>
