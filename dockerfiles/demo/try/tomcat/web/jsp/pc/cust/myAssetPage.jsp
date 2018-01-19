<%@page import="com.investfinancing.constants.DictValue"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="<%=request.getContextPath() %>/pcjs/pc/entrust/myEntrustView.js"></script>

    <!------个人中心右侧start-------->
    <div class="col-sm-9 personal_right  ">
      <jsp:include page="/myView/pcMyAssetTopView.do" flush="true"></jsp:include>
      <div class="p_rightBottom martop30 bgwhite"> 
        <!-------资金明细start----->
        <div class="title_wrap clearfix">
          <div class="title pull-left">资产列表</div>
          <a class="pull-right auth-status-btn auth-status-cla" id="export-btn" href="<%=request.getContextPath() %>/order/pcRechargeEdit.do">充值</a> 
          <a class="pull-right auth-status-btn auth-status-cla" id="export-btn" href="javascript:linkUrl('withdrawEdit');">提现</a> 
        </div>
        <div class="search_wrap clearfix">
			<form class="queryForm">
			<div class="pull-right">
				日期： <input type="text" class="Wdate" data-type="datetime" onclick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" id="queryBeignDate" name="queryBeignDate" />
				&nbsp;至&nbsp; 
					<input type="text" class="Wdate" data-type="datetime" onclick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" id="queryEndDate" name="queryEndDate" /> 
					<!-- <input type="hidden" name="time" id="time" value=""/>  -->
					<input type="button" value="查询"class="btn btn-default" id="querySubmit"/>
			</div>
			</form>
		</div>
        <div class="table_wrap">
        	<div class="table_top"> 
	          <a url="/order/pcMyAssetPage/all.do" class="active">全部</a> 
	          <a url="/order/pcMyAssetPage/2.do">委托中</a> 
	          <a url="/order/pcMyAssetPage/3.do">结束</a> 
          </div>
        
          <table class="table table-striped table_con" id="table" url="/order/pcMyAssetPage/all.do">
          <tr>
            <th>项目</th>
            <th>时间</th>
            <th>起息日期</th>
            <th>到期日期</th>
            <th>资金(元)</th>
            <th>状态</th>
            <th>年利率</th>
            <th>返息明细</th>
          </tr>
            <c:forEach items="${page.data}" var="data">
            <tr>
            	<td>${data.goodsName}</td>
            	<td>${data.createDateText}</td>
            	<td>${data.displayBeginDate}</td>
            	<td>${data.displayEndDate}</td>
            	<td>${data.amount}</td>
            	<td>${data.displayStatus}</td>
            	<td>${data.rateText}</td>
            	<td><a onclick="linkUrl('returnDetails','assetId=${data.id}')">详情</a></td>
            </tr>
            </c:forEach>
          </table>
       	<jsp:include page="/jsp/pc/pager.jsp"></jsp:include>
        </div>
        <!-------资金明细end------> 
      </div>
    </div>
    <!-------个人中心右侧end------> 
    