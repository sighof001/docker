<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/pccss/pc/other.css">
<script src="<%=request.getContextPath()%>/pcjs/pc/order/withdrawSuccess.js"></script>

<!------个人中心右侧start-------->
<div class="col-sm-9 personal_right ">
	<div class="p_r_con bgwhite">
		<div class="p_r_con_title">
			<h3>提现</h3>
			<p class="lead">为保安全，只能提现到已绑定的银行卡</p>
		</div>
		<!-----提示信息start-------->

		<div class="alert alert-success r_alert">
			<p class="icon"></p>
			<div class="a_s_con">
				<h3>提现申请成功，请等待处理</h3>

				<div>银行卡号：${cust.anonymousCardNumber }</div>
				<div>提现金额：${order.amount }元</div>
				<div>
					<a href="javascript:linkUrl('withdrawList',{orderId:'${order.id }'});" class="a_link withdrawList">返回提现记录</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-------个人中心右侧end------>
