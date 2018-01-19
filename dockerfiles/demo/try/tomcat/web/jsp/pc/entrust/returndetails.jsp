  <%@ page language="java" pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="<%=request.getContextPath() %>/pcjs/pc/entrust/returndetails.js"></script>
 <!------个人中心右侧start-------->
    <div class="col-sm-9 personal_right  ">
      <div class="rd_top">
      <div class=" container-fluid  bgwhite">
    <div class="row">
    <c:if test="${tryCustAsset.extractAmount }">
    	<a  class="transfer_btn" data-toggle="modal" >转出</a>
    </c:if>
    <div class="col-sm-12 entrustdetail_left ">
      <div class="row">
      	<input type="hidden" id="orderId" value="${tryOrder.id }"/>
      	<input type="hidden" id="assetId" value="${tryCustAsset.id }"/>
      	<input type="hidden" id="assetTerm" value="${tryCustAsset.term }"/>
      	<input type="hidden" id="goodsId" name="goodsId" value="${tryCustAsset.goodsId }"/>
      	<input type="hidden" id="amount" name="amount" value="${tryCustAsset.amount }"/>
      	<input type="hidden" id="interestDay" name="interestDay" value="${interestDay }"/>
      	<input type="hidden" id="goodsType" name="goodsType" value="${tryCustAsset.goodsType }"/>
      	<input type="hidden" id="beginDate" name="beginDate" value="${tryCustAsset.beginDate }"/>
      	<input type="hidden" id="policyUpload" name="policyUpload" value="${tryOrder.policyUpload }"/>
        <div class="col-sm-12 entrustdetail_name"><span>${tryCustAsset.goodsName }</span></div>
        <div class="col-sm-12 borderbtline mar10"></div>
        <div class="col-sm-4">委托金额：<span>${tryCustAsset.amountText} 元</span></div>
        
        <c:if test="${tryCustAsset.term != 0 }">
        	<div class="col-sm-4">委托期限：<span>${tryCustAsset.term }天</span></div>
        	<%-- <div class="col-sm-4">计息频率：<span>${tryOrder.interestFrequency}天</span></div> --%>
        	<div class="col-sm-4">到期时间：<span>${tryCustAsset.endDateText}</span></div>
        </c:if>
        <div class="col-sm-4">委托时间：<span>${tryCustAsset.beginDateText}</span></div>
        <div class="col-sm-4">保障方式：<span>保险本息全额承保</span></div>
        <c:if test="${!tryCustAsset.fp}">
        	<!-- <div class="col-sm-4">电子保单：<a class="downloadPolicy">点击下载</a></div> --> 
        	<div class="col-sm-4">年化收益率：<span>${tryCustAsset.rateText }</span></div>
        </c:if>
        <!-- <div class="col-sm-4">委托合同：<a href="###">点击下载</a></div> -->
      </div>
    </div>
 
  </div>
</div>
      </div>
      
      
      <div class="p_rightBottom martop30 bgwhite"> 
      <%-- <c:if test="${tryCustAsset.fp}"> --%>
      <!-------委托保单start----->
        <div class="title_wrap clearfix">
          <div class="title pull-left">委托订单</div>
        </div>
        <div class="table_wrap">
          <table class="table table-striped table_con" id="table_id">
            <tr>
              <th>时间</th>
              <th>金额</th>
              <th>明细</th>
            </tr>
            <c:forEach items="${tryOrderList }" var="orderList">
           	<tr>
              <td>${orderList.createTimeStr }</td>
              <td>${orderList.amountText }</td>
              <td><a onclick="linkUrl('entrustOrderView','orderId=${orderList.id}')">详情</a></td>
              <input type="hidden"  name="policyUploadFp" value="${orderList.policyUpload }"/>
              <input type="hidden"  id="orderIdFp" value="${orderList.id}"/>
           	</tr>
            </c:forEach>  
          </table>
        </div>
        <!-------委托保单end------> 
     <%--  </c:if> --%>
      
        <!-------资金明细start----->
        <div class="title_wrap clearfix martop30">
          <div class="title pull-left">返息明细</div> </div>
        
        <div class="table_wrap">
          <table class="table table-striped table_con" id="table" url="/webEntrust/pcReturnDetails.do?assetId=${tryCustAsset.id }">
            <tr>
              <th>期数</th>
              <th>返息时间</th>
              <th>返息金额（元）</th>
              <th>状态</th>
            </tr>
            <c:forEach items="${page.data}" var="pay" varStatus="i">
            	<tr>
	              <td>第${page.resultSize - page.rowNum + 1 - i.count }期</td>
	              <td>${pay.createDateText }</td>
	              <td>${pay.amountText }</td>
	              <td>已返息</td>
            	</tr>
            	
            </c:forEach>
              
          </table>
         
           <jsp:include page="/jsp/pc/pager.jsp"></jsp:include>
        </div>
      
        <!-------资金明细end------> 
        
      </div>
    </div>
    <!-------个人中心右侧end------> 
    
 <!-- 提前转出弹出框start -->
