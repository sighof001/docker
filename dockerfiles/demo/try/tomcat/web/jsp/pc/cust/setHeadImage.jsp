<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>修改头像</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="/jsp/pc/pc_include.jsp" flush="true"></jsp:include>
<!--引入CSS-->
<%-- <link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/pccss/webuploader.css"> --%>
<!--引入JS-->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/pcjs/webuploader.min.js"></script>
<script src="<%=request.getContextPath()%>/pcjs/pc/cust/setHeadImage.js"></script>
<!--[if lt IE 9]>
<script src="js/html5shiv.min.js"></script>
<script src="js/respond.min.js"></script>
 <![endif]-->
</head>

<body>
	<div class="col-sm-9 personal_right ">
		<div class="p_r_con bgwhite">
			<div class="p_r_con_title">
				<h3>修改头像</h3>
			</div>
			<!----表单start---------->
			<form class="form-horizontal r_form" role="form" id="form">
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<p id="headImageText" style="font-size: 12px; color: #ff352b;">
						<p class="colorlightgrey f_tip">请上传的文件大小不能超过1M，格式为png,jpeg,jpg,gif,bmp(点击图片进行修改)</p>
						<div class="col-sm-6 ID_wrap" id="test">
							<!-- <div class="ID_div" id="div1">
								<p>+</p>
							</div> -->
<%-- <<<<<<< .mine
							<div class="ID_front" id="filePicker">
								<a href="javascript:;" id="pic1"> <input type="file"
									accept="image/gif,image/jpeg,image/x-png" id="headerImage"
									name="headerImage" /> <c:if
										test="${tryCustInfo.headerImage==null}">
======= --%>
							<div class="ID_front" style="width: 230px;">
								<a href="javascript:;" id="pic1">
									<c:if test="${tryCustInfo.headerImage==null}">
										<img id="defaultPic" style="width: 220px; height: 150px;"
											src="<%=request.getContextPath()%>/images/defaulthead.jpg" />
									</c:if> <c:if test="${tryCustInfo.headerImage!=null}">
										<img id="headPic" style="width: 220px; height: 150px;"
											src="<%=request.getContextPath()%>/myView/viewHeaderImages.do?alaramPic=${tryCustInfo.headerImage}">
									</c:if>
								</a>
							</div>
						</div>
					</div>
					 <!-- <div id="uploader-demo">
						<div id="fileList" class="uploader-list"></div>
						<div id="filePicker1">选择图片</div>
					</div>  -->
				</div>
				<%-- <div class="form-group ID_btn_wrap">
					<!-- <div class="col-sm-offset-3 col-sm-2">
						<input type="button" class="btn  f_btn" value="提交并返回" id="submit" onClick="javascript:history.go(0);"/>
					</div> -->
					<div class="col-sm-offset-3 col-sm-2">
						<input type="button" class="btn  f_btn grybtn"
							onClick="javascript:window.location.href='<%=request.getContextPath()%>/myView/pcMyAssetView.do?menuId=mySet'"
							value="确定" />
					</div>
				</div> --%>
			</form>
			<!----表单end---------->
		</div>
	</div>
	</div>
	</div>
	<!-------个人中心end-------->
</body>
</html>
