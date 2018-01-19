<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/pccss/pc/other.css">
<jsp:include page="/jsp/pc/pc_include.jsp" flush="true"></jsp:include>
<style type="text/css">
.error{color: red;}
</style>
<script src="<%=request.getContextPath()%>/pcjs/pc/order/withdrawEdit.js"></script>

<!------个人中心右侧start-------->
<div class="col-sm-9 personal_right ">
	<div class="p_r_con bgwhite">
		<div class="p_r_con_title">
			<h3>提现</h3>
			<p class="lead">为保安全，只能提现到已绑定的银行卡</p>
		</div>
		<!-----表单start-------->
		<div class="alert alert-info">当前帐户余额：${banlance}元</div>
		<form class="form-horizontal r_form" role="form">
		<input type= "hidden" id="banlance" name="banlance" value="${banlance }"/>
			<div class="form-group">
				<label class="col-sm-3 control-label">银行卡号：</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" disabled="disabled"
						placeholder="${cust.anonymousCardNumber }">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">提现金额(元)：</label>
				<div class="col-sm-9">
					<input type="number" class="form-control" name="amount" value="${banlance }" placeholder="请输入提现金额">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">支付密码：</label>
				<div class="col-sm-9">
					<input type="password" class="form-control" name="payPassword"  onblur="validatPayPassword();" placeholder="请输入支付密码">
				</div>
			</div>

			<div class="form-group ID_btn_wrap">
				<div class="col-sm-offset-3 col-sm-9">
					<input type="button" class="btn f_btn ok" value="申请提现" >
				</div>
			</div>

			<div class="form-group ID_btn_wrap">
				<div class="error col-sm-offset-3"></div>
			</div>
		</form>
		<!------表单end------>
	</div>
</div>
<!-------个人中心右侧end------>
