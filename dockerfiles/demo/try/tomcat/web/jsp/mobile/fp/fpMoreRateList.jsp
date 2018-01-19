<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>公益金融</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<style type="text/css">
.error{color: red;}
</style>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/mobile/fp/fpRateList.js"></script>
</head>

<body>
<div data-role="page" class="page bgwhite"  data-theme="i"> 
  <!-----header start----->
  <div data-role="header" data-position="fixed" class="inside-header"> <a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
    <h1>公益金融</h1>
    <!-- <a href="###" class="btnwordwhite btnnobg icon-news"  rel="external"></a> -->
     </div>
  <!-----header end----> 
  <!---内容start--->
  <div class="theme-wrap">
    <div class="more" style="height:1.7rem"></div>
    <!----扶贫利率表start---->
    <div class="theme-title" style="top:1.3rem;">更多存款利率表</div>
    <div class="theme-con">
      <div class="txtcenter marbt12">&nbsp;</div>
      <table class="theme-table">
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
    </div>
    <!---扶贫利率表end---->
  </div>

<!---内容end--->
</div>
</body>
</html>
