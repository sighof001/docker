<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>个人信息</title>
<!-- 不要修改引入顺序 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/other.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mobiscroll.custom-2.5.2.min.css">
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<!--引入JS-->
<script type="text/javascript" src="<%=request.getContextPath()%>/pcjs/webuploader.html5only.min.js"></script>
<script src="<%=request.getContextPath()%>/js/mobile/cust/custPersonalInfo.js"></script>
<script src="<%=request.getContextPath()%>/js/mobiscroll.custom-2.5.2.min.js"></script>
<script src="https://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<script src="<%=request.getContextPath() %>/js/mobile/tryWx.js"></script>
</head>

<body>
	<div data-role="page" id="pageone" class="page" data-theme="i">
		<!-----header start----->
		<div data-role="header" data-position="fixed" class="inside-header">
			<a href="<%=request.getContextPath()%>/myView/myViewMain.do" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
			<h1>个人信息</h1>
			<a href="###" class="btnwordwhite btnnobg" rel="external"></a>
		</div>
		<!-----header end---->
		<div class="inside-main">
			<div class="select_content">
				<!-----全部明细内容start------>
				<!----用户消息 start------>
				<form id="form" method="post" enctype="multipart/form-data">
					<input id="id" name="id" type="hidden" value="${tryCustInfo.id}">
					<div class="select_item inside-list nomarin">
						<a class="inside-listcon autoheight-list clearfix a-inputfileUpdate headImageUpload" href="javascript:;"> 
							<div class="clearfix clickFile">
								<div class="fl">
									<p class="maintitle">
										<span>头像</span>
									</p>
								</div>
								<div class="fr  color-grey ">
									<p class="price color-lightgray f24 mehead ">
										<c:choose>
											<c:when test="${tryCustInfo.headerImage==null}">
												<img id="defaultPic" src="<%=request.getContextPath()%>/images/defaulthead.jpg" />
											</c:when>
											<c:otherwise>
												<img id="headPic"
													src="<%=request.getContextPath()%>/myView/viewHeaderImages.do?alaramPic=${tryCustInfo.headerImage}">
											</c:otherwise>
										</c:choose>
									</p>
								</div>
							</div>
						</a> 
						<a rel="external" class="inside-listcon autoheight-list clearfix"
							href="<%=request.getContextPath()%>/personal/setNickName.do">
							<div class="clearfix">
								<div class="fl">
									<p class="maintitle">
										<span>昵称</span>
									</p>
								</div>
								<div class="fr  color-grey">
									<p class="price color-lightgray f24 icon-rightarrow-1r">${tryCustInfo.nickName}</p>
								</div>
							</div>
						</a>
						<a rel="external" class="inside-listcon autoheight-list clearfix"
							href="<%=request.getContextPath()%>/personal/setMailAddress.do">
							<div class="clearfix">
								<div class="fl">
									<p class="maintitle">
										<span>邮寄地址</span>
									</p>
								</div>
								<div class="fr  color-grey">
									<p class="price color-lightgray f24 icon-rightarrow-1r">${tryCustInfo.mailAddressStr}</p>
								</div>
							</div>
						</a>
						
						<a rel="external" class="inside-listcon autoheight-list clearfix">
							<div class="clearfix">
								<div class="fl">
									<p class="maintitle">
										<span>生日 </span>
									</p>
								</div>
								<div class="fr  color-grey">
									<!-- <p class="price color-lightgray f24 icon-rightarrow-1r" id="scroller" data-role="none">2017-7-18</p> -->
									<p class="price color-lightgray f24 icon-rightarrow-1r date-wrap "><input class="color-lightgray f24 inputtxt1" id="scroller" data-role="none" value="${tryCustInfo.displayBirthday}" name="birthday"/></p>
								</div>
							</div>
						</a>
						<a rel="external" class="inside-listcon autoheight-list clearfix">
							<div class="clearfix">
								<div class="fl">
									<p class="maintitle">
										<span>推荐码</span>
									</p>
								</div>
								<div class="fr ">
									<p class="price color-lightgray f24">${tryCustInfo.recommendNum}</p>
								</div>
							</div>
						</a>
						
						<!-- 错误提示 -->
						<div id="desc" style="display: none;">
							<label style="color: red;"></label>
						</div>
					</div>
					<!-----用户消息 end---->
			</div>
			<!-----全部明细内容end------>
			</form>
		</div>
	<%-- 	<!--底部start--->
		<jsp:include page="/jsp/mobile/buttons.jsp" flush="true"></jsp:include>
		<!---底部end--> --%>
	</div>
	</div>
</body>
</html>
