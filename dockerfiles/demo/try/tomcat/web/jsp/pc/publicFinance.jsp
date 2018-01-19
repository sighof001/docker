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
  <!-----金达扶贫存款利率及金达扶贫贷款申请的链接start------>
  <div class="pf_top">
	  <div class="pf_buttons">
			<a href="#interest_rate" class="pf_button_right pf_button"></a>
			<a href="<%=request.getContextPath()%>/loanApplication/pcLoanApplicationViewFP.do" class="pf_button_right pf_button"></a>
			<a href="<%=request.getContextPath()%>/fp/pcEntrustFp.do" class="pf_button"></a>
	  </div>
  </div>
  <!-----金达扶贫存款利率及金达扶贫贷款申请的链接end------>
  <div class="gold1"></div>
  <div class="gold2"></div>
  <div class="gold3"></div>
  <div class="gold4"></div>
  <div> 
    <!-----扶贫介绍start------>
    <div class="container pf_box">
      <h3 class="pf_box_title">金达扶贫简介</h3>
      <p>金达投资以普济天下、敢为人先的胸怀和气魄，革命性地提出以金融手段相结合国家意志，通过金融创新，以货币-利率为杠杆，调节各阶层的经济行为，达到缩小贫富差距，逐步共同富裕的目的。</p>
      <p>金达投资依据此理论，制定了金融扶贫方案，可通过国家精准扶贫系统，对目标家庭进行一对一的持续公益扶贫，力争在五年内，不仅使其脱贫，还达至小康水平，真正让贫困家庭祛贫根，奔富路。</p>
    </div>
    <!-----扶贫介绍end------> 
    <!-----计算器start------>
    <div class="container pf_box">
      <h3 class="pf_box_title2">金达扶贫存款计算器</h3>
      <form role="form" class="form-horizontal pf_form">
        <div class=" form-group col-sm-5">
          <label style="line-height:20px;"  class="col-sm-4 control-label">存款金额(元):</label>
          <div class="col-sm-8">
            <input type="number" name='amount' class="form-control"  placeholder="请输入存款金额">
          </div>
        </div>
        <div class="col-sm-2"></div>
        <div class=" form-group col-sm-5">
          <label style="line-height:20px;"  class="col-sm-4 control-label">存款天数(天):</label>
          <div class="col-sm-8">
            <input type="number" name='term' class="form-control" placeholder="请输入存款天数">
          </div>
        </div>
        <div class=" form-group col-sm-6 martop30 pf_count">
          <p>计算结果：<em id="income">0.00</em>元</p>
        </div>
        <div class="col-sm-3"></div>
        <div class=" form-group col-sm-3 martop30 ">
          <input type="button" id="cal" value="计算" class="btn  pf_btn"/>
          <p id="warn" style="color:red;"></p>
        </div>
      </form>
    </div>
    <!-----计算机器end------> 
    <!-----利率start------>
    <div class="container pf_box" id="interest_rate">
      <h3 class="pf_box_title2">金达差异化存款利率标准表</h3>
      <div class="pf_box_mark">(按30天为单位化简)</div>
      <table class="table" id="table1">
      <tr>
      <td><table class="table">
        <tr>
          <th>天数</th>
          <th>本利和（元）</th>
          <th>日利率（%）</th>
        </tr>
        
        <c:forEach items="${rateList}" var="fp" varStatus="i" begin="0" end="11">
         <tr>
         <td>${fp.displayDays }</td>
          <td>${fp.principal }</td>
          <td>${fp.displayRate}</td>
        </tr>
        </c:forEach>
      </table>
      </td>
       <td><table class="table">
        <tr>
          <th>天数</th>
          <th>本利和（元）</th>
          <th>日利率（%）</th>
        </tr>
        
        <c:forEach items="${rateList}" var="fp" varStatus="i" begin="12" end="23">
         <tr>
         <td>${fp.displayDays }</td>
          <td>${fp.principal }</td>
          <td>${fp.displayRate}</td>
          
        </tr>
        </c:forEach>
      </table></td>
      <td>
      <table class="table">
        <tr>
          <th>天数</th>
          <th>本利和（元）</th>
          <th>日利率（%）</th>
        </tr>
        
        <c:forEach items="${rateList}" var="fp" varStatus="i" begin="24" end="35">
         <tr>
         <td>${fp.displayDays }</td>
          <td>${fp.principal }</td>
          <td>${fp.displayRate}</td>
        </tr>
        </c:forEach>
      </table></td>
    <td rowspan="10" style="border-right:none;border-top:none;border-button:none;text-align:center;vertical-align:middle;" id="nextPage"><div class="u-arrow u-arrow-right "></div></td>
      </tr>
      </table>
      <table class="table" id="table2" hidden>
      <tr>
        <td text-align="center;line-height:" rowspan="10" style="border-left:none;border-top:none;border-button:none;text-align:center;vertical-align:middle;" id="prePage"><i class="u-arrow u-arrow-left "></i></td>
      <td><table class="table">
        <tr>
          <th>天数</th>
          <th>本利和（元）</th>
          <th>日利率（%）</th>
        </tr>
        
        <c:forEach items="${rateList}" var="fp" varStatus="i" begin="36" end="45">
         <tr>
         <td>${fp.displayDays }</td>
          <td>${fp.principal }</td>
          <td>${fp.displayRate}</td>
        </tr>
        </c:forEach>
      </table></td>
       <td>
       <table class="table">
        <tr>
          <th>天数</th>
          <th>本利和（元）</th>
          <th>日利率（%）</th>
        </tr>
        
        <c:forEach items="${rateList}" var="fp" varStatus="i" begin="46" end="55">
         <tr>
         <td>${fp.displayDays }</td>
          <td>${fp.principal }</td>
          <td>${fp.displayRate}</td>
          
        </tr>
        </c:forEach>
      </table></td>
      <td><table class="table">
        <tr>
          <th>天数</th>
          <th>本利和（元）</th>
          <th>日利率（%）</th>
        </tr>
        
        <c:forEach items="${rateList}" var="fp" varStatus="i" begin="56" end="65">
         <tr>
         <td>${fp.displayDays }</td>
          <td>${fp.principal }</td>
          <td>${fp.displayRate}</td>
        </tr>
        </c:forEach>
      </table></td>
      </tr>
     
      </table>
      </div>
    <!-----利率end------> 
      <a class="btn pf_btn more_rate" href="<%=request.getContextPath()%>/fp/moreFinance.do">更多利率</a>
  </div>
</div>

<!-------公益金融end--------> 


	<!-----网站底部start-------->
	<!------网站底部end------->
	<jsp:include page="/index/buttons.do" flush="true"></jsp:include>
	<!-- 登录弹出框start -->
	<jsp:include page="/jsp/pc/login_include.jsp" flush="true"></jsp:include>
	<!--弹出框start -->
</body>
</html>
