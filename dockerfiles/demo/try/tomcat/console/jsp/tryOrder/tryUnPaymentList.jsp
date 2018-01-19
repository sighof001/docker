<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="/header/header.jsp"%>
<%@ include file="/jsp/include.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/plugin/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/tryOrder/tryUnPaymentList.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/list.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/list.css" type="text/css" />
<script>
</script>
</head>
<body>
	<div class="panel panel-default no-border">
		<div class="panel-heading">
			<div id="query-form" class="query-form">
			<ul class="query-form-wrap form-wrap">
				    <!-- 
					<li><span class="form_span">时间结束：</span>
    					<input id="queryEndDate" name="queryEndDate" type="text" data-type="datetime" onclick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" placeholder="时间结束">
					</li> -->
					<li><span class="form_span">付息时间：</span>
    					<input id="transDate" name="transDate" type="text" data-type="datetime" onclick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" placeholder="请选择付息时间">
					</li>
			</ul>
			<!-- <div class="queryBtn_wrap">
                    <button id="payInterestButton" class="btn btn-primary"><span>一键付息</span></button>
             </div> -->
			</div>
		</div>
		
		<!--表格头部操作栏 start -->
        <div class="content_title">
            <div class="titleName">待返息记录列表</div>
            <div class="operation_wrap">
                <a id="unhitch-btn" class="tableright_icon">	
                	<i class="agree_icon"></i>
                	<span>单独付息</span> 
                </a>
                <a id="payInterestButton" class="tableright_icon">	
                	<i class="agree_icon"></i>
                	<span>全部付息</span> 
                </a>
            </div>
        </div>
		<div id="table" class="panel-body tableContent"></div>
	</div>
</body>

</html>