<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>404</title>
<script type="text/javascript">
</script>


</head>
<body>
<div class="container">
<div style='font-size: 800px;'>500
  <% Exception ex = (Exception)request.getAttribute("exception"); %>
    <H2>Exception: <%= ex.getMessage()%></H2>
    <P/>
    <% ex.printStackTrace(new java.io.PrintWriter(out)); %>

</div>
</div>
</body>
</html>