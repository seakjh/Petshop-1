<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String msg=(String)request.getAttribute("msg");
	String url=(String)request.getAttribute("url");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
alert("<%=msg%>");
location.href="<%=url%>";//redirect 할 요청 경로
</script>
</head>
<body>

</body>
</html>








