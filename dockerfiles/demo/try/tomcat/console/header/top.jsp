<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<div class="navbar navbar-fixed-top">
	
	<div class="left">
		<a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp"> 
			<img height="20" width="20" src="<%=request.getContextPath()%>/image/favicon/favicon.png"> 
			金达投融易后台管理系统
		</a>
		<div id="nav_menu">
			<ul class="nav navbar-nav-ie8"></ul>
		</div>
	</div>
		<div class="top-head-user-tip navbar-right" style="padding-top:10px">
			<div id="login_div">
				<a href="<%=request.getContextPath()%>/registe.jsp">注册</a> | <a href="<%=request.getContextPath()%>/login.jsp">登录</a>
			</div>
			<div id="user_div" class="hidden dropdown pull-right">
				<a id="username" data-toggle="dropdown" href="#" class="dropdown-toggle">用户XXX</a>  <a href="<%=request.getContextPath()%>/logout.do" class="headerGetOut">退出</a>
				<ul class="dropdown-menu" role="menu" aria-labelledby="drop1">
    				<li role="presentation"><a tabindex="-1" role="menuitem" data-toggle="modal" href="#changepwd">修改密码</a></li>
  				</ul>
			</div>
		</div>

</div>
<!-- 修改密码对话框  -->
<div id="changepwd" class="modal fade change-pwd-dialog" role="dialog" data-backdrop="static" data-keyboard="false">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">修改密码</h4>
      </div>
      <div class="modal-body">
        <div class="form-group">
			<label>原密码<span class="red">*</span></label> 
			<input
				type="password" class="form-control" name="oldpwd"
				placeholder="输入原密码">
		</div>
        <div class="form-group">
			<label>新密码<span class="red">*</span></label> 
			<input
				type="password" class="form-control" name="password"
				placeholder="输入新密码">
		</div>
		<div class="form-group">
			<label>重复新密码<span class="red">*</span></label> 
			<input
				type="password" class="form-control" name="confirm"
				placeholder="重复新密码">
		</div>
		<div class="form-group">
			<label>手机号码<span class="red">*</span></label> 
			<input
				type="text" class="form-control" name="mobile"
				placeholder="输入手机号码">
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
        <button id="btn-change-pwd" type="button" class="btn btn-primary">保存</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script type="text/javascript" src="<%=request.getContextPath()%>/js/frame/header.js"></script>


<script>
function showjgbb(){
	$("#4B35012D40C74EE086FF0ECA940E45CF").click();
}
function shownbglbb(){
	$("#6A5FA47B69344D0495DB0631A9C3F3D9").click();
}
function showhzbb(){
	$("#79C4725B7F226E44A361177E108A29D3BB").click();
}
function showsjzljcbb(){
	$("#083241764D60055F51C84CD877EBE01CBB").click();
}
</script>
