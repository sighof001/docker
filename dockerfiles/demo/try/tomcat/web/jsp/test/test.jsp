<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>test</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery/jquery-1.12.4.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.try.js"></script>
<script type="text/javascript">
$(function(){
	$('.ajaxGoods1').click(function(){
		$.post('<%=request.getContextPath()%>/goods/goodsDetail.do',function(data){
			if(data.success){
				alert('ok');
			}else{
				alert(data.message);
			}
		},"json");
	});
	$('.ajaxGoods2').click(function(){
		$.post('<%=request.getContextPath()%>/goods/goodsDetail2.do',function(data){
			if(data.success){
				alert('ok');
			}else{
				alert(data.message);
			}
		},"json");
	});
	$('.ajaxGoods3').click(function(){
		$.post('<%=request.getContextPath()%>/goods/goodsDetail3.do',function(data){
			alert(typeof(data));
			if(data.success){
				alert('ok');
			}else{
				alert(data.message);
			}
		},"json");
	});

	$('.tx').click(function(){
		var flag1 = $(this).attr('flag1');
		var flag2 = $(this).attr('flag2');
		var flag3 = $(this).attr('flag3');
		$.post('<%=request.getContextPath()%>/tmpTest/test2.do',{flag1:flag1,flag2:flag2,flag3:flag3},function(data){
			if(data.success){
				alert('ok');
			}else{
				alert(data.message);
			}
		},"json");
		
		return false;
	});
	
	$('.showName').click(function(){
		$(this).showName();
		
		return false;
	});
	
	$('.countDown').click(function(){
		$(this).countDown("计时",5);
		return false;
	});
	
	$('.browser').click(function(){
		debugger;
		alert($.browser.userClient);
		alert('isIpad:' + $.browser.isIpad);
		alert('isIphone:' + $.browser.isIphone);
		alert('isMidp:' + $.browser.isMidp);
		alert('isUc7:' + $.browser.isUc7);
		alert('isUc:' + $.browser.isUc);
		alert('isUc:' + $.browser.isUc);
		alert('isAndroid:' + $.browser.isAndroid);
		alert('isCE:' + $.browser.isCE);
		alert('isWM:' + $.browser.isWM);
		alert('isWx:' + $.browser.isWx);
		alert('isPc:' + $.browser.isPc);
	});
});
</script>


</head>
<body>
<div class="container">
<form name="mainForm" action="#" method="post">
<div>
	<ul>
		<li><a href='<%=request.getContextPath()%>/goods/goodsDetail.do' target="_blank">goods1</a></li>
		<li><a href='<%=request.getContextPath()%>/goods/goodsDetail2.do' target="_blank">goods2</a></li>
		<li><a href='<%=request.getContextPath()%>/goods/goodsDetail3.do' target="_blank">goods3</a></li>
		<li><a href='#' class="ajaxGoods1">ajaxGoods1</a></li>
		<li><a href='#' class="ajaxGoods2">ajaxGoods2</a></li>
		<li><a href='#' class="ajaxGoods3">ajaxGoods3</a></li>
		<li><a href='#' class="showName" name='aaa'>showName</a></li>
		<li><b href='#' class="showName" name='bbb'>showName</b></li>
		<li><button class="countDown" disabled="disabled"><b style='color: red;'>呵呵</b></button></li>
		<li><button class="countDown"><b style='color: red;'>哈哈</b></button></li>
		<li><a href='#' class="tx" name='aaa' flag1='2' flag2='1' flag3='1'>test transaction</a></li>
		<li><a href='#' class="browser">test browser</a></li>
	</ul>
</div>
</form>
</div>
</body>
</html>