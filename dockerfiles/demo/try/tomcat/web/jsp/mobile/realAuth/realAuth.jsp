<%@ page language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>实名认证</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<!--引入JS-->
<script type="text/javascript" src="<%=request.getContextPath()%>/pcjs/webuploader.html5only.min.js"></script>
<script src="<%=request.getContextPath()%>/js/mobile/realAuth/realAuth.js"></script>
<script src="https://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<script src="<%=request.getContextPath() %>/js/mobile/tryWx.js"></script>
<style type="text/css">
.a-inputfile1{position:relative; width:2.16rem; height:1.44rem; text-align:left; margin:0 0.36rem; color:#999 !important;}
.a-inputfile1 input{position:absolute;width:2.16rem; height:1.44rem; opacity:0; }
.uploadImage div:nth-child(2){height:1.44rem !important;}
</style>
</head>

<body>
	<div data-role="page" class="page" data-theme="i">
		<!-----header start----->
		<div data-role="header" data-position="fixed" class="inside-header">
			<a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
			<h1>实名认证</h1>
			<!-- <a href="###" class="btnwordwhite btnnobg icon-news" rel="external"></a> -->
		</div>
		<!-----header end----->
		<!----认证信息start-->
		<div class="inside-main">
			<div class="wrap">
				<form id="form" method="post"
					action="<%=request.getContextPath()%>/myView/submitAuth.do"
					enctype="multipart/form-data">
					<input id="id" name="id" type="hidden" value="${tryCustInfo.id}">
					<ul class="ul-formlist form-list">
						<li><label>真实姓名</label> <input type="text" id="realName"
							name="realName" class="inputtxt inputtxt2" placeholder="请输入真实姓名"
							data-role="none" /></li>
						<li><label>身份证号</label> <input type="text" id="idCard"
							name="idCard" placeholder="请输入身份证号" class="inputtxt"
							data-role="none" /></li>
						<li class="certification-pic">
							<p>证件照片</p>
							<div class="certification-picwrap">
								<div class="col-sm-6 ID_wrap" style="height: 1.85rem;text-align: center;">
									<a id="pic1" href="javascript:;"
										class="certification-picface a-inputfile icon-papers uploadImage" style="float: left;"> 
										<span id="span1">身份证正面照</span>
										<img alt="" src="" id="img_image1" name="img_image1" style="width:2.16rem; height:1.44rem">
									</a> 
									<a id="pic2" href="javascript:;"
										class="certification-picback a-inputfile icon-papers1 uploadImage" style="float: right;"> 
										<span id="span2">身份证反面照</span>
										<img alt="" src="" id="img_image2" name="img_image2" style="width:2.16rem; height:1.44rem">
									</a> 
								</div>
							</div>
						</li>
						<!--错误提示，默认隐藏 -->
						<div id="desc" style="display: none;">
							<label style="color: red;"></label>
						</div>
					</ul>
					<input type="button" id="add" class="btn" data-role="none"
						value="添加" />
				</form>
			</div>
		</div>
		<!--认证信息end---->
		<!--底部start--->
		<jsp:include page="/jsp/mobile/buttons.jsp" flush="true"></jsp:include>
		<!---底部end-->
	</div>
</body>
</html>
