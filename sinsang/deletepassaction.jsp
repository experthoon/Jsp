<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<%
		String pass = request.getParameter("pass");
		String num = request.getParameter("num");
		
		//비밀번호가 a1234면 삭제
		if(pass.equals("a1234"))
			response.sendRedirect("ssdelete.jsp?num=" +num);
		else
		{%>
			<script type = "text/javascript">
			alert("비밀번호가 맞지 않습니다.");
			history.back();
			</script>
		<%}
	%>
</body>
</html>