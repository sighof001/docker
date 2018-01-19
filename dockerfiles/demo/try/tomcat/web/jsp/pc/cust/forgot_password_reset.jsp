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
  		<a href="###"><span><i>2</i>安全验证</span></a>
  		<a href="###" class="active"><span><i>3</i>找回密码</span></a>
  </div>
  <div class="findpwd-con">
    <form id="form" action="">
    	<input type="hidden" name="account" id="account" value="${ account}" >
    	<input type="hidden" name="paramType" id="paramType" value="${paramType }">
      <div class="form-group">
          <label for="password" class="control-label col-sm-3">密码：</label>
          <div class="col-sm-8">
            <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
            <p id="passwordText"></p>
          </div>
        </div>
        <div class="form-group">
          <label for="password" class="control-label col-sm-3">再次密码：</label>
          <div class="col-sm-8">
            <input type="password" class="form-control" id="confirmPwd" name="confirmPwd" placeholder="请再次输入密码">
          	<p id="confirmPwdText"></p>
          </div>
        </div>
      <div class="form-group registerbtn_wrap">
          <div class="col-sm-offset-3 col-sm-8">
            <button type="button" id="submit_res" class="btn btn-default btnorange btnblue register_btn">下一步</button>
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
