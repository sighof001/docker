<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="/header/header.jsp"%>
<%@ include file="/jsp/include.jsp"%>
<link href="<%=request.getContextPath()%>/css/edit.css" type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/progressbar.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/plugin/jquery.form.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/plugin/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/tryOrder/tryOrderEdit.js"></script>
<script type="text/javascript">
var op = '${op}';
var returnType = '${returnType}';
</script>
</head>
<body>
	<div class="panel panel-default no-border">
		<div class="panel-heading floating-top">
			<!-- 头部步骤说明-->
			<div class="flow_container">
			<!---头部 start-->
			 <div class="theme_title">${title}</div>
			</div>
			<a class="btn btn-danger btn-block floating-back" href="javascript:returnPage();">返回列表</a>
			<button id="save" type="button" class="btn btn-danger btn-block floating-back view-hidden">保存</button>
		</div>
		<div class="panel-body floating-content">
			<form id="edit-form" name="edit-form" class="row" onSubmit="return false">
				<input id="id" name="id" type="hidden" value="${tryOrder.id}">
				<ul class="form-wrap formgroup_wrap">
					<li>
						<span class="form_span" title="交易类型">交易类型:</span>
						<select class="form-control" id="orderType" name="orderType"  placeholder="商品类型">
								<!-- <option value="">请选择</option>  -->
								<c:forEach items="${tradeType}" var="item" varStatus="i">	
									<option value="${item.dictValue}" data='${item}' <c:if test="${item.dictValue == tryCustInfo.custType}">selected="selected"</c:if>>${item.text}</option>
								</c:forEach>
						</select>
						<p id='orderTypeTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="商品编号">商品编号:</span>
						<input type="text" class="form-control" id="goodsCode" name="goodsCode"  value="${tryOrder.goodsCode}" placeholder="请输入商品编号"/>
						<p id='goodsCodeTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="商品名称">商品名称:</span>
						<input type="text" class="form-control" id="goodsName" name="goodsName"  value="${tryOrder.goodsName}" placeholder="请输入商品名称"/>
						<p id='goodsNameTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="商品类型,0:普通商品，1:扶贫产品">商品类型:</span>
						<select class="form-control" id="goodsType" name="goodsType"  placeholder="商品类型">
								<!-- <option value="">请选择</option>  -->
								<c:forEach items="${goodsType}" var="item" varStatus="i">	
									<option value="${item.dictValue}" data='${item}' <c:if test="${item.dictValue == tryCustInfo.custType}">selected="selected"</c:if>>${item.text}</option>
								</c:forEach>
						</select>
						<p id='goodsTypeTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="年化利率">年化利率:</span>
						<input type="text" class="form-control" id="rate" name="rate"  value="${tryOrder.rate}" placeholder="请输入年化利率"/>
						<p id='rateTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="期限(天),若为0则为活期">期限(天):</span>
						<input type="text" class="form-control" id="term" name="term"  value="${tryOrder.term}" placeholder=""/>
						<p id='termTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="">计息频率(天):</span>
						<input type="text" class="form-control" id="interestFrequency" name="interestFrequency"  value="${tryOrder.interestFrequency}" placeholder=""/>
						<p id='interestFrequencyTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="商品价格">商品价格:</span>
						<input type="text" class="form-control" id="price" name="price"  value="${tryOrder.price}" placeholder="请输入商品价格"/>
						<p id='priceTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="交易金额">交易金额:</span>
						<input type="text" class="form-control" id="amount" name="amount"  value="${tryOrder.amount}" placeholder="请输入交易金额"/>
						<p id='amountTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="计息金额,转出时所计利息">计息金额:</span>
						<input type="text" class="form-control" id="interest" name="interest"  value="${tryOrder.interest}" placeholder=""/>
						<p id='interestTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="支付状态">支付状态:</span>
						<select class="form-control" id="payStatus" name="payStatus"  placeholder="支付状态">
								<!-- <option value="">请选择</option>  -->
								<c:forEach items="${payStatus}" var="item" varStatus="i">	
									<option value="${item.dictValue}" data='${item}' <c:if test="${item.dictValue == tryCustInfo.custType}">selected="selected"</c:if>>${item.text}</option>
								</c:forEach>
						</select>
						<p id='payStatusTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="支付时间">支付时间:</span>
						<input type="text" class="form-control" id="payTime" name="payTime"  value="${tryOrder.payTime}" placeholder="请输入支付时间"/>
						<p id='payTimeTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="说明">说明:</span>
						<input type="text" class="form-control" id="remark" name="remark"  value="${tryOrder.remark}" placeholder="请输入说明"/>
						<p id='remarkTip' class="form_tips formalert"></p>
					</li>
				</ul>
			</form>
		</div>
	</div>
</body>