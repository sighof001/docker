<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>test</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(function(){
	$('.add').click(function(){
		$.post('<%=request.getContextPath()%>/tmpTest/addTmpTest.do',{a:$('input[name="a"]').val()},function(data){
			if(data.success){
				location.reload();
			}else{
				alert(data.message);
			}
			
		},"json");
	});
	
	$('.remove').click(function(){
		var id = $(this).attr('id2');
		$.post('<%=request.getContextPath()%>/tmpTest/delete.do',{id:id},function(data){
			if(data.success){
				location.reload();
			}else{
				alert(data.message);
			}
			
		},"json");
	});
	
});
</script>


</head>
<body>
<div class="container">
	<table>
		<thead>
			<th>id</th>
			<th>a</th>
			<th>操作</th>
		</thead>
		<c:forEach items="${list}" var="item">
			<tr>
				<td>${item.id }</td>
				<td>${item.a }</td>
				<td><a href='#' class="remove" id2='${item.id }'>删除</a></td>
			</tr>
		</c:forEach>
	</table>
	
	<div>
	<form name="mainForm" action="<%=request.getContextPath()%>/tmpTest/addTmpTest">
		<div>
			<label>a</label>
			<input type="text" name='a' />
		</div>
		<div>
			<a href='#' class="add">增加</a>
		</div>
	</form>
	</div>
</div>
</body>
</html>