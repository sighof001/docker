<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="/header/header.jsp"%>
<%@ include file="/jsp/include.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/plugin/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/tryRealLoan/tryRealLoanList.js"></script>
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
						<li><span class="form_span">姓名：</span>
    						<input id="queryName" name="queryName" type="text" placeholder="姓名">
						</li>
						<li><span class="form_span">贷款类型：</span> <select
						id='queryLoanType' name='queryLoanType'>
							<option value="">请选择</option>
							<c:forEach items="${loanTypeList}" var="item">
								<option value="${item.dictValue}">${item.text}</option>
							</c:forEach>
					</select></li>
					<li><span class="form_span">还款状态：</span> <select
						id='queryPaybackStatus' name='queryPaybackStatus'>
							<option value="">请选择</option>
							<c:forEach items="${paybackStatusList}" var="item">
								<option value="${item.dictValue}">${item.text}</option>
							</c:forEach>
					</select></li>
						<li><span class="form_span">时间开始：</span>
    					<input id="queryBeignDate" name="queryBeignDate" type="text" data-type="datetime" onclick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" placeholder="贷款日期开始">
					</li>
					<li><span class="form_span">时间结束：</span>
    					<input id="queryEndDate" name="queryEndDate" type="text" data-type="datetime" onclick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" placeholder="贷款日期结束">
					</li>
					</ul>
					<div class="queryBtn_wrap">
                    	<button id="query-btn" class="btn btn-primary">
                    		<span>查询</span>
                    	</button>
                	</div>
			</div>
			
			
		</div>
		
		<!--表格头部操作栏 start -->
        <div class="content_title">
            <div class="titleName">放款列表</div>
            <div class="operation_wrap">
                <a id="add-btn" class="tableright_icon">	
                	<i class="add_icon"></i>
                	<span>新增</span> 
                </a>
            </div>
        </div>
		<div id="table" class="panel-body tableContent"></div>
	</div>
</body>

</html>