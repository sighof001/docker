<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>转出</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/mobile/entrust/extract.js"></script>
<script type="text/javascript">
var amount = "${asset.amount}";
var goodsType = "${asset.goodsType}";
var assertTerm = "${asset.term}"
var isAssertNow = "${timeout}"
</script>

</head>

<body>
<div data-role="page" class="page"  data-theme="i"> 
  <!-----header start----->
  <div data-role="header" data-position="fixed" class="inside-header"> <a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
    <h1>转出</h1>
    <a href="###" class="btnwordwhite btnnobg f24"  rel="external"></a> </div>
  <!-----header end----> 
  <!---委托信息start--->
  <div class="inside-main">
    <div class="wrap">
      <form>
      
         
         
      
        <ul class="form-list takeout-list">
        <div>  
        <c:if test="${asset.term == '0'}">
        	<li class="takeout-list-tip">可取${asset.amount }元至余额，当前帐户余额${custInfo.custAmount}元</li>
       	</c:if>
        </div>
          <input type="hidden" id="custAmount" value="${custInfo.custAmount }"/>
          <li>
            <label >￥(元)</label>
            <input type="text" data-role="none" id="number" class="inputtxt" value="${earningsVo.entrustAmount }" placeholder="请输入委托金额"/>
            <input type="hidden" data-role="none" id="oldNumber" value="${asset.amount }"/>
            <input type="button" value="全部转出" class="getvalid" data-role="none"/>
            <input type="hidden" id="assetId" value="${asset.id }">
          </li>
          <li>
            <label >支付密码</label>
            <input  type="password" id="password" data-role="none" class="inputtxt" placeholder="请输入支付密码"/>
          </li>
          <div>
          	<span id="errorInfo" style="color:red;display: none;"></span>
          </div>
          
          <c:if test="${asset.term != '0'}">
	          <div>
	          	</br></br>
	         	<strong style="color: red">温馨提示</strong>: </br>
	         	     提前终止将按活期<strong><fmt:formatNumber value="${currentRate*100}" pattern="#.00" type="number"/>%</strong>年化收益计息</br>
	         	     实际可得收益<strong>${earningsVo.earnings}</strong>元,比原定委托少收益<strong>${earningsVo.less }</strong>元</br>
	         	     目前已得收益<strong>${earningsVo.earningsAlready}</strong>元 ,利息差额为<strong>${earningsVo.interestMargin }</strong>元</br>
	         	  <c:if test="${asset.interestDay < asset.term && order.policyFlag}">
	    				由于您未按到期时间转出需加收<strong id="poundageRate">${earningsVo.poundageRate }</strong>手续费</br>
	    				扣除手续费为<strong id="poundage">${earningsVo.poundage }</strong>元</br>
	    		  </c:if>
	         	    可提金额为<strong id="entrustAmount">${earningsVo.entrustAmount }</strong>元</br>
	         </div>
         </c:if>
        </ul>
        <input class="btn-submit2 bgorange" type="button" data-role="none" value="转出"  onClick="extract();" />
      </form>
    </div>
  </div>
  <!---委托信息end---> 
</div>
</body>
</html>
