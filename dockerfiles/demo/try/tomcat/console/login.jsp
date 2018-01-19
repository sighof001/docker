<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn" class="loginhtml">
<head>
<%@ include file="header/header.jsp" %>
<title>登录页面</title>
<style>
form {
	margin-top: 150px;
}
</style>
</head>
<body class="loginbody">
    <div class="loginLogo"></div>
	<div class="container" >
   
		<div class="logincontain">
		<div class="loginbox">
        <div class="logintitle"></div>
			<form name="loginform" class="form-horizontal loginform" action="<%=path%>/login.do" method="post">
				<div class="form-group login-form-group">
					<label for="username" class="control-label usernamelabel">用户名：</label>
					<div class="logintxt">
						<input type="text" class="form-control" name="username"
							placeholder="请输入用户名">
					</div>
				</div>
				
				<div class="form-group login-form-group">
					<label for="password" class="control-label passwordlabel">密码：</label>
					<div class="logintxt">
						<input type="password" class="form-control" name="password"
							placeholder="请输入密码">
					</div>
				</div>
				<div class="form-group loginbtnwrap">
					<div class="loginbtnbg">
						<button type="submit" class="btn btn-default pull-right loginbtn">登&nbsp;&nbsp;&nbsp;&nbsp;录</button></div>
                        </div>
					<div class="form-group nopadding-form-group">
					<!--  
                    <div class="col-xs-3">  <a href="registe.jsp">注册</a> </div>
					<div class="col-xs-9 txtright" >

						<a href="#">忘记密码</a></div>
				</div>
				-->
				<div class="alertlogin alert alert-danger <%if (error==null) out.print("hide");%>"><%=error%></div>
			</form>
		</div>
        </div>
	</div>
    <div class="loginFooter"></div>
</body>

<script>
$(document).ready(function() {
	if(window.parent.length>0){ 
		window.parent.location=window.location; 
    }
	/* var username=$("input[name=username]").val();
	var password=$("input[name=password]").val();
	console.log(username);
	console.log(password);
	if(username&&password){
		setCookie("loginId",username,"password",password);
	} */
	$(".loginbtn").on("click",function(){
		var username=$("input[name=username]").val();
		//var password=$("input[name=password]").val();
		setCookie("loginId",username);
	})
	getCookie("loginId");
	//设置cookie,保存30天
	function setCookie(name,value){
		var Days = 30;
		var exp = new Date();
		exp.setTime(exp.getTime() + Days*24*60*60*1000);
		document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString()
		//document.cookie = c_password + "="+ escape (pValue) + ";expires=" + exp.toGMTString()
	}
	//获取cookie
	function getCookie(name){
		var arr = '';
	//	var arr2 = '';
		reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
	//	reg2=new RegExp("(^| )"+password+"=([^;]*)(;|$)");
		if(arr=document.cookie.match(reg)){
			//arr2=document.cookie.match(reg2);
			$("input[name=username]").val(arr[2]);
			//$("input[name=password]").val(arr2[2]);
			//return unescape(arr[2]);
		}else{
			return null;
		}
	}
})
</script>
</html>