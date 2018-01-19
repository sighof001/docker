<%@ page language="java" pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>修改登录密码</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<script src="<%=request.getContextPath() %>/js/mobile/cust/custPasswordUpdate.js"></script>
</head>

<body>
<div data-role="page" class="page"  data-theme="i"> 
  <!-----header start----->
  <div data-role="header" data-position="fixed" class="inside-header"> <a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
    <h1>修改登录密码</h1>
    <!-- <a href="###" class="btnwordwhite btnnobg icon-news"  rel="external"></a> </div> -->
  <!-----header end----->
  <div class="inside-main">
    <div class="wrap">
      <form id="form"  method="post" >
        <ul class="ul-formlist form-list">
          <li>
            <label>原登录密码</label>
            <input type="password" id="oldPassword" name="oldPassword" class="inputtxt inputtxt2" placeholder="请输入原登录密码" data-role="none"/>
          </li>
          <li>
            <label>新登录密码</label>
            <input type="password" id="password" name="password" class="inputtxt inputtxt2" placeholder="请输入新登录密码" data-role="none"/>
          </li>
          <li>
            <label>新密码确认</label>
            <input type="password" id="rePassword" name="rePassword"  placeholder="请再次确认登录密码"  class="inputtxt" data-role="none"  />
          </li>
          <!--错误提示，默认隐藏 -->
          <div id="desc" style="display:none;">
            <label style="color:red;"></label>
          </div>
        </ul>
        <input type="button"  class="btn" data-role="none" value="确定" />
      </form>
    </div>
  </div>
   <!--底部start--->
 <jsp:include page="/jsp/mobile/buttons.jsp" flush="true"></jsp:include>
  <!---底部end--> 
</div>
</body>
</html>
