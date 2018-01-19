<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>基本资料</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="/jsp/pc/pc_include.jsp" flush="true"></jsp:include>
<script src="<%=request.getContextPath() %>/pcjs/pc/cust/custBaseInfo.js"></script>
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
      <div class="title_wrap clearfix">
          <div class="title pull-left">基本资料</div>
        </div>
        <div class="s_tip"><span>
        </span>为了保证账户安全，建议您完善所有资料</div>
        <!-------内容start----->
        <table class="s_table">
         <tr>
        <th>邮寄地址</th>
        <c:if test="${ tryCustInfo.mailAddress==null ||tryCustInfo.mailAddress == ''}">
        <td>
         	暂无
         </td>
         <td>
           <span><a class="links" url="/personal/pcCustMailAddressUpdate.do">马上设置</a></span>
         </td>
        </c:if>
        <c:if test="${tryCustInfo.mailAddress!=null&&tryCustInfo.mailAddress != ''}">
        <td>
        <span>${ tryCustInfo.mailAddressStr}</span>
         </td>
         <td>
        <span><a class="links" url="/personal/pcCustMailAddressUpdate.do">修改</a></span>
        </td>
        </c:if>
        </tr>
           <tr>
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
        </tr>
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
