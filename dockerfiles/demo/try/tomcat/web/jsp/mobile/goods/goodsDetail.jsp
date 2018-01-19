<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>金达投融易产品展示</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<style type="text/css">
</style>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/mobile/goods/goodsDetail.js"></script>
</head>

<body>
<div data-role="page" class="page"  data-theme="i">
<form name="mainForm" method="post" action="#">
	<input type="hidden" name="id" value="${goods.id}" />
  <!-----header start----->
  <div data-role="header" data-position="fixed" class="inside-header"> <a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
    <h1>${goods.goodsName}</h1>
    <!-- <a href="###" class="btnwordwhite btnnobg icon-news"  rel="external"></a> -->
  </div>
  <!-----header end---->
  <div class="inside-main">
  <!----16% start--->
    <div class="product-sum-top">
      <div class="product-sum-topcon">
        <p class="f24 color-ligntblue">预期年化率</p>
        <p class="f48 fb">${goods.rate * 100}%</p>
      </div>
    </div>
    <!---16% end--->
    <!----委托等信息 start----->
    <div class="product-sum-bottom ui-grid-a">
      <div class="ui-block-a">
        <div class="sum-bottom-left">
          <p class="f24 color-ligntblue">委托期限</p>
          <p>${goods.term}天 </p>
        </div>
      </div>
      <div class="ui-block-b">
        <div class="sum-bottom-right">
          <p class="f24 color-ligntblue">起投金额(元)</p>
          <p>${goods.startAmount}</p>
        </div>
      </div>
    </div>
    <!----委托等信息 end----->
    <!----一个产品信息 start------>
    <div class="inside-list"> 
     <a class="inside-listcon clearfix" >
      <div class="fl list-title">返息方式</div>
      <div class="fr list-info color-grey">${goods.payInterestTypeStr }</div>
      </a> 
    </div>
    <!-----一个产品信息 end---->

   <!----一个产品信息 start------>
    <div class="inside-list"> 
    <a class="inside-listcon clearfix" href="###" rel="external">
      <div class="fl list-title">保险保单模板</div>
      <div class="fr list-info color-grey icon-rightarrow-1"></div>
      </a> 
      <a class="inside-listcon clearfix" href="###" rel="external">
      <div class="fl list-title">产品委托合同</div>
      <div class="fr list-info color-grey icon-rightarrow-1"></div>
      </a> 
      </div>
    <!-----一个产品信息 end---->
    <!----一个产品信息 start------>
     <div class="inside-list">
     <a class="inside-listcon clearfix" href="###">
      <div class="fl list-title">委托记录</div>
      <div class="fr list-info color-grey icon-rightarrow-1">
        <div class="fr">已有<span class="color-orange">${entrustCount}</span>人次委托</div>
      </div>
      </a> 
      </div>
    <!----一个产品信息 end------>  
      
    <div class="buy-tip f20 color-orange"><span>15点前到账当天计息，15点后到账次日计息</span></div>
  </div>
  
  <!----底部start------> 
  <div data-role="footer" data-position="fixed" class="inside-detail-footer">
   <!---投资额计算start--->
    <div class="ui-grid-a f24">
      <div class="ui-block-a txtleft">
        <p class="color-lightgray">账户余额(元)</p>
        <p class="color-grey">${banlance}</p>
      </div>
      <div class="ui-block-b txtright">
        <p class="color-lightgray">预计可收利益(元)</p>
        <p class="color-orange expectedEarnings"></p>
      </div>
    </div>
	<div class="inside-main">
		<div class="wrap">
			<ul class="ul-formlist form-list">
				<li>
					<label>委托金额</label> 
					<input type="number" class="inputtxt inputtxt2" name='amount' value="${banlance}" placeholder="请输入委托金额" data-role="none" />
				</li>
			</ul>
		</div>
	</div>
	<div class="buy-tip f20 error"><span></span></div>
	<!---投资额计算end--->
     <a  href="###"  class="btn-submit btnnobg bgorange btnwordwhite">立即委托</a> 
     </div>
    <!----底部end------>  
    
</form>
</div>
</body>
</html>
