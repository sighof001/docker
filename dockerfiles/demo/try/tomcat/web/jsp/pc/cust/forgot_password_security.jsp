<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>找回密码</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="/jsp/pc/pc_include.jsp" flush="true"></jsp:include>
<script src="<%=request.getContextPath() %>/pcjs/pc/forgot_password.js"></script>
</head>

<body>
<!-----头部start------>
<jsp:include page="/jsp/pc/top_include.jsp" flush="true"></jsp:include>
<!-----头部end----------> 


<!------用户注册start--------->
<div class="container register_wrap bgwhite">
  <div class="register_head clearfix">
    <h4 class=" pull-left colororange">找回密码</h4>
  </div>
  <div class="findpwd-flow">
  		<a href="###"><span><i>1</i>确定账号</span></a>
  		<a href="###" class="active"><span><i>2</i>安全验证</span></a>
  		<a href="###" class="flow-lastchild"><span><i>3</i>找回密码</span></a>
  </div>
  <div class="findpwd-con">
    <form id="form" action="<%=request.getContextPath() %>/login/pcForgotPasswordReset.do" method="post">
      <div class="form-group ">
          <label for="valid" class="control-label col-sm-3">验证码：</label>
          <input type="hidden" name="account" id="account" value="${ account}" >
          <input type="hidden" name="paramType" id="paramType" value="${ paramType}" >
          <div class="valid_wrap clearfix col-sm-8">
            <input type="text"  class="form-control pull-left" id="code" name="code" placeholder="请输入验证码">
            <a  class="telvalid pull-left" id="smsCode2">获取验证码 </a>
            <p id="smsCodeText" style="display: inline-block;"></p>
          </div>
        </div>
      <!-- <div class="form-group registerbtn_wrap">
          <div class="col-sm-offset-4 col-sm-8">
            <button type="button" id="submit_sec" class="btn btn-default btnorange btnblue register_btn">下一步</button>
          </div>
      </div> -->
      <div class="form-group ID_btn_wrap">
      		<div class="col-sm-offset-3 col-sm-2">
				<input type="button" class="btn  f_btn grybtn" onClick="history.go(-1);" value="上一步" />
			</div>
			<div class="col-sm-offset-2 col-sm-2">
				<input type="button" class="btn  f_btn btnred" value="下一步" id="submit_sec" />
			</div>
	 </div>
      
    </form>
  </div>
 </div>
  <!-------用户注册end--------> 
  
<!-----网站底部start-------->
<jsp:include page="/index/buttons.do" flush="true"></jsp:include>
<!------网站底部end------->
<!-- 登录弹出框start -->
<jsp:include page="/jsp/pc/login_include.jsp" flush="true"></jsp:include>
<!--弹出框start -->

</body>
</html>
