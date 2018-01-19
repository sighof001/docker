<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="/header/header.jsp"%>
<%@ include file="/jsp/include.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/plugin/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery/jquery.form.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/oldEntrustOrder/oldEntrustOrderList.js"></script>
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
				<form method="POST" enctype="multipart/form-data" id="form1">
						<li><table>
								<tr>
									<td><span>批量付息(请先导出数据)：</span></td>
									<td><input id="upfile" type="file" name="upfile"></td>
									<td><button class="btn btn-primary" id="batchInterest" type="button">
											<span>确定导入</span>
										</button></td>
								</tr>
							</table></li>
				</form>
						<li><span class="form_span">用户名/手机：</span>
    						<input id="queryLoginIdText" name="queryLoginIdText" type="text" placeholder="请输入用户名/手机" style="width:200px">
    						<input id="queryLoginId" name="queryLoginId" type="hidden" >
						</li>
						<li><span class="form_span">状态：</span>
    						<select id='queryPayOutStatus' name='queryPayOutStatus'>
							<option value="">请选择</option>
							<c:forEach items="${payOutStatusList}" var="item">
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
            <div class="titleName">历史委托列表</div>
            <div class="operation_wrap">
                <a id="export" class="tableright_icon">	
                	<i class="correct_icon"></i>
                	<span>导出数据</span> 
                </a>
            </div>
        </div>
		<div id="table" class="panel-body tableContent"></div>
	</div>
</body>

</html>