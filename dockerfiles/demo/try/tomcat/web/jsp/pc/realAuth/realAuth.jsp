<%@ page language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>实名认证</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="/jsp/pc/pc_include.jsp" flush="true"></jsp:include>
<!--引入JS-->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/pcjs/webuploader.min.js"></script>
<script src="<%=request.getContextPath() %>/pcjs/pc/realAuth/realAuth.js"></script>
<!--[if lt IE 9]>
<script src="js/html5shiv.min.js"></script>
<script src="js/respond.min.js"></script>
 <![endif]-->
<style type="text/css">
.div_img{width: 160px;height: 160px;}
</style>
</head>

<body>
    <div class="col-sm-9 personal_right ">
      <div class="p_r_con bgwhite">
        <div class="p_r_con_title">
          <h3>实名认证</h3>
          <p class="lead">完善实名认证后，即可进行操作</p>
        </div>
        <!----表单start---------->
        <form class="form-horizontal r_form" role="form" id="form">
       	 <input id="id" name="id" type="hidden" value="${tryCustInfo.id}">
          <div class="form-group">
            <label class="col-sm-2 control-label">真实姓名：</label>
            <div class="col-sm-10">
              <input id="realName" name="realName" type="text" class="form-control" placeholder="请输入真实姓名"/>
              <p id="realNameText" style="font-size:12px;color:#ff352b;">
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">身份证号：</label>
            <div class="col-sm-10">
              <input id="idCard" name="idCard" type="text" class="form-control" placeholder="请输入身份证号"/>
                 <p id="idCardText" style="font-size:12px;color:#ff352b;">
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
             <p id="image1Text" style="font-size:12px;color:#ff352b;">
             <p id="image2Text" style="font-size:12px;color:#ff352b;">
              <p class="colorlightgrey f_tip">请上传身份证扫描件(正反面)或图片，文件大小不能超过1M，格式为png,jpeg,jpg,gif</p>
              <!-- 正面 -->
              <div class="col-sm-6 ID_wrap">
              	<div id="div1" class="div_img">
              		<div class="ID_div">
	                  <p>+</p>
	                </div>
              	</div>
              </div>
              <!-- 反面 -->
              <div class="col-sm-6 ID_wrap">
              	<div id="div2" class="div_img">
              		<div class="ID_div">
	                  <p>+</p>
	                </div>
              	</div>
              </div>
            </div>
            
          </div>
          <div class="form-group ID_btn_wrap">
            <div class="col-sm-offset-3 col-sm-2">
              <input type="button" class="btn  f_btn"  value="提交" id="submit"/>
            </div>
             <div class="col-sm-offset-2 col-sm-2">
              <input type="button" class="btn  f_btn grybtn"  onClick="javascript:history.go(0);"  value="返回"/>
            </div>
          </div>
        </form>
         <!----表单end---------->
      </div>
    </div>
<!-------个人中心end--------> 

</body>
</html>
