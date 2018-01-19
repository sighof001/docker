<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>账户设置</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="/jsp/pc/pc_include.jsp" flush="true"></jsp:include>
<script src="<%=request.getContextPath() %>/pcjs/pc/cust/set.js"></script>
<!--[if lt IE 9]>
<script src="js/html5shiv.min.js"></script>
<script src="js/respond.min.js"></script>
 <![endif]-->
</head>
<body>
<!------个人中心start--------->
    <!-----个人中心左侧end--------> 
    <!------个人中心右侧start-------->
    <div class="content">
    <div class="col-sm-9 personal_right ">
     
      <div class="p_rightBottom p_r_con bgwhite"> 
        <!-------内容start----->
        <div class="title_wrap clearfix">
          <div class="title pull-left">账户设置</div>
        </div>
        <div class="s_tip"><span>安全等级:
        <c:if test="${realAuthStatus==true&&payPwdStatus==true}">
        <em>高</em>
        </c:if>
        <c:if test="${realAuthStatus==false||payPwdStatus==false}">
        <em>中</em>
        </c:if>
        </span> (为了保证账户安全，建议您开启全部安全设置)</div>
        <table class="s_table">
        <tr>
        <th>真实姓名</th>
        <c:if test="${realAuthStatus==false}">
         <td>
        		暂无信息
        </td>
        <td>
        <span><a class="links" url="/myView/pcRealAuth.do">马上认证</a></span></td>
        </c:if>
        <c:if test="${realAuthStatus==true}">
        <td>
        <span>${tryCustInfo.anonymousRealName}</span><span> | </span><span>${tryCustInfo.anonymousIdNumber} </span>
        </td>
        <td>
        <span>已认证</span></td>
        </c:if>
        
        </tr>
         <tr>
        <th>银行卡</th>
        <c:if test="${bindBankCardStatus==false}">
        <td>
        		暂无信息
        </td>
        <td><span><a class="links" url="/bank/pcCardAdd.do">马上绑定</a></span></td>
        </c:if>
        <c:if test="${bindBankCardStatus==true}">
        <td>
        <span>${tryCustInfo.bankName}</span><span> | </span><span>${ tryCustInfo.anonymousCardNumber} </span>
        </td>
        <td><span>
        <c:if test="${isAlreadyOrder==false}">
        <a class="links" url="/bank/pcCardAddAgain.do">修改绑定</a>
        </c:if>
        <c:if test="${isAlreadyOrder==true}">
      		  进行交易后,不能修改绑定
        </c:if>
        </span></td>
        </c:if>
        </tr>
         <tr>
        <th>手机</th>
        <td>
        <span>${ tryCustInfo.anonymousMobile}</span>
        </td>
        <td><span><a class="links" url="/myAccountPwd/pcCustMobileUpdate.do">修改</a></span></td>
        </tr>
         <tr>
        <th>登录密码</th>
        <td>
        <span>登录金达投融易时需要输入的密码 </span>
        </td>
        <td><span><a class="links" url="/myAccountPwd/pcCustPwdUpdate.do">修改</a></span></td>
        </tr>
        <tr>
        <th>支付密码</th>
        <td>
        <span>在账户资金变动，需要输入的密码 </span>
        </td>
        <c:if test="${payPwdStatus==true}">
        <td>
        <span><a class="links" url="/myAccountPwd/pcCustPayPwdUpdate.do">修改&nbsp;&nbsp;&nbsp;&nbsp;</a></span>
        <span><a class="links" url="/myAccountPwd/pcCustPayPwdForget.do">忘记密码</a></span>
        </td>
        
        </c:if>
        <c:if test="${payPwdStatus==false}">
        <td><span><a class="links" url="/myAccountPwd/pcCustSetPayPwd.do">设置</a></span></td>
        </c:if>
        </tr>
          <tr>
        <th>绑定邮箱</th>
        
        <c:if test="${bindEmailStatus==true}">
        <td>
        <span>${tryCustInfo.anonymousEmail} </span>
        </td>
        <td><span><a class="links" url="/myAccountPwd/pcCustBindEmail.do" >重新绑定</a></span></td>
        </c:if>
        <c:if test="${bindEmailStatus==false }">
        <td>
        <span>获取账户资金变动通知 </span>
        </td>
        <td><span><a class="links" url="/myAccountPwd/pcCustBindEmail.do" >马上绑定</a></span></td>
        </c:if>
        </tr>
        <%--   <tr>
        <th>设置头像</th>
        <td>
        <span>个性化提高识别度 </span>
        </td>
        <c:if test="${tryCustInfo.headerImage==null}">
        <td><span><a class="links" url="/personal/pcHeadImage.do">设置</a></span></td>
        </c:if>
        <c:if test="${tryCustInfo.headerImage!=null}">
        <td><span><a class="links" url="/personal/pcHeadImage.do">修改头像</a></span></td>
        </c:if>
        
        </tr> --%>
        </table>
      
        <!-------内容end------> 
        
      </div>
    </div>
    </div>
    <!-------个人中心右侧end------> 
  </div>
</div>
<!-------个人中心end--------> 
</body>
</html>
