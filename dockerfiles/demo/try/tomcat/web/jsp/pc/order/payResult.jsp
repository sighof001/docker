<%@page import="com.investfinancing.constants.DictValue"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>个人中心</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="/jsp/pc/pc_include.jsp" flush="true"></jsp:include>
<script src="<%=request.getContextPath() %>/pcjs/pc/order/payResult.js"></script>
</head>

<body>
<form action="#" method="post" name="mainForm">
<input type="hidden" name="orderId" value="${order.id}" />
<!-----头部start------>
<jsp:include page="/jsp/pc/top_include.jsp" flush="true"></jsp:include>
<!-----头部end----------> 
<!------start--------->
<div class="container martop30 ">
  <div class="row">
    <!--------个人中心左侧start----->
   <jsp:include page="/myView/pcAssetLeftView.do" flush="true"></jsp:include>
    <!-----个人中心左侧end--------> 
<div class="content">
	<div class="col-sm-9 personal_right ">
		<div class="p_r_con bgwhite">
			<div class="p_r_con_title">
				<h3>充值</h3>
				<p class="lead">进行充值，方便存款</p>
			</div>
			<!-----提示信息start-------->

			<div class="alert alert-success r_alert">
				<p class="icon"></p>
				<div class="a_s_con">
					<h3>充值成功</h3>

					<div>充值银行：${cust.bankName }</div>
					<div>银行卡号：${cust.anonymousCardNumber }</div>
					<div>充值金额：${order.amount }元</div>
					<div>
						<a href="<%=request.getContextPath() %>/order/pcRechargeEdit.do" class="a_link">继续充值</a><a
							href="<%=request.getContextPath() %>/webEntrust/pcProductsListView/<%=DictValue.GOODS_TYPE_NORMAL %>.do" class="a_link">去委托</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
    
  </div>
</div>
<!-------end--------> 


<!-----网站底部start-------->
<jsp:include page="/index/buttons.do" flush="true"></jsp:include>
<!------网站底部end------->
</form>
</body>
</html>
