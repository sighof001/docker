<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>用户注册</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<script src="<%=request.getContextPath() %>/js/mobile/register.js"></script>
</head>

<body>
<div data-role="page" class="page bgwhite"  data-theme="i"> 
  <!-----header start----->
  <div data-role="header" data-position="fixed" class="inside-header"> <a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
    <h1>用户注册</h1>
  </div>
  <!-----header end---->
  <!---注册信息start--->
  <div class="inside-main bgwhite">
    <div class="wrap">
      <form id="form"  method="post" action="<%=request.getContextPath() %>/register/sumbit.do">
        <ul class="form-list">
          <li>
            <label>用户名</label>
            <input type="text" id="loginId" name="loginId" data-role="none" class="inputtxt" placeholder="请输入用户名" autofocus/>
          </li>
          <li>
            <label>手机号</label>
            <input  type="tel" id="mobile" name="mobile" data-role="none" class="inputtxt"   placeholder="请输入手机号" autofocus/>
          </li>
          <li>
            <label>手机验证</label>
            <input type="text" id="smsCode" name="smsCode" data-role="none"  class="inputtxt" placeholder="请输入验证码"/>
            <button type="button" id="smsCodeInp" value="获取验证码" class="getvalid" data-role="none" style="width:250px;" />获取验证码</button>
          </li>
          <li>
            <label>密&nbsp;码</label>
            <input  type="password" id="password" name="password" data-role="none" class="inputtxt" placeholder="请设置6-18位密码"/>
          </li>
          <li>
            <label>确认密码</label>
            <input  type="password" id="confirmPwd" name="confirmPwd" data-role="none" class="inputtxt" placeholder="请输入密码"/>
          </li>
          <li>
            <label>邮寄地址</label>
            <input  type="text" id="mailAddress" name="mailAddress" data-role="none" class="inputtxt"   placeholder="请输入邮寄地址(可不填)" onblur="checkMailAddress()" autofocus/>
          </li>
          <li>
            <label>推荐码</label>
            <input  type="tel" id="sufferRecommendNum" name="sufferRecommendNum" data-role="none" class="inputtxt"  onblur="checkSufferRecommendNum()"   placeholder="请输入推荐码(可不填)" autofocus/>
          </li>
          <li>
     		<label>验证码</label>
     		<input type="text" id="checkCode" name="checkCode"  placeholder="请输入验证码"  class="inputtxt"  data-role="none"/>
     		<img src= "<%=request.getContextPath() %>/login/getCode.do?imgHeight=88&imgWidth=30&codeLen=4" id="imgCode" onclick="changeImg(this);"  class="getvalid"/>
     	  </li>
          
          <!--错误提示，默认隐藏 -->
          <div id="desc" style="display:none;">
            <label style="color:red;"></label>
          </div>
          
        </ul>
        <input class="btn-submit2 bgorange" type="button" data-role="none" value="注册"/>
        <!-- <div><span>已阅读并同意<a href="###" rel="external" class="color-blue">《金达投融易服务协议》</a></span></div> -->
      </form>
    </div>
  </div>
    <!---注册信息end--->
</div>
</body>
</html>
