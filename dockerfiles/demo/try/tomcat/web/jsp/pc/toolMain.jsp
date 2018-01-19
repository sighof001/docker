<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/pcjs/pc/toolMain.js"></script>
<!---------右侧浮动start----------->
<div class="cndns-right"> 
  <!------计算机器start------>
  <div class="cndns-right-meau meau-contact"> 
  	<a href="javascript:" class="cndns-right-btn"> 
  		<span class="demo-icon"><img src="<%=request.getContextPath() %>/pcimages/can_icon.png"/></span>
    	<p> 收益<br/>计算 </p>
    </a>
    <div class="cndns-right-box">
      <div class="box-border" style="height:400px;">
        <div class="sev-t clearfix"> <span class="demo-icon"></span>
          <p>收益计算<br />
            <i></i></p>
        </div>
        <div class="sev-b">
          <form class="form-horizontal" role="form">
            <div class="form-group">
              <label class="col-sm-5 control-label">委托金额(元):</label>
              <div class="col-sm-7">
                <input type="number" name="amount" value="10000" class="form-control calc" placeholder="要委托的金额"/>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-5 control-label">存款类型:</label>
              <div class="col-sm-7">
               <select name="goodsId" class="form-control">
			   <c:forEach items="${goodsList}" var="item">
			   		<option value="${item.id}" rate='${item.rate }' term='${item.term }'>${item.goodsName }</option>
			   </c:forEach>
			   </select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-5 control-label">委托期限(天):</label>
              <div class="col-sm-7">
                <input type="number" name="term" class="form-control calc" placeholder="要委托的期限"/>
                <p class="error" style="color: red;"></p>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-5 control-label">预计收益:</label>
              <div class="col-sm-7 control-label text-left"> <em class="income">0.00</em> 元 </div>
            </div>
            <div class="form-group btn_wrap">
              <div class="col-sm-offset-1 col-sm-6">
                <input type="button" class="btn  f_btn ok"  value="马上委托"/>
              </div>
            </div>
          </form>
        </div>
        <span class="arrow-right"></span> </div>
    </div>
  </div>
  <!------计算机器end------->
  <!--------微信二维码start---------->
  <div class="cndns-right-meau meau-code"> <a href="javascript:" class="cndns-right-btn"> <span class="demo-icon">
  <img src="<%=request.getContextPath() %>/pcimages/weixin_icon.png"/></span>
    <p> 关注<br />
      微信 </p>
    </a>
    <div class="cndns-right-box">
      <div class="box-border">
        <div class="sev-t"> <img src="<%=request.getContextPath() %>/pcimages/weixin_gzh.png" /> <i>扫扫关注微信号</i> </div>
        <span class="arrow-right"></span> </div>
    </div>
  </div>
 <!-------微信二维码end--------->
 <!-------app二维码start------->
  <div class="cndns-right-meau meau-code"> 
  	<a href="javascript:" class="cndns-right-btn"> 
  		<span class="demo-icon"><img src="<%=request.getContextPath() %>/pcimages/phone_icon.png"/></span>
    	<p>下载<br/>app </p>
    </a>
    <div class="cndns-right-box">
      <div class="box-border">
        <div class="sev-t"> <img src="<%=request.getContextPath() %>/pcimages/app.png" /> <i>扫扫下载手机app</i> </div>
        <span class="arrow-right"></span> </div>
    </div>
  </div>
 <!---------app二维码end------->
 <!--------返回顶部start-------->
  <div class="cndns-right-meau meau-top" id="top-back"> 
  	<a href="javascript:" class="cndns-right-btn" onclick="topBack()"> 
	  	<span class="arrow-icon"></span> 
	  	<i>顶部</i> 
  	</a> 
  </div>
 <!--------返回顶部edn-------->
</div>
<!---------右侧浮动edn----------->