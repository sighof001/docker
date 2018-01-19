<%@ page language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>修改邮寄地址</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="/jsp/pc/pc_include.jsp" flush="true"></jsp:include>
<script src="<%=request.getContextPath()%>/pcjs/pc/cust/resetMailAddress.js"></script>
<!--[if lt IE 9]>
<script src="js/html5shiv.min.js"></script>
<script src="js/respond.min.js"></script>
 <![endif]-->

</head>
<style>
.error-p{
	font-size: 12px; 
	color: #ff352b;
	position: absolute; 
	top: 100%;
}

</style>

<body>
	<div class="col-sm-9 personal_right ">
		<div class="p_r_con bgwhite">
			<div class="p_r_con_title">
				<h3>修改邮寄地址</h3>
			</div>
			<!-----表单start-------->
			<form class="form-horizontal r_form" role="form" id="form">
				<div class="form-group">
					<label class="col-sm-3 control-label">邮寄地址：</label>
					<div class="col-sm-9">
						<input type="hidden" class="form-control"
							id="id" name="id" value="${tryCustInfo.id}" />
						<input type="text" class="form-control"
							id="mailAddress" name="mailAddress" value="${tryCustInfo.mailAddress}" />
							<p id="mailAddressText" class="error-p">
					</div>
				</div>
				<div class="form-group ID_btn_wrap">
					<div class="col-sm-offset-3 col-sm-2">
						<input type="button" class="btn  f_btn" value="提交" id="submit" />
					</div>
					<div class="col-sm-offset-1 col-sm-2">
						<input type="button" class="btn  f_btn grybtn" onClick="javascript:window.location.href='<%=request.getContextPath()%>/myView/pcMyAssetView.do?menuId=myBaseInfo'"  value="返回" />
					</div>
				</div>
			</form>
			<!------表单end------>
		</div>
	</div>
	</div>
	</div>
	<!-------个人中心end-------->
</body>
</html>
