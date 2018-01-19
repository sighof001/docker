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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/oldEntrustOrder/oldEntrustOrderEdit.js"></script>
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
				<input id="id" name="id" type="hidden" value="${oldEntrustOrder.id}">
				<div id="tableTradeInfo" title="${title}" class="form_box_item">
				<ul class="form-wrap formgroup_wrap">
					<li>
						<span class="form_span" title="客户id">用户名:</span>
						<input type="text" class="form-control" id="loginId" name="loginId"  value="${oldEntrustOrder.loginId}" placeholder="请输入客户id"/>
						<p id='custIdTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="商品名称">商品名称:</span>
						<input type="text" class="form-control" id="goodsName" name="goodsName"  value="${oldEntrustOrder.goodsName}" placeholder="请输入商品名称"/>
						<p id='goodsNameTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="利率">利率(%):</span>
						<input type="text" class="form-control" id="rate" name="rate"  value="${oldEntrustOrder.displayRate}" placeholder="请输入利率"/>
						<p id='rateTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="期限">期限(年):</span>
						<input type="text" class="form-control" id="term" name="term"  value="${oldEntrustOrder.term}" placeholder="请输入期限(天),若为0则为活期"/>
						<p id='termTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="合同号">合同号:</span>
						<input type="text" class="form-control" id="contractNumber" name="contractNumber"  value="${oldEntrustOrder.contractNumber}" placeholder="请输入合同号"/>
						<p id='contractNumberTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="委托金额">委托金额(元):</span>
						<input type="text" class="form-control" id="amount" name="amount"  value="${oldEntrustOrder.amount}" placeholder="请输入委托金额"/>
						<p id='amountTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="委托日期">委托日期:</span>
						<input type="text" class="form-control" id="entrustDate" name="entrustDate"  value="${oldEntrustOrder.entrustDateText}" placeholder="请输入委托日期"/>
						<p id='entrustDateTip' class="form_tips formalert"></p>
					</li>
					<%-- <li>
						<span class="form_span" title="订单状态,0:正常,1：已取消,2:已删除">订单状态,0:正常,1：已取消,2:已删除:</span>
						<input type="text" class="form-control" id="status" name="status"  value="${oldEntrustOrder.status}" placeholder="请输入订单状态,0:正常,1：已取消,2:已删除"/>
						<p id='statusTip' class="form_tips formalert"></p>
					</li> --%>
					<li>
						<span class="form_span" title="状态">状态:</span>
						<input type="text" class="form-control" id="payOutStatus" name="payOutStatus"  value="${oldEntrustOrder.displayPayOutStatus}" placeholder="请输入转出状态,0:未转出,1：已转出"/>
						<p id='payOutStatusTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="转出金额">转出金额:</span>
						<input type="text" class="form-control" id="payOutAmount" name="payOutAmount"  value="${oldEntrustOrder.payOutAmount}" placeholder="请输入转出金额"/>
						<p id='payOutAmountTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="转出人">转出人:</span>
						<input type="text" class="form-control" id="payOutUserId" name="payOutUserId"  value="${oldEntrustOrder.payOutUserId}" placeholder="请输入转出人"/>
						<p id='payOutUserIdTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="转出日期">转出日期:</span>
						<input type="text" class="form-control" id="payOutDate" name="payOutDate"  value="${oldEntrustOrder.payOutDateText}" placeholder="请输入转出日期"/>
						<p id='payOutDateTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="转出时间">转出时间:</span>
						<input type="text" class="form-control" id="payOutTime" name="payOutTime"  value="${oldEntrustOrder.payOutTimeText}" placeholder="请输入转出时间"/>
						<p id='payOutTimeTip' class="form_tips formalert"></p>
					</li>
					</ul>
					<ul class="form-wrap formgroup_wrap">
					<li class="textarea">
						<span class="form_span" title="说明">说明:</span>
						<textarea class="form-control" id="remark" name="remark" placeholder="请输入说明">${oldEntrustOrder.remark}</textarea>
						<p id='remarkTip' class="form_tips formalert"></p>
					</li>
					<%-- <li>
						<span class="form_span" title="创建人">创建人:</span>
						<input type="text" class="form-control" id="createUserId" name="createUserId"  value="${oldEntrustOrder.createUserId}" placeholder="请输入创建人"/>
						<p id='createUserIdTip' class="form_tips formalert"></p>
					</li> --%>
				</ul>
				</div>
			</form>
		</div>
	</div>
</body>