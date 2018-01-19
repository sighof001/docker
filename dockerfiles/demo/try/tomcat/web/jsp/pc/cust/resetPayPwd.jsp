<%@ page language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>修改支付密码</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="/jsp/pc/pc_include.jsp" flush="true"></jsp:include>
<script src="<%=request.getContextPath() %>/pcjs/pc/cust/resetPayPwd.js"></script>
<!--[if lt IE 9]>
<script src="js/html5shiv.min.js"></script>
<script src="js/respond.min.js"></script>
 <![endif]-->

</head>
<body>
    <div class="col-sm-9 personal_right ">
      <div class="p_r_con bgwhite">
        <div class="p_r_con_title">
          <h3>修改支付密码</h3>
        </div>
        <!-----表单start-------->
        <form class="form-horizontal r_form" role="form" id="form">
          <div class="form-group">
            <label class="col-sm-3 control-label">原支付密码：</label>
             <div class="col-sm-9">
              <input id="oldPayPassword" name="oldPayPassword"  type="password" class="form-control" placeholder="请输入原支付密码"/>
             	<p id="oldPayPasswordText" style="font-size:12px;color:#ff352b;">
             </div>
          </div>
          <div class="form-group">
            <label class="col-sm-3 control-label">新支付密码：</label>
             <div class="col-sm-9">
              <input id="payPassword" name="payPassword" type="password" class="form-control" placeholder="请输入新支付密码"/>
             	<p id="payPasswordText" style="font-size:12px;color:#ff352b;">
             </div>
          </div>
            <div class="form-group">
            <label class="col-sm-3 control-label">确认支付密码：</label>
             <div class="col-sm-9">
              <input id="rePayPassword" name="rePayPassword" type="password" class="form-control" placeholder="请确认新支付密码"/>
             	<p id="rePayPasswordText" style="font-size:12px;color:#ff352b;">
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
