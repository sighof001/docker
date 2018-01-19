<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>投资计算器</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<style type="text/css">
.error{color: red;}
.mb30{margin-bottom: 30px;}
</style>
<script src="<%=request.getContextPath() %>/js/mobile/tool/toolMain.js"></script>
</head>

<body>
<div data-role="page" class="page"  data-theme="i"> 
  <!-----header start----->
  <div data-role="header" data-position="fixed" class="inside-header"> <a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
    <h1>投资计算器</h1>
    <!-- <a href="###" class="btnwordwhite btnnobg icon-news"  rel="external"></a> -->
     </div>
  <!-----header end----->
  <div class="inside-main"> 
  <div class="wrap">
   <form>
   <ul class="ul-formlist form-list">
   <li><label>委托金额</label><input type="number" name="amount" value="10000" class="inputtxt inputtxt2 calc" placeholder="请输入委托金额" data-role="none"/></li>
   <li>
   <fieldset data-role="fieldcontain"  class="icon-downarrow-2">
   <label for="licaitype">选择产品</label>
   <select name="goodsId" >
   <c:forEach items="${goodsList}" var="item">
   		<option value="${item.id}" rate='${item.rate }' type='${item.goodsType }' term='${item.term }'>${item.goodsName }</option>
   </c:forEach>
   </select>
   </fieldset>
   </li>
   <li><label>委托期限</label><input type="number" name="term" class="inputtxt inputtxt2 calc" placeholder="请输入委托期限（天）" data-role="none"/></li>
   <li><label>预期收益</label><div class="inputtxt inputtxt2"><span class="form-span f36 color-orange income">0.00</span>元</div></li>
   </ul>
   <input type="button"  class="btn btn-submit2 ok" value="马上委托" data-role="none"/>
   <div class="mb30 error"></div>
   </form>
   <div class="income-mark">
   <div class="income-mark-title">个人委托投资收益说明</div>
   <table class="income-table">
	<tr>
		<th>产品名称</th>
		<th>期限</th>
		<th>年化收益率(%)</th>
		<%--
		<th>收益说明</th> 
		--%>
	</tr>
	<c:forEach items="${goodsList }" var="item">
   	<tr>
   	   <td>${item.goodsName}</td>
	   <td>${item.termStr}</td>
	   <td>${item.rateStr }</td>
	   <%-- 
	   <td>${item.description}</td>
	   --%>
   	</tr>
   	</c:forEach>
   </table>
   </div>
   </div>
    
  </div>
  <!--底部start--->
 <jsp:include page="/jsp/mobile/buttons.jsp" flush="true"></jsp:include>
  <!---底部end--> 
</div>
</body>
</html>
