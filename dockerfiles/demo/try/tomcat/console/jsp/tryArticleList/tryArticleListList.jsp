<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="/header/header.jsp"%>
<%@ include file="/jsp/include.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/plugin/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/tryArticleList/tryArticleListList.js"></script>
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
						<li><span class="form_span">文章标题：</span>
    						<input id="queryTitle" name="queryTitle" type="text" placeholder="请输入文章标题">
						</li>
						<li><span class="form_span">文章分类：</span>
    						<select id='queryAssort' name='queryAssort'>
							<option value="">请选择</option>
							<c:forEach items="${assortTypeList}" var="item">
								<option value="${item.id}">${item.themeName}</option>
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
            <div class="titleName">文章列表</div>
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