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
	request.setCharacterEncoding("utf-8");
	
	
	//세션이 있는지 확인 후 없으면 상품 꽝 ~~
	String msg = (String)session.getAttribute("msg");
	String travel = request.getParameter("travel");
	
	if(msg==null || !msg.equals("happy!!!"))
	{%>
		<h3 style="color:red;">시간초과로 꽝입니다</h3>
	<%}else
	{%>
		<h3 style="color:blue;">축하합니다 <%=travel %> 상품에 당첨되셨습니다.</h3>
	<%}
	%>
	
	<a href = "sessionMain.jsp">다시선택</a>
</body>
</html>