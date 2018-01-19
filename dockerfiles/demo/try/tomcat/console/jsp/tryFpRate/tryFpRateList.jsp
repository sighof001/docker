<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="/header/header.jsp"%>
<%@ include file="/jsp/include.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/plugin/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery/jquery.form.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/tryFpRate/tryFpRateList.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/list.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/list.css"
	type="text/css" />
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
									<td><span>导入数据(请先下载模板)：</span></td>
									<td><input id="upfile" type="file" name="upfile"></td>
									<td><button class="btn btn-primary" id="test" type="button">
											<span>确定导入</span>
										</button></td>
								</tr>
							</table></li>
					</form>
					<li><span class="form_span">天数：</span> <input id="days"
						name="days" type="text" placeholder="请输入天数(数值)"></li>
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
			<div class="titleName">列表</div>
			<div class="operation_wrap">

				<a id="add-btn" class="tableright_icon"> <i class="add_icon"></i>
					<span>新增</span>
				</a> <a id="demo-btn" class="tableright_icon"> <i
					class="correct_icon"></i> <span>导出模板</span>
				</a> <a id="export-btn" class="tableright_icon"> <i
					class="correct_icon"></i> <span>导出数据</span>
				</a>
			</div>
		</div>
		<div id="table" class="panel-body tableContent"></div>

	</div>

</body>
</html>