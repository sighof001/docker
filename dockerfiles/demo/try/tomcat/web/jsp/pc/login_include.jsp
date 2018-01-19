<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<script src="<%=request.getContextPath() %>/pcjs/pc/pub_login.js"></script>
<div class="modal fade loginmodal submit-group-wrap" id="gologin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	  <div class="modal-content">
	    <div class="modal-header">
	      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	      <h4 class="modal-title" id="myModalLabel">用户登录</h4>
	    </div>
	    <div class="modal-body">
	      <form id="pub_login_form">
	        <div class="form-group">
	          <label for="name" class=" control-label">用户名/手机号</label>
	          <input type="text" class="form-control submit-group" id="pub_loginId" name="pub_loginId" placeholder="请输入用户名/手机号">
	         <!--  <p id="pub_loginIdText" class="error" style="color:red"></p> -->
	        </div>
	        <div class="form-group">
	          <label for="password" class="control-label">密码</label>
	          <input type="password" class="form-control submit-group" id="pub_password" name="pub_password" placeholder="请输入密码">
	          <!-- <p id="pub_passwordText" class="error" style="color:red"></p> -->
	        </div>
	        <div class="form-group ">
	          <label for="valid" class="control-label">验证码</label>
	          <div class="valid_wrap clearfix">
	            <input type="text" class="form-control pull-left submit-group" id='pub_checkCode' name="pub_checkCode" placeholder="请输入验证码">
	            <img src="<%=request.getContextPath() %>/login/getCode.do?imgHeight=96&imgWidth=34&codeLen=4" class=" pull-left" id="pub_codeImg" onclick="changeImg(this);"/> </div>
	          	<!-- <p id="pub_passwordText" class="error" style="color:red"></p> -->
	        </div>
	        <div class="form-group ">
	        	<p class="error_pub" style="color:red;height: 20px;margin: 0;"></p>
	        </div>
	        <button type="button" id="pub_submit" class="btn btn-default btnorange submit-group">登录</button>
	        <a href="<%=request.getContextPath()%>/login/pcForgotPassword.do" class="col-lg-6">忘记密码</a> 
	        <a href="<%=request.getContextPath()%>/register/pcRegisterView.do" class="col-lg-6 text-right">去注册</a>
	      </form>
	    </div>
	  </div>
	  <!-- /.modal-content --> 
	</div>
</div>