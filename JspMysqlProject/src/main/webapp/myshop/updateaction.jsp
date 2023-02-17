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
%>
	<jsp:useBean id="dao" class="myshop.model.MyshopDao"/>
	<jsp:useBean id="dto" class="myshop.model.MyshopDto"/>
	
	<jsp:setProperty property ="*" name = "dto"/>
	
	<%
	
	dao.updateShop(dto);
	
	response.sendRedirect("shoplist.jsp");
	//response.sendRedirect("detailpage.jsp?num="+dto.getNum());
	%>
</body>
</html>