<div class="modal fade loginmodal t_modal" id="transfer_pop" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
      <h4 class="modal-title" id="myModalLabel">结束委托</h4>
    </div>
    <div class="modal-body">
    <table class="table r_table">
	    <tr>
	    	<th>委托项目</th>
	    	<th>委托本金(元)</th>
	    	<c:if test="${!tryCustAsset.fp}">
	    		<th>年化收益</th>
	    	</c:if>
	    	<th>计息天数(天)</th>
	    	<!-- <th>已返利息(元)</th> -->
	    </tr>
	    <tr>
		    <td>${tryCustAsset.goodsName }</td>
		    <td>${tryCustAsset.amountText}</td>
		    <c:if test="${!tryCustAsset.fp}">
		    	<td>${tryCustAsset.rateText }</td>
		    </c:if>
		    <td>${interestDay }天</td>
		    <!-- <td></td> -->
	    </tr>
    </table>
	    <c:if test="${tryCustAsset.term != '0'&&timeout}">
  	 	 <div class="alert alert-warning">
	  		<p>温馨提示：</p>
	   		<p>您本次委托提前终止将按活期<strong><fmt:formatNumber value="${currentRate*100}" pattern="#.00" type="number"/>%</strong></strong>年化收益计息。</p>
	    	<p>实际可得收益<strong id="earnings"></strong>元 ，比原定委托少收益<strong id="less"></strong>元</p>
	    	<p>目前已得收益<strong id="earningsAlready"></strong>元 ，利息差额为<strong id="interestMargin"></strong>元</p>
	    	<c:if test="${interestDay < tryCustAsset.term && tryOrder.policyFlag}">
	    		<p>由于您未按到期时间转出需加收<strong id="poundageRate"></strong>手续费</p>
	    		<p>扣除手续费为<strong id="poundage"></strong>元</p>
	    	</c:if>
	    	<p>可提金额为<strong id="entrustAmount"></strong>元</p>
    	</div>
	    </c:if>
	  <%--   <c:if test="${tryCustAsset.term == '0'}">
	    	<p>转出金额不能高于委托金额</p> 
	    	<!-- <p>实际可得收益<strong id="earnings"></strong>元</p> -->
	    </c:if> --%>
   <div role="form" class="form-inline mar10">
	   <label for="paynumber" class="control-label">转出金额：</label>
	   <input  type="number" class="form-control w360" id="paynumber" placeholder="请输入转出金额">
   </div> 
   <div role="form" class="form-inline">
	   <label for="paypwd" class="control-label">支付密码：</label>
	   <input  type="password" class="form-control w360" id="password" placeholder="请输入支付密码">
	   <p style="color:red;display: none;" id="errorInfo">错误提示</p>
   </div>
   <button type="button" id="extract" class="btn btn-default btnorange">转出</button>
   </div>
  </div>
  <!-- /.modal-content --> 
  </div>
</div>
<!--提前转出弹出框start -->