<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="/header/header.jsp"%>
<%@ include file="/jsp/include.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/plugin/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/tryOpLog/tryOpLogList.js"></script>
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
						<%-- <li><span class="form_span">操作类型：</span>
    						<select id='queryOpType' name='queryOpType'  style="width:200px">
					        <option value="">请选择</option>
					        <c:forEach items="${opTypeList}" var="item">
					            <option value="${item.dictValue}">${item.text}</option>
					        </c:forEach>
					    </select>
						</li> --%>
						<li>
							<span class="form_span">操作类型：</span>
							<input type="text" class="form-control" id="queryOpTypeText" name="queryOpTypeText" placeholder="请输入操作类型" width="250px"/>
							<input type="hidden" id="queryOpType" name="queryOpType"/>
						</li>
						<li>
							<span class="form_span">操作人：</span>
							<input type="text" class="form-control" id="userName" name="userName" placeholder="请输入创建人" width="250px"/>
						</li>
						<li>
							<span class="form_span">开始日期：</span>
							<input type="text" class="form-control" id="queryCreateDateBegin" name="queryCreateDateBegin" onclick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" placeholder="请输入开始日期" width="250px"/>
						</li>
						<li>
							<span class="form_span">结束日期：</span>
							<input type="text" class="form-control" id="queryCreateDateEnd" name="queryCreateDateEnd" onclick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" placeholder="请输入结束日期" width="250px"/>
						</li>
						<li>
							<span class="form_span">日志内容：</span>
							<input type="text" class="form-control" id="queryContent" name="queryContent" placeholder="请输入日志内容" width="250px"/>
						</li>
						<li>
							<span class="form_span">平台类型：</span>
							<select id='queryOpUserType' name='queryOpUserType'>
								<option value="">请选择</option>
								<c:forEach items="${opUserType}" var="item">
									<option value="${item.dictValue}">${item.text}</option>
								</c:forEach>
							</select>
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
            <div class="titleName">日志管理列表</div>
        </div>
		<div id="table" class="panel-body tableContent"></div>
	</div>
</body>

</html>