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
<script src="<%=request.getContextPath() %>/pcjs/pc/forgot_password_mail.js"></script>

</head>

<body>
<!-----头部start------>
<jsp:include page="/jsp/pc/top_include.jsp" flush="true"></jsp:include>
<!-----头部end----------> 


<!------用户注册start--------->
<div class="container register_wrap bgwhite">
  <div class="register_head clearfix">
    <h4 class=" pull-left colororange">找回密码</h4>
    <a class="pull-right" href="<%=request.getContextPath() %>/login/pcForgotPassword.do">手机号码找回</a>
  </div>
  <div class="findpwd-flow">
  		<a class="active"><span><i>1</i>确定账号</span></a>
  		<a><span><i>2</i>安全验证</span></a>
  		<a class="flow-lastchild"><span><i>3</i>找回密码</span></a>
  </div>
  <div class="findpwd-con">
    <form id="form">
    <input type="hidden" id="paramType" name="paramType" value="1" />
      <div class="form-group">
        <label for="name" class="control-label col-sm-4">邮箱：</label>
        <div class="col-sm-8">
          <input type="text" class="form-control" id="account" name="account" placeholder="请输入邮箱">
         <p id="accountText"></p>
        </div>
      </div>
      <div class="form-group ">
        <label for="valid" class="control-label col-sm-4">验证码：</label>
        <div class="valid_wrap clearfix col-sm-8">
	          <input type="text" class="form-control pull-left " id="checkCode" name="checkCode" placeholder="请输入验证码">
	          <img src="<%=request.getContextPath() %>/login/getCode.do?imgHeight=96&imgWidth=34&codeLen=4" id="codeImg" class="pull-left" onclick="changeImg(this);"/>
	          <p id="checkCodeText"></p> 
          </div>
      </div>
      <div class="form-group registerbtn_wrap">
          <div class="col-sm-offset-3 col-sm-8">
            <button type="button" id="submit_for" class="btn btn-default btnorange btnblue register_btn">下一步</button>
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
