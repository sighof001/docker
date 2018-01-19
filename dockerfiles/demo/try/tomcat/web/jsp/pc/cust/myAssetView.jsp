<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>个人中心</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="/jsp/pc/pc_include.jsp" flush="true"></jsp:include>
<script src="<%=request.getContextPath() %>/pcjs/pc/cust/myAssetView.js"></script>

</head>

<body>
<!-----头部start------>
<jsp:include page="/jsp/pc/top_include.jsp" flush="true"></jsp:include>
<!-----头部end----------> 
<!------start--------->
<div class="container martop30 ">
  <div class="row">
    <!--------个人中心左侧start----->
   <jsp:include page="/myView/pcAssetLeftView.do" flush="true"></jsp:include>
    <!-----个人中心左侧end--------> 
    <div class="content">
    <div class="col-sm-9 personal_right ">
      <div class="personal_rightHead bgwhite">
        <div class="personal_rightHead_top clearfix">
    <%--     <input type="hidden" value="${trigger}" id="forTrigger"> --%>
          <div class="pull-left">总资产:<em>${assetAmount + custInfo.custAmount}<i>元</i></em></div>
          <div class="pull-right">
          	<a href="<%=request.getContextPath() %>/order/pcRechargeEdit.do" class="recharge_btn">充值</a>
          	<a class="cash_btn">提现申请</a>
          </div>
        </div>
        <table class="personal_rightTable">
          <tr>
            <td><p>总收益</p>
              <p>${total }<em>元</em></p></td>
            <%-- <td><p>委托${stats.orderNum }笔</p>
              <p>${stats.totalAmount }<em>元</em></p></td> --%>
              <td><p>资产总额</p>
              	  <p>${assetAmount }<em>元</em></p>
              </td>
            <td><a id="myRunningAccount"><p>可用余额</p>
              <p>${custInfo.custAmount }<em>元</em></p></a></td>
          </tr>
        </table>
      </div>
      <div class="personal_rightBottom martop30 bgwhite"> 
        
        <div class="recommended_head">为你推荐</div>
        
        <c:forEach items="${tryGoods}" var="goods">
         <div class="recommended_wrap">
          <div class="panel panel-default ">
            <div class="panel-heading">
              <h2 class="panel-title"> ${goods.goodsName } </h2>
            </div>
            <div class="panel-body ">
              <div class="row entrust_con">
                <div class="col-sm-3 bigdta_wrap">
                  <p class="bigdata"><fmt:formatNumber value="${goods.rate*100}" pattern="#" type="number"/><em>%</em></p>
                  <p>年化收益率</p>
                </div>
                <div class="col-sm-2">
                <c:if test="${goods.term != 0}">
			     	<p>${goods.term}天</p>
			    </c:if>
                <c:if test="${goods.term == 0}">
			     	<p>随时取</p>
			    </c:if>
                  <p>委托期限</p>
                </div>
                <div class="col-sm-2">
                <c:if test="${goods.term != 0}">
		     		<p>按月返息</p>
		     	</c:if>
			    <c:if test="${goods.term == 0}">
		     		<p>按日返息</p>
		     	</c:if>
                  <p>返息方式</p>
                </div>
                <div class="col-sm-2">
                  <p><fmt:formatNumber value="${goods.rate*10000}" pattern="#.00" type="number"/>元</p>
                  <p>万元年收益</p>
                </div>
                <div class="col-sm-3"> <a onClick="window.location.href='<%=request.getContextPath() %>/webEntrust/pcEntrustDetail/${goods.id }.do'" class="customize_btn">立即委托</a> </div>
              </div>
            </div>
            <div class="panel-footer">保障方式：保险本息全额承保</div>
          </div>
        </div>
        </c:forEach>
         
      </div>
    </div>
    </div>
    
  </div>
</div>
<!-------end--------> 


<!-----网站底部start-------->
<jsp:include page="/index/buttons.do" flush="true"></jsp:include>
<!------网站底部end------->
<!-- 登录弹出框start -->
<jsp:include page="/jsp/pc/login_include.jsp" flush="true"></jsp:include>
<!--弹出框start -->
</body>
</html>
