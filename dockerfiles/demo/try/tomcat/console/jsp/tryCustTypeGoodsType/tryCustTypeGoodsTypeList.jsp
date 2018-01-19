<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="/header/header.jsp"%>
<%@ include file="/jsp/include.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/plugin/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/tryCustTypeGoodsType/tryCustTypeGoodsTypeList.js"></script>
</head>
<body>
	<div class="panel panel-default no-border tree-panel">
		<div class="panel-heading">
<%-- 			<h3>角色授权    <small>将菜单和操作授权给角色[<%=name%>]</small></h3> --%>
			<h3>客户类型商品类型管理</h3>
		</div>
		<div class="panel-body">
			<div class="col-xs-8">
				<div id="success-hint" class="alert alert-info hidden">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
					角色授权成功！
				</div>
				<div id="error-hint" class="alert alert-danger hidden">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				</div>
			</div>
			<div class="col-xs-2 pull-right">
				<button id="save-btn" class="btn btn-danger btn-block">保存</button>
			</div>
			
			<div class="col-xs-10">
			<form id="edit-form" name="edit-form" class="row" onSubmit="return false">
				<!-- <div class="tree"></div> -->
			<div class="tree tree-selectable" style="overflow: hidden; width: auto; height: auto;">
			  <div class="tree-folder" style="display: block;" obj="1">
			  	  <!-- 普通用户授权 -->
				  <c:forEach items="${custTypeList}" var="cust" >
				  	<div class="tree-folder-header tree-selected">
					    <div class="tree-folder-name">
					      <i class="icon-folder-close blue2"></i>${cust.text }
					    </div>
				  	</div>
				  	<div class="tree-folder-content">
				  	
					  	<c:forEach items="${goodsTypeList}" var="goods">
					  		<div class="tree-item" style="display: block;">
							      <div class="tree-item-name">
							        
							        	<input  type="checkbox" name="productKey" value="${cust.dictValue}_${goods.dictValue}" <c:forEach items="${tryList}" var="tryList"><c:if test="${cust.dictValue == tryList.custType && goods.dictValue == tryList.goodsType}">checked="checked"</c:if></c:forEach>>${goods.text }
							        
							      </div>
				    		</div>
					  	</c:forEach>
					
				  	</div>
				  	
				  </c:forEach>
				  
				  <div class="tree-loader" style="display: none;">
				    <div class="tree-loading">
				      <i class="icon-refresh icon-spin blue"></i>
				    </div>
				  </div>
				</div>
			  </div>
			  
			  
			  </form>
			</div>
		</div>
	</div>
</body>
</html>