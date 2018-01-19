<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>用户注册</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="/jsp/pc/pc_include.jsp" flush="true"></jsp:include>
<script src="<%=request.getContextPath() %>/pcjs/pc/register.js"></script>
</head>
<body>
<!-----头部start------>
<jsp:include page="/jsp/pc/top_include.jsp" flush="true"></jsp:include>
<!-----头部end----------> 
<!------用户注册start--------->
<div class="container register_wrap bgwhite submit-group-wrap">
<div class="register_head clearfix"><h4 class=" pull-left colororange">用户注册</h4>
	<a class="pull-right" data-toggle="modal" data-target="#gologin">已有账户？直接<span class="colororange">登录</span></a></div>
  <div class="row">
    <div class="col-sm-6">
      <form id="form">
        <div class="form-group">
        <label for="name" class="control-label col-sm-3">用户名：</label>
        <div class="col-sm-7">
        <input type="text" class="form-control submit-group" id="loginId" name="loginId" onblur="synCheckLoginId();" placeholder="请输入用户名">
        <p id="loginIdText"></p>
        </div>
      
        </div>
        <div class="form-group">
          <label for="tel" class="control-label  col-sm-3">手机号：</label>
          <div class="col-sm-7">
            <input type="text" class="form-control submit-group" id="mobile" name="mobile" placeholder="请输入手机号">
            <p id="mobileText"></p>
          </div>
        </div>
        <div class="form-group ">
          <label for="valid" class="control-label col-sm-3">短信验证：</label>
          <div class="valid_wrap clearfix col-sm-7">
            <input type="text" class="form-control pull-left submit-group" id="smsCode" name="smsCode" placeholder="请输入短信验证码">
            <a  class="telvalid pull-left" id="smsCode2"> 获取验证码 </a>
            <p id="smsCodeText"></p>
          </div>
        </div>
        <div class="form-group">
          <label for="password" class="control-label col-sm-3">密码：</label>
          <div class="col-sm-7">
            <input type="password" class="form-control submit-group" id="password" name="password" placeholder="请输入密码">
            <p id="passwordText"></p>
          </div>
        </div>
        <div class="form-group">
          <label for="password" class="control-label col-sm-3">再次密码：</label>
          <div class="col-sm-7">
            <input type="password" class="form-control submit-group" id="confirmPwd" name="confirmPwd" placeholder="请再次输入密码">
          	<p id="confirmPwdText"></p>
          </div>
        </div>
        <div class="form-group">
          <label for="valid" class="control-label col-sm-3">邮寄地址：</label>
          <div class="col-sm-7">
            <input type="text" class="form-control submit-group" id="mailAddress" name="mailAddress" onblur="checkMailAddress();" placeholder="请输入邮寄地址(可不填)">
          	<p id="mailAddressText"></p>
          </div>
        </div>
        <div class="form-group ">
          <label for="valid" class="control-label col-sm-3">验证码：</label>
          <div class="valid_wrap clearfix col-sm-7">
            <input type="text" class="form-control pull-left submit-group" id="checkCode" name="checkCode" placeholder="请输入验证码">
            <img src="<%=request.getContextPath() %>/login/getCode.do?imgHeight=96&imgWidth=34&codeLen=4" class=" pull-left" id="loginCodeImg" onclick="changeImg(this);"/> </div>
        </div>
        <div class="form-group">
          <label for="valid" class="control-label col-sm-3">推荐码：</label>
          <div class="valid_wrap clearfix col-sm-7">
            <input type="text" class="form-control pull-left submit-group" id="sufferRecommendNum" name="sufferRecommendNum" onblur="checkSufferRecommendNum();" placeholder="请输入推荐码(可不填)">
          	<p id="sufferRecommendNumText"></p>
          </div>
        </div>
        <div class="form-group agree_wrap">
         <div class="col-sm-offset-3 col-sm-9">
      <div class="checkbox">
        <!-- <label>
          <input id="checkbox" type="checkbox" class="submit-group">我已阅读，并同意 《注册协议》
        </label> -->
        <p id="checkCodeText"></p>
      </div>
    </div>
        </div>
         <div class="form-group registerbtn_wrap">
        
        <div class="col-sm-offset-2 col-sm-8">
        <button type="button" id="register_submit" class="btn btn-default btnorange register_btn submit-group">注册</button>
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
<!-- 登录弹出框start -->
<jsp:include page="/jsp/pc/login_include.jsp" flush="true"></jsp:include>
<!--弹出框start -->
</body>
</html>
