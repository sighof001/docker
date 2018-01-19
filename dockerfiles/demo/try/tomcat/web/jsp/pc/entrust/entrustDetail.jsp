<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>委托投资详情</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="/jsp/pc/pc_include.jsp" flush="true"></jsp:include>
<script type="text/javascript" src="<%=request.getContextPath()%>/pcjs/pc/entrust/entrustDetails.js"></script>
<script>
$(document).ready(function(e) {
	 tab(".tab_content",".tab_item",".tabsNavUl ","tabNavOn");
	 locationIndex(tabView.productsTabView);//导航定位
});
</script>
<style>
.disabled_icon{
background-color: gray;

}
</style>
</head>

<body>
<!-----头部start------>
<jsp:include page="/jsp/pc/top_include.jsp" flush="true"></jsp:include>
<!-----头部end----------> 
<!-----产品详情start-------->
<div class="container martop30 bgwhite">
  <div class="row">
    <div class="col-sm-8 entrustdetail_left">
      <div class="row">
      	<input type="hidden" id="goodsId" name="goodsId" value="${goods.id}"/>
        <div class="col-sm-12 entrustdetail_name"><span>${goods.goodsName}</span></div>
        
        <c:if test="${!goods.fp}">
       		<div class="col-sm-4 entrustdetail_income">
       			<p><fmt:formatNumber value="${goods.rate*100}" pattern="#" type="number"/><em>%</em></p>
       			<input id="rate" name="rate" type="hidden" value="${goods.rate}">
       			<p>年化收益率</p>
        	</div>
        </c:if>
        <c:if test="${goods.fp}">
       		<div class="col-sm-4 entrustdetail_time">
          		<p><em><a href='<%=request.getContextPath()%>/fp/publicFinance.do' target="_blank">查看收益率</a></em></p>
          		<p>收益率</p>
       		</div>
        </c:if>
        
        <div class="col-sm-4 entrustdetail_time">
          <p>${goods.term}<em>天</em></p>
          <input id="term" name="term" type="hidden" value="${goods.term}">
          <p>委托期限</p>
        </div>
        <div class="col-sm-4 entrustdetail_moneystart">
          <p id="startAmount">${goods.startAmount}<em>元</em></p>
          <p>起购金额</p>
        </div>
        <div class="col-sm-12 borderbtline mar10"></div>
        <div class="col-sm-6">返息方式：<span>${goods.payInterestTypeStr}</span></div>
        <!-- <div class="col-sm-6">回款方式：<span>先息后本</span></div> -->
        <div class="col-sm-6">委托合同：<a href="<%=request.getContextPath()%>/doc/2016newEntust.docx">点击下载</a></div>
        <div class="col-sm-6">保障方式：<span>保险本息全额承保</span></div>
        <!-- <div class="col-sm-6">起息方式：<span>15点前到账当天计息</span></div> -->
        <div class="col-sm-6">保单模板：<a href="<%=request.getContextPath()%>/doc/templet.zip">点击下载</a></div>
      </div>
    </div>
    <div class="col-sm-4 entrustdetail_right">
      <div class="row">
        <div class="col-sm-12 entrustdetail_righttitle">购买金额（元）</div>
        <div class="col-sm-12">
          <p class=" colorlightgrey">按<em id="increaseAmount">${goods.increaseAmount }</em>元递增递减</p>
          <p class="clearfix">
            <input type="button" id="minus" value="&#8722;" class="btn_minus disabled_icon"/>
            <input type="number" id="money" class="entrust_buytxt" value="${goods.startAmount}"/>
            <input type="button" id="add" value="&#43;" class="btn_add"/>
          </p>
        </div>
        <div class="col-sm-12 entrustdetail_buyinfo">
          <p>账户余额：<span id="amount">${custInfo.custAmount}元</span></p>
          <input type="hidden" value="${custInfo.bindPayPwd}" id="bindPayPwd">
          <input type="hidden" value="${custInfo.isRealAuth}" id="isRealAuth">
          <input type="hidden" value="${custInfo.bindBankinfo}" id="bindBankinfo">
         	<c:if test="${!goods.current && !goods.fp}">
         		<p>预计到期收益：<span class="colororange receipts"  goodsId='${goods.id }'></span></p>
         	</c:if>
          
        </div>
        <div>
          <input type="button" id="btn-submit"  value="立即委托" class=" btn  orange_btn" />
        </div>
      </div>
    </div>
  </div>
