<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>${title}</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="/jsp/pc/pc_include.jsp" flush="true"></jsp:include>
<script src="<%=request.getContextPath() %>/pcjs/pc/result.js"></script>
<!--[if lt IE 9]>
<script src="js/html5shiv.min.js"></script>
<script src="js/respond.min.js"></script>
 <![endif]-->
<script type="text/javascript">

</script>
</head>

<body>
<div class = "content">
	<div class="col-sm-9 personal_right ">
		<div class="p_r_con bgwhite">
			<div class="p_r_con_title">
				<h3>${title}</h3>
				<p class="lead">${content}</p>
			</div>
			<!-----提示信息start-------->
			<c:if test="${status!=3}">
				<div class="alert alert-success r_alert">
					<p class="icon"></p>
					<div class="a_s_con">
						<c:if test="${status==2}">
							<h3>${title}成功</h3>
						</c:if>
						<c:if test="${status==1}">
							<h3>${title}过程中,请等待审核</h3>
						</c:if>
						<div>${text1}：${value1}</div>
						<div>${text2}：${value2}</div>
					</div>
				</div>
				<c:if test="${title=='实名认证'}">
				<div class="alert alert-success r_alert">
					<h4>身份证信息</h4>
					<div class="a_s_con" style="display: inline-block;width: 100%;">
						<div style="float: left;width: 50%;">
							<h5>身份证正面</h5>
							<img src="<%=request.getContextPath() %>/myView/viewImages.do?alaramPic=${image1}" id="image1" name="image1" style="width: 250px;">
						</div>
						<div style="float: right;width: 50%;">
							<h5>身份证反面</h5>
							<img src="<%=request.getContextPath() %>/myView/viewImages.do?alaramPic=${image2}" id="image2" name="image2" style="width: 250px;">
						</div>
					</div>
				</div>
				</c:if>
			</c:if>

			<!------提示信息end------>
			<!------失败的提示信息start------>
			<c:if test="${status==3}">
				<div class="alert  alert-danger r_alert">
					<p class="icon icon_error"></p>
					<div class="a_s_con">
						<h3>${title }失败</h3>
						<div>${text1}：${value1}</div>
						<div>${text2}：${value2}</div>
						<div>${text3}:${value3}</div>
						<div>
							<a class="links" url="${link}">${retry}</a>
						</div>
					</div>
				</div>
			</c:if>
			<!------失败的提示信息end-------->
		</div>
	</div>
	</div>
	</div>
	</div>
	<!-------个人中心end-------->
</body>
</html>
