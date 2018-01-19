<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="utf-8">
<title>贷款申请</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/mobile/loan/loanApplication.js"></script>
<script>
$(document).on("pagecreate","#pageone",function(){
  tab(".tab_content",".tab_item",".selectNavUl","tabNavOn");                     
});
</script>
</head>

<body>
<div data-role="page" id="pageone" class="page"  data-theme="i"> 
  <!-----header start----->
  <div data-role="header" data-position="fixed" class="inside-header"> <a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
    <h1>贷款申请</h1>
     </div>
   <!-----header end----->
  <div class="inside-main"> 
    <div class="selectNavUl ui-grid-a clearfix">
    <li class="ui-block-a tabNavOn" >个人贷款申请</li>
    <li class="ui-block-b" >企业贷款申请</li>
    </div>
  <div class="wrap tab_content">
  <!-------个人贷款申请start---->
  <div class="tab_item">
  <form id="person_form">
   <input id="loanType" type="hidden" name="loanType" value="1"/>
   <ul class="ul-formlist form-list">
   <li>
   		<label>贷款城市</label>
   		<input type="text" id="txt_city"  placeholder="目前开放广州的借贷业务" disabled="disabled"  class="citytxt"  data-role="none"/>
		<input type="hidden" id="hd_city"  data-role="none"/>
   </li>
  
   <li>
	   <label>姓名</label>
	   <input type="text"  id="name" name="name" class="inputtxt inputtxt2" placeholder="请输入姓名"  data-role="none" value="${currentUser.realName }"/>
	   <%-- <input type="hidden" id="name" name="name" value="${currentUser.realName }"/> --%>
	   <div id="nameText" class="pop_tip">
	      <p></p>
	      <p class="pop_tip_arrow">&diams;</p>
	    </div>
   </li>
   
   <li>
   <fieldset data-role="fieldcontain"  class="icon-downarrow-2">
   <label>年龄</label>
   <select id="age" name="age">
	   <c:forEach items="${ageRange }" var="age">
	   		<option value="${age.dictValue}">${ age.text}</option>
	   </c:forEach>
   </select>
   </fieldset>
   </li>
   
   <li>
	   <label>联系电话</label>
	   <input type="tel" id="tel" name="tel" class="inputtxt inputtxt2" placeholder="请输入联系电话" data-role="none" value="${currentUser.mobile }" disabled="disabled"/>
	   <input type="hidden" id="person_tel" name="tel" value="${currentUser.mobile }"/>
	      <div id="telText" class="pop_tip">
	      <p></p>
	      <p class="pop_tip_arrow">&diams;</p>
   </li>
   
    <li>
	   <fieldset data-role="fieldcontain" class="icon-downarrow-2" >
	   <label>您的职业</label>
	   <select id="job" name="job">
	   		<c:forEach items="${ jobType}" var="job">
	   			<option value="${job.dictValue}">${ job.text}</option>
	   		</c:forEach>
	   </select>
	   </fieldset>
   </li>
   
   
    <li>
    	<label>身份证地址</label>
    	<input type="text" id="idAddress" name="idAddress"  placeholder="请输入身份证地址"  class="citytxt"  data-role="none"/>
		<div id="idAddressText" class="pop_tip">
	      <p></p>
	      <p class="pop_tip_arrow">&diams;</p>
	    </div>
    </li>
     
    <li>
    	<label>现居住地址</label>
    	<input type="text" id="nowAddress" name="nowAddress"  placeholder="请输入现居住地址"  class="citytxt"  data-role="none"/>
		<div id="nowAddressText" class="pop_tip">
	      <p></p>
	      <p class="pop_tip_arrow">&diams;</p>
	    </div>
    </li>
    
    <li>
	   <fieldset data-role="fieldcontain"  class="icon-downarrow-2">
	   <label>借款用途</label>
	   <select id="loanUse" name="loanUse">
	   		<c:forEach items="${loanUseType }" var="loan">
	   			<option value="${loan.dictValue}">${loan.text}</option>
	   		</c:forEach>
	   </select>
	   </fieldset>
   </li>
    
     <li>
     	<label>拟借金额</label>
     	<input type="text"  id="person_amount" name="amount"  placeholder="请输入拟借金额(单位:元)"  class="inputtxt"  data-role="none"/>
     	<div id="person_amountText" class="pop_tip">
	      <p></p>
	      <p class="pop_tip_arrow">&diams;</p>
	    </div>
     </li>
     
   	<li>
     	<label>借款期限</label>
     	<input type="text" id="person_loanTerm" name="loanTerm"  placeholder="请输入借款期限(单位:天)"  class="inputtxt"  data-role="none"/>
     	<div id="person_loanTermText" class="pop_tip">
	      <p></p>
	      <p class="pop_tip_arrow">&diams;</p>
	    </div>
     </li>
   
   <li>
	   <fieldset data-role="fieldcontain"  class="icon-downarrow-2">
	   <label>还款来源</label>
	   <select id="person_repaymentSource" name="repaymentSource">
	   		<c:forEach items="${repaymentSourceType}" var="source">
	   			<option value="${source.dictValue}">${source.text}</option>
	   		</c:forEach>
	   </select>
	   </fieldset>
   </li>
   
   	<li>
     	<label>验证码</label>
     	<input type="text" id="person_checkCode" name="checkCode"  placeholder="请输入验证码"  class="inputtxt"  data-role="none"/>
     	<img src= "<%=request.getContextPath() %>/login/getCode.do?imgHeight=88&imgWidth=30&codeLen=4" id="checkCodeImg" onclick="changeImg(this);"  class="getvalid"/>
     	
     	<div id="person_checkCodeText" class="pop_tip">
	      <p></p>
	      <p class="pop_tip_arrow">&diams;</p>
	    </div>
     </li>
   </ul>
   <input type="button"  class="btn" id="person_submit"  data-role="none" value="提交申请"/>
   </form>
  </div>
  <!------个人贷款申请end----->
  
  
  <!--------企业贷款申请start------->
  <div class="tab_item">
  <form id="enterprise_form">
   <input id="loanType" type="hidden" name="loanType" value="2"/>
   <ul class="ul-formlist form-list">
   <li>
   		<label>贷款城市</label>
   		<input type="text" id="txt_city"  placeholder="目前开放广州的借贷业务" disabled="disabled"  class="citytxt"  data-role="none"/>
		<input type="hidden" id="hd_city"  data-role="none"/>
   </li>
  
   <li>
	   <label>企业名称</label>
	   <input type="text" name="companyName" id="companyName" class="inputtxt inputtxt2" placeholder="请输入企业名称" data-role="none" />
	   <div id="companyNameText" class="pop_tip">
	      <p></p>
	      <p class="pop_tip_arrow">&diams;</p>
	    </div>
   </li> 
     <li>
	   <label>姓名</label>
	   <input type="text"  id="nameCompany" name="name" class="inputtxt inputtxt2" placeholder="请输入姓名"  data-role="none" value="${currentUser.realName}"/>
	   <div id="nameCompanyText" class="pop_tip">
	      <p></p>
	      <p class="pop_tip_arrow">&diams;</p>
	    </div>
   </li>
   <li>
   		<label>联系电话</label>
   		<input type="tel" id="telCompany" name="tel" class="inputtxt inputtxt2" placeholder="请输入联系电话" data-role="none" value="${currentUser.mobile }" disabled="disabled"/>
   		<input type="hidden" id="enterprise_tel" name="tel" value="${currentUser.mobile }"/>
   		<div id="telCompanyText" class="pop_tip">
	      <p></p>
	      <p class="pop_tip_arrow">&diams;</p>
   </li>
   
   
   <li>
	   <fieldset data-role="fieldcontain"  class="icon-downarrow-2">
	   <label>行业</label>
	   <select id="industry" name="industry">
		   <c:forEach items="${industryType }" var="industry">
		   		<option value="${industry.dictValue}">${industry.text}</option>
		   </c:forEach>
   	   </select>
   	   </fieldset>
   </li>
   
   
    <li>
    	<label>注册地址</label>
    	<input type="text" name="registerAddress" id="registerAddress"  placeholder="请输入注册地址"  class="citytxt"  data-role="none"/>
		<div id="registerAddressText" class="pop_tip">
	      <p></p>
	      <p class="pop_tip_arrow">&diams;</p>
	    </div>
    </li>
     
    <li>
    	<label>办公地址</label>
    	<input type="text" id="officeAddress" name="officeAddress"  placeholder="请输入办公地址"  class="citytxt"  data-role="none"/>
		<div id="officeAddressText" class="pop_tip">
	      <p></p>
	      <p class="pop_tip_arrow">&diams;</p>
	    </div>
    </li>
    
    <li>
	   <fieldset data-role="fieldcontain" class="icon-downarrow-2" >
	   <label>成立年限</label>
	   <select id="years" name="years">
		   <c:forEach items="${yearsType }" var="years">
		   		<option value="${years.dictValue}">${years.text}</option>
		   </c:forEach>
	   </select>
	   </fieldset>
   </li>
   
   
    <li>
    	<label>拟借金额</label>
    	<input type="number" id="enterprise_amount" name="amount"  placeholder="请输入拟借金额(单位:元)"  class="inputtxt"  data-role="none"/>
    	<div id="enterprise_amountText" class="pop_tip">
	      <p></p>
	      <p class="pop_tip_arrow">&diams;</p>
	    </div>
    </li>
    
   <li>
	   <fieldset data-role="fieldcontain"  class="icon-downarrow-2">
	   <label>借款用途</label>
	   <select id="loanUse" name="loanUse">
	   		<c:forEach items="${loanUseType }" var="loan">
	   			<option value="${loan.dictValue}">${loan.text}</option>
	   		</c:forEach>
	   </select>
	   </fieldset>
   </li>
   
   <li>
     	<label>借款期限</label>
     	<input type="number" id="enterprise_loanTerm" name="loanTerm"  placeholder="请输入借款期限(单位:天)"  class="inputtxt"  data-role="none"/>
     	<div id="enterprise_loanTermText" class="pop_tip">
	      <p></p>
	      <p class="pop_tip_arrow">&diams;</p>
	    </div>
     </li>
   
   
   <li>
	   <fieldset data-role="fieldcontain"  class="icon-downarrow-2">
	   <label>还款来源</label>
	   <select id="enterprise_repaymentSource" name="repaymentSource">
	   		<c:forEach items="${repaymentSourceType}" var="source">
	   			<option value="${source.dictValue}">${source.text}</option>
	   		</c:forEach>
	   </select>
	   </fieldset>
   </li>
   
   <li>
     	<label>验证码</label>
     	<input type="text" id="enterprise_checkCode" name="checkCode"  placeholder="请输入验证码"  class="inputtxt"  data-role="none"/>
     	<img src= "<%=request.getContextPath() %>/login/getCode.do?imgHeight=88&imgWidth=30&codeLen=4" id="enterprise_checkCodeImg" onclick="changeImg(this);"  class="getvalid"/>
     	<div id="enterprise_checkCodeText" class="pop_tip">
	      <p></p>
	      <p class="pop_tip_arrow">&diams;</p>
	    </div>
     </li>
  
   </ul>
   <input type="button" id="enterprise_submit"  class="btn" data-role="none" value="提交申请"/>
   </form>
  </div>
  <!--------企业贷款申请end-------->
   </div>
    
  </div>
</div>
  
</body>
<!-- <script>
		var selectArea = new MobileSelectArea();
		selectArea.init({ trigger: '#txt_city', value: $('#hd_city').val(), data: json,position: "bottom"});
		var selectArea1 = new MobileSelectArea();
		selectArea1.init({ trigger: '#txt_city1', value: $('#hd_city1').val(), data: json,position: "bottom"});
		var selectArea2 = new MobileSelectArea();
		selectArea2.init({ trigger: '#txt_city2', value: $('#hd_city2').val(), data: json,position: "bottom"});
	</script> -->
</html>
