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
<style type="text/css">
.error{color: red;}
</style>
<script src="<%=request.getContextPath() %>/pcjs/pc/order/payEdit.js"></script>
</head>

<body>
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
				<p class="lead">进行充值,方便存款</p>
			</div>
			<!-----表单start-------->
			<form name="mainForm" method="post" class="form-horizontal r_form" role="form">
				<div class="form-group">
					<label class="col-sm-3 control-label">订单号：</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" readonly="readonly" name="orderId"  value="${order.id}" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">银行卡号：</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" disabled="disabled"
							placeholder="${cust.anonymousCardNumber}">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">充值金额(元)：</label>
					<div class="col-sm-9">
						<input type="number" class="form-control" name="amount" disabled="disabled"
							value="${order.amount}" placeholder="请输入提现金额">
					</div>
				</div>
				<div class="form-group verLi">
					<label class="col-sm-3 control-label">手机验证码：</label>
					<div class="valid_wrap clearfix col-sm-9">
						<input type="text" class="form-control pull-left" name="verCode" placeholder="请输入手机验证码"> 
						<button style="background: transparent; color: #337AB7;" class="telvalid pull-left" id="btnVerCode"> 获取短信验证码 </button>
					</div>
				</div>

				<div class="form-group ID_btn_wrap">
					<div class="col-sm-offset-3 col-sm-9">
						<input type="button" class="btn f_btn ok" value="充值">
					</div>
				</div>

				<div class="form-group ID_btn_wrap">
					<div class="error col-sm-offset-3"></div>
				</div>
			</form>
			<!------表单end------>
		</div>
	</div>
</div>
    
  </div>
</div>
<!-------end--------> 


<!-----网站底部start-------->
<jsp:include page="/index/buttons.do" flush="true"></jsp:include>
<!------网站底部end------->
</body>
</html>
