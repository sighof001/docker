<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="/header/header.jsp"%>
<%@ include file="/jsp/include.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/list.css" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/plugin/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/tryGoods/tryGoodsList.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/list.js"></script>
<script>
</script>
</head>
<body>
	<div class="panel panel-default no-border">
		<div class="panel-heading">
			<div id="query-form" class="query-form">
			<ul class="query-form-wrap form-wrap">
				    <li><span class="form_span">产品名称：</span>
    					<input id="goodsName" name="goodsName" type="text" placeholder="产品名称">
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
            <div class="operation_wrap">
                <a id="publish" class="tableright_icon">	
                	<i class="agree_icon"></i>
                	<span>上架</span> 
                </a>
                <a id="unPublish" class="tableright_icon">	
                	<i class="disagree_icon"></i>
                	<span>下架</span> 
                </a>
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