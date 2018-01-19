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
    <div class="theme-publicfinancebg"></div>
    <!----扶贫利率表start---->
    <div class="theme-title">金达扶贫存款标准利率表</div>
    <div class="theme-con">
      <div class="txtcenter marbt12">（按30天为单位计算）</div>
      <table class="theme-table">
        <tr>
          <th>天数</th>
          <th>本利和(元)</th>
          <th>日利率(%)</th>
        </tr>
        <c:forEach items="${rateList}" var="fp">
         <tr>
          <td>${fp.displayDays }</td>
          <td>${fp.principal }</td>
          <td>${fp.displayRate}
        <%--   <fmt:formatNumber value="${fp.displayRate}" type="number" pattern="0.0000"/> --%>
          </td>
        </tr>
        </c:forEach>
      </table>
    </div>
    <!---扶贫利率表end---->
    <!--扶贫利率计算器弹出框start--->
    <a href="#myPopup" data-rel="popup" data-position="fixed" class="publicpop-wrap icon-calculator"></a>
    <!--弹出窗口start---->
    <div data-role="popup" id="myPopup" data-overlay-theme="b" data-position-to="window" class="popup-wrap" > 
    <a href="#" data-rel="back" class="popup-close ui-btn-right icon-close-1"></a>
      <div class="pop-title">金达扶贫存款计算器</div>
      <div class="pop-con">
        <form>
          <ul class="ul-list">
            <li>
              <p class=" f20 color-lightgray">存款金额(元)</p>
              <input type="number" name='amount' class="inputtxt " />
            </li>
            <li>
              <p class=" f20 color-lightgray">存款天数(天)</p>
              <input type="number" name='term' class="inputtxt"/>
            </li>
            <li>
            <span>收益:</span><span class="color-orange f32 marleft12 income"></span>
            </li>
            <li>
              <p class=" f20 color-lightgray error"></p>
            </li>
            <li>
              <input type="button" value="计算一下" class="ok btn"  data-role="none"/>
            </li>
          
          </ul>
        </form>
      </div>
    </div>
    <!----弹出窗口end----->
    <!--扶贫利率计算器弹出框end--->
  </div>

<!---内容end--->
</div>
</body>
</html>
