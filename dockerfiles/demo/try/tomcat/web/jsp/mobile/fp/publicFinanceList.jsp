<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>公益金融</title>
<jsp:include page="/jsp/mobile/include.jsp" flush="true"></jsp:include>
</head>

<body>
	<div data-role="page" class="page" data-theme="i">
		<!-----header start----->
		<div data-role="header" data-position="fixed" class="inside-header"> 
			<a data-rel="back" class="btnwordwhite btnnobg icon-leftarrow-1"></a>
    		<h1>公益金融</h1>
    	</div>
		<div class="inside-main">
		
			<!----一个列表信息 start------>
			<div class="inside-list me-list">
				<a class="inside-listcon clearfix" href="<%=request.getContextPath()%>/fp/fpPrudctList.do" rel="external">
					<div class="fl list-title icon-chart">公益</div>
					<div class="fr list-info color-grey icon-rightarrow-1"></div>
				</a> 
				<a class="inside-listcon clearfix" href="<%=request.getContextPath()%>/fp/fpLoanApplicationView.do" rel="external">
					<div class="fl list-title icon-page">扶贫贷款</div>
					<div class="fr list-info color-grey icon-rightarrow-1"></div>
				</a> 
				<a class="inside-listcon clearfix" href="<%=request.getContextPath()%>/fp/fpRateList.do" rel="external">
					<div class="fl list-title icon-list-1">扶贫利率</div>
					<div class="fr list-info color-grey icon-rightarrow-1"></div>
				</a> 
				<a class="inside-listcon clearfix" href="<%=request.getContextPath()%>/fp/fpMoreRateList.do" rel="external">
					<div class="fl list-title icon-list">更多存款利率</div>
					<div class="fr list-info color-grey icon-rightarrow-1"></div>
				</a>
			</div>
			<!-----一个列表信息 end---->
		

		</div>
	</div>
</body>
</html>
