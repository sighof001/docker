<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查找加载类路径</title>

<%
	String classPath = "";
	//if (request.getAttribute("classPath") != null)
	//	classPath = (String)request.getAttribute("classPath");
	
	String className = request.getParameter("className");
	if (className == null || "".equals(className)) {
		out.write("<span style='color:red'>请输入类名！</span>");
	}else {
		Class clz = Class.forName(className.trim());
		classPath = clz.getResource("").getPath();
	}
%>
</head>
<body>

<form method="post">
	<span>输入类名：</span>
	<input name="className" type="text" style="width:500px">
	<input type="submit" value="提交">
</form>
<hr>
<div>
<%=classPath%>
</div>
</body>
</html>