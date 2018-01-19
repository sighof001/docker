<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>用户登录</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="/jsp/pc/pc_include.jsp" flush="true"></jsp:include>
<script src="<%=request.getContextPath() %>/pcjs/pc/login.js"></script>
</head>
<body>
<!-----头部start------>
<jsp:include page="/jsp/pc/top_include.jsp" flush="true"></jsp:include>
<!-----头部end----------> 
<!------用户注册start--------->
<div class="container register_wrap bgwhite">
<div class="register_head clearfix">
	<h4 class=" pull-left colororange">登录</h4>
</div>
  <div class="row">
    <div class="col-sm-6 submit-group-wrap">
      <form id="login_form">
        <div class="form-group">
	        <label for="name" class="control-label col-sm-3">用户名/手机号：</label>
	        <div class="col-sm-7">
		        <input type="text" class="form-control  submit-group" id="loginId" name="loginId" onblur="checkUserName()" placeholder="请输入用户名">
		        <p id="loginIdText"></p>
	        </div>
        </div>
        <div class="form-group">
          <label for="password" class="control-label col-sm-3">密码：</label>
          <div class="col-sm-7">
	            <input type="password" class="form-control submit-group" id="password" name="password" onblur="checkPassWord()"  placeholder="请输入密码">
	            <p id="passwordText"></p>
          </div>
        </div>
        <div class="form-group ">
          <label for="valid" class="control-label col-sm-3">验证码：</label>
          <div class="valid_wrap clearfix col-sm-7">
            <input type="text" class="form-control pull-left submit-group" id="checkCode" name="checkCode" placeholder="请输入验证码">
            <img src="<%=request.getContextPath() %>/login/getCode.do?imgHeight=96&imgWidth=34&codeLen=4" class=" pull-left" id="codeImg" onclick="changeImg(this);"/> </div>
        </div>
        <div class="form-group ">
       		 <label for="password" class="control-label col-sm-3"></label>
	         <div class="col-sm-7">
	       		<p id='checkCodeText'></p>
	          </div>
       	 </div>
         <div class="form-group registerbtn_wrap">
	        <div class="col-sm-offset-2 col-sm-8">
	        	<button type="button" id="submit" class="btn btn-default btnorange submit-group">登录</button>
	        	<a href="<%=request.getContextPath()%>/login/pcForgotPassword.do" class="col-lg-6">忘记密码</a> 
	        <a href="<%=request.getContextPath()%>/register/pcRegisterView.do" class="col-lg-6 text-right">去注册</a>
	        </div>
        </div>
      </form>
    </div>
    <div class="col-sm-6">
    <div class="register_pic"></div>
    </div>
  </div>
</div>
<!-------用户注册end--------> 

<!-----网站底部start-------->
<jsp:include page="/index/buttons.do" flush="true"></jsp:include>
<!------网站底部end------->
</body>
</html>
