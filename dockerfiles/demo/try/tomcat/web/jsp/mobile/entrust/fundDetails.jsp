<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>资金明细</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
<script src="<%=request.getContextPath()%>/js/mobile/entrust/fundDetails.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/js/dropload/dist/dropload.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/dropload/dist/dropload.min.js"></script>
<script>
/* $(document).ready(function(e) {
 fixtop(".inside-header","selectNavUl");   
}); */

</script>
</head>

<body>
<div data-role="page" id="pageone" class="page"  data-theme="i"> 
  <!-----header start----->
   <div data-role="header" data-position="fixed" class="inside-header"> <a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
    <h1>资金明细</h1>
    <a href="###" class="btnwordwhite btnnobg"  rel="external"></a>
  </div>
  <!-----header end---->
  <div class="inside-main"> 
    <!----累计充值等信息 start----->
    <div class="product-sum-bottom topblue ui-grid-a">
      <div class="ui-block-a">
        <div class="sum-bottom-left">
          <p class="f24 color-ligntblue">累计充值(元)</p>
          <p>${recharge }</p>
        </div>
      </div>
      <div class="ui-block-b">
        <div class="sum-bottom-right">
          <p class="f24 color-ligntblue">累积提现(元)</p>
          <p>${withdrawals }</p>
        </div>
      </div>
    </div>
    <!----累计充值等信息 end----->
    <div class="selectNavUl ui-grid-c clearfix">
      <a class="ui-block-a" style="width:33%;" id="orderAll" >全部</a>
      <a class="ui-block-b" href="#weituoPopup"  data-rel="popup" style="width:33%;">委托明细<span class="disblock icon-downarrow-1"></span></a>
     <!--弹出窗口start---->
    <div data-role="popup" id="weituoPopup" data-overlay-theme="b" data-position-to="window" class="popup-wrap" > 
    <a href="#" data-rel="back" class="popup-close ui-btn-right" ></a>
      <div class="pop-con">
        <form>
        <fieldset data-role="controlgroup">
          <ul class="ul-list ul-radio">
          <li>
             <label  for="chongzi">充值</label><input type="radio"  name="orderTypeRadio" id="chongzi" value="1" />
            </li>
            <li>
             <label  for="tixian">提现</label><input type="radio" name="orderTypeRadio"  id="tixian" value="2" />
            </li>
            <li>
             <label  for="weituo" >委托</label><input type="radio"  name="orderTypeRadio" id="weituo" value="3"/>
            </li>
            <li>
             <label  for="zhuangchu">转出</label><input type="radio" name="orderTypeRadio"  id="zhuangchu" value="4"/>
            </li>
            <li>
            <label  for="fanxi">返息</label><input type="radio" name="orderTypeRadio" id="fanxi" value="5" />
            </li>
            
          </ul>
          </fieldset>
        </form>
      </div>
    </div>
    
      
   <a class="ui-block-d" data-rel="popup" href="#datePopup" style="width:33%;">所有月份<span class="disblock icon-downarrow-1"></span></a>
       <!--弹出窗口start---->
    <div data-role="popup" id="datePopup" data-overlay-theme="b" data-position-to="window" class="popup-wrap" > 
    <a href="#" data-rel="back" class="popup-close ui-btn-right"></a>
      <div class="pop-con">
        <form>
        <fieldset data-role="controlgroup">
          <ul class="ul-list  ul-radio">
            <li>
             <label  for="2017year5">最近一个月</label><input type="radio"  name="timeRadio" id="2017year5" time="-30" />
            </li>
            <li>
              <label  for="2017year4">3个月</label><input type="radio"  name="timeRadio" id="2017year4" time="-90"/>
            </li>
          </ul>
          </fieldset>
        </form>
      </div>
    </div>
    <!----弹出窗口end----->
    </div>
  	<form class="queryForm">
  		<input type="hidden" name="type" id="type" value="${type }"/>
  		<input type="hidden" name="time" id="time" value="${time }"/>
  	</form>
  	
    <div class="select_content data-container">
    	<div class="select_item">
      <!----一个月份信息 start------>
      <div class="sperate"><span class="select_span">全部</span></div>   
      <div class="inside-list lists"> 
      
      </div>
  	  <!----一个月份信息 end------>
    </div>
    
   
  </div>
  

</div>
</body>
</html>
