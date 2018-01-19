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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/tryGoods/tryGoodsEdit.js"></script>
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
				<input id="id" name="id" type="hidden" value="${tryGoods.id}">
				<input id="goodsType" name="goodsType" type="hidden" value="${tryGoods.goodsType}">
				<div id="tableTradeInfo" title="${title}" class="form_box_item">
				<ul class="form-wrap formgroup_wrap">
					<li>
						<span class="form_span" title="产品编号">*产品编号:</span>
						<input type="text" class="form-control" id="goodsCode" name="goodsCode"  value="${tryGoods.goodsCode}" placeholder="请输入产品编号"/>
						<p id='goodsCodeTip' class="form_tips formalert"  ></p>
					</li>
					<li>
						<span class="form_span" title="产品名称">*产品名称:</span>
						<input type="text" class="form-control" id="goodsName" name="goodsName"  value="${tryGoods.goodsName}" placeholder="请输入产品名称"/>
						<p id='goodsNameTip' class="form_tips formalert" ></p>
					</li>
					<%-- <li>
						<span class="form_span" title="产品类型">*产品类型:</span>
						<select class="form-control" id="goodsType" name="goodsType" value="${tryGoods.goodsType}">
							<c:forEach items="${goodsTypeList}" var="item">
								<option value="${item.dictValue}" <c:if test="${item.dictValue eq tryGoods.goodsType}">selected="selected"</c:if> >${item.text }</option>
							</c:forEach>
							</select>
						<input type="text" class="form-control" id="goodsType" name="goodsType"  value="${tryGoods.goodsType}" placeholder="请输入产品类型"/>
						<p id='goodsTypeTip' class="form_tips formalert"></p>
					</li> --%>
					<li>
						<span class="form_span" title="年化利率">*年化利率:</span>
						<input type="text" class="form-control" id="rate" name="rate"  value="${tryGoods.rate}" placeholder="请输入年化利率"/>
						<p id='rateTip' class="form_tips formalert" ></p>
					</li>
					<li>
						<span class="form_span" title="期限(天),若为0则为活期">*期限(天):</span>
						<input type="text" class="form-control" id="term" name="term"  value="${tryGoods.term}" placeholder="请输入期限,,若为0则为活期"/>
						<p id='termTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="计息频率,若为0则为活期">*计息频率(天):</span>
						<input type="text" class="form-control" id="interestFrequency" name="interestFrequency"  value="${tryGoods.interestFrequency}" placeholder="请输入计息频率(天),若为0则为活期"/>
						<p id='interestFrequencyTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="起投金额">*起投金额(元):</span>
						<input type="text" class="form-control" id="startAmount" name="startAmount"  value="${tryGoods.startAmount}" placeholder="请输入起投金额"/>
						<p id='startAmountTip' class="form_tips formalert" ></p>
					</li>
					<li>
						<span class="form_span" title="递增金额">*递增金额(元):</span>
						<input type="text" class="form-control" id="increaseAmount" name="increaseAmount"  value="${tryGoods.increaseAmount}" placeholder="请输入递增金额"/>
						<p id='increaseAmountTip' class="form_tips formalert" ></p>
					</li>
					<li>
						<span class="form_span" title="是否推荐">*是否推荐:</span>
						<select class="form-control" id="recommendFlag" name="recommendFlag" value="${tryGoods.recommendFlag}">
							<c:forEach items="${recommendFlagTypeList}" var="item">
							<option value="${item.dictValue}" <c:if test="${item.dictValue eq tryGoods.recommendFlag}">selected="selected"</c:if> >${item.text}</option>
							</c:forEach>
							</select>
						<%-- <input type="text" class="form-control" id="recommendFlag" name="recommendFlag"  value="${tryGoods.recommendFlag}" placeholder="请输入是否推荐，1：是,0:否"/> --%>
						<p id='recommendFlagTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="是否上架">*是否上架:</span>
						<select class="form-control" id="publishStatus" name="publishStatus" value="${tryGoods.publishStatus}">
							<c:forEach items="${publishStatusTypeList}" var="item">
							<option value="${item.dictValue}" <c:if test="${item.dictValue eq tryGoods.publishStatus}">selected="selected"</c:if> >${item.text}</option>
							</c:forEach>
							</select>
						<%-- <input type="text" class="form-control" id="recommendFlag" name="recommendFlag"  value="${tryGoods.recommendFlag}" placeholder="请输入是否推荐，1：是,0:否"/> --%>
						<p id='publishStatusTip' class="form_tips formalert"></p>
					</li>
				<%-- 	<li>
						<span class="form_span" title="返息方式">*返息方式:</span>
						<select class="form-control" id="payInterestType" name="payInterestType" value="${tryGoods.payInterestType}">
							<c:forEach items="${payInterestTypeList}" var="item">
							<option value="${item.dictValue}" <c:if test="${item.dictValue eq tryGoods.payInterestType}">selected="selected"</c:if> >${item.text}</option>
							</c:forEach>
							</select>
						<input type="text" class="form-control" id="recommendFlag" name="recommendFlag"  value="${tryGoods.recommendFlag}" placeholder="请输入是否推荐，1：是,0:否"/>
						<p id='payInterestTypeTip' class="form_tips formalert"></p>
					</li> --%>
					<li><span class="form_span" title="序号">序号:</span> 
					<c:if test="${tryGoods==null}">
						<input type="text" class="form-control"  name="sequence"
						value="0" placeholder="请输入序号,数字越大越靠前显示" id="newSequence"/>
						<p id='newSequenceTip' class="form_tips formalert"></p>
						</c:if>
						<c:if test="${tryGoods!=null}">
					<input
						type="text" class="form-control" id="sequence" name="sequence"
						value="${tryGoods.sequence}" placeholder="请输入序号,数字越大越靠前显示" />
						<p id='sequenceTip' class="form_tips formalert"></p>
						</c:if>
					</li>
					<%-- <li>
						<span class="form_span" title="创建人">创建人:</span>
						<input type="text" class="form-control" id="createUserId" name="createUserId"  value="${tryGoods.createUserId}" placeholder="请输入创建人"/>
						<p id='createUserIdTip' class="form_tips formalert"></p>
					</li> --%>
				</ul>
				<ul class="form-wrap formgroup_wrap">
						<li class="textarea">
							<span class="form_span" title="*产品介绍">*产品介绍:</span>
							<textarea class="form-control" id="description" name="description" placeholder="请输入产品介绍">${tryGoods.description}</textarea>
							<p id='descriptionTip' class="form_tips formalert"></p>
						</li>
				</ul>
			 </div>
			</form>
		</div>
	</div>
</body>