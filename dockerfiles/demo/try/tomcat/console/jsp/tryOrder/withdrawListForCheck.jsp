<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="/header/header.jsp"%>
<%@ include file="/jsp/include.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/plugin/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/list.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/list.css" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/tryOrder/withdrawListForCheck.js"></script>
<script>
</script>
</head>
<body>
	<div class="panel panel-default no-border">
		<div class="panel-heading">
			<div id="query-form" class="query-form">
			<ul class="query-form-wrap form-wrap">
				    <li><span class="form_span">用户名：</span>
    					<input id="queryLoginId" name="queryLoginId" type="text" placeholder="用户名">
					</li>
					<li><span class="form_span">时间开始：</span>
    					<input id="queryBeignDate" name="queryBeignDate" type="text" data-type="datetime" onclick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" placeholder="时间开始">
					</li>
					<li><span class="form_span">时间结束：</span>
    					<input id="queryEndDate" name="queryEndDate" type="text" data-type="datetime" onclick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" placeholder="时间结束">
					</li>
					<li><span class="form_span">审核状态：</span>
					    <select id='queryCheckStatus' name='queryCheckStatus'>
					        <option value="">请选择</option>
					        <c:forEach items="${checkStatus}" var="item">
					            <option value="${item.dictValue}">${item.text}</option>
					        </c:forEach>
					    </select>
					</li>
					<li><span class="form_span">支付状态：</span>
					    <select id='queryPayStatus' name='queryPayStatus'>
					        <option value="">请选择</option>
					        <c:forEach items="${payStatus}" var="item">
					            <option value="${item.dictValue}">${item.text}</option>
					        </c:forEach>
					    </select>
					</li>
			</ul>
			<div class="queryBtn_wrap">
                    <button id="query-btn" class="btn btn-primary"><span>查询</span></button>
             </div>
			</div>
		</div>
		
		<!--表格头部操作栏 start -->
        <div class="content_title">
            <div class="titleName">提现申请列表</div>
            <div class="operation_wrap">
			<a id="export-btn" class="tableright_icon" >
			</a>
         </div>
        </div>
		<div id="table" class="panel-body tableContent">
		
		</div>
	</div>
	<form action="javascript:void" method="post" name="shForm">
		<input type="hidden" name="id" value=""/>
		<input type="hidden" name="checkDesc" value=""/>
	</form>
	
	<!-- 模态框 -->
	<%@ include file="/jsp/tryCustLoan/auditFailCommon.jsp"%>
	<!-- 模态框 -->
</body>

</html>