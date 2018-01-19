<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="/header/header.jsp"%>
<%@ include file="/jsp/include.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/plugin/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/tryCustInfo/tryCustInfoList.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/list.js"></script>
<script>
</script>
</head>
<body>
	<div class="panel panel-default no-border">
		<div class="panel-heading">
			<div id="query-form" class="query-form">
			<ul class="query-form-wrap form-wrap">
				    <li><span class="form_span">登录名：</span>
    					<input id="queryLoginId" name="queryLoginId" type="text" placeholder="登录名">
					</li>
					<li><span class="form_span">姓名：</span>
    					<input id="queryRealName" name="queryRealName" type="text" placeholder="姓名">
					</li>
					<li><span class="form_span">身份证：</span>
    					<input id="queryIdCard" name="queryIdCard" type="text" placeholder="身份证">
					</li>
			</ul>
			<div class="queryBtn_wrap">
                    <button id="query-btn" class="btn btn-primary"><span>查询</span></button>
             </div>
			</div>
		</div>
		
		
		<!--表格头部操作栏 start -->
        <div class="content_title">
            <div class="titleName">列表</div>
            <!-- <div class="operation_wrap">
                <a id="add-btn" class="tableright_icon">	
                	<i class="add_icon"></i>
                	<span>新增</span> 
                </a>
            </div> -->
            <div class="operation_wrap">
                <a id="frozen-btn" class="tableright_icon">	
                	<i class="disagree_icon"></i>
                	<span>冻结</span> 
                </a>
            </div>
            <div class="operation_wrap">
                <a  class="tableright_icon unhitch-btn">	
                	<i class="agree_icon"></i>
                	<span>解冻</span> 
                </a>
            </div>
            <div class="operation_wrap">
                <a class="tableright_icon activation-btn">	
                	<i class="agree_icon"></i>
                	<span>激活</span> 
                </a>
            </div>
            
        </div>
		<div id="table" class="panel-body tableContent"></div>
	</div>
</body>

</html>