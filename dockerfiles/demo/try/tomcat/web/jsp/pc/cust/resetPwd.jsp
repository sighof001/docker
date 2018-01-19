<%@ page language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>修改密码</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="/jsp/pc/pc_include.jsp" flush="true"></jsp:include>
<script src="<%=request.getContextPath() %>/pcjs/pc/cust/resetPwd.js"></script>
<!--[if lt IE 9]>
<script src="js/html5shiv.min.js"></script>
<script src="js/respond.min.js"></script>
 <![endif]-->

</head>

<body>
    <div class="col-sm-9 personal_right ">
      <div class="p_r_con bgwhite">
        <div class="p_r_con_title">
          <h3>修改密码</h3>
        </div>
        <!-----表单start-------->
        <form class="form-horizontal r_form" role="form" id="form">
          <div class="form-group">
            <label class="col-sm-3 control-label">当前密码：</label>
            <div class="col-sm-9">
            <input type="password" id="oldPassword" name="oldPassword" class="form-control" placeholder="请输入当前密码"/>
           	<p id="oldPasswordText" style="font-size:12px;color:#ff352b;">
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-3 control-label">新密码：</label>
            <div class="col-sm-9">
              <input type="password" id="password" name="password" class="form-control" placeholder="请输入新的密码"/>
           		<p id="passwordText" style="font-size:12px;color:#ff352b;">
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-3 control-label">再次确认新密码：</label>
             <div class="col-sm-9">
              <input type="password" id="rePassword" name="rePassword" class="form-control " placeholder="请再次确认密码"/>
           		<p id="rePasswordText" style="font-size:12px;color:#ff352b;">
             </div>
          </div>
          <div class="form-group ID_btn_wrap">
            <div class="col-sm-offset-3 col-sm-2">
              <input type="button" class="btn  f_btn"  value="提交" id="submit"/>
            </div>
             <div class="col-sm-offset-1 col-sm-2">
              <input type="button" class="btn  f_btn grybtn"  onClick="javascript:window.location.href='<%=request.getContextPath()%>/myView/pcMyAssetView.do?menuId=mySet'"  value="返回"/>
            </div>
          </div>
        </form>
        <!------表单end------> 
      </div>
    </div>
  </div>
</div>
<!-------个人中心end--------> 

</body>
</html>
