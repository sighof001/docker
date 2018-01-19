<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>登录</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<script src="<%=request.getContextPath() %>/js/mobile/login.js"></script>
</head>

<body>
<div data-role="page" class="page bgwhite"  data-theme="i"> 
  <!-----header start----->
  <div data-role="header" data-position="fixed" class="inside-header"> 
  <a href="<%=request.getContextPath() %>/index/indexList.do" class="btnwordwhite btnnobg icon-leftarrow-1" rel="external"></a>
    <h1>登录</h1>
    <a href="<%=request.getContextPath() %>/register/registerView.do" class="btnwordwhite btnnobg f24"  rel="external">注册</a> </div>
  <!-----header end---->
  <!---登录信息start--->
  <div class="inside-main bgwhite">
    <div class="wrap">
      <form id="form">
        <ul class="form-list">
          <li>
            <label class="icon-user"></label>
            <input id="loginId" name="loginId" type="text" data-role="none" class="inputtxt" placeholder="请输入用户名/手机号" autofocus/>
          </li>
          <li>
            <label  class="icon-lock" id="showPwd" ></label>
            <input id="password" name="password"  type="password" data-role="none" class="inputtxt" placeholder="请输入6-18位密码"/>
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
        <input class="btn-submit2 bgorange" type="button" data-role="none" value="登录"/>
        <div><a href="<%=request.getContextPath() %>/login/retrievalPassword.do" rel="external" class="color-blue">忘记密码</a></div>
      </form>
    </div>
  </div>
   <!---登录信息end--->
</div>
</body>
</html>