<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>公益金融</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="/jsp/pc/pc_include.jsp" flush="true"></jsp:include>
<script src="<%=request.getContextPath() %>/pcjs/pc/publicFinance.js"></script>
<script type="text/javascript">
$(document).ready(function(e) {
	locationIndex(tabView.commonwealTabView);//导航栏定位
});
</script>
<style type="text/css">
.u-arrow {
        display: inline-block;
        width: 17px;
        height: 17px;
        border-top: 1px solid #999;
        border-right: 1px solid #999;
    }

    .u-arrow-up {
        transform: rotate(-45deg);
    }

    .u-arrow-down {
        transform: rotate(135deg);
    }

    .u-arrow-left {
        transform: rotate(-135deg);
    }

    .u-arrow-right {
        transform: rotate(45deg);
    }
</style>
</head>

<body>
	<!-----头部start------>
	<jsp:include page="/jsp/pc/top_include.jsp" flush="true"></jsp:include>
	<!-----头部end---------->

	<!------公益金融start--------->
<div class="pf_main">
	<div style="background-color: #ffe4ae;height: 70px;"></div>
    <!-----利率start------>
    <div class="container pf_box" style="margin-top: 0px;">
      <h3 class="pf_box_title2">更多存款利率表</h3>
      <div class="pf_box_mark" style="margin: 20px 0;">&nbsp;</div>
      <table class="table" id="table1">
      	<tr>
      		<td>
	      		<table class="table">
			        <tr><th>存款金额</th><th>存款利率（年）</th></tr>
			        <tr><td>0-5万</td><td>按之前定义的利率表执行</td></tr>
			        <tr><td>5-10万</td><td>4.5</td></tr>
			        <tr><td>10-15万</td><td>4.2</td></tr>
			        <tr><td>15-20万</td><td>3.9</td></tr>
			        <tr><td>20-25万</td><td>3.6</td></tr>
			        <tr><td>25-30万</td><td>3.3</td></tr>
			        <tr><td>30-35万</td><td>3</td></tr>
			        <tr><td>35-40万</td><td>2.925</td></tr>
			        <tr><td>40-45万</td><td>2.85</td></tr>
			        <tr><td>45-50万</td><td>2.775</td></tr>
			        <tr><td>50-60万</td><td>2.7</td></tr>
			        <tr><td>60-70万</td><td>2.625</td></tr>
			        <tr><td>70-80万</td><td>2.55</td></tr>
			        <tr><td>80-90万</td><td>2.475</td></tr>
			        <tr><td>90-100万</td><td>2.4</td></tr>
			        <tr><td>100-300万</td><td>2.325</td></tr>
			        <tr><td>300-500万</td><td>2.25</td></tr>
			        <tr><td>500-600万</td><td>2.175</td></tr>
			    </table>
      		</td>
       		<td>
	      		<table class="table">
			        <tr><th>存款金额</th><th>存款利率（年）</th></tr>
			        <tr><td>600-700万</td><td>2.025</td></tr>
			        <tr><td>700-800万</td><td>1.875</td></tr>
			        <tr><td>800-900万</td><td>1.725</td></tr>
			        <tr><td>900-1000万</td><td>1.575</td></tr>
			        <tr><td>1000-5000万</td><td>1.5</td></tr>
			        <tr><td>5000-10000万</td><td>0.75</td></tr>
			        <tr><td>10000-15000万</td><td>0</td></tr>
			        <tr><td>15000万-2亿</td><td>-0.75</td></tr>
			        <tr><td>2-3亿</td><td>-1.5</td></tr>
			        <tr><td>3-4亿</td><td>-1.575</td></tr>
			        <tr><td>4-5亿</td><td>-1.725</td></tr>
			        <tr><td>5-6亿</td><td>-1.875</td></tr>
			        <tr><td>6-7亿</td><td>-2.025</td></tr>
			        <tr><td>7-8亿</td><td>-2.175</td></tr>
			        <tr><td>8-9亿</td><td>-2.25</td></tr>
			        <tr><td>9-10亿</td><td>-2.325</td></tr>
			        <tr><td>10亿以上</td><td>-2.4</td></tr>
			    </table>
      		</td>
      </tr>
      </table>
      </div>
    <!-----利率end------> 
</div>

	<!-----网站底部start-------->
	<!------网站底部end------->
	<jsp:include page="/index/buttons.do" flush="true"></jsp:include>
	<!-- 登录弹出框start -->
	<jsp:include page="/jsp/pc/login_include.jsp" flush="true"></jsp:include>
	<!--弹出框start -->
</body>
</html>
