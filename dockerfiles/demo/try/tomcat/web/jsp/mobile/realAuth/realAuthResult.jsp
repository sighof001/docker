<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>实名认证结果</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
</head>

<body>
	<div data-role="page" class="page" data-theme="i">
		<!-----header start----->
		<div data-role="header" data-position="fixed" class="inside-header">
			<a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
			<h1>实名认证结果</h1>
			<!-- <a href="###" class="btnwordwhite btnnobg icon-news" rel="external"></a> -->
		</div>
		<!-----header end----->
		<!----认证信息start-->
		<div class="inside-main">
			<c:choose>
				<c:when test="${auditing==true}">
					<div class="panel-body">
						<h3>实名认证</h3>
						<p class="text-info">实名认证资料已经提交，等待业务员审核，请耐心等待；如果急需审核请联系客服!</p>
					</div>
					<hr />
						<table style="width: 100%; height: 100px;">
							<tr>
								<td><span>真实姓名： ${tryCustInfo.anonymousRealName}</span></td>
							</tr>
							<tr>
								<td><span>证件号码： ${tryCustInfo.anonymousIdNumber}</span></td>
							</tr>
							<tr>
								<td align="center"><span>身份证正面：</span></td>
							</tr>
							<tr>
								<td align="center"><img
									src="<%=request.getContextPath()%>/myView/viewImages.do?alaramPic=${tryCustInfo.image1}"
									id="image1" name="image1" style="width: 450px; height: 280px"></td>
							</tr>

							<tr>
								<td align="center"><span>身份证反面： </span></td>
							<tr>
								<td align="center"><img
									src="<%=request.getContextPath()%>/myView/viewImages.do?alaramPic=${tryCustInfo.image2}"
									id="image2" name="image2" style="width: 450px; height: 280px"></td>
							</tr>
							</tr>
						</table>
				</c:when>
				<c:otherwise>
					<div class="wrap">
						<ul class="ul-formlist form-list">
							<div class="panel-body">
								<h3 class="text-success ">您已经通过实名认证!</h3>
								<h3 class="text-success ">具体信息如下:</h3>
						</ul>
						<hr />
						<table style="width: 100%; height: 100px;">
							<tr>
								<td><span>真实姓名： ${tryCustInfo.anonymousRealName}</span></td>
							</tr>
							<tr>
								<td><span>证件号码： ${tryCustInfo.anonymousIdNumber}</span></td>
							</tr>
							<tr>
								<td align="center"><span>身份证正面：</span></td>
							</tr>
							<tr>
								<td align="center"><img
									src="<%=request.getContextPath()%>/myView/viewImages.do?alaramPic=${tryCustInfo.image1}"
									id="image1" name="image1" style="width: 450px; height: 280px"></td>
							</tr>

							<tr>
								<td align="center"><span>身份证反面： </span></td>
							<tr>
								<td align="center"><img
									src="<%=request.getContextPath()%>/myView/viewImages.do?alaramPic=${tryCustInfo.image2}"
									id="image2" name="image2" style="width: 450px; height: 280px"></td>
							</tr>
							</tr>
						</table>
						<%-- <c:choose>
							<c:when test="${tryCustInfo.payPassword==null}">
								<input type="button" id="add" class="btn" data-role="none"
									onclick="location.href='<%=request.getContextPath()%>/myView/tradeCode.do'"
									value="设置支付密码" />
							</c:when>
							<c:otherwise>
								<!-- 支付密码不为空-->
								<input type="button" id="update" class="btn" data-role="none"
									onclick="location.href='<%=request.getContextPath()%>/myView/tradeCodeUpdate.do'"
									value="修改支付密码" />
							</c:otherwise>
						</c:choose> --%>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		<!--底部start--->
	<jsp:include page="/jsp/mobile/buttons.jsp" flush="true"></jsp:include>
	<!---底部end-->
	<!--认证信息end---->
	</div>
	
	</div>
</body>
</html>
