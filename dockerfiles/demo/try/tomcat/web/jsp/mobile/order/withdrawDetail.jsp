<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>提现详情</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/mobile/order/withdrawDetail.js"></script>
</head>
<style>
.enable_icon{
background-color: #ff6d22;

}


</style>

<body>
<div data-role="page" class="page"  data-theme="i"> 

  <!-----header start----->
  <div data-role="header" data-position="fixed" class="inside-header"> <a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
		<h1>提现详情</h1>
     </div>
  <!-----header end---->
  <div class="inside-main"> 
    <!----一个产品信息 start------>
	<div class="inside-list">
		<a class="inside-listcon clearfix">
			<div class="fl list-title">交易编号</div>
			<div class="fr list-info color-grey">${order.id }</div>
		</a>
		<a class="inside-listcon clearfix">
			<div class="fl list-title">交易时间</div>
			<div class="fr list-info color-grey">${order.createTimeStr }</div>
		</a>
		<a class="inside-listcon clearfix">
			<div class="fl list-title">年化收益率</div>
			<div class="fr list-info color-grey">${order.rateText }</div>
		</a>
		<a class="inside-listcon clearfix">
			<div class="fl list-title">审核状态</div>
			<div class="fr list-info color-grey">${order.checkStatusText }</div>
		</a>
		<a class="inside-listcon clearfix">
			<div class="fl list-title">审核时间</div>
			<div class="fr list-info color-grey">${order.checkTimeStr }</div>
		</a>
		<a class="inside-listcon clearfix">
			<div class="fl list-title">审核信息</div>
			<div class="fr list-info color-grey">${order.checkDesc }</div>
		</a>
		
	</div>
	<!-----一个产品信息 end----> 
  </div>
  
  <!----底部start------>

  <!----底部end------> 
</div>
  
</body>
</html>