</div>

<!----产品详情底部start------->
<div class="container martop30  bgwhite prodetail_bottomwrap">
  <ul class="synewsNavUl tabsNavUl prodetailNavUl clearfix">
    <li class="tabNavOn">产品信息</li>
    <!-- <li>安全保障</li> -->
    <li>购买记录</li>
  </ul>
  <div class="prodetail_content tab_content ">
    <div class="synews_item tab_item">
      <p>${goods.description }</p>
    </div>
    <!-- 
    <div class="synews_item tab_item">
      <p>安全保障内容</p>
    </div>
     -->
    <div class="synews_item tab_item">
      <table class="table prodetail_table">
        <tr>
          <th>购买人</th>
          <th>购买金额</th>
          <th>购买时间</th>
        </tr>
        <c:forEach items="${tryOrderOrderByAmount }" var="tryOrder" begin="0" end="3">
        	<tr>
		          <td>${tryOrder.anonymousCreateUserId}</td>
		          <td>${tryOrder.amount}元</td>
		          <td>${tryOrder.createTimeStr}</td>
        	</tr>
        </c:forEach>
      </table>
    </div>
  </div>
</div>
<!-----产品详情底部end------> 
<!------产品详情end-------> 

<!-----网站底部start-------->
<jsp:include page="/index/buttons.do" flush="true"></jsp:include>
<!------网站底部end------->
<!-- 登录弹出框start -->
<jsp:include page="/jsp/pc/login_include.jsp" flush="true"></jsp:include>
<!--弹出框start -->

 <!-- 提前转出弹出框start -->
<div class="modal fade loginmodal t_modal" id="transfer_pop" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
      <h4 class="modal-title" id="myModalLabel">委托确认</h4>
    </div>
    <div class="modal-body">
    <table class="table r_table">
	    <tr>
	    	<th>委托项目</th>
	    	<th>委托本金(元)</th>
	    	<th>年化收益</th>
	    	<th>每万元年收益(元)</th>
	    </tr>
	    <tr>
		    <td>${goods.goodsName }</td>
		    <td id="td_money"> 元</td>
		    <c:if test="${!goods.fp}">
		    	<td><fmt:formatNumber value="${goods.rate*100}" pattern="#" type="number"/> %</td>
		    </c:if>
		    <c:if test="${goods.fp}">
		    	<td>--</td>
		    </c:if>
		    <c:if test="${!goods.fp}">
		    	 <td id="td_receipts"></td>
		    </c:if>
		    <c:if test="${goods.fp}">
		    	<td>--</td>
		    </c:if>
	    </tr>
    </table>
    <div class="alert alert-warning">
    <p>支付金额:<strong id="str_money"></strong></p>
    </div>
   <form role="form" class="form-inline">
	   <label for="paypwd" class="control-label">支付密码：</label><input  type="password" class="form-control w360" id="payPassword" placeholder="请输入支付密码">
	   <div class="form-group"><a href="<%=request.getContextPath()%>/myView/pcMyAssetView.do?menuId=mySet">忘记密码？</a></div>
	   <div> 
	    <button type="button" id="entrust_submit" class="btn btn-default btnorange">确认</button>
	   </div>
   </form>
    </div>
  </div>
  <!-- /.modal-content --> 
  </div>
</div>
<!--提前转出弹出框end -->
</body>
</html>